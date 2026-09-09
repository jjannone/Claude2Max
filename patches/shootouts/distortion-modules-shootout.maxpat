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
          "text": "DISTORTION MODULES SHOOTOUT \u2014 distortion in BEAP modules, Max for Live devices and Apple's AudioUnit. One source bus (s~ SRC_L / SRC_R / SRC_M), every effect runs in parallel, the tab picks which one reaches the master via two selector~ (30 ms crossfade). Each effect is set 100% wet where it has a mix control; the master DRY/WET slider does the global mix (loads at 0.25 wet)."
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
          "text": "EFFECT SELECT \u2014 live.tab, one column of 11, conventional order. The v8 maps item index \u2192 slot number (1 = DRY: wet bus muted, master dry only) and lights the pane title"
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
            238.0
          ],
          "num_lines_patching": 11,
          "num_lines_presentation": 11,
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
                "2 BEAP Wavefolder",
                "3 BEAP Waveshaper",
                "4 BEAP Folder",
                "5 BEAP Diode",
                "6 amxd PluggoFuzz",
                "7 amxd Waveshaper",
                "8 amxd MonsterCrunch",
                "9 amxd WasteBand",
                "10 amxd Noyzckippr",
                "11 AU Distortion"
              ],
              "parameter_initial": [
                0
              ],
              "parameter_longname": "FX_SELECT",
              "parameter_mmax": 10,
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
          "text": "v8 fx-shootout-highlight.js 11 @embed 1",
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
          "id": "obj-41",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            60.0,
            169.0,
            20.0
          ],
          "text": "2 \u00b7 BEAP Wavefolder",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            406.0,
            134.0,
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
            316.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            406.0,
            134.0,
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
            316.0,
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
            316.0,
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
            276.0,
            20.0
          ],
          "text": "2 \u00b7 bp.Wavefolder \u2014 BEAP wavefolder"
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
          "maxclass": "bpatcher",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            590.0,
            132.0,
            116.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            430.0,
            132.0,
            116.0
          ],
          "varname": "FX_WAVEFOLD",
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
              79.0,
              501.0,
              487.0
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
                  "id": "obj-3",
                  "linecount": 2,
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    19.236206,
                    64.0,
                    229.0,
                    30.0
                  ],
                  "text": "## Waveshape a signal by amplifying and wrapping the peaks back down ## "
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
                  "id": "obj-1",
                  "maxclass": "live.text",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    149.236206,
                    301.691772,
                    40.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    75.0,
                    19.0,
                    52.0,
                    14.764644622802734
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_initial": [
                        0.0
                      ],
                      "parameter_shortname": "Bypass",
                      "parameter_enum": [
                        "val1",
                        "val2"
                      ],
                      "parameter_type": 0,
                      "parameter_unitstyle": 0,
                      "parameter_longname": "Bypass",
                      "parameter_mmax": 1.0
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
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-54",
                  "maxclass": "newobj",
                  "numinlets": 6,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    564.236206,
                    274.0,
                    112.0,
                    20.0
                  ],
                  "text": "scale~ 1 5 5 1 0.25"
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
                    "signal"
                  ],
                  "patching_rect": [
                    423.236206,
                    323.0,
                    160.0,
                    20.0
                  ],
                  "text": "*~"
                }
              },
              {
                "box": {
                  "bubble": 1,
                  "bubbleside": 3,
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-11",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    359.0,
                    244.754272,
                    54.0,
                    22.0
                  ],
                  "text": "wrap"
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
                    "int"
                  ],
                  "patching_rect": [
                    149.236206,
                    339.754272,
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
                  "id": "obj-16",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    149.236206,
                    382.754272,
                    567.0,
                    20.0
                  ],
                  "text": "selector~ 2 1"
                }
              },
              {
                "box": {
                  "comment": "signal output",
                  "id": "obj-2",
                  "index": 1,
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    149.236206,
                    428.754272,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-32",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    472.236206,
                    191.254272,
                    33.0,
                    20.0
                  ],
                  "text": "sig~"
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
                  "id": "obj-29",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    472.236206,
                    122.883911,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    43.29222869873047,
                    44.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_initial": [
                        1.0
                      ],
                      "parameter_shortname": "Range",
                      "parameter_type": 0,
                      "parameter_unitstyle": 1,
                      "parameter_mmin": 1.0,
                      "parameter_longname": "Range",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 5.0
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "Range"
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
                    423.236206,
                    244.754272,
                    68.0,
                    20.0
                  ],
                  "text": "%~ 0"
                }
              },
              {
                "box": {
                  "comment": "signal input",
                  "id": "obj-23",
                  "index": 1,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    423.236206,
                    46.883911,
                    25.0,
                    25.0
                  ]
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
                    98.236206,
                    436.754272,
                    37.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
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
                  "id": "obj-19",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    367.5,
                    46.883911,
                    37.0,
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
                    19.236206,
                    38.907501,
                    73.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    19.0,
                    73.0,
                    17.0
                  ],
                  "text": "WAVEFOLDER",
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
                    19.236206,
                    18.711639,
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
                    63.573395,
                    18.711639,
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
                    106.315491,
                    18.711639,
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
                    "obj-17",
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
                    "obj-25",
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
                    "obj-2",
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
                    "obj-10",
                    0
                  ],
                  "order": 1,
                  "source": [
                    "obj-23",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-16",
                    2
                  ],
                  "midpoints": [
                    432.736206,
                    110.627136,
                    706.736206,
                    110.627136
                  ],
                  "order": 0,
                  "source": [
                    "obj-23",
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
                    "obj-25",
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
                    "obj-29",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-10",
                    1
                  ],
                  "order": 1,
                  "source": [
                    "obj-32",
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
                  "order": 0,
                  "source": [
                    "obj-32",
                    0
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
                    "obj-54",
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
          "id": "obj-48",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            741.0,
            83.0,
            22.0
          ],
          "text": "s~ FX02_L"
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
            120.0,
            741.0,
            83.0,
            22.0
          ],
          "text": "s~ FX02_R"
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
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            552.0,
            134.0,
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
          "id": "obj-52",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            112.0,
            169.0,
            20.0
          ],
          "text": "3 \u00b7 BEAP Waveshaper",
          "presentation": 1,
          "presentation_rect": [
            176.0,
            406.0,
            134.0,
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
          "id": "obj-53",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            922.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            176.0,
            406.0,
            134.0,
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
          "id": "obj-54",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            922.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "2"
        }
      },
      {
        "box": {
          "id": "obj-55",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            922.0,
            580.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            456.0,
            520.0,
            456.0,
            20.0
          ],
          "text": "3 \u00b7 bp.Waveshaper \u2014 BEAP waveshaper (in 1 = gain CV, unused)"
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
            456.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_M"
        }
      },
      {
        "box": {
          "id": "obj-58",
          "maxclass": "bpatcher",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            456.0,
            590.0,
            107.0,
            116.0
          ],
          "presentation": 1,
          "presentation_rect": [
            176.0,
            430.0,
            107.0,
            116.0
          ],
          "varname": "FX_WAVESHAPE",
          "comment": "in 0: signal | in 1: CV (unused) | out 0: signal",
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
              79.0,
              312.0,
              339.0
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
                  "id": "obj-16",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    47.0,
                    70.970001,
                    117.0,
                    18.0
                  ],
                  "text": "## Waveshaper ## "
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-60",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    379.0,
                    276.0,
                    46.0,
                    20.0
                  ],
                  "text": "*~ 100"
                }
              },
              {
                "box": {
                  "id": "obj-57",
                  "linecolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.61
                  ],
                  "maxclass": "live.line",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    28.486885,
                    25.681641,
                    5.0,
                    100.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    38.0,
                    67.29222869873047,
                    16.0,
                    5.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-56",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    475.736877,
                    100.85083,
                    23.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    80.2362060546875,
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
                  "appearance": 1,
                  "id": "obj-22",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    562.406006,
                    47.528717,
                    47.0,
                    36.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    53.0,
                    44.483158111572266,
                    47.0,
                    36.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_shortname": "CV",
                      "parameter_type": 0,
                      "parameter_unitstyle": 5,
                      "parameter_longname": "CV",
                      "parameter_mmax": 100.0
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "Gain"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-54",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    208.736206,
                    233.058716,
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
                  "id": "obj-55",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    208.736206,
                    276.0,
                    81.0,
                    21.0
                  ],
                  "text": "pow~"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-36",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    248.736206,
                    452.245728,
                    43.0,
                    20.0
                  ],
                  "text": "sig~ 1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-38",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    248.736206,
                    488.0,
                    70.513794,
                    20.0
                  ],
                  "text": "/~ 1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-39",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    300.25,
                    452.245728,
                    47.0,
                    21.0
                  ],
                  "text": "atan~"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-40",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    154.736206,
                    564.0,
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
                  "id": "obj-41",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    154.736206,
                    396.0,
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
                  "id": "obj-42",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "int"
                  ],
                  "patching_rect": [
                    62.236206,
                    544.754272,
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
                  "id": "obj-43",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    62.236206,
                    599.754272,
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
                  "id": "obj-44",
                  "maxclass": "live.text",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    62.236206,
                    499.691772,
                    40.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    57.2362060546875,
                    20.0,
                    46.0,
                    14.764644622802734
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_initial": [
                        0.0
                      ],
                      "parameter_shortname": "bypass",
                      "parameter_enum": [
                        "val1",
                        "val2"
                      ],
                      "parameter_defer": 1,
                      "parameter_type": 2,
                      "parameter_longname": "bypass[1]",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 1.0
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
                  "varname": "bypass[1]"
                }
              },
              {
                "box": {
                  "comment": "signal output",
                  "id": "obj-45",
                  "index": 1,
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    62.236206,
                    645.754272,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "comment": "signal input",
                  "id": "obj-46",
                  "index": 1,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    154.736206,
                    321.0,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-47",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    154.736206,
                    533.0,
                    113.0,
                    21.0
                  ],
                  "text": "*~"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-48",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    154.736206,
                    440.0,
                    73.0,
                    21.0
                  ],
                  "text": "*~"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-49",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    154.736206,
                    488.0,
                    47.0,
                    21.0
                  ],
                  "text": "atan~"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-51",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "float"
                  ],
                  "patching_rect": [
                    270.736206,
                    233.058716,
                    35.0,
                    20.0
                  ],
                  "text": "* 0.1"
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
                  "id": "obj-53",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    270.736206,
                    167.970001,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    43.483158111572266,
                    44.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_initial": [
                        0.01
                      ],
                      "parameter_shortname": "Amount",
                      "parameter_type": 0,
                      "parameter_unitstyle": 5,
                      "parameter_mmin": 0.01,
                      "parameter_exponent": 2.0,
                      "parameter_longname": "Amount[1]",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 100.0
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "Amount[1]"
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
                    "signal"
                  ],
                  "patching_rect": [
                    208.736206,
                    321.0,
                    189.263794,
                    20.0
                  ],
                  "text": "+~"
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-114",
                  "index": 2,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    441.0,
                    100.85083,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-115",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    441.0,
                    179.974976,
                    42.0,
                    20.0
                  ],
                  "text": "*~ 0.2"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-119",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    379.0,
                    190.117432,
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
                  "id": "obj-120",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    379.0,
                    233.058716,
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
                  "id": "obj-124",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    441.0,
                    148.974976,
                    140.406006,
                    20.0
                  ],
                  "text": "*~"
                }
              },
              {
                "box": {
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 10.0,
                  "id": "obj-126",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "float"
                  ],
                  "patching_rect": [
                    562.406006,
                    107.85083,
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
                    47.0,
                    109.470001,
                    59.5,
                    20.0
                  ],
                  "restore": {
                    "Amount[1]": [
                      0.01
                    ],
                    "Gain": [
                      0.0
                    ],
                    "bypass[1]": [
                      0.0
                    ]
                  },
                  "text": "autopattr",
                  "varname": "u454010350"
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
                    16.736206,
                    645.754272,
                    37.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
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
                  "id": "obj-19",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    106.736206,
                    321.0,
                    37.0,
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
                    47.0,
                    42.907501,
                    55.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    19.0,
                    55.0,
                    17.0
                  ],
                  "text": "WVSHPR",
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
                    47.0,
                    25.681641,
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
                    91.337189,
                    25.681641,
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
                    134.079285,
                    25.681641,
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
                    "obj-124",
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
                    "obj-120",
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
                  "color": [
                    0.501961,
                    0.501961,
                    0.501961,
                    0.901961
                  ],
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
                    "obj-60",
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
                    "obj-115",
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
                    "obj-126",
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
                    "obj-38",
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
                    "obj-47",
                    1
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
                    "obj-38",
                    1
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
                    "obj-43",
                    1
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
                    "obj-48",
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
                    "obj-41",
                    0
                  ],
                  "order": 1,
                  "source": [
                    "obj-46",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-43",
                    2
                  ],
                  "order": 0,
                  "source": [
                    "obj-46",
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
                    "obj-55",
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
                    "obj-51",
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
                  "color": [
                    0.501961,
                    0.501961,
                    0.501961,
                    0.901961
                  ],
                  "destination": [
                    "obj-55",
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
                    "obj-7",
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
                    "obj-7",
                    1
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
                    "obj-39",
                    0
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
                    "obj-48",
                    1
                  ],
                  "order": 1,
                  "source": [
                    "obj-7",
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
          "id": "obj-59",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            456.0,
            741.0,
            83.0,
            22.0
          ],
          "text": "s~ FX03_L"
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
            546.0,
            741.0,
            83.0,
            22.0
          ],
          "text": "s~ FX03_R"
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
            2520.0,
            138.0,
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            176.0,
            552.0,
            134.0,
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
          "id": "obj-63",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            164.0,
            135.0,
            20.0
          ],
          "text": "4 \u00b7 BEAP Folder",
          "presentation": 1,
          "presentation_rect": [
            334.0,
            406.0,
            254.0,
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
          "id": "obj-64",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1535.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            334.0,
            406.0,
            254.0,
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
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1535.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "3"
        }
      },
      {
        "box": {
          "id": "obj-66",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1535.0,
            580.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            1062.0,
            520.0,
            463.0,
            20.0
          ],
          "text": "4 \u00b7 bp.Folder \u2014 BEAP fold / wrap / clip (in 1\u20132 = CV, unused)"
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
            1062.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_M"
        }
      },
      {
        "box": {
          "id": "obj-69",
          "maxclass": "bpatcher",
          "numinlets": 3,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1062.0,
            590.0,
            254.0,
            116.0
          ],
          "presentation": 1,
          "presentation_rect": [
            334.0,
            430.0,
            254.0,
            116.0
          ],
          "varname": "FX_FOLDER",
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
              79.0,
              621.0,
              520.0
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
                  "id": "obj-3",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    36.5,
                    87.422546,
                    220.0,
                    18.0
                  ],
                  "text": "## CV-controllable waveform folder ## "
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
                    "int"
                  ],
                  "patching_rect": [
                    111.5,
                    468.754272,
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
                  "id": "obj-16",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    111.5,
                    523.754272,
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
                  "id": "obj-4",
                  "maxclass": "live.text",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    111.5,
                    423.691772,
                    40.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    191.5,
                    20.0,
                    52.0,
                    14.764644622802734
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_initial": [
                        0.0
                      ],
                      "parameter_shortname": "bypass",
                      "parameter_enum": [
                        "val1",
                        "val2"
                      ],
                      "parameter_defer": 1,
                      "parameter_type": 2,
                      "parameter_longname": "bypass",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 1.0
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
                  "fontname": "Ableton Sans Bold Regular",
                  "fontsize": 9.0,
                  "id": "obj-2",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    566.479248,
                    29.0,
                    37.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    206.0,
                    0.0,
                    35.0,
                    17.0
                  ],
                  "text": "Hi CV",
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
                  "id": "obj-1",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    388.239624,
                    118.0,
                    37.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    109.0,
                    0.0,
                    36.0,
                    17.0
                  ],
                  "text": "Lo CV",
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
                  "id": "obj-57",
                  "index": 1,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    296.5,
                    406.735229,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-56",
                  "index": 1,
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    111.5,
                    585.422546,
                    25.0,
                    25.0
                  ]
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-46",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    604.479248,
                    187.922546,
                    43.0,
                    21.0
                  ],
                  "text": "$1 20"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-47",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "signal",
                    "bang"
                  ],
                  "patching_rect": [
                    604.479248,
                    217.922546,
                    40.0,
                    21.0
                  ],
                  "text": "line~"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-48",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    572.479248,
                    250.922546,
                    51.0,
                    20.0
                  ],
                  "text": "*~"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-49",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "float"
                  ],
                  "patching_rect": [
                    604.479248,
                    153.922546,
                    42.0,
                    20.0
                  ],
                  "text": "* 0.01"
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
                  "appearance": 1,
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
                    604.479248,
                    87.422546,
                    47.0,
                    36.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    136.0,
                    42.79222869873047,
                    47.0,
                    36.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_shortname": "CV",
                      "parameter_type": 0,
                      "parameter_unitstyle": 5,
                      "parameter_mmin": -100.0,
                      "parameter_longname": "HiValueCV",
                      "parameter_mmax": 100.0
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "HiValueCV"
                }
              },
              {
                "box": {
                  "comment": "signal input",
                  "id": "obj-51",
                  "index": 3,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    572.479248,
                    62.422546,
                    25.0,
                    25.0
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
                    693.979248,
                    161.922546,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    96.0,
                    42.79222869873047,
                    44.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_initial": [
                        0.0
                      ],
                      "parameter_shortname": "High",
                      "parameter_type": 0,
                      "parameter_unitstyle": 1,
                      "parameter_mmin": -5.0,
                      "parameter_longname": "HiValue",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 5.0
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "HiValue"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-53",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    693.979248,
                    230.922546,
                    43.0,
                    21.0
                  ],
                  "text": "$1 20"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-54",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "signal",
                    "bang"
                  ],
                  "patching_rect": [
                    693.979248,
                    260.922546,
                    40.0,
                    21.0
                  ],
                  "text": "line~"
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
                    "signal"
                  ],
                  "patching_rect": [
                    572.479248,
                    306.922546,
                    140.5,
                    20.0
                  ],
                  "text": "+~"
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
                  "bordercolor": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "focusbordercolor": [
                    0.0,
                    0.0,
                    0.0,
                    1.0
                  ],
                  "hltcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.16
                  ],
                  "id": "obj-45",
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
                    204.0,
                    371.735229,
                    100.0,
                    15.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    187.0,
                    42.79222869873047,
                    55.355247497558594,
                    15.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_shortname": "mode",
                      "parameter_enum": [
                        "fold",
                        "wrap",
                        "clip"
                      ],
                      "parameter_type": 2,
                      "parameter_longname": "mode"
                    }
                  },
                  "textcolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "varname": "mode"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-34",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    420.239502,
                    277.232635,
                    43.0,
                    21.0
                  ],
                  "text": "$1 20"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-35",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "signal",
                    "bang"
                  ],
                  "patching_rect": [
                    420.239502,
                    307.232635,
                    40.0,
                    21.0
                  ],
                  "text": "line~"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-36",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    388.239624,
                    340.232635,
                    51.0,
                    20.0
                  ],
                  "text": "*~"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-37",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "float"
                  ],
                  "patching_rect": [
                    420.239502,
                    243.232635,
                    42.0,
                    20.0
                  ],
                  "text": "* 0.01"
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
                  "appearance": 1,
                  "id": "obj-38",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    420.239502,
                    176.732635,
                    47.0,
                    36.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    42.0,
                    42.79222869873047,
                    47.0,
                    36.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_shortname": "CV",
                      "parameter_type": 0,
                      "parameter_unitstyle": 5,
                      "parameter_mmin": -100.0,
                      "parameter_longname": "LoValueCV",
                      "parameter_mmax": 100.0
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "LoValueCV"
                }
              },
              {
                "box": {
                  "comment": "signal input",
                  "id": "obj-39",
                  "index": 2,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    388.239624,
                    151.732635,
                    25.0,
                    25.0
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
                  "id": "obj-40",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    509.739502,
                    251.232635,
                    44.0,
                    48.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    42.79222869873047,
                    44.0,
                    48.0
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_initial": [
                        0.0
                      ],
                      "parameter_shortname": "Low",
                      "parameter_type": 0,
                      "parameter_unitstyle": 1,
                      "parameter_mmin": -5.0,
                      "parameter_longname": "LoValue",
                      "parameter_initial_enable": 1,
                      "parameter_mmax": 5.0
                    }
                  },
                  "textcolor": [
                    1.0,
                    1.0,
                    1.0,
                    0.7
                  ],
                  "varname": "LoValue"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-41",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    509.739502,
                    320.232635,
                    43.0,
                    21.0
                  ],
                  "text": "$1 20"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-42",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "signal",
                    "bang"
                  ],
                  "patching_rect": [
                    509.739502,
                    350.232635,
                    40.0,
                    21.0
                  ],
                  "text": "line~"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-43",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    388.239624,
                    396.232666,
                    140.5,
                    20.0
                  ],
                  "text": "+~"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-9",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    204.0,
                    406.735229,
                    62.0,
                    21.0
                  ],
                  "text": "mode $1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 13.0,
                  "id": "obj-29",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    204.0,
                    454.922546,
                    387.479248,
                    21.0
                  ],
                  "text": "pong~ 0 -0.25 0.25"
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
                    36.5,
                    116.815094,
                    59.5,
                    20.0
                  ],
                  "restore": {
                    "HiValue": [
                      5.0
                    ],
                    "HiValueCV": [
                      0.0
                    ],
                    "LoValue": [
                      -5.0
                    ],
                    "LoValueCV": [
                      0.0
                    ],
                    "bypass": [
                      0.0
                    ],
                    "mode": [
                      0.0
                    ]
                  },
                  "text": "autopattr",
                  "varname": "u807009586"
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
                    62.736206,
                    593.422546,
                    37.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
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
                  "id": "obj-19",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    331.0,
                    406.735229,
                    37.0,
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
                    36.5,
                    63.800049,
                    48.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    19.0,
                    48.0,
                    17.0
                  ],
                  "text": "FOLDER",
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
                    36.5,
                    41.422546,
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
                    83.081711,
                    41.422546,
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
                    129.663422,
                    41.422546,
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
                  "proportion": 0.39,
                  "rounded": 0
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "destination": [
                    "obj-56",
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
                    "obj-16",
                    1
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
                    "obj-35",
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
                    "obj-36",
                    1
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
                    "obj-43",
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
                    "obj-34",
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
                    "obj-36",
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
                    1
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
                    "obj-29",
                    1
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
                    "obj-9",
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
                    "obj-46",
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
                    "obj-55",
                    1
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
                    "obj-29",
                    2
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
                    "obj-16",
                    2
                  ],
                  "order": 0,
                  "source": [
                    "obj-57",
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
                  "order": 1,
                  "source": [
                    "obj-57",
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
          "id": "obj-70",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1062.0,
            741.0,
            83.0,
            22.0
          ],
          "text": "s~ FX04_L"
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
            1256.0,
            741.0,
            83.0,
            22.0
          ],
          "text": "s~ FX04_R"
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
            190.0,
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            334.0,
            552.0,
            254.0,
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
          "id": "obj-74",
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
          "text": "5 \u00b7 BEAP Diode",
          "presentation": 1,
          "presentation_rect": [
            612.0,
            406.0,
            102.0,
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
          "id": "obj-75",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            2119.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            612.0,
            406.0,
            102.0,
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
          "id": "obj-76",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            2119.0,
            550.0,
            40.0,
            22.0
          ],
          "text": "4"
        }
      },
      {
        "box": {
          "id": "obj-77",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2119.0,
            580.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            1675.0,
            520.0,
            434.0,
            20.0
          ],
          "text": "5 \u00b7 bp.Diode \u2014 BEAP half-wave rectifier (+ only / \u2212 only)"
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
            1675.0,
            550.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_M"
        }
      },
      {
        "box": {
          "id": "obj-80",
          "maxclass": "bpatcher",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1675.0,
            590.0,
            92.0,
            116.0
          ],
          "presentation": 1,
          "presentation_rect": [
            612.0,
            430.0,
            92.0,
            116.0
          ],
          "varname": "FX_DIODE",
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
          "patcher": {
            "fileversion": 1,
            "appversion": {
              "major": 7,
              "minor": 0,
              "revision": 0,
              "architecture": "x64",
              "modernui": 1
            },
            "rect": [
              34.0,
              78.0,
              92.0,
              116.0
            ],
            "bgcolor": [
              1.0,
              1.0,
              1.0,
              0.0
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
            "boxes": [
              {
                "box": {
                  "id": "obj-16",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    26.173828,
                    74.0,
                    363.0,
                    20.0
                  ],
                  "style": "",
                  "text": "## Constrain the signal output to positive-only or negative-only ## "
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-23",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 3,
                  "outlettype": [
                    "bang",
                    "bang",
                    ""
                  ],
                  "patching_rect": [
                    336.931091,
                    229.0,
                    46.0,
                    22.0
                  ],
                  "style": "",
                  "text": "sel 0 1"
                }
              },
              {
                "box": {
                  "activebgoncolor": [
                    0.278431,
                    0.839216,
                    1.0,
                    1.0
                  ],
                  "id": "obj-38",
                  "maxclass": "live.tab",
                  "num_lines_patching": 2,
                  "num_lines_presentation": 2,
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "",
                    "",
                    "float"
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    336.931091,
                    157.0,
                    44.443909,
                    41.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    3.640533,
                    42.088398,
                    82.359467,
                    49.072964
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_longname": "mode",
                      "parameter_shortname": "mode",
                      "parameter_type": 2,
                      "parameter_enum": [
                        "+ only",
                        "- only"
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_initial": [
                        0.0
                      ],
                      "parameter_unitstyle": 0
                    }
                  },
                  "varname": "FilterType"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-21",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    391.931091,
                    303.529999,
                    32.5,
                    22.0
                  ],
                  "style": "",
                  "text": "0"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-18",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    336.931091,
                    303.529999,
                    32.5,
                    22.0
                  ],
                  "style": "",
                  "text": "-5"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-14",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    391.931091,
                    268.0,
                    32.5,
                    22.0
                  ],
                  "style": "",
                  "text": "5"
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
                    336.931091,
                    268.0,
                    32.5,
                    22.0
                  ],
                  "style": "",
                  "text": "0"
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
                    318.931091,
                    340.0,
                    56.0,
                    22.0
                  ],
                  "style": "",
                  "text": "clip~ 0 5"
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
                    "int"
                  ],
                  "patching_rect": [
                    226.431091,
                    340.0,
                    32.5,
                    22.0
                  ],
                  "style": "",
                  "text": "+ 1"
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-11",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "outlettype": [
                    "signal"
                  ],
                  "patching_rect": [
                    226.431091,
                    395.0,
                    204.0,
                    22.0
                  ],
                  "style": "",
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
                  "id": "obj-20",
                  "maxclass": "live.text",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "parameter_enable": 1,
                  "patching_rect": [
                    226.431091,
                    294.9375,
                    40.0,
                    20.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    41.0,
                    19.0,
                    45.0,
                    14.764645
                  ],
                  "saved_attribute_attributes": {
                    "valueof": {
                      "parameter_longname": "bypass",
                      "parameter_shortname": "bypass",
                      "parameter_type": 2,
                      "parameter_mmax": 1.0,
                      "parameter_enum": [
                        "val1",
                        "val2"
                      ],
                      "parameter_initial_enable": 1,
                      "parameter_initial": [
                        0.0
                      ],
                      "parameter_defer": 1
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
                  "id": "obj-22",
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    226.431091,
                    441.0,
                    25.0,
                    25.0
                  ],
                  "style": ""
                }
              },
              {
                "box": {
                  "fontname": "Arial",
                  "fontsize": 12.0,
                  "id": "obj-2",
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
                    26.173828,
                    114.0,
                    59.5,
                    22.0
                  ],
                  "restore": {
                    "FilterType": [
                      0.0
                    ],
                    "bypass": [
                      0.0
                    ]
                  },
                  "style": "",
                  "text": "autopattr",
                  "varname": "u903002161"
                }
              },
              {
                "box": {
                  "comment": "signal input",
                  "id": "obj-4",
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    411.431091,
                    65.529999,
                    25.0,
                    25.0
                  ],
                  "style": ""
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
                    269.642456,
                    445.0,
                    37.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    97.0,
                    38.0,
                    17.0
                  ],
                  "style": "",
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
                    455.142456,
                    65.529999,
                    37.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    0.0,
                    38.0,
                    17.0
                  ],
                  "style": "",
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
                    26.173828,
                    47.907501,
                    48.0,
                    17.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    2.0,
                    19.0,
                    40.0,
                    17.0
                  ],
                  "style": "",
                  "text": "DIODE",
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
                    26.173828,
                    24.529999,
                    37.0,
                    5.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    0.0,
                    37.0,
                    283.0,
                    60.338158
                  ],
                  "proportion": 0.39,
                  "rounded": 0,
                  "style": ""
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
                    72.834366,
                    24.529999,
                    37.0,
                    5.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    0.0,
                    17.0,
                    283.0,
                    80.338158
                  ],
                  "proportion": 0.39,
                  "rounded": 0,
                  "style": ""
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
                    117.816223,
                    24.529999,
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
                  "proportion": 0.39,
                  "rounded": 0,
                  "style": ""
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-10",
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
                  "disabled": 0,
                  "hidden": 0,
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
                    2
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-14",
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-18",
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-20",
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-21",
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-23",
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-23",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-21",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-23",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-9",
                    0
                  ],
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-23",
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-38",
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-4",
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-4",
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-5",
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
                  "disabled": 0,
                  "hidden": 0,
                  "source": [
                    "obj-9",
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
          "id": "obj-81",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1675.0,
            741.0,
            83.0,
            22.0
          ],
          "text": "s~ FX05_L"
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
            1765.0,
            741.0,
            83.0,
            22.0
          ],
          "text": "s~ FX05_R"
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
            242.0,
            203.0,
            20.0
          ],
          "text": "mono in \u2192 both channels",
          "presentation": 1,
          "presentation_rect": [
            612.0,
            552.0,
            102.0,
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
            268.0,
            169.0,
            20.0
          ],
          "text": "6 \u00b7 amxd PluggoFuzz",
          "presentation": 1,
          "presentation_rect": [
            738.0,
            406.0,
            464.0,
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
          "id": "obj-86",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            580.0,
            841.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            738.0,
            406.0,
            464.0,
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
            580.0,
            871.0,
            40.0,
            22.0
          ],
          "text": "5"
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
            580.0,
            901.0,
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
            30.0,
            841.0,
            540.0,
            20.0
          ],
          "text": "6 \u00b7 amxd~ PluggoFuzz.amxd \u2014 four clipping modes with in/out filters"
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
            30.0,
            871.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            1212.0,
            406.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-91",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            100.0,
            871.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            180.0,
            871.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-93",
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
            951.0,
            520.0,
            196.0
          ],
          "text": "amxd~ PluggoFuzz.amxd",
          "presentation": 1,
          "presentation_rect": [
            738.0,
            432.0,
            520.0,
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
          "id": "obj-94",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            1182.0,
            83.0,
            22.0
          ],
          "text": "s~ FX06_L"
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
            170.0,
            1182.0,
            83.0,
            22.0
          ],
          "text": "s~ FX06_R"
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
            294.0,
            169.0,
            20.0
          ],
          "text": "7 \u00b7 amxd Waveshaper",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            658.0,
            376.0,
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
          "id": "obj-98",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1190.0,
            841.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            658.0,
            376.0,
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
          "id": "obj-99",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1190.0,
            871.0,
            40.0,
            22.0
          ],
          "text": "6"
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
            1190.0,
            901.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-101",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            720.0,
            841.0,
            460.0,
            20.0
          ],
          "text": "7 \u00b7 amxd~ Waveshaper.amxd \u2014 drawable transfer curve"
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
            720.0,
            871.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            404.0,
            658.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-103",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            790.0,
            871.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            870.0,
            871.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-105",
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
            720.0,
            951.0,
            432.0,
            196.0
          ],
          "text": "amxd~ Waveshaper.amxd",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            684.0,
            432.0,
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
          "id": "obj-106",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            720.0,
            1182.0,
            83.0,
            22.0
          ],
          "text": "s~ FX07_L"
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
            860.0,
            1182.0,
            83.0,
            22.0
          ],
          "text": "s~ FX07_R"
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
            320.0,
            195.0,
            20.0
          ],
          "text": "8 \u00b7 amxd MonsterCrunch",
          "presentation": 1,
          "presentation_rect": [
            478.0,
            658.0,
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
          "varname": "TITLE_08"
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
            1800.0,
            841.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            478.0,
            658.0,
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
          "id": "obj-111",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1800.0,
            871.0,
            40.0,
            22.0
          ],
          "text": "7"
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
            1800.0,
            901.0,
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
            1330.0,
            841.0,
            460.0,
            20.0
          ],
          "text": "8 \u00b7 amxd~ MonsterCrunch.amxd \u2014 huge gain, hard clip, lowpass"
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
            1330.0,
            871.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            856.0,
            658.0,
            50.0,
            22.0
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
            1400.0,
            871.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            1480.0,
            871.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-117",
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
            1330.0,
            951.0,
            424.0,
            196.0
          ],
          "text": "amxd~ MonsterCrunch.amxd",
          "presentation": 1,
          "presentation_rect": [
            478.0,
            684.0,
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
          "varname": "DEV_08"
        }
      },
      {
        "box": {
          "id": "obj-118",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1630.0,
            871.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-119",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1630.0,
            911.0,
            104.0,
            22.0
          ],
          "text": "wet-dry 100."
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
            1330.0,
            1182.0,
            83.0,
            22.0
          ],
          "text": "s~ FX08_L"
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
            1470.0,
            1182.0,
            83.0,
            22.0
          ],
          "text": "s~ FX08_R"
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
            346.0,
            161.0,
            20.0
          ],
          "text": "9 \u00b7 amxd WasteBand",
          "presentation": 1,
          "presentation_rect": [
            930.0,
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
          "varname": "TITLE_09"
        }
      },
      {
        "box": {
          "id": "obj-124",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            553.0,
            1282.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            930.0,
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
          "id": "obj-125",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            553.0,
            1312.0,
            40.0,
            22.0
          ],
          "text": "8"
        }
      },
      {
        "box": {
          "id": "obj-126",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            553.0,
            1342.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            30.0,
            1282.0,
            513.0,
            20.0
          ],
          "text": "9 \u00b7 amxd~ WasteBand.amxd \u2014 three bands, each mute / pass / overdrive"
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
            30.0,
            1312.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            1306.0,
            658.0,
            50.0,
            22.0
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
            100.0,
            1312.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            180.0,
            1312.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-131",
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
            1392.0,
            422.0,
            196.0
          ],
          "text": "amxd~ WasteBand.amxd",
          "presentation": 1,
          "presentation_rect": [
            930.0,
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
          "varname": "DEV_09"
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
            1623.0,
            83.0,
            22.0
          ],
          "text": "s~ FX09_L"
        }
      },
      {
        "box": {
          "id": "obj-133",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            170.0,
            1623.0,
            83.0,
            22.0
          ],
          "text": "s~ FX09_R"
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
            372.0,
            178.0,
            20.0
          ],
          "text": "10 \u00b7 amxd Noyzckippr",
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
          "varname": "TITLE_10"
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
            1292.0,
            1282.0,
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
          "id": "obj-137",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1292.0,
            1312.0,
            40.0,
            22.0
          ],
          "text": "9"
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
            1292.0,
            1342.0,
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
            693.0,
            1282.0,
            589.0,
            20.0
          ],
          "text": "10 \u00b7 amxd~ Noyzckippr.amxd \u2014 multiplies the input by bandpassed noise"
        }
      },
      {
        "box": {
          "id": "obj-140",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            693.0,
            1312.0,
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
          "id": "obj-141",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            763.0,
            1312.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
        }
      },
      {
        "box": {
          "id": "obj-142",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            843.0,
            1312.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-143",
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
            693.0,
            1392.0,
            250.0,
            196.0
          ],
          "text": "amxd~ Noyzckippr.amxd",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            936.0,
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
          "varname": "DEV_10"
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
            993.0,
            1312.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-145",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            993.0,
            1352.0,
            279.0,
            22.0
          ],
          "text": "wet_dry_left 100., wet_dry_right 100."
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
            693.0,
            1623.0,
            83.0,
            22.0
          ],
          "text": "s~ FX10_L"
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
            833.0,
            1623.0,
            83.0,
            22.0
          ],
          "text": "s~ FX10_R"
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
            398.0,
            501.0,
            20.0
          ],
          "text": "wet_dry_left / wet_dry_right \u2192 100 on load and on wet-only",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1138.0,
            264.0,
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
            424.0,
            161.0,
            20.0
          ],
          "text": "11 \u00b7 AU Distortion",
          "presentation": 1,
          "presentation_rect": [
            306.0,
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
          "id": "obj-151",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1318.0,
            1723.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            306.0,
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
          "id": "obj-152",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1318.0,
            1753.0,
            40.0,
            22.0
          ],
          "text": "10"
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
            1318.0,
            1783.0,
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
            30.0,
            1723.0,
            1278.0,
            20.0
          ],
          "text": "11 \u00b7 vst~ + plug_au AUDistortion \u2014 Apple's multi-stage distortion"
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
            30.0,
            1753.0,
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
            110.0,
            1753.0,
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
            2093.0,
            48.0,
            22.0
          ],
          "text": "vst~",
          "presentation": 1,
          "presentation_rect": [
            306.0,
            1107.0,
            214.0,
            22.0
          ],
          "varname": "VST_11"
        }
      },
      {
        "box": {
          "id": "obj-158",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            230.0,
            1753.0,
            76.0,
            22.0
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "obj-159",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            230.0,
            1781.0,
            55.0,
            22.0
          ],
          "text": "t b b"
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
            330.0,
            1823.0,
            160.0,
            22.0
          ],
          "text": "plug_au AUDistortion"
        }
      },
      {
        "box": {
          "id": "obj-161",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            230.0,
            1823.0,
            97.0,
            22.0
          ],
          "text": "s AU11_INIT"
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
            470.0,
            1753.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            306.0,
            934.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-163",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            1863.0,
            97.0,
            22.0
          ],
          "text": "r AU11_INIT"
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
            230.0,
            2008.0,
            90.0,
            22.0
          ],
          "text": "s TO_VST11"
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
            230.0,
            1903.0,
            40.0,
            22.0
          ],
          "text": "0"
        }
      },
      {
        "box": {
          "id": "obj-166",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            230.0,
            1933.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            364.0,
            934.0,
            22.0,
            22.0
          ]
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
            2520.0,
            450.0,
            59.0,
            20.0
          ],
          "text": "bypass",
          "presentation": 1,
          "presentation_rect": [
            390.0,
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
          "id": "obj-168",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            1963.0,
            83.0,
            22.0
          ],
          "text": "bypass $1"
        }
      },
      {
        "box": {
          "id": "obj-169",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            403.0,
            1903.0,
            62.0,
            22.0
          ],
          "text": "0.7398"
        }
      },
      {
        "box": {
          "id": "obj-170",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            403.0,
            1933.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            306.0,
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
          "id": "obj-171",
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
          "text": "soft clip gain (\u221280\u201320 dB)",
          "presentation": 1,
          "presentation_rect": [
            362.0,
            964.0,
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
          "id": "obj-172",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            403.0,
            1963.0,
            153.0,
            22.0
          ],
          "text": "\"Soft Clip Gain\" $1"
        }
      },
      {
        "box": {
          "id": "obj-173",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            576.0,
            1903.0,
            40.0,
            22.0
          ],
          "text": "1."
        }
      },
      {
        "box": {
          "id": "obj-174",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            576.0,
            1933.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            306.0,
            1003.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            502.0,
            135.0,
            20.0
          ],
          "text": "wet/dry (\u2192 wet)",
          "presentation": 1,
          "presentation_rect": [
            362.0,
            1005.0,
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
          "id": "obj-176",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            576.0,
            1963.0,
            132.0,
            22.0
          ],
          "text": "\"Wet/Dry Mix\" $1"
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
            749.0,
            1903.0,
            41.0,
            22.0
          ],
          "text": "0.5"
        }
      },
      {
        "box": {
          "id": "obj-178",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            749.0,
            1933.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            306.0,
            1027.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            2520.0,
            528.0,
            93.0,
            20.0
          ],
          "text": "decimation",
          "presentation": 1,
          "presentation_rect": [
            362.0,
            1029.0,
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
          "id": "obj-180",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            749.0,
            1963.0,
            111.0,
            22.0
          ],
          "text": "Decimation $1"
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
            922.0,
            1903.0,
            41.0,
            22.0
          ],
          "text": "0.5"
        }
      },
      {
        "box": {
          "id": "obj-182",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            922.0,
            1933.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            306.0,
            1051.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            554.0,
            127.0,
            20.0
          ],
          "text": "decimation mix",
          "presentation": 1,
          "presentation_rect": [
            362.0,
            1053.0,
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
          "id": "obj-184",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            922.0,
            1963.0,
            153.0,
            22.0
          ],
          "text": "\"Decimation Mix\" $1"
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
            1095.0,
            1903.0,
            41.0,
            22.0
          ],
          "text": "0.5"
        }
      },
      {
        "box": {
          "id": "obj-186",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            1095.0,
            1933.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            306.0,
            1075.0,
            50.0,
            22.0
          ],
          "minimum": 0.0,
          "maximum": 1.0
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
            580.0,
            127.0,
            20.0
          ],
          "text": "polynomial mix",
          "presentation": 1,
          "presentation_rect": [
            362.0,
            1077.0,
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
          "id": "obj-188",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1095.0,
            1963.0,
            153.0,
            22.0
          ],
          "text": "\"Polynomial Mix\" $1"
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
            2053.0,
            90.0,
            22.0
          ],
          "text": "r TO_VST11"
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
            2143.0,
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
            120.0,
            2143.0,
            83.0,
            22.0
          ],
          "text": "s~ FX11_R"
        }
      },
      {
        "box": {
          "id": "obj-192",
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
            306.0,
            1135.0,
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
          "id": "obj-193",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2253.0,
            1200.0,
            34.0
          ],
          "text": "MIXER \u2014 selector~ inlet n = tab item n. Inlet 1 (DRY) is left unconnected so DRY is silence on the wet bus (the master dry path is always live); inlets 2\u201311 are the effects"
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
            30.0,
            2313.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-195",
          "maxclass": "newobj",
          "numinlets": 12,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            2363.0,
            209.0,
            22.0
          ],
          "text": "selector~ 11 1 @ramptime 30"
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
            2413.0,
            76.0,
            22.0
          ],
          "text": "s~ WET_L"
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
            120.0,
            2313.0,
            83.0,
            22.0
          ],
          "text": "r~ FX02_L"
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
            210.0,
            2313.0,
            83.0,
            22.0
          ],
          "text": "r~ FX03_L"
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
            300.0,
            2313.0,
            83.0,
            22.0
          ],
          "text": "r~ FX04_L"
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
            390.0,
            2313.0,
            83.0,
            22.0
          ],
          "text": "r~ FX05_L"
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
            480.0,
            2313.0,
            83.0,
            22.0
          ],
          "text": "r~ FX06_L"
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
            570.0,
            2313.0,
            83.0,
            22.0
          ],
          "text": "r~ FX07_L"
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
            660.0,
            2313.0,
            83.0,
            22.0
          ],
          "text": "r~ FX08_L"
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
            750.0,
            2313.0,
            83.0,
            22.0
          ],
          "text": "r~ FX09_L"
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
            840.0,
            2313.0,
            83.0,
            22.0
          ],
          "text": "r~ FX10_L"
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
            930.0,
            2313.0,
            83.0,
            22.0
          ],
          "text": "r~ FX11_L"
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
            30.0,
            2443.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-208",
          "maxclass": "newobj",
          "numinlets": 12,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            2493.0,
            209.0,
            22.0
          ],
          "text": "selector~ 11 1 @ramptime 30"
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
            2543.0,
            76.0,
            22.0
          ],
          "text": "s~ WET_R"
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
            120.0,
            2443.0,
            83.0,
            22.0
          ],
          "text": "r~ FX02_R"
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
            210.0,
            2443.0,
            83.0,
            22.0
          ],
          "text": "r~ FX03_R"
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
            300.0,
            2443.0,
            83.0,
            22.0
          ],
          "text": "r~ FX04_R"
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
            390.0,
            2443.0,
            83.0,
            22.0
          ],
          "text": "r~ FX05_R"
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
            480.0,
            2443.0,
            83.0,
            22.0
          ],
          "text": "r~ FX06_R"
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
            570.0,
            2443.0,
            83.0,
            22.0
          ],
          "text": "r~ FX07_R"
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
            660.0,
            2443.0,
            83.0,
            22.0
          ],
          "text": "r~ FX08_R"
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
            750.0,
            2443.0,
            83.0,
            22.0
          ],
          "text": "r~ FX09_R"
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
            840.0,
            2443.0,
            83.0,
            22.0
          ],
          "text": "r~ FX10_R"
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
            930.0,
            2443.0,
            83.0,
            22.0
          ],
          "text": "r~ FX11_R"
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
            30.0,
            2593.0,
            700.0,
            20.0
          ],
          "text": "MASTER \u2014 global dry/wet crossfade (equal power); wet and dry paths sum at the live.gain~ inlets \u2192 ezdac~"
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
            30.0,
            2623.0,
            76.0,
            22.0
          ],
          "text": "r~ WET_L"
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
            110.0,
            2623.0,
            69.0,
            22.0
          ],
          "text": "r WET_G"
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
            200.0,
            2623.0,
            76.0,
            22.0
          ],
          "text": "r~ WET_R"
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
            330.0,
            2623.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            410.0,
            2623.0,
            69.0,
            22.0
          ],
          "text": "r DRY_G"
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
            500.0,
            2623.0,
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
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "patching_rect": [
            110.0,
            2663.0,
            55.0,
            22.0
          ],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "obj-228",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "patching_rect": [
            410.0,
            2663.0,
            55.0,
            22.0
          ],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "obj-229",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            2713.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-230",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            200.0,
            2713.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-231",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            330.0,
            2713.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-232",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            500.0,
            2713.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-233",
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
            2773.0,
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
          "id": "obj-234",
          "maxclass": "ezdac~",
          "numinlets": 2,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2853.0,
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
          "id": "obj-235",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            780.0,
            2593.0,
            400.0,
            20.0
          ],
          "text": "DRY/WET 0..1 \u2014 wet = sqrt(x), dry = sqrt(1-x); loads at 0.25"
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
            780.0,
            2623.0,
            111.0,
            22.0
          ],
          "text": "loadmess 0.25"
        }
      },
      {
        "box": {
          "id": "obj-237",
          "maxclass": "slider",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            780.0,
            2663.0,
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
          "id": "obj-238",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            780.0,
            2703.0,
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
          "id": "obj-239",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            780.0,
            2743.0,
            55.0,
            22.0
          ],
          "text": "t f f"
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
            780.0,
            2783.0,
            118.0,
            22.0
          ],
          "text": "expr sqrt($f1)"
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
            930.0,
            2783.0,
            139.0,
            22.0
          ],
          "text": "expr sqrt(1.-$f1)"
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
            780.0,
            2823.0,
            55.0,
            22.0
          ],
          "text": "$1 20"
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
            930.0,
            2823.0,
            55.0,
            22.0
          ],
          "text": "$1 20"
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
            780.0,
            2863.0,
            69.0,
            22.0
          ],
          "text": "s WET_G"
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
            930.0,
            2863.0,
            69.0,
            22.0
          ],
          "text": "s DRY_G"
        }
      },
      {
        "box": {
          "id": "obj-248",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            632.0,
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
          "id": "obj-249",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            658.0,
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
          "id": "obj-250",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            684.0,
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
          "id": "obj-251",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            710.0,
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
          "id": "obj-252",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            736.0,
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
          "id": "obj-253",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            762.0,
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
          "id": "obj-254",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            788.0,
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
          "id": "obj-255",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            814.0,
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
          "id": "obj-256",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            840.0,
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
          "id": "obj-257",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            866.0,
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
          "id": "obj-258",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            892.0,
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
          "id": "obj-259",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            918.0,
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
          "id": "obj-260",
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
            2923.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            400.0,
            150.0,
            201.0
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
          "id": "obj-51",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            100.0,
            2923.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            168.0,
            400.0,
            150.0,
            201.0
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
          "id": "obj-62",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            170.0,
            2923.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            326.0,
            400.0,
            270.0,
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
          "id": "obj-73",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            240.0,
            2923.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            604.0,
            400.0,
            118.0,
            201.0
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
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            310.0,
            2923.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            730.0,
            400.0,
            540.0,
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
          "id": "obj-96",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            380.0,
            2923.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            652.0,
            452.0,
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
          "id": "obj-108",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            450.0,
            2923.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            470.0,
            652.0,
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
          "id": "obj-122",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            520.0,
            2923.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            922.0,
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
          "id": "obj-134",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            590.0,
            2923.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            904.0,
            280.0,
            283.0
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
            660.0,
            2923.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            298.0,
            904.0,
            230.0,
            278.0
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
            730.0,
            2923.0,
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
          "id": "obj-247",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            800.0,
            2923.0,
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
            2983.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"width\": 1444,\n  \"height\": 900,\n  \"bglocked\": 1,\n  \"objects\": {\n    \"hdr_note\": {\n      \"type\": \"comment\",\n      \"text\": \"DISTORTION MODULES SHOOTOUT \\u2014 distortion in BEAP modules, Max for Live devices and Apple's AudioUnit. One source bus (s~ SRC_L / SRC_R / SRC_M), every effect runs in parallel, the tab picks which one reaches the master via two selector~ (30 ms crossfade). Each effect is set 100% wet where it has a mix control; the master DRY/WET slider does the global mix (loads at 0.25 wet).\",\n      \"pos\": [\n        20,\n        12\n      ],\n      \"size\": [\n        900,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_src\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE \\u2014 file player, live input (muted on load) and test signals all sum on the bus\",\n      \"pos\": [\n        30,\n        66\n      ],\n      \"size\": [\n        560,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"playlist\": {\n      \"type\": \"playlist~\",\n      \"pos\": [\n        30,\n        90\n      ],\n      \"size\": [\n        300,\n        120\n      ],\n      \"inlets\": 1,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"dictionary\"\n      ],\n      \"presentation\": [\n        20,\n        40,\n        300,\n        200\n      ]\n    },\n    \"ezadc\": {\n      \"type\": \"ezadc~\",\n      \"pos\": [\n        360,\n        210\n      ],\n      \"presentation\": [\n        340,\n        40,\n        45,\n        45\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"mute\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        460,\n        210\n      ],\n      \"presentation\": [\n        340,\n        92,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"mute_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        360,\n        300\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"mute_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        430,\n        300\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"c_mute\": {\n      \"type\": \"comment\",\n      \"text\": \"live-input mute: toggle \\u00d7 signal, starts closed\",\n      \"pos\": [\n        360,\n        260\n      ],\n      \"size\": [\n        300,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"btn_impulse\": {\n      \"type\": \"button\",\n      \"pos\": [\n        700,\n        90\n      ],\n      \"presentation\": [\n        340,\n        130,\n        24,\n        24\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"click\": {\n      \"type\": \"newobj\",\n      \"text\": \"click~\",\n      \"pos\": [\n        700,\n        130\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_test1\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ TEST\",\n      \"pos\": [\n        700,\n        170\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"btn_burst\": {\n      \"type\": \"button\",\n      \"pos\": [\n        860,\n        90\n      ],\n      \"presentation\": [\n        340,\n        170,\n        24,\n        24\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"burst_env\": {\n      \"type\": \"message\",\n      \"text\": \"0.5, 0. 120\",\n      \"pos\": [\n        860,\n        130\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"noise\": {\n      \"type\": \"newobj\",\n      \"text\": \"noise~\",\n      \"pos\": [\n        780,\n        130\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"burst_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        860,\n        170\n      ],\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"bang\"\n      ]\n    },\n    \"burst_mul\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        780,\n        210\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_test2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ TEST\",\n      \"pos\": [\n        780,\n        250\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_test\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ TEST\",\n      \"pos\": [\n        250,\n        300\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s_src_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_L\",\n      \"pos\": [\n        30,\n        385\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s_src_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_R\",\n      \"pos\": [\n        150,\n        385\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_mono\": {\n      \"type\": \"comment\",\n      \"text\": \"mono downmix for the mono-input effects (signals sum at the *~ inlet)\",\n      \"pos\": [\n        620,\n        300\n      ],\n      \"size\": [\n        420,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"r_mono_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        620,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_mono_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        700,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mono_half\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~ 0.5\",\n      \"pos\": [\n        620,\n        385\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_src_M\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_M\",\n      \"pos\": [\n        620,\n        425\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_tab\": {\n      \"type\": \"comment\",\n      \"text\": \"EFFECT SELECT \\u2014 live.tab, one column of 11, conventional order. The v8 maps item index \\u2192 slot number (1 = DRY: wet bus muted, master dry only) and lights the pane title\",\n      \"pos\": [\n        1120,\n        36\n      ],\n      \"size\": [\n        460,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"lm_tab\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0\",\n      \"pos\": [\n        1600,\n        36\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"tab\": {\n      \"type\": \"live.tab\",\n      \"pos\": [\n        1140,\n        90\n      ],\n      \"size\": [\n        340,\n        150\n      ],\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"float\"\n      ],\n      \"presentation\": [\n        630,\n        40,\n        340,\n        238\n      ],\n      \"attrs\": {\n        \"num_lines_patching\": 11,\n        \"num_lines_presentation\": 11,\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"rounded\": 4.0,\n        \"bgcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1,\n        \"saved_attribute_attributes\": {\n          \"bgcolor\": {\n            \"expression\": \"\"\n          },\n          \"bgoncolor\": {\n            \"expression\": \"\"\n          },\n          \"textcolor\": {\n            \"expression\": \"\"\n          },\n          \"textoncolor\": {\n            \"expression\": \"\"\n          },\n          \"valueof\": {\n            \"parameter_enum\": [\n              \"1 DRY\",\n              \"2 BEAP Wavefolder\",\n              \"3 BEAP Waveshaper\",\n              \"4 BEAP Folder\",\n              \"5 BEAP Diode\",\n              \"6 amxd PluggoFuzz\",\n              \"7 amxd Waveshaper\",\n              \"8 amxd MonsterCrunch\",\n              \"9 amxd WasteBand\",\n              \"10 amxd Noyzckippr\",\n              \"11 AU Distortion\"\n            ],\n            \"parameter_initial\": [\n              0\n            ],\n            \"parameter_longname\": \"FX_SELECT\",\n            \"parameter_mmax\": 10,\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"FX\",\n            \"parameter_type\": 2,\n            \"parameter_unitstyle\": 9\n          }\n        },\n        \"varname\": \"FX_TAB\"\n      },\n      \"inlets\": 1,\n      \"box_extras\": {\n        \"num_lines_patching\": 11,\n        \"num_lines_presentation\": 11,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1\n      }\n    },\n    \"r_tabsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TABSEL\",\n      \"pos\": [\n        1500,\n        8\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_tabsel\": {\n      \"type\": \"comment\",\n      \"text\": \"r TABSEL: the transparent button over each pane title sends its tab index here\",\n      \"pos\": [\n        1590,\n        8\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"hl_v8\": {\n      \"type\": \"newobj\",\n      \"text\": \"v8 fx-shootout-highlight.js 11 @embed 1\",\n      \"pos\": [\n        1140,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"attrs\": {\n        \"textfile\": {\n          \"filename\": \"fx-shootout-highlight.js\",\n          \"flags\": 0,\n          \"autowatch\": 1,\n          \"embed\": 1,\n          \"text\": \"// fx-shootout-highlight.js \\u2014 turns the [live.tab] index into the slot\\n// number, lights the selected pane's title, dims every other title.\\n// Shared by every *-shootout patch; the box arguments size it:\\n//\\n//     v8 fx-shootout-highlight.js <lastslot> [<rows> <cols>]\\n//\\n// inlet 0  : int \\u2014 the live.tab item index (row-major, 0-based).\\n// outlet 0 : int \\u2014 the slot number (1 = DRY, 2..lastslot = the panes) \\u2192 [s SEL].\\n//\\n// The numbers must read DOWN each column, then across (MAX_PATCHING.md >\\n// Number UI controls down each column). A tab fills row by row, so for a\\n// grid with more than one column the items are stored transposed and this\\n// script maps the index back:\\n//     row = index / COLS, col = index % COLS, slot = col * ROWS + row + 1\\n// With one column (the default) the stored order is the shown order and the\\n// mapping is index + 1. ROWS / COLS must match what Max draws.\\n// Each pane's title comment carries the scripting name TITLE_<slot>, two\\n// digits (TITLE_02 \\u2026 TITLE_nn); patcher.getnamed() reaches them and their\\n// colors are set by sending the attribute name as a message.\\n\\ninlets = 1;\\noutlets = 1;\\nautowatch = 1;\\n\\nsetinletassist(0, \\\"int: live.tab item index (row-major) \\u2014 lights TITLE_<slot>\\\");\\nsetoutletassist(0, \\\"int: slot number (1 = DRY, 2..lastslot = panes) \\u2192 s SEL\\\");\\n\\nvar FIRST_SLOT = 2;                        // slot 1 is DRY and has no pane\\nvar LAST_SLOT  = (jsarguments.length > 1) ? parseInt(jsarguments[1], 10) : 12;\\nvar ROWS       = (jsarguments.length > 2) ? parseInt(jsarguments[2], 10) : LAST_SLOT;\\nvar COLS       = (jsarguments.length > 3) ? parseInt(jsarguments[3], 10) : 1;\\n\\n// amber on dark is the panel palette; the selected title inverts it\\nvar ON_BG  = [1.0,  0.55, 0.0,  1.0];\\nvar ON_TX  = [0.05, 0.05, 0.05, 1.0];\\nvar OFF_BG = [0.13, 0.13, 0.15, 1.0];\\nvar OFF_TX = [1.0,  0.55, 0.0,  1.0];\\n\\nfunction pad2(n) { return (n < 10 ? \\\"0\\\" : \\\"\\\") + n; }\\n\\nfunction paint(obj, bg, tx) {\\n    obj.message(\\\"bgcolor\\\",   bg[0], bg[1], bg[2], bg[3]);\\n    obj.message(\\\"textcolor\\\", tx[0], tx[1], tx[2], tx[3]);\\n}\\n\\nfunction msg_int(index) {\\n    var row = Math.floor(index / COLS), col = index % COLS;\\n    var slot = col * ROWS + row + 1;\\n    for (var n = FIRST_SLOT; n <= LAST_SLOT; n++) {\\n        var obj = this.patcher.getnamed(\\\"TITLE_\\\" + pad2(n));\\n        if (!obj) {\\n            post(\\\"fx-shootout-highlight: no comment named TITLE_\\\" + pad2(n) + \\\"\\\\n\\\");\\n            continue;\\n        }\\n        if (n === slot) paint(obj, ON_BG, ON_TX);\\n        else            paint(obj, OFF_BG, OFF_TX);\\n    }\\n    outlet(0, slot);\\n}\\n\"\n        },\n        \"filename\": \"fx-shootout-highlight.js\"\n      }\n    },\n    \"c_hl\": {\n      \"type\": \"comment\",\n      \"text\": \"index \\u2192 slot number (one column, so index + 1) \\u2192 s SEL; also lights TITLE_nn\",\n      \"pos\": [\n        1450,\n        330\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"s_sel\": {\n      \"type\": \"newobj\",\n      \"text\": \"s SEL\",\n      \"pos\": [\n        1140,\n        370\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_wetonly\": {\n      \"type\": \"comment\",\n      \"text\": \"WET-ONLY \\u2014 re-sends every effect's mix / dry-wet setting: 500 ms after load, and from the presented wet-only button\",\n      \"pos\": [\n        1640,\n        66\n      ],\n      \"size\": [\n        560,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"wo_lb\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        1640,\n        100\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"wo_delay\": {\n      \"type\": \"newobj\",\n      \"text\": \"delay 500\",\n      \"pos\": [\n        1640,\n        140\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"wo_send\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WETONLY\",\n      \"pos\": [\n        1640,\n        180\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"wo_btn\": {\n      \"type\": \"message\",\n      \"text\": \"wet-only\",\n      \"pos\": [\n        1760,\n        140\n      ],\n      \"presentation\": [\n        980,\n        200,\n        90,\n        22\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"bgcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ]\n      },\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"wo_send2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WETONLY\",\n      \"pos\": [\n        1760,\n        180\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        30,\n        2923\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        400,\n        150,\n        201\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f02_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 BEAP Wavefolder\",\n      \"pos\": [\n        2520,\n        60\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        18,\n        406,\n        134,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_02\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        316,\n        520\n      ],\n      \"presentation\": [\n        18,\n        406,\n        134,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f02_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"1\",\n      \"pos\": [\n        316,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        316,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 bp.Wavefolder \\u2014 BEAP wavefolder\",\n      \"pos\": [\n        30,\n        520\n      ],\n      \"size\": [\n        276,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        30,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        30,\n        590\n      ],\n      \"size\": [\n        132,\n        116\n      ],\n      \"presentation\": [\n        18,\n        430,\n        132,\n        116\n      ],\n      \"attrs\": {\n        \"varname\": \"FX_WAVEFOLD\",\n        \"comment\": \"in 0: signal | out 0: signal\",\n        \"bgmode\": 0,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1,\n        \"embed\": 1\n      },\n      \"maxpat\": {\n        \"fileversion\": 1,\n        \"appversion\": {\n          \"major\": 8,\n          \"minor\": 0,\n          \"revision\": 0,\n          \"architecture\": \"x64\",\n          \"modernui\": 1\n        },\n        \"classnamespace\": \"box\",\n        \"rect\": [\n          34.0,\n          79.0,\n          501.0,\n          487.0\n        ],\n        \"bglocked\": 0,\n        \"openinpresentation\": 1,\n        \"default_fontsize\": 12.0,\n        \"default_fontface\": 0,\n        \"default_fontname\": \"Arial\",\n        \"gridonopen\": 1,\n        \"gridsize\": [\n          15.0,\n          15.0\n        ],\n        \"gridsnaponopen\": 1,\n        \"objectsnaponopen\": 1,\n        \"statusbarvisible\": 1,\n        \"toolbarvisible\": 1,\n        \"lefttoolbarpinned\": 0,\n        \"toptoolbarpinned\": 0,\n        \"righttoolbarpinned\": 0,\n        \"bottomtoolbarpinned\": 0,\n        \"toolbars_unpinned_last_save\": 0,\n        \"tallnewobj\": 0,\n        \"boxanimatetime\": 200,\n        \"enablehscroll\": 1,\n        \"enablevscroll\": 1,\n        \"devicewidth\": 0.0,\n        \"description\": \"\",\n        \"digest\": \"\",\n        \"tags\": \"\",\n        \"style\": \"\",\n        \"subpatcher_template\": \"\",\n        \"boxes\": [\n          {\n            \"box\": {\n              \"id\": \"obj-3\",\n              \"linecount\": 2,\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                19.236206,\n                64.0,\n                229.0,\n                30.0\n              ],\n              \"text\": \"## Waveshape a signal by amplifying and wrapping the peaks back down ## \"\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.572549,\n                0.615686,\n                0.658824,\n                0.0\n              ],\n              \"activebgoncolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activetextcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.57\n              ],\n              \"activetextoncolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                1.0\n              ],\n              \"bgcolor\": [\n                0.101961,\n                0.101961,\n                0.101961,\n                0.78\n              ],\n              \"bordercolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                0.37\n              ],\n              \"id\": \"obj-1\",\n              \"maxclass\": \"live.text\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                149.236206,\n                301.691772,\n                40.0,\n                20.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                75.0,\n                19.0,\n                52.0,\n                14.764644622802734\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_initial\": [\n                    0.0\n                  ],\n                  \"parameter_shortname\": \"Bypass\",\n                  \"parameter_enum\": [\n                    \"val1\",\n                    \"val2\"\n                  ],\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 0,\n                  \"parameter_longname\": \"Bypass\",\n                  \"parameter_mmax\": 1.0\n                }\n              },\n              \"text\": \"bypass\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"texton\": \"bypass\",\n              \"varname\": \"bypass\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-54\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 6,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                564.236206,\n                274.0,\n                112.0,\n                20.0\n              ],\n              \"text\": \"scale~ 1 5 5 1 0.25\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-25\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                423.236206,\n                323.0,\n                160.0,\n                20.0\n              ],\n              \"text\": \"*~\"\n            }\n          },\n          {\n            \"box\": {\n              \"bubble\": 1,\n              \"bubbleside\": 3,\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-11\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                359.0,\n                244.754272,\n                54.0,\n                22.0\n              ],\n              \"text\": \"wrap\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-17\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"int\"\n              ],\n              \"patching_rect\": [\n                149.236206,\n                339.754272,\n                32.5,\n                20.0\n              ],\n              \"text\": \"+ 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-16\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                149.236206,\n                382.754272,\n                567.0,\n                20.0\n              ],\n              \"text\": \"selector~ 2 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"signal output\",\n              \"id\": \"obj-2\",\n              \"index\": 1,\n              \"maxclass\": \"outlet\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                149.236206,\n                428.754272,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-32\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                472.236206,\n                191.254272,\n                33.0,\n                20.0\n              ],\n              \"text\": \"sig~\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"id\": \"obj-29\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                472.236206,\n                122.883911,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                43.29222869873047,\n                44.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_initial\": [\n                    1.0\n                  ],\n                  \"parameter_shortname\": \"Range\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 1,\n                  \"parameter_mmin\": 1.0,\n                  \"parameter_longname\": \"Range\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 5.0\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"Range\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-10\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                423.236206,\n                244.754272,\n                68.0,\n                20.0\n              ],\n              \"text\": \"%~ 0\"\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"signal input\",\n              \"id\": \"obj-23\",\n              \"index\": 1,\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                423.236206,\n                46.883911,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-8\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                98.236206,\n                436.754272,\n                37.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                97.0,\n                38.0,\n                17.0\n              ],\n              \"text\": \"Signal\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-19\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                367.5,\n                46.883911,\n                37.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                0.0,\n                38.0,\n                17.0\n              ],\n              \"text\": \"Signal\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-13\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                19.236206,\n                38.907501,\n                73.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                19.0,\n                73.0,\n                17.0\n              ],\n              \"text\": \"WAVEFOLDER\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.137255,\n                0.145098,\n                0.160784,\n                0.65\n              ],\n              \"id\": \"obj-130\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                19.236206,\n                18.711639,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                37.0,\n                425.0,\n                60.338157653808594\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.367404,\n                0.389405,\n                0.430238,\n                1.0\n              ],\n              \"id\": \"obj-131\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                63.573395,\n                18.711639,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                17.0,\n                425.0,\n                80.3381576538086\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"id\": \"obj-135\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                106.315491,\n                18.711639,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                0.0,\n                425.0,\n                133.0\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          }\n        ],\n        \"lines\": [\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-17\",\n                0\n              ],\n              \"source\": [\n                \"obj-1\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-25\",\n                0\n              ],\n              \"source\": [\n                \"obj-10\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-2\",\n                0\n              ],\n              \"source\": [\n                \"obj-16\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-16\",\n                0\n              ],\n              \"source\": [\n                \"obj-17\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-10\",\n                0\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-23\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-16\",\n                2\n              ],\n              \"midpoints\": [\n                432.736206,\n                110.627136,\n                706.736206,\n                110.627136\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-23\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-16\",\n                1\n              ],\n              \"source\": [\n                \"obj-25\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-32\",\n                0\n              ],\n              \"source\": [\n                \"obj-29\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-10\",\n                1\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-32\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-54\",\n                0\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-32\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-25\",\n                1\n              ],\n              \"source\": [\n                \"obj-54\",\n                0\n              ]\n            }\n          }\n        ],\n        \"bgcolor\": [\n          1.0,\n          1.0,\n          1.0,\n          0.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"comment\": \"in 0: signal | out 0: signal\",\n        \"bgmode\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f02_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX02_L\",\n      \"pos\": [\n        30,\n        741\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX02_R\",\n      \"pos\": [\n        120,\n        741\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        86\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        18,\n        552,\n        134,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        100,\n        2923\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        168,\n        400,\n        150,\n        201\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f03_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 BEAP Waveshaper\",\n      \"pos\": [\n        2520,\n        112\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        176,\n        406,\n        134,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_03\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        922,\n        520\n      ],\n      \"presentation\": [\n        176,\n        406,\n        134,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f03_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"2\",\n      \"pos\": [\n        922,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        922,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 bp.Waveshaper \\u2014 BEAP waveshaper (in 1 = gain CV, unused)\",\n      \"pos\": [\n        456,\n        520\n      ],\n      \"size\": [\n        456,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        456,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        456,\n        590\n      ],\n      \"size\": [\n        107,\n        116\n      ],\n      \"presentation\": [\n        176,\n        430,\n        107,\n        116\n      ],\n      \"attrs\": {\n        \"varname\": \"FX_WAVESHAPE\",\n        \"comment\": \"in 0: signal | in 1: CV (unused) | out 0: signal\",\n        \"bgmode\": 0,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1,\n        \"embed\": 1\n      },\n      \"maxpat\": {\n        \"fileversion\": 1,\n        \"appversion\": {\n          \"major\": 8,\n          \"minor\": 0,\n          \"revision\": 0,\n          \"architecture\": \"x64\",\n          \"modernui\": 1\n        },\n        \"classnamespace\": \"box\",\n        \"rect\": [\n          34.0,\n          79.0,\n          312.0,\n          339.0\n        ],\n        \"bglocked\": 0,\n        \"openinpresentation\": 1,\n        \"default_fontsize\": 12.0,\n        \"default_fontface\": 0,\n        \"default_fontname\": \"Arial\",\n        \"gridonopen\": 1,\n        \"gridsize\": [\n          15.0,\n          15.0\n        ],\n        \"gridsnaponopen\": 1,\n        \"objectsnaponopen\": 1,\n        \"statusbarvisible\": 1,\n        \"toolbarvisible\": 1,\n        \"lefttoolbarpinned\": 0,\n        \"toptoolbarpinned\": 0,\n        \"righttoolbarpinned\": 0,\n        \"bottomtoolbarpinned\": 0,\n        \"toolbars_unpinned_last_save\": 0,\n        \"tallnewobj\": 0,\n        \"boxanimatetime\": 200,\n        \"enablehscroll\": 1,\n        \"enablevscroll\": 1,\n        \"devicewidth\": 0.0,\n        \"description\": \"\",\n        \"digest\": \"\",\n        \"tags\": \"\",\n        \"style\": \"\",\n        \"subpatcher_template\": \"\",\n        \"boxes\": [\n          {\n            \"box\": {\n              \"id\": \"obj-16\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                47.0,\n                70.970001,\n                117.0,\n                18.0\n              ],\n              \"text\": \"## Waveshaper ## \"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-60\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                379.0,\n                276.0,\n                46.0,\n                20.0\n              ],\n              \"text\": \"*~ 100\"\n            }\n          },\n          {\n            \"box\": {\n              \"id\": \"obj-57\",\n              \"linecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.61\n              ],\n              \"maxclass\": \"live.line\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                28.486885,\n                25.681641,\n                5.0,\n                100.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                38.0,\n                67.29222869873047,\n                16.0,\n                5.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-56\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                475.736877,\n                100.85083,\n                23.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                80.2362060546875,\n                0.0,\n                23.0,\n                17.0\n              ],\n              \"text\": \"CV\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"appearance\": 1,\n              \"id\": \"obj-22\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                562.406006,\n                47.528717,\n                47.0,\n                36.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                53.0,\n                44.483158111572266,\n                47.0,\n                36.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_shortname\": \"CV\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 5,\n                  \"parameter_longname\": \"CV\",\n                  \"parameter_mmax\": 100.0\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"Gain\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-54\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                208.736206,\n                233.058716,\n                45.0,\n                21.0\n              ],\n              \"text\": \"sig~ 2\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-55\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                208.736206,\n                276.0,\n                81.0,\n                21.0\n              ],\n              \"text\": \"pow~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-36\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                248.736206,\n                452.245728,\n                43.0,\n                20.0\n              ],\n              \"text\": \"sig~ 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-38\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                248.736206,\n                488.0,\n                70.513794,\n                20.0\n              ],\n              \"text\": \"/~ 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-39\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                300.25,\n                452.245728,\n                47.0,\n                21.0\n              ],\n              \"text\": \"atan~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-40\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                154.736206,\n                564.0,\n                32.5,\n                20.0\n              ],\n              \"text\": \"*~ 5\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-41\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                154.736206,\n                396.0,\n                42.0,\n                20.0\n              ],\n              \"text\": \"*~ 0.2\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-42\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"int\"\n              ],\n              \"patching_rect\": [\n                62.236206,\n                544.754272,\n                32.5,\n                20.0\n              ],\n              \"text\": \"+ 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-43\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                62.236206,\n                599.754272,\n                204.0,\n                20.0\n              ],\n              \"text\": \"selector~ 2 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.572549,\n                0.615686,\n                0.658824,\n                0.0\n              ],\n              \"activebgoncolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activetextcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.57\n              ],\n              \"activetextoncolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                1.0\n              ],\n              \"bgcolor\": [\n                0.101961,\n                0.101961,\n                0.101961,\n                0.78\n              ],\n              \"bordercolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                0.37\n              ],\n              \"id\": \"obj-44\",\n              \"maxclass\": \"live.text\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                62.236206,\n                499.691772,\n                40.0,\n                20.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                57.2362060546875,\n                20.0,\n                46.0,\n                14.764644622802734\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_initial\": [\n                    0.0\n                  ],\n                  \"parameter_shortname\": \"bypass\",\n                  \"parameter_enum\": [\n                    \"val1\",\n                    \"val2\"\n                  ],\n                  \"parameter_defer\": 1,\n                  \"parameter_type\": 2,\n                  \"parameter_longname\": \"bypass[1]\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 1.0\n                }\n              },\n              \"text\": \"bypass\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"texton\": \"bypass\",\n              \"varname\": \"bypass[1]\"\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"signal output\",\n              \"id\": \"obj-45\",\n              \"index\": 1,\n              \"maxclass\": \"outlet\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                62.236206,\n                645.754272,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"signal input\",\n              \"id\": \"obj-46\",\n              \"index\": 1,\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                154.736206,\n                321.0,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-47\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                154.736206,\n                533.0,\n                113.0,\n                21.0\n              ],\n              \"text\": \"*~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-48\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                154.736206,\n                440.0,\n                73.0,\n                21.0\n              ],\n              \"text\": \"*~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-49\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                154.736206,\n                488.0,\n                47.0,\n                21.0\n              ],\n              \"text\": \"atan~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-51\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"float\"\n              ],\n              \"patching_rect\": [\n                270.736206,\n                233.058716,\n                35.0,\n                20.0\n              ],\n              \"text\": \"* 0.1\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"focusbordercolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-53\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                270.736206,\n                167.970001,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                43.483158111572266,\n                44.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_initial\": [\n                    0.01\n                  ],\n                  \"parameter_shortname\": \"Amount\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 5,\n                  \"parameter_mmin\": 0.01,\n                  \"parameter_exponent\": 2.0,\n                  \"parameter_longname\": \"Amount[1]\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 100.0\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"Amount[1]\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-7\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                208.736206,\n                321.0,\n                189.263794,\n                20.0\n              ],\n              \"text\": \"+~\"\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"\",\n              \"id\": \"obj-114\",\n              \"index\": 2,\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                441.0,\n                100.85083,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-115\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                441.0,\n                179.974976,\n                42.0,\n                20.0\n              ],\n              \"text\": \"*~ 0.2\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-119\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                379.0,\n                190.117432,\n                45.0,\n                21.0\n              ],\n              \"text\": \"sig~ 2\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-120\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                379.0,\n                233.058716,\n                81.0,\n                21.0\n              ],\n              \"text\": \"pow~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-124\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                441.0,\n                148.974976,\n                140.406006,\n                20.0\n              ],\n              \"text\": \"*~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 10.0,\n              \"id\": \"obj-126\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"float\"\n              ],\n              \"patching_rect\": [\n                562.406006,\n                107.85083,\n                37.0,\n                20.0\n              ],\n              \"text\": \"* 0.01\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-6\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 4,\n              \"outlettype\": [\n                \"\",\n                \"\",\n                \"\",\n                \"\"\n              ],\n              \"patching_rect\": [\n                47.0,\n                109.470001,\n                59.5,\n                20.0\n              ],\n              \"restore\": {\n                \"Amount[1]\": [\n                  0.01\n                ],\n                \"Gain\": [\n                  0.0\n                ],\n                \"bypass[1]\": [\n                  0.0\n                ]\n              },\n              \"text\": \"autopattr\",\n              \"varname\": \"u454010350\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-8\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                16.736206,\n                645.754272,\n                37.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                97.0,\n                38.0,\n                17.0\n              ],\n              \"text\": \"Signal\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-19\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                106.736206,\n                321.0,\n                37.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                0.0,\n                38.0,\n                17.0\n              ],\n              \"text\": \"Signal\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-13\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                47.0,\n                42.907501,\n                55.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                19.0,\n                55.0,\n                17.0\n              ],\n              \"text\": \"WVSHPR\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.137255,\n                0.145098,\n                0.160784,\n                0.65\n              ],\n              \"id\": \"obj-130\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                47.0,\n                25.681641,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                37.0,\n                425.0,\n                60.338157653808594\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.367404,\n                0.389405,\n                0.430238,\n                1.0\n              ],\n              \"id\": \"obj-131\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                91.337189,\n                25.681641,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                17.0,\n                425.0,\n                80.3381576538086\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"id\": \"obj-135\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                134.079285,\n                25.681641,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                0.0,\n                425.0,\n                133.0\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          }\n        ],\n        \"lines\": [\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-124\",\n                0\n              ],\n              \"source\": [\n                \"obj-114\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-120\",\n                1\n              ],\n              \"source\": [\n                \"obj-115\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"color\": [\n                0.501961,\n                0.501961,\n                0.501961,\n                0.901961\n              ],\n              \"destination\": [\n                \"obj-120\",\n                0\n              ],\n              \"source\": [\n                \"obj-119\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-60\",\n                0\n              ],\n              \"source\": [\n                \"obj-120\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-115\",\n                0\n              ],\n              \"source\": [\n                \"obj-124\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-124\",\n                1\n              ],\n              \"source\": [\n                \"obj-126\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-126\",\n                0\n              ],\n              \"source\": [\n                \"obj-22\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-38\",\n                0\n              ],\n              \"source\": [\n                \"obj-36\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-47\",\n                1\n              ],\n              \"source\": [\n                \"obj-38\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-38\",\n                1\n              ],\n              \"source\": [\n                \"obj-39\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-43\",\n                1\n              ],\n              \"source\": [\n                \"obj-40\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-48\",\n                0\n              ],\n              \"source\": [\n                \"obj-41\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-43\",\n                0\n              ],\n              \"source\": [\n                \"obj-42\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-45\",\n                0\n              ],\n              \"source\": [\n                \"obj-43\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-42\",\n                0\n              ],\n              \"source\": [\n                \"obj-44\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-41\",\n                0\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-46\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-43\",\n                2\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-46\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-40\",\n                0\n              ],\n              \"source\": [\n                \"obj-47\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-49\",\n                0\n              ],\n              \"source\": [\n                \"obj-48\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-47\",\n                0\n              ],\n              \"source\": [\n                \"obj-49\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-55\",\n                1\n              ],\n              \"source\": [\n                \"obj-51\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-51\",\n                0\n              ],\n              \"source\": [\n                \"obj-53\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"color\": [\n                0.501961,\n                0.501961,\n                0.501961,\n                0.901961\n              ],\n              \"destination\": [\n                \"obj-55\",\n                0\n              ],\n              \"source\": [\n                \"obj-54\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-7\",\n                0\n              ],\n              \"source\": [\n                \"obj-55\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-7\",\n                1\n              ],\n              \"source\": [\n                \"obj-60\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-39\",\n                0\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-7\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-48\",\n                1\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-7\",\n                0\n              ]\n            }\n          }\n        ],\n        \"bgcolor\": [\n          1.0,\n          1.0,\n          1.0,\n          0.0\n        ]\n      },\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"comment\": \"in 0: signal | in 1: CV (unused) | out 0: signal\",\n        \"bgmode\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f03_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX03_L\",\n      \"pos\": [\n        456,\n        741\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX03_R\",\n      \"pos\": [\n        546,\n        741\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        138\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        176,\n        552,\n        134,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        170,\n        2923\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        326,\n        400,\n        270,\n        184\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f04_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 BEAP Folder\",\n      \"pos\": [\n        2520,\n        164\n      ],\n      \"size\": [\n        135,\n        20\n      ],\n      \"presentation\": [\n        334,\n        406,\n        254,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_04\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1535,\n        520\n      ],\n      \"presentation\": [\n        334,\n        406,\n        254,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f04_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"3\",\n      \"pos\": [\n        1535,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1535,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 bp.Folder \\u2014 BEAP fold / wrap / clip (in 1\\u20132 = CV, unused)\",\n      \"pos\": [\n        1062,\n        520\n      ],\n      \"size\": [\n        463,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        1062,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        1062,\n        590\n      ],\n      \"size\": [\n        254,\n        116\n      ],\n      \"presentation\": [\n        334,\n        430,\n        254,\n        116\n      ],\n      \"attrs\": {\n        \"varname\": \"FX_FOLDER\",\n        \"comment\": \"in 0: signal | in 1: CV (unused) | in 2: CV (unused) | out 0: signal\",\n        \"bgmode\": 0,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1,\n        \"embed\": 1\n      },\n      \"maxpat\": {\n        \"fileversion\": 1,\n        \"appversion\": {\n          \"major\": 8,\n          \"minor\": 0,\n          \"revision\": 0,\n          \"architecture\": \"x64\",\n          \"modernui\": 1\n        },\n        \"classnamespace\": \"box\",\n        \"rect\": [\n          34.0,\n          79.0,\n          621.0,\n          520.0\n        ],\n        \"bglocked\": 0,\n        \"openinpresentation\": 1,\n        \"default_fontsize\": 12.0,\n        \"default_fontface\": 0,\n        \"default_fontname\": \"Arial\",\n        \"gridonopen\": 1,\n        \"gridsize\": [\n          15.0,\n          15.0\n        ],\n        \"gridsnaponopen\": 1,\n        \"objectsnaponopen\": 1,\n        \"statusbarvisible\": 1,\n        \"toolbarvisible\": 1,\n        \"lefttoolbarpinned\": 0,\n        \"toptoolbarpinned\": 0,\n        \"righttoolbarpinned\": 0,\n        \"bottomtoolbarpinned\": 0,\n        \"toolbars_unpinned_last_save\": 0,\n        \"tallnewobj\": 0,\n        \"boxanimatetime\": 200,\n        \"enablehscroll\": 1,\n        \"enablevscroll\": 1,\n        \"devicewidth\": 0.0,\n        \"description\": \"\",\n        \"digest\": \"\",\n        \"tags\": \"\",\n        \"style\": \"\",\n        \"subpatcher_template\": \"\",\n        \"boxes\": [\n          {\n            \"box\": {\n              \"id\": \"obj-3\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                36.5,\n                87.422546,\n                220.0,\n                18.0\n              ],\n              \"text\": \"## CV-controllable waveform folder ## \"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-17\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"int\"\n              ],\n              \"patching_rect\": [\n                111.5,\n                468.754272,\n                32.5,\n                20.0\n              ],\n              \"text\": \"+ 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-16\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                111.5,\n                523.754272,\n                204.0,\n                20.0\n              ],\n              \"text\": \"selector~ 2 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.572549,\n                0.615686,\n                0.658824,\n                0.0\n              ],\n              \"activebgoncolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activetextcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.57\n              ],\n              \"activetextoncolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                1.0\n              ],\n              \"bgcolor\": [\n                0.101961,\n                0.101961,\n                0.101961,\n                0.78\n              ],\n              \"bordercolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                0.37\n              ],\n              \"id\": \"obj-4\",\n              \"maxclass\": \"live.text\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                111.5,\n                423.691772,\n                40.0,\n                20.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                191.5,\n                20.0,\n                52.0,\n                14.764644622802734\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_initial\": [\n                    0.0\n                  ],\n                  \"parameter_shortname\": \"bypass\",\n                  \"parameter_enum\": [\n                    \"val1\",\n                    \"val2\"\n                  ],\n                  \"parameter_defer\": 1,\n                  \"parameter_type\": 2,\n                  \"parameter_longname\": \"bypass\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 1.0\n                }\n              },\n              \"text\": \"bypass\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"texton\": \"bypass\",\n              \"varname\": \"bypass\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-2\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                566.479248,\n                29.0,\n                37.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                206.0,\n                0.0,\n                35.0,\n                17.0\n              ],\n              \"text\": \"Hi CV\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-1\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                388.239624,\n                118.0,\n                37.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                109.0,\n                0.0,\n                36.0,\n                17.0\n              ],\n              \"text\": \"Lo CV\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"\",\n              \"id\": \"obj-57\",\n              \"index\": 1,\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                296.5,\n                406.735229,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"\",\n              \"id\": \"obj-56\",\n              \"index\": 1,\n              \"maxclass\": \"outlet\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                111.5,\n                585.422546,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-46\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                604.479248,\n                187.922546,\n                43.0,\n                21.0\n              ],\n              \"text\": \"$1 20\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-47\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"signal\",\n                \"bang\"\n              ],\n              \"patching_rect\": [\n                604.479248,\n                217.922546,\n                40.0,\n                21.0\n              ],\n              \"text\": \"line~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-48\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                572.479248,\n                250.922546,\n                51.0,\n                20.0\n              ],\n              \"text\": \"*~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-49\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"float\"\n              ],\n              \"patching_rect\": [\n                604.479248,\n                153.922546,\n                42.0,\n                20.0\n              ],\n              \"text\": \"* 0.01\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"appearance\": 1,\n              \"id\": \"obj-50\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                604.479248,\n                87.422546,\n                47.0,\n                36.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                136.0,\n                42.79222869873047,\n                47.0,\n                36.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_shortname\": \"CV\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 5,\n                  \"parameter_mmin\": -100.0,\n                  \"parameter_longname\": \"HiValueCV\",\n                  \"parameter_mmax\": 100.0\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"HiValueCV\"\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"signal input\",\n              \"id\": \"obj-51\",\n              \"index\": 3,\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                572.479248,\n                62.422546,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"id\": \"obj-52\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                693.979248,\n                161.922546,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                96.0,\n                42.79222869873047,\n                44.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_initial\": [\n                    0.0\n                  ],\n                  \"parameter_shortname\": \"High\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 1,\n                  \"parameter_mmin\": -5.0,\n                  \"parameter_longname\": \"HiValue\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 5.0\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"HiValue\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-53\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                693.979248,\n                230.922546,\n                43.0,\n                21.0\n              ],\n              \"text\": \"$1 20\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-54\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"signal\",\n                \"bang\"\n              ],\n              \"patching_rect\": [\n                693.979248,\n                260.922546,\n                40.0,\n                21.0\n              ],\n              \"text\": \"line~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-55\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                572.479248,\n                306.922546,\n                140.5,\n                20.0\n              ],\n              \"text\": \"+~\"\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"bordercolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"focusbordercolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"hltcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.16\n              ],\n              \"id\": \"obj-45\",\n              \"maxclass\": \"live.menu\",\n              \"numinlets\": 1,\n              \"numoutlets\": 3,\n              \"outlettype\": [\n                \"\",\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                204.0,\n                371.735229,\n                100.0,\n                15.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                187.0,\n                42.79222869873047,\n                55.355247497558594,\n                15.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_shortname\": \"mode\",\n                  \"parameter_enum\": [\n                    \"fold\",\n                    \"wrap\",\n                    \"clip\"\n                  ],\n                  \"parameter_type\": 2,\n                  \"parameter_longname\": \"mode\"\n                }\n              },\n              \"textcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"varname\": \"mode\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-34\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                420.239502,\n                277.232635,\n                43.0,\n                21.0\n              ],\n              \"text\": \"$1 20\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-35\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"signal\",\n                \"bang\"\n              ],\n              \"patching_rect\": [\n                420.239502,\n                307.232635,\n                40.0,\n                21.0\n              ],\n              \"text\": \"line~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-36\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                388.239624,\n                340.232635,\n                51.0,\n                20.0\n              ],\n              \"text\": \"*~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-37\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"float\"\n              ],\n              \"patching_rect\": [\n                420.239502,\n                243.232635,\n                42.0,\n                20.0\n              ],\n              \"text\": \"* 0.01\"\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"appearance\": 1,\n              \"id\": \"obj-38\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                420.239502,\n                176.732635,\n                47.0,\n                36.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                42.0,\n                42.79222869873047,\n                47.0,\n                36.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_shortname\": \"CV\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 5,\n                  \"parameter_mmin\": -100.0,\n                  \"parameter_longname\": \"LoValueCV\",\n                  \"parameter_mmax\": 100.0\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"LoValueCV\"\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"signal input\",\n              \"id\": \"obj-39\",\n              \"index\": 2,\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                388.239624,\n                151.732635,\n                25.0,\n                25.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"activedialcolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activefgdialcolor\": [\n                0.65098,\n                0.666667,\n                0.662745,\n                1.0\n              ],\n              \"activeneedlecolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"id\": \"obj-40\",\n              \"maxclass\": \"live.dial\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                509.739502,\n                251.232635,\n                44.0,\n                48.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                42.79222869873047,\n                44.0,\n                48.0\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_initial\": [\n                    0.0\n                  ],\n                  \"parameter_shortname\": \"Low\",\n                  \"parameter_type\": 0,\n                  \"parameter_unitstyle\": 1,\n                  \"parameter_mmin\": -5.0,\n                  \"parameter_longname\": \"LoValue\",\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_mmax\": 5.0\n                }\n              },\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.7\n              ],\n              \"varname\": \"LoValue\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-41\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                509.739502,\n                320.232635,\n                43.0,\n                21.0\n              ],\n              \"text\": \"$1 20\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-42\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"signal\",\n                \"bang\"\n              ],\n              \"patching_rect\": [\n                509.739502,\n                350.232635,\n                40.0,\n                21.0\n              ],\n              \"text\": \"line~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-43\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                388.239624,\n                396.232666,\n                140.5,\n                20.0\n              ],\n              \"text\": \"+~\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-9\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                204.0,\n                406.735229,\n                62.0,\n                21.0\n              ],\n              \"text\": \"mode $1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 13.0,\n              \"id\": \"obj-29\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                204.0,\n                454.922546,\n                387.479248,\n                21.0\n              ],\n              \"text\": \"pong~ 0 -0.25 0.25\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-6\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 4,\n              \"outlettype\": [\n                \"\",\n                \"\",\n                \"\",\n                \"\"\n              ],\n              \"patching_rect\": [\n                36.5,\n                116.815094,\n                59.5,\n                20.0\n              ],\n              \"restore\": {\n                \"HiValue\": [\n                  5.0\n                ],\n                \"HiValueCV\": [\n                  0.0\n                ],\n                \"LoValue\": [\n                  -5.0\n                ],\n                \"LoValueCV\": [\n                  0.0\n                ],\n                \"bypass\": [\n                  0.0\n                ],\n                \"mode\": [\n                  0.0\n                ]\n              },\n              \"text\": \"autopattr\",\n              \"varname\": \"u807009586\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-8\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                62.736206,\n                593.422546,\n                37.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                97.0,\n                38.0,\n                17.0\n              ],\n              \"text\": \"Signal\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-19\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                331.0,\n                406.735229,\n                37.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                0.0,\n                38.0,\n                17.0\n              ],\n              \"text\": \"Signal\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-13\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                36.5,\n                63.800049,\n                48.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                19.0,\n                48.0,\n                17.0\n              ],\n              \"text\": \"FOLDER\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.137255,\n                0.145098,\n                0.160784,\n                0.65\n              ],\n              \"id\": \"obj-130\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                36.5,\n                41.422546,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                37.0,\n                283.0,\n                60.338157653808594\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.367404,\n                0.389405,\n                0.430238,\n                1.0\n              ],\n              \"id\": \"obj-131\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                83.081711,\n                41.422546,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                17.0,\n                283.0,\n                80.3381576538086\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"id\": \"obj-135\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                129.663422,\n                41.422546,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                0.0,\n                283.0,\n                133.0\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0\n            }\n          }\n        ],\n        \"lines\": [\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-56\",\n                0\n              ],\n              \"source\": [\n                \"obj-16\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-16\",\n                0\n              ],\n              \"source\": [\n                \"obj-17\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-16\",\n                1\n              ],\n              \"source\": [\n                \"obj-29\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-35\",\n                0\n              ],\n              \"source\": [\n                \"obj-34\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-36\",\n                1\n              ],\n              \"source\": [\n                \"obj-35\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-43\",\n                0\n              ],\n              \"source\": [\n                \"obj-36\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-34\",\n                0\n              ],\n              \"source\": [\n                \"obj-37\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-37\",\n                0\n              ],\n              \"source\": [\n                \"obj-38\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-36\",\n                0\n              ],\n              \"source\": [\n                \"obj-39\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-17\",\n                0\n              ],\n              \"source\": [\n                \"obj-4\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-41\",\n                0\n              ],\n              \"source\": [\n                \"obj-40\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-42\",\n                0\n              ],\n              \"source\": [\n                \"obj-41\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-43\",\n                1\n              ],\n              \"source\": [\n                \"obj-42\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-29\",\n                1\n              ],\n              \"source\": [\n                \"obj-43\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-9\",\n                0\n              ],\n              \"source\": [\n                \"obj-45\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-47\",\n                0\n              ],\n              \"source\": [\n                \"obj-46\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-48\",\n                1\n              ],\n              \"source\": [\n                \"obj-47\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-55\",\n                0\n              ],\n              \"source\": [\n                \"obj-48\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-46\",\n                0\n              ],\n              \"source\": [\n                \"obj-49\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-49\",\n                0\n              ],\n              \"source\": [\n                \"obj-50\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-48\",\n                0\n              ],\n              \"source\": [\n                \"obj-51\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-53\",\n                0\n              ],\n              \"source\": [\n                \"obj-52\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-54\",\n                0\n              ],\n              \"source\": [\n                \"obj-53\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-55\",\n                1\n              ],\n              \"source\": [\n                \"obj-54\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-29\",\n                2\n              ],\n              \"source\": [\n                \"obj-55\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-16\",\n                2\n              ],\n              \"order\": 0,\n              \"source\": [\n                \"obj-57\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-29\",\n                0\n              ],\n              \"order\": 1,\n              \"source\": [\n                \"obj-57\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-29\",\n                0\n              ],\n              \"source\": [\n                \"obj-9\",\n                0\n              ]\n            }\n          }\n        ],\n        \"bgcolor\": [\n          1.0,\n          1.0,\n          1.0,\n          0.0\n        ]\n      },\n      \"inlets\": 3,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"comment\": \"in 0: signal | in 1: CV (unused) | in 2: CV (unused) | out 0: signal\",\n        \"bgmode\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f04_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX04_L\",\n      \"pos\": [\n        1062,\n        741\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX04_R\",\n      \"pos\": [\n        1256,\n        741\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        190\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        334,\n        552,\n        254,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        240,\n        2923\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        604,\n        400,\n        118,\n        201\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f05_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 BEAP Diode\",\n      \"pos\": [\n        2520,\n        216\n      ],\n      \"size\": [\n        127,\n        20\n      ],\n      \"presentation\": [\n        612,\n        406,\n        102,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_05\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        2119,\n        520\n      ],\n      \"presentation\": [\n        612,\n        406,\n        102,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f05_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"4\",\n      \"pos\": [\n        2119,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        2119,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 bp.Diode \\u2014 BEAP half-wave rectifier (+ only / \\u2212 only)\",\n      \"pos\": [\n        1675,\n        520\n      ],\n      \"size\": [\n        434,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_rM\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_M\",\n      \"pos\": [\n        1675,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_bp\": {\n      \"type\": \"bpatcher\",\n      \"pos\": [\n        1675,\n        590\n      ],\n      \"size\": [\n        92,\n        116\n      ],\n      \"presentation\": [\n        612,\n        430,\n        92,\n        116\n      ],\n      \"attrs\": {\n        \"varname\": \"FX_DIODE\",\n        \"comment\": \"in 0: signal | out 0: signal\",\n        \"bgmode\": 0,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"viewvisibility\": 1,\n        \"embed\": 1\n      },\n      \"maxpat\": {\n        \"fileversion\": 1,\n        \"appversion\": {\n          \"major\": 7,\n          \"minor\": 0,\n          \"revision\": 0,\n          \"architecture\": \"x64\",\n          \"modernui\": 1\n        },\n        \"rect\": [\n          34.0,\n          78.0,\n          92.0,\n          116.0\n        ],\n        \"bgcolor\": [\n          1.0,\n          1.0,\n          1.0,\n          0.0\n        ],\n        \"bglocked\": 0,\n        \"openinpresentation\": 1,\n        \"default_fontsize\": 12.0,\n        \"default_fontface\": 0,\n        \"default_fontname\": \"Arial\",\n        \"gridonopen\": 1,\n        \"gridsize\": [\n          15.0,\n          15.0\n        ],\n        \"gridsnaponopen\": 1,\n        \"objectsnaponopen\": 1,\n        \"statusbarvisible\": 1,\n        \"toolbarvisible\": 1,\n        \"lefttoolbarpinned\": 0,\n        \"toptoolbarpinned\": 0,\n        \"righttoolbarpinned\": 0,\n        \"bottomtoolbarpinned\": 0,\n        \"toolbars_unpinned_last_save\": 0,\n        \"tallnewobj\": 0,\n        \"boxanimatetime\": 200,\n        \"enablehscroll\": 1,\n        \"enablevscroll\": 1,\n        \"devicewidth\": 0.0,\n        \"description\": \"\",\n        \"digest\": \"\",\n        \"tags\": \"\",\n        \"style\": \"\",\n        \"boxes\": [\n          {\n            \"box\": {\n              \"id\": \"obj-16\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                26.173828,\n                74.0,\n                363.0,\n                20.0\n              ],\n              \"style\": \"\",\n              \"text\": \"## Constrain the signal output to positive-only or negative-only ## \"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-23\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 3,\n              \"outlettype\": [\n                \"bang\",\n                \"bang\",\n                \"\"\n              ],\n              \"patching_rect\": [\n                336.931091,\n                229.0,\n                46.0,\n                22.0\n              ],\n              \"style\": \"\",\n              \"text\": \"sel 0 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"activebgoncolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"id\": \"obj-38\",\n              \"maxclass\": \"live.tab\",\n              \"num_lines_patching\": 2,\n              \"num_lines_presentation\": 2,\n              \"numinlets\": 1,\n              \"numoutlets\": 3,\n              \"outlettype\": [\n                \"\",\n                \"\",\n                \"float\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                336.931091,\n                157.0,\n                44.443909,\n                41.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                3.640533,\n                42.088398,\n                82.359467,\n                49.072964\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_longname\": \"mode\",\n                  \"parameter_shortname\": \"mode\",\n                  \"parameter_type\": 2,\n                  \"parameter_enum\": [\n                    \"+ only\",\n                    \"- only\"\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_initial\": [\n                    0.0\n                  ],\n                  \"parameter_unitstyle\": 0\n                }\n              },\n              \"varname\": \"FilterType\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-21\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                391.931091,\n                303.529999,\n                32.5,\n                22.0\n              ],\n              \"style\": \"\",\n              \"text\": \"0\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-18\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                336.931091,\n                303.529999,\n                32.5,\n                22.0\n              ],\n              \"style\": \"\",\n              \"text\": \"-5\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-14\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                391.931091,\n                268.0,\n                32.5,\n                22.0\n              ],\n              \"style\": \"\",\n              \"text\": \"5\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-9\",\n              \"maxclass\": \"message\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                336.931091,\n                268.0,\n                32.5,\n                22.0\n              ],\n              \"style\": \"\",\n              \"text\": \"0\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-5\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                318.931091,\n                340.0,\n                56.0,\n                22.0\n              ],\n              \"style\": \"\",\n              \"text\": \"clip~ 0 5\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-10\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 2,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"int\"\n              ],\n              \"patching_rect\": [\n                226.431091,\n                340.0,\n                32.5,\n                22.0\n              ],\n              \"style\": \"\",\n              \"text\": \"+ 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-11\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 3,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"signal\"\n              ],\n              \"patching_rect\": [\n                226.431091,\n                395.0,\n                204.0,\n                22.0\n              ],\n              \"style\": \"\",\n              \"text\": \"selector~ 2 1\"\n            }\n          },\n          {\n            \"box\": {\n              \"activebgcolor\": [\n                0.572549,\n                0.615686,\n                0.658824,\n                0.0\n              ],\n              \"activebgoncolor\": [\n                0.278431,\n                0.839216,\n                1.0,\n                1.0\n              ],\n              \"activetextcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                0.57\n              ],\n              \"activetextoncolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                1.0\n              ],\n              \"bgcolor\": [\n                0.101961,\n                0.101961,\n                0.101961,\n                0.78\n              ],\n              \"bordercolor\": [\n                0.0,\n                0.019608,\n                0.078431,\n                0.37\n              ],\n              \"id\": \"obj-20\",\n              \"maxclass\": \"live.text\",\n              \"numinlets\": 1,\n              \"numoutlets\": 2,\n              \"outlettype\": [\n                \"\",\n                \"\"\n              ],\n              \"parameter_enable\": 1,\n              \"patching_rect\": [\n                226.431091,\n                294.9375,\n                40.0,\n                20.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                41.0,\n                19.0,\n                45.0,\n                14.764645\n              ],\n              \"saved_attribute_attributes\": {\n                \"valueof\": {\n                  \"parameter_longname\": \"bypass\",\n                  \"parameter_shortname\": \"bypass\",\n                  \"parameter_type\": 2,\n                  \"parameter_mmax\": 1.0,\n                  \"parameter_enum\": [\n                    \"val1\",\n                    \"val2\"\n                  ],\n                  \"parameter_initial_enable\": 1,\n                  \"parameter_initial\": [\n                    0.0\n                  ],\n                  \"parameter_defer\": 1\n                }\n              },\n              \"text\": \"bypass\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ],\n              \"texton\": \"bypass\",\n              \"varname\": \"bypass\"\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"signal output\",\n              \"id\": \"obj-22\",\n              \"maxclass\": \"outlet\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                226.431091,\n                441.0,\n                25.0,\n                25.0\n              ],\n              \"style\": \"\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Arial\",\n              \"fontsize\": 12.0,\n              \"id\": \"obj-2\",\n              \"maxclass\": \"newobj\",\n              \"numinlets\": 1,\n              \"numoutlets\": 4,\n              \"outlettype\": [\n                \"\",\n                \"\",\n                \"\",\n                \"\"\n              ],\n              \"patching_rect\": [\n                26.173828,\n                114.0,\n                59.5,\n                22.0\n              ],\n              \"restore\": {\n                \"FilterType\": [\n                  0.0\n                ],\n                \"bypass\": [\n                  0.0\n                ]\n              },\n              \"style\": \"\",\n              \"text\": \"autopattr\",\n              \"varname\": \"u903002161\"\n            }\n          },\n          {\n            \"box\": {\n              \"comment\": \"signal input\",\n              \"id\": \"obj-4\",\n              \"maxclass\": \"inlet\",\n              \"numinlets\": 0,\n              \"numoutlets\": 1,\n              \"outlettype\": [\n                \"\"\n              ],\n              \"patching_rect\": [\n                411.431091,\n                65.529999,\n                25.0,\n                25.0\n              ],\n              \"style\": \"\"\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-8\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                269.642456,\n                445.0,\n                37.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                97.0,\n                38.0,\n                17.0\n              ],\n              \"style\": \"\",\n              \"text\": \"Signal\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-19\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                455.142456,\n                65.529999,\n                37.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                0.0,\n                38.0,\n                17.0\n              ],\n              \"style\": \"\",\n              \"text\": \"Signal\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"fontname\": \"Ableton Sans Bold Regular\",\n              \"fontsize\": 9.0,\n              \"id\": \"obj-13\",\n              \"maxclass\": \"comment\",\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                26.173828,\n                47.907501,\n                48.0,\n                17.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                2.0,\n                19.0,\n                40.0,\n                17.0\n              ],\n              \"style\": \"\",\n              \"text\": \"DIODE\",\n              \"textcolor\": [\n                1.0,\n                1.0,\n                1.0,\n                1.0\n              ]\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.137255,\n                0.145098,\n                0.160784,\n                0.65\n              ],\n              \"id\": \"obj-130\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                26.173828,\n                24.529999,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                37.0,\n                283.0,\n                60.338158\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0,\n              \"style\": \"\"\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.367404,\n                0.389405,\n                0.430238,\n                1.0\n              ],\n              \"id\": \"obj-131\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                72.834366,\n                24.529999,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                17.0,\n                283.0,\n                80.338158\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0,\n              \"style\": \"\"\n            }\n          },\n          {\n            \"box\": {\n              \"angle\": 0.0,\n              \"background\": 1,\n              \"bgcolor\": [\n                0.0,\n                0.0,\n                0.0,\n                1.0\n              ],\n              \"id\": \"obj-135\",\n              \"maxclass\": \"panel\",\n              \"mode\": 0,\n              \"numinlets\": 1,\n              \"numoutlets\": 0,\n              \"patching_rect\": [\n                117.816223,\n                24.529999,\n                37.0,\n                5.0\n              ],\n              \"presentation\": 1,\n              \"presentation_rect\": [\n                0.0,\n                0.0,\n                283.0,\n                133.0\n              ],\n              \"proportion\": 0.39,\n              \"rounded\": 0,\n              \"style\": \"\"\n            }\n          }\n        ],\n        \"lines\": [\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-11\",\n                0\n              ],\n              \"disabled\": 0,\n              \"hidden\": 0,\n              \"source\": [\n                \"obj-10\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-22\",\n                0\n              ],\n              \"disabled\": 0,\n              \"hidden\": 0,\n              \"source\": [\n                \"obj-11\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-5\",\n                2\n              ],\n              \"disabled\": 0,\n              \"hidden\": 0,\n              \"source\": [\n                \"obj-14\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-5\",\n                1\n              ],\n              \"disabled\": 0,\n              \"hidden\": 0,\n              \"source\": [\n                \"obj-18\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-10\",\n                0\n              ],\n              \"disabled\": 0,\n              \"hidden\": 0,\n              \"source\": [\n                \"obj-20\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-5\",\n                2\n              ],\n              \"disabled\": 0,\n              \"hidden\": 0,\n              \"source\": [\n                \"obj-21\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-14\",\n                0\n              ],\n              \"disabled\": 0,\n              \"hidden\": 0,\n              \"source\": [\n                \"obj-23\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-18\",\n                0\n              ],\n              \"disabled\": 0,\n              \"hidden\": 0,\n              \"source\": [\n                \"obj-23\",\n                1\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-21\",\n                0\n              ],\n              \"disabled\": 0,\n              \"hidden\": 0,\n              \"source\": [\n                \"obj-23\",\n                1\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-9\",\n                0\n              ],\n              \"disabled\": 0,\n              \"hidden\": 0,\n              \"source\": [\n                \"obj-23\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-23\",\n                0\n              ],\n              \"disabled\": 0,\n              \"hidden\": 0,\n              \"source\": [\n                \"obj-38\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-11\",\n                2\n              ],\n              \"disabled\": 0,\n              \"hidden\": 0,\n              \"source\": [\n                \"obj-4\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-5\",\n                0\n              ],\n              \"disabled\": 0,\n              \"hidden\": 0,\n              \"source\": [\n                \"obj-4\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-11\",\n                1\n              ],\n              \"disabled\": 0,\n              \"hidden\": 0,\n              \"source\": [\n                \"obj-5\",\n                0\n              ]\n            }\n          },\n          {\n            \"patchline\": {\n              \"destination\": [\n                \"obj-5\",\n                1\n              ],\n              \"disabled\": 0,\n              \"hidden\": 0,\n              \"source\": [\n                \"obj-9\",\n                0\n              ]\n            }\n          }\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"comment\": \"in 0: signal | out 0: signal\",\n        \"bgmode\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f05_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX05_L\",\n      \"pos\": [\n        1675,\n        741\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX05_R\",\n      \"pos\": [\n        1765,\n        741\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"mono in \\u2192 both channels\",\n      \"pos\": [\n        2520,\n        242\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        612,\n        552,\n        102,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        310,\n        2923\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        730,\n        400,\n        540,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f06_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 amxd PluggoFuzz\",\n      \"pos\": [\n        2520,\n        268\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        738,\n        406,\n        464,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_06\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        580,\n        841\n      ],\n      \"presentation\": [\n        738,\n        406,\n        464,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f06_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"5\",\n      \"pos\": [\n        580,\n        871\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        580,\n        901\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 amxd~ PluggoFuzz.amxd \\u2014 four clipping modes with in/out filters\",\n      \"pos\": [\n        30,\n        841\n      ],\n      \"size\": [\n        540,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        30,\n        871\n      ],\n      \"presentation\": [\n        1212,\n        406,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        100,\n        871\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        180,\n        871\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ PluggoFuzz.amxd\",\n      \"pos\": [\n        30,\n        951\n      ],\n      \"size\": [\n        520,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        738,\n        432,\n        520,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_06\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f06_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX06_L\",\n      \"pos\": [\n        30,\n        1182\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX06_R\",\n      \"pos\": [\n        170,\n        1182\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        380,\n        2923\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        652,\n        452,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f07_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 amxd Waveshaper\",\n      \"pos\": [\n        2520,\n        294\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        18,\n        658,\n        376,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_07\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1190,\n        841\n      ],\n      \"presentation\": [\n        18,\n        658,\n        376,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f07_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"6\",\n      \"pos\": [\n        1190,\n        871\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1190,\n        901\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 amxd~ Waveshaper.amxd \\u2014 drawable transfer curve\",\n      \"pos\": [\n        720,\n        841\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        720,\n        871\n      ],\n      \"presentation\": [\n        404,\n        658,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        790,\n        871\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        870,\n        871\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ Waveshaper.amxd\",\n      \"pos\": [\n        720,\n        951\n      ],\n      \"size\": [\n        432,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        684,\n        432,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_07\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f07_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX07_L\",\n      \"pos\": [\n        720,\n        1182\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX07_R\",\n      \"pos\": [\n        860,\n        1182\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        450,\n        2923\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        470,\n        652,\n        444,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f08_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 amxd MonsterCrunch\",\n      \"pos\": [\n        2520,\n        320\n      ],\n      \"size\": [\n        195,\n        20\n      ],\n      \"presentation\": [\n        478,\n        658,\n        368,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_08\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1800,\n        841\n      ],\n      \"presentation\": [\n        478,\n        658,\n        368,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f08_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"7\",\n      \"pos\": [\n        1800,\n        871\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1800,\n        901\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 amxd~ MonsterCrunch.amxd \\u2014 huge gain, hard clip, lowpass\",\n      \"pos\": [\n        1330,\n        841\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        1330,\n        871\n      ],\n      \"presentation\": [\n        856,\n        658,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1400,\n        871\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1480,\n        871\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ MonsterCrunch.amxd\",\n      \"pos\": [\n        1330,\n        951\n      ],\n      \"size\": [\n        424,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        478,\n        684,\n        424,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_08\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f08_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1630,\n        871\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet-dry 100.\",\n      \"pos\": [\n        1630,\n        911\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX08_L\",\n      \"pos\": [\n        1330,\n        1182\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX08_R\",\n      \"pos\": [\n        1470,\n        1182\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        520,\n        2923\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        922,\n        652,\n        442,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f09_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 amxd WasteBand\",\n      \"pos\": [\n        2520,\n        346\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        930,\n        658,\n        366,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_09\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        553,\n        1282\n      ],\n      \"presentation\": [\n        930,\n        658,\n        366,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f09_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"8\",\n      \"pos\": [\n        553,\n        1312\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        553,\n        1342\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 amxd~ WasteBand.amxd \\u2014 three bands, each mute / pass / overdrive\",\n      \"pos\": [\n        30,\n        1282\n      ],\n      \"size\": [\n        513,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        30,\n        1312\n      ],\n      \"presentation\": [\n        1306,\n        658,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        100,\n        1312\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        180,\n        1312\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ WasteBand.amxd\",\n      \"pos\": [\n        30,\n        1392\n      ],\n      \"size\": [\n        422,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        930,\n        684,\n        422,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_09\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f09_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX09_L\",\n      \"pos\": [\n        30,\n        1623\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX09_R\",\n      \"pos\": [\n        170,\n        1623\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        590,\n        2923\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        904,\n        280,\n        283\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f10_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 amxd Noyzckippr\",\n      \"pos\": [\n        2520,\n        372\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        18,\n        910,\n        204,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_10\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1292,\n        1282\n      ],\n      \"presentation\": [\n        18,\n        910,\n        204,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f10_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"9\",\n      \"pos\": [\n        1292,\n        1312\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1292,\n        1342\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 amxd~ Noyzckippr.amxd \\u2014 multiplies the input by bandpassed noise\",\n      \"pos\": [\n        693,\n        1282\n      ],\n      \"size\": [\n        589,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        693,\n        1312\n      ],\n      \"presentation\": [\n        232,\n        910,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        763,\n        1312\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        843,\n        1312\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ Noyzckippr.amxd\",\n      \"pos\": [\n        693,\n        1392\n      ],\n      \"size\": [\n        250,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        936,\n        250,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_10\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f10_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        993,\n        1312\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet_dry_left 100., wet_dry_right 100.\",\n      \"pos\": [\n        993,\n        1352\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX10_L\",\n      \"pos\": [\n        693,\n        1623\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX10_R\",\n      \"pos\": [\n        833,\n        1623\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"wet_dry_left / wet_dry_right \\u2192 100 on load and on wet-only\",\n      \"pos\": [\n        2520,\n        398\n      ],\n      \"size\": [\n        501,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1138,\n        264,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        660,\n        2923\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        298,\n        904,\n        230,\n        278\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f11_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 AU Distortion\",\n      \"pos\": [\n        2520,\n        424\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        306,\n        910,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_11\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1318,\n        1723\n      ],\n      \"presentation\": [\n        306,\n        910,\n        214,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f11_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"10\",\n      \"pos\": [\n        1318,\n        1753\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1318,\n        1783\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 vst~ + plug_au AUDistortion \\u2014 Apple's multi-stage distortion\",\n      \"pos\": [\n        30,\n        1723\n      ],\n      \"size\": [\n        1278,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        30,\n        1753\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        110,\n        1753\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"vst~\",\n      \"pos\": [\n        30,\n        2093\n      ],\n      \"inlets\": 2,\n      \"outlets\": 8,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"list\",\n        \"int\",\n        \"\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        306,\n        1107,\n        214,\n        22\n      ],\n      \"attrs\": {\n        \"varname\": \"VST_11\"\n      }\n    },\n    \"f11_lb\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        230,\n        1753\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"f11_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b b\",\n      \"pos\": [\n        230,\n        1781\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"f11_plug\": {\n      \"type\": \"message\",\n      \"text\": \"plug_au AUDistortion\",\n      \"pos\": [\n        330,\n        1823\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_sinit\": {\n      \"type\": \"newobj\",\n      \"text\": \"s AU11_INIT\",\n      \"pos\": [\n        230,\n        1823\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        470,\n        1753\n      ],\n      \"presentation\": [\n        306,\n        934,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_rinit\": {\n      \"type\": \"newobj\",\n      \"text\": \"r AU11_INIT\",\n      \"pos\": [\n        230,\n        1863\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_stov\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TO_VST11\",\n      \"pos\": [\n        230,\n        2008\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_p0_i\": {\n      \"type\": \"message\",\n      \"text\": \"0\",\n      \"pos\": [\n        230,\n        1903\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_p0\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        230,\n        1933\n      ],\n      \"presentation\": [\n        364,\n        934,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"f11_p0_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"bypass\",\n      \"pos\": [\n        2520,\n        450\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        390,\n        936,\n        60,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_p0_m\": {\n      \"type\": \"message\",\n      \"text\": \"bypass $1\",\n      \"pos\": [\n        230,\n        1963\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_p1_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.7398\",\n      \"pos\": [\n        403,\n        1903\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_p1\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        403,\n        1933\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        306,\n        962,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f11_p1_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"soft clip gain (\\u221280\\u201320 dB)\",\n      \"pos\": [\n        2520,\n        476\n      ],\n      \"size\": [\n        229,\n        20\n      ],\n      \"presentation\": [\n        362,\n        964,\n        158,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_p1_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Soft Clip Gain\\\" $1\",\n      \"pos\": [\n        403,\n        1963\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_p2_i\": {\n      \"type\": \"message\",\n      \"text\": \"1.\",\n      \"pos\": [\n        576,\n        1903\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_p2\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        576,\n        1933\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        306,\n        1003,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f11_p2_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"wet/dry (\\u2192 wet)\",\n      \"pos\": [\n        2520,\n        502\n      ],\n      \"size\": [\n        135,\n        20\n      ],\n      \"presentation\": [\n        362,\n        1005,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_p2_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Wet/Dry Mix\\\" $1\",\n      \"pos\": [\n        576,\n        1963\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_p3_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.5\",\n      \"pos\": [\n        749,\n        1903\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_p3\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        749,\n        1933\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        306,\n        1027,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f11_p3_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"decimation\",\n      \"pos\": [\n        2520,\n        528\n      ],\n      \"size\": [\n        93,\n        20\n      ],\n      \"presentation\": [\n        362,\n        1029,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_p3_m\": {\n      \"type\": \"message\",\n      \"text\": \"Decimation $1\",\n      \"pos\": [\n        749,\n        1963\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_p4_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.5\",\n      \"pos\": [\n        922,\n        1903\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_p4\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        922,\n        1933\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        306,\n        1051,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f11_p4_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"decimation mix\",\n      \"pos\": [\n        2520,\n        554\n      ],\n      \"size\": [\n        127,\n        20\n      ],\n      \"presentation\": [\n        362,\n        1053,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_p4_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Decimation Mix\\\" $1\",\n      \"pos\": [\n        922,\n        1963\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_p5_i\": {\n      \"type\": \"message\",\n      \"text\": \"0.5\",\n      \"pos\": [\n        1095,\n        1903\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_p5\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        1095,\n        1933\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        306,\n        1075,\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"f11_p5_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"polynomial mix\",\n      \"pos\": [\n        2520,\n        580\n      ],\n      \"size\": [\n        127,\n        20\n      ],\n      \"presentation\": [\n        362,\n        1077,\n        158,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_p5_m\": {\n      \"type\": \"message\",\n      \"text\": \"\\\"Polynomial Mix\\\" $1\",\n      \"pos\": [\n        1095,\n        1963\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_rtov\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TO_VST11\",\n      \"pos\": [\n        110,\n        2053\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX11_L\",\n      \"pos\": [\n        30,\n        2143\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX11_R\",\n      \"pos\": [\n        120,\n        2143\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_pnote\": {\n      \"type\": \"comment\",\n      \"text\": \"AU parameters: 0\\u20131 of their range\",\n      \"pos\": [\n        2520,\n        606\n      ],\n      \"size\": [\n        288,\n        20\n      ],\n      \"presentation\": [\n        306,\n        1135,\n        214,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_mix\": {\n      \"type\": \"comment\",\n      \"text\": \"MIXER \\u2014 selector~ inlet n = tab item n. Inlet 1 (DRY) is left unconnected so DRY is silence on the wet bus (the master dry path is always live); inlets 2\\u201311 are the effects\",\n      \"pos\": [\n        30,\n        2253\n      ],\n      \"size\": [\n        1200,\n        34\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"r_sel_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        2313\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sel_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"selector~ 11 1 @ramptime 30\",\n      \"pos\": [\n        30,\n        2363\n      ],\n      \"inlets\": 12,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_wet_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ WET_L\",\n      \"pos\": [\n        30,\n        2413\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX02_L\",\n      \"pos\": [\n        120,\n        2313\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX03_L\",\n      \"pos\": [\n        210,\n        2313\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX04_L\",\n      \"pos\": [\n        300,\n        2313\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX05_L\",\n      \"pos\": [\n        390,\n        2313\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX06_L\",\n      \"pos\": [\n        480,\n        2313\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX07_L\",\n      \"pos\": [\n        570,\n        2313\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX08_L\",\n      \"pos\": [\n        660,\n        2313\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX09_L\",\n      \"pos\": [\n        750,\n        2313\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX10_L\",\n      \"pos\": [\n        840,\n        2313\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX11_L\",\n      \"pos\": [\n        930,\n        2313\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_sel_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        2443\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sel_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"selector~ 11 1 @ramptime 30\",\n      \"pos\": [\n        30,\n        2493\n      ],\n      \"inlets\": 12,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_wet_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ WET_R\",\n      \"pos\": [\n        30,\n        2543\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX02_R\",\n      \"pos\": [\n        120,\n        2443\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX03_R\",\n      \"pos\": [\n        210,\n        2443\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX04_R\",\n      \"pos\": [\n        300,\n        2443\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX05_R\",\n      \"pos\": [\n        390,\n        2443\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX06_R\",\n      \"pos\": [\n        480,\n        2443\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX07_R\",\n      \"pos\": [\n        570,\n        2443\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX08_R\",\n      \"pos\": [\n        660,\n        2443\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX09_R\",\n      \"pos\": [\n        750,\n        2443\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX10_R\",\n      \"pos\": [\n        840,\n        2443\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX11_R\",\n      \"pos\": [\n        930,\n        2443\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_master\": {\n      \"type\": \"comment\",\n      \"text\": \"MASTER \\u2014 global dry/wet crossfade (equal power); wet and dry paths sum at the live.gain~ inlets \\u2192 ezdac~\",\n      \"pos\": [\n        30,\n        2593\n      ],\n      \"size\": [\n        700,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"mw_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ WET_L\",\n      \"pos\": [\n        30,\n        2623\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mw_gain\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WET_G\",\n      \"pos\": [\n        110,\n        2623\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mw_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ WET_R\",\n      \"pos\": [\n        200,\n        2623\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"md_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        330,\n        2623\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"md_gain\": {\n      \"type\": \"newobj\",\n      \"text\": \"r DRY_G\",\n      \"pos\": [\n        410,\n        2623\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"md_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        500,\n        2623\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mw_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        110,\n        2663\n      ],\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"bang\"\n      ]\n    },\n    \"md_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        410,\n        2663\n      ],\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"bang\"\n      ]\n    },\n    \"wetL\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        30,\n        2713\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"wetR\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        200,\n        2713\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"dryL\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        330,\n        2713\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"dryR\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        500,\n        2713\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"gain\": {\n      \"type\": \"live.gain~\",\n      \"pos\": [\n        30,\n        2773\n      ],\n      \"size\": [\n        50,\n        47\n      ],\n      \"attrs\": {\n        \"orientation\": 1\n      },\n      \"presentation\": [\n        980,\n        130,\n        250,\n        47\n      ],\n      \"inlets\": 2,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"float\",\n        \"list\"\n      ],\n      \"box_extras\": {\n        \"orientation\": 1\n      }\n    },\n    \"dac\": {\n      \"type\": \"ezdac~\",\n      \"pos\": [\n        30,\n        2853\n      ],\n      \"presentation\": [\n        1235,\n        130,\n        45,\n        45\n      ],\n      \"inlets\": 2,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_dw\": {\n      \"type\": \"comment\",\n      \"text\": \"DRY/WET 0..1 \\u2014 wet = sqrt(x), dry = sqrt(1-x); loads at 0.25\",\n      \"pos\": [\n        780,\n        2593\n      ],\n      \"size\": [\n        400,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"dw_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0.25\",\n      \"pos\": [\n        780,\n        2623\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_slider\": {\n      \"type\": \"slider\",\n      \"pos\": [\n        780,\n        2663\n      ],\n      \"size\": [\n        200,\n        22\n      ],\n      \"attrs\": {\n        \"floatoutput\": 1,\n        \"size\": 1.0,\n        \"knobcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"elementcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.08,\n          0.08,\n          0.09,\n          1.0\n        ]\n      },\n      \"presentation\": [\n        980,\n        62,\n        240,\n        36\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"floatoutput\": 1,\n        \"size\": 1.0,\n        \"knobcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"elementcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ]\n      }\n    },\n    \"dw\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        780,\n        2703\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        1226,\n        69,\n        54,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"dw_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t f f\",\n      \"pos\": [\n        780,\n        2743\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"dw_wet\": {\n      \"type\": \"newobj\",\n      \"text\": \"expr sqrt($f1)\",\n      \"pos\": [\n        780,\n        2783\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_dry\": {\n      \"type\": \"newobj\",\n      \"text\": \"expr sqrt(1.-$f1)\",\n      \"pos\": [\n        930,\n        2783\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_wet_ramp\": {\n      \"type\": \"message\",\n      \"text\": \"$1 20\",\n      \"pos\": [\n        780,\n        2823\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_dry_ramp\": {\n      \"type\": \"message\",\n      \"text\": \"$1 20\",\n      \"pos\": [\n        930,\n        2823\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_s_wet\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WET_G\",\n      \"pos\": [\n        780,\n        2863\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"dw_s_dry\": {\n      \"type\": \"newobj\",\n      \"text\": \"s DRY_G\",\n      \"pos\": [\n        930,\n        2863\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_src_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        730,\n        2923\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        10,\n        600,\n        380\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_shoot_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        800,\n        2923\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        620,\n        10,\n        670,\n        380\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_src_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE\",\n      \"pos\": [\n        2520,\n        632\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        20,\n        16,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_playlist_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"drop audio files on the player, click a clip to play\",\n      \"pos\": [\n        2520,\n        658\n      ],\n      \"size\": [\n        450,\n        20\n      ],\n      \"presentation\": [\n        20,\n        244,\n        306,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_ezadc_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"live in (DSP on/off)\",\n      \"pos\": [\n        2520,\n        684\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        392,\n        52,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_mute_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"live in OPEN \\u2014 loads muted\",\n      \"pos\": [\n        2520,\n        710\n      ],\n      \"size\": [\n        229,\n        20\n      ],\n      \"presentation\": [\n        372,\n        94,\n        220,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_impulse_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"impulse (click~)\",\n      \"pos\": [\n        2520,\n        736\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        372,\n        133,\n        150,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_burst_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"noise burst 120 ms\",\n      \"pos\": [\n        2520,\n        762\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        372,\n        173,\n        150,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_shoot_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SHOOTOUT \\u2014 click an effect; all run in parallel, crossfade in 30 ms\",\n      \"pos\": [\n        2520,\n        788\n      ],\n      \"size\": [\n        577,\n        20\n      ],\n      \"presentation\": [\n        630,\n        16,\n        640,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_dw_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"DRY / WET  \\u25c4 dry \\u00b7 wet \\u25ba  (loads 0.25)\",\n      \"pos\": [\n        2520,\n        814\n      ],\n      \"size\": [\n        331,\n        20\n      ],\n      \"presentation\": [\n        980,\n        40,\n        300,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_dw_val\": {\n      \"type\": \"comment\",\n      \"text\": \"wet\",\n      \"pos\": [\n        2520,\n        840\n      ],\n      \"size\": [\n        40,\n        20\n      ],\n      \"presentation\": [\n        1226,\n        93,\n        54,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_gain_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"master\",\n      \"pos\": [\n        2520,\n        866\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        980,\n        110,\n        80,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_dac_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"audio\",\n      \"pos\": [\n        2520,\n        892\n      ],\n      \"size\": [\n        50,\n        20\n      ],\n      \"presentation\": [\n        1235,\n        178,\n        50,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_wo_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"re-apply wet-only everywhere\",\n      \"pos\": [\n        2520,\n        918\n      ],\n      \"size\": [\n        246,\n        20\n      ],\n      \"presentation\": [\n        1075,\n        203,\n        205,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_plbl\": {\n      \"type\": \"comment\",\n      \"text\": \"presentation-only labels (they show in the panels)\",\n      \"pos\": [\n        2520,\n        30\n      ],\n      \"size\": [\n        330,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    }\n  },\n  \"connections\": [\n    [\n      \"ezadc\",\n      0,\n      \"mute_L\",\n      0\n    ],\n    [\n      \"ezadc\",\n      1,\n      \"mute_R\",\n      0\n    ],\n    [\n      \"mute\",\n      0,\n      \"mute_L\",\n      1\n    ],\n    [\n      \"mute\",\n      0,\n      \"mute_R\",\n      1\n    ],\n    [\n      \"btn_impulse\",\n      0,\n      \"click\",\n      0\n    ],\n    [\n      \"click\",\n      0,\n      \"s_test1\",\n      0\n    ],\n    [\n      \"btn_burst\",\n      0,\n      \"burst_env\",\n      0\n    ],\n    [\n      \"burst_env\",\n      0,\n      \"burst_line\",\n      0\n    ],\n    [\n      \"noise\",\n      0,\n      \"burst_mul\",\n      0\n    ],\n    [\n      \"burst_line\",\n      0,\n      \"burst_mul\",\n      1\n    ],\n    [\n      \"burst_mul\",\n      0,\n      \"s_test2\",\n      0\n    ],\n    [\n      \"playlist\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"playlist\",\n      1,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"mute_L\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"mute_R\",\n      0,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"r_test\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"r_test\",\n      0,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"r_mono_L\",\n      0,\n      \"mono_half\",\n      0\n    ],\n    [\n      \"r_mono_R\",\n      0,\n      \"mono_half\",\n      0\n    ],\n    [\n      \"mono_half\",\n      0,\n      \"s_src_M\",\n      0\n    ],\n    [\n      \"lm_tab\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"r_tabsel\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"tab\",\n      0,\n      \"hl_v8\",\n      0\n    ],\n    [\n      \"hl_v8\",\n      0,\n      \"s_sel\",\n      0\n    ],\n    [\n      \"wo_lb\",\n      0,\n      \"wo_delay\",\n      0\n    ],\n    [\n      \"wo_delay\",\n      0,\n      \"wo_send\",\n      0\n    ],\n    [\n      \"wo_btn\",\n      0,\n      \"wo_send2\",\n      0\n    ],\n    [\n      \"f02_tbtn\",\n      0,\n      \"f02_tsel\",\n      0\n    ],\n    [\n      \"f02_tsel\",\n      0,\n      \"f02_tsend\",\n      0\n    ],\n    [\n      \"f02_rM\",\n      0,\n      \"f02_bp\",\n      0\n    ],\n    [\n      \"f02_bp\",\n      0,\n      \"f02_sL\",\n      0\n    ],\n    [\n      \"f02_bp\",\n      0,\n      \"f02_sR\",\n      0\n    ],\n    [\n      \"f03_tbtn\",\n      0,\n      \"f03_tsel\",\n      0\n    ],\n    [\n      \"f03_tsel\",\n      0,\n      \"f03_tsend\",\n      0\n    ],\n    [\n      \"f03_rM\",\n      0,\n      \"f03_bp\",\n      0\n    ],\n    [\n      \"f03_bp\",\n      0,\n      \"f03_sL\",\n      0\n    ],\n    [\n      \"f03_bp\",\n      0,\n      \"f03_sR\",\n      0\n    ],\n    [\n      \"f04_tbtn\",\n      0,\n      \"f04_tsel\",\n      0\n    ],\n    [\n      \"f04_tsel\",\n      0,\n      \"f04_tsend\",\n      0\n    ],\n    [\n      \"f04_rM\",\n      0,\n      \"f04_bp\",\n      0\n    ],\n    [\n      \"f04_bp\",\n      0,\n      \"f04_sL\",\n      0\n    ],\n    [\n      \"f04_bp\",\n      0,\n      \"f04_sR\",\n      0\n    ],\n    [\n      \"f05_tbtn\",\n      0,\n      \"f05_tsel\",\n      0\n    ],\n    [\n      \"f05_tsel\",\n      0,\n      \"f05_tsend\",\n      0\n    ],\n    [\n      \"f05_rM\",\n      0,\n      \"f05_bp\",\n      0\n    ],\n    [\n      \"f05_bp\",\n      0,\n      \"f05_sL\",\n      0\n    ],\n    [\n      \"f05_bp\",\n      0,\n      \"f05_sR\",\n      0\n    ],\n    [\n      \"f06_tbtn\",\n      0,\n      \"f06_tsel\",\n      0\n    ],\n    [\n      \"f06_tsel\",\n      0,\n      \"f06_tsend\",\n      0\n    ],\n    [\n      \"f06_open\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_rL\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_rR\",\n      0,\n      \"f06_obj\",\n      1\n    ],\n    [\n      \"f06_obj\",\n      0,\n      \"f06_sL\",\n      0\n    ],\n    [\n      \"f06_obj\",\n      1,\n      \"f06_sR\",\n      0\n    ],\n    [\n      \"f07_tbtn\",\n      0,\n      \"f07_tsel\",\n      0\n    ],\n    [\n      \"f07_tsel\",\n      0,\n      \"f07_tsend\",\n      0\n    ],\n    [\n      \"f07_open\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_rL\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_rR\",\n      0,\n      \"f07_obj\",\n      1\n    ],\n    [\n      \"f07_obj\",\n      0,\n      \"f07_sL\",\n      0\n    ],\n    [\n      \"f07_obj\",\n      1,\n      \"f07_sR\",\n      0\n    ],\n    [\n      \"f08_tbtn\",\n      0,\n      \"f08_tsel\",\n      0\n    ],\n    [\n      \"f08_tsel\",\n      0,\n      \"f08_tsend\",\n      0\n    ],\n    [\n      \"f08_open\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_rL\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_rR\",\n      0,\n      \"f08_obj\",\n      1\n    ],\n    [\n      \"f08_rwo\",\n      0,\n      \"f08_wet\",\n      0\n    ],\n    [\n      \"f08_wet\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_obj\",\n      0,\n      \"f08_sL\",\n      0\n    ],\n    [\n      \"f08_obj\",\n      1,\n      \"f08_sR\",\n      0\n    ],\n    [\n      \"f09_tbtn\",\n      0,\n      \"f09_tsel\",\n      0\n    ],\n    [\n      \"f09_tsel\",\n      0,\n      \"f09_tsend\",\n      0\n    ],\n    [\n      \"f09_open\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_rL\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_rR\",\n      0,\n      \"f09_obj\",\n      1\n    ],\n    [\n      \"f09_obj\",\n      0,\n      \"f09_sL\",\n      0\n    ],\n    [\n      \"f09_obj\",\n      1,\n      \"f09_sR\",\n      0\n    ],\n    [\n      \"f10_tbtn\",\n      0,\n      \"f10_tsel\",\n      0\n    ],\n    [\n      \"f10_tsel\",\n      0,\n      \"f10_tsend\",\n      0\n    ],\n    [\n      \"f10_open\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_rL\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_rR\",\n      0,\n      \"f10_obj\",\n      1\n    ],\n    [\n      \"f10_rwo\",\n      0,\n      \"f10_wet\",\n      0\n    ],\n    [\n      \"f10_wet\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_obj\",\n      0,\n      \"f10_sL\",\n      0\n    ],\n    [\n      \"f10_obj\",\n      1,\n      \"f10_sR\",\n      0\n    ],\n    [\n      \"f11_tbtn\",\n      0,\n      \"f11_tsel\",\n      0\n    ],\n    [\n      \"f11_tsel\",\n      0,\n      \"f11_tsend\",\n      0\n    ],\n    [\n      \"f11_rL\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_rR\",\n      0,\n      \"f11_obj\",\n      1\n    ],\n    [\n      \"f11_lb\",\n      0,\n      \"f11_t\",\n      0\n    ],\n    [\n      \"f11_t\",\n      1,\n      \"f11_plug\",\n      0\n    ],\n    [\n      \"f11_t\",\n      0,\n      \"f11_sinit\",\n      0\n    ],\n    [\n      \"f11_plug\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_open\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_rinit\",\n      0,\n      \"f11_p0_i\",\n      0\n    ],\n    [\n      \"f11_p0_i\",\n      0,\n      \"f11_p0\",\n      0\n    ],\n    [\n      \"f11_p0\",\n      0,\n      \"f11_p0_m\",\n      0\n    ],\n    [\n      \"f11_p0_m\",\n      0,\n      \"f11_stov\",\n      0\n    ],\n    [\n      \"f11_rinit\",\n      0,\n      \"f11_p1_i\",\n      0\n    ],\n    [\n      \"f11_p1_i\",\n      0,\n      \"f11_p1\",\n      0\n    ],\n    [\n      \"f11_p1\",\n      0,\n      \"f11_p1_m\",\n      0\n    ],\n    [\n      \"f11_p1_m\",\n      0,\n      \"f11_stov\",\n      0\n    ],\n    [\n      \"f11_rinit\",\n      0,\n      \"f11_p2_i\",\n      0\n    ],\n    [\n      \"f11_p2_i\",\n      0,\n      \"f11_p2\",\n      0\n    ],\n    [\n      \"f11_p2\",\n      0,\n      \"f11_p2_m\",\n      0\n    ],\n    [\n      \"f11_p2_m\",\n      0,\n      \"f11_stov\",\n      0\n    ],\n    [\n      \"f11_rinit\",\n      0,\n      \"f11_p3_i\",\n      0\n    ],\n    [\n      \"f11_p3_i\",\n      0,\n      \"f11_p3\",\n      0\n    ],\n    [\n      \"f11_p3\",\n      0,\n      \"f11_p3_m\",\n      0\n    ],\n    [\n      \"f11_p3_m\",\n      0,\n      \"f11_stov\",\n      0\n    ],\n    [\n      \"f11_rinit\",\n      0,\n      \"f11_p4_i\",\n      0\n    ],\n    [\n      \"f11_p4_i\",\n      0,\n      \"f11_p4\",\n      0\n    ],\n    [\n      \"f11_p4\",\n      0,\n      \"f11_p4_m\",\n      0\n    ],\n    [\n      \"f11_p4_m\",\n      0,\n      \"f11_stov\",\n      0\n    ],\n    [\n      \"f11_rinit\",\n      0,\n      \"f11_p5_i\",\n      0\n    ],\n    [\n      \"f11_p5_i\",\n      0,\n      \"f11_p5\",\n      0\n    ],\n    [\n      \"f11_p5\",\n      0,\n      \"f11_p5_m\",\n      0\n    ],\n    [\n      \"f11_p5_m\",\n      0,\n      \"f11_stov\",\n      0\n    ],\n    [\n      \"f11_rtov\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_obj\",\n      0,\n      \"f11_sL\",\n      0\n    ],\n    [\n      \"f11_obj\",\n      1,\n      \"f11_sR\",\n      0\n    ],\n    [\n      \"r_sel_L\",\n      0,\n      \"sel_L\",\n      0\n    ],\n    [\n      \"sel_L\",\n      0,\n      \"s_wet_L\",\n      0\n    ],\n    [\n      \"mx_L_2\",\n      0,\n      \"sel_L\",\n      2\n    ],\n    [\n      \"mx_L_3\",\n      0,\n      \"sel_L\",\n      3\n    ],\n    [\n      \"mx_L_4\",\n      0,\n      \"sel_L\",\n      4\n    ],\n    [\n      \"mx_L_5\",\n      0,\n      \"sel_L\",\n      5\n    ],\n    [\n      \"mx_L_6\",\n      0,\n      \"sel_L\",\n      6\n    ],\n    [\n      \"mx_L_7\",\n      0,\n      \"sel_L\",\n      7\n    ],\n    [\n      \"mx_L_8\",\n      0,\n      \"sel_L\",\n      8\n    ],\n    [\n      \"mx_L_9\",\n      0,\n      \"sel_L\",\n      9\n    ],\n    [\n      \"mx_L_10\",\n      0,\n      \"sel_L\",\n      10\n    ],\n    [\n      \"mx_L_11\",\n      0,\n      \"sel_L\",\n      11\n    ],\n    [\n      \"r_sel_R\",\n      0,\n      \"sel_R\",\n      0\n    ],\n    [\n      \"sel_R\",\n      0,\n      \"s_wet_R\",\n      0\n    ],\n    [\n      \"mx_R_2\",\n      0,\n      \"sel_R\",\n      2\n    ],\n    [\n      \"mx_R_3\",\n      0,\n      \"sel_R\",\n      3\n    ],\n    [\n      \"mx_R_4\",\n      0,\n      \"sel_R\",\n      4\n    ],\n    [\n      \"mx_R_5\",\n      0,\n      \"sel_R\",\n      5\n    ],\n    [\n      \"mx_R_6\",\n      0,\n      \"sel_R\",\n      6\n    ],\n    [\n      \"mx_R_7\",\n      0,\n      \"sel_R\",\n      7\n    ],\n    [\n      \"mx_R_8\",\n      0,\n      \"sel_R\",\n      8\n    ],\n    [\n      \"mx_R_9\",\n      0,\n      \"sel_R\",\n      9\n    ],\n    [\n      \"mx_R_10\",\n      0,\n      \"sel_R\",\n      10\n    ],\n    [\n      \"mx_R_11\",\n      0,\n      \"sel_R\",\n      11\n    ],\n    [\n      \"mw_rL\",\n      0,\n      \"wetL\",\n      0\n    ],\n    [\n      \"mw_gain\",\n      0,\n      \"mw_line\",\n      0\n    ],\n    [\n      \"mw_rR\",\n      0,\n      \"wetR\",\n      0\n    ],\n    [\n      \"md_rL\",\n      0,\n      \"dryL\",\n      0\n    ],\n    [\n      \"md_gain\",\n      0,\n      \"md_line\",\n      0\n    ],\n    [\n      \"md_rR\",\n      0,\n      \"dryR\",\n      0\n    ],\n    [\n      \"mw_line\",\n      0,\n      \"wetL\",\n      1\n    ],\n    [\n      \"mw_line\",\n      0,\n      \"wetR\",\n      1\n    ],\n    [\n      \"md_line\",\n      0,\n      \"dryL\",\n      1\n    ],\n    [\n      \"md_line\",\n      0,\n      \"dryR\",\n      1\n    ],\n    [\n      \"wetL\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"dryL\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"wetR\",\n      0,\n      \"gain\",\n      1\n    ],\n    [\n      \"dryR\",\n      0,\n      \"gain\",\n      1\n    ],\n    [\n      \"gain\",\n      0,\n      \"dac\",\n      0\n    ],\n    [\n      \"gain\",\n      1,\n      \"dac\",\n      1\n    ],\n    [\n      \"dw_lm\",\n      0,\n      \"dw_slider\",\n      0\n    ],\n    [\n      \"dw_slider\",\n      0,\n      \"dw\",\n      0\n    ],\n    [\n      \"dw\",\n      0,\n      \"dw_t\",\n      0\n    ],\n    [\n      \"dw_t\",\n      0,\n      \"dw_wet\",\n      0\n    ],\n    [\n      \"dw_t\",\n      1,\n      \"dw_dry\",\n      0\n    ],\n    [\n      \"dw_wet\",\n      0,\n      \"dw_wet_ramp\",\n      0\n    ],\n    [\n      \"dw_dry\",\n      0,\n      \"dw_dry_ramp\",\n      0\n    ],\n    [\n      \"dw_wet_ramp\",\n      0,\n      \"dw_s_wet\",\n      0\n    ],\n    [\n      \"dw_dry_ramp\",\n      0,\n      \"dw_s_dry\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
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
            "obj-48",
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
            "obj-54",
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
            "obj-60",
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
            "obj-71",
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
            "obj-93",
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
            "obj-93",
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
            1
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
            "obj-95",
            0
          ],
          "source": [
            "obj-93",
            1
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
            "obj-99",
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
            "obj-102",
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
            "obj-103",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-105",
            1
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
            "obj-107",
            0
          ],
          "source": [
            "obj-105",
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
            "obj-117",
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
            "obj-117",
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
            "obj-117",
            1
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
            "obj-117",
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
            "obj-120",
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
            "obj-117",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-125",
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
            "obj-131",
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
            "obj-131",
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
            "obj-131",
            1
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
            "obj-133",
            0
          ],
          "source": [
            "obj-131",
            1
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
            "obj-143",
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
            1
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
            "obj-143",
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
            "obj-146",
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
            "obj-147",
            0
          ],
          "source": [
            "obj-143",
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
            "obj-159",
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
            "obj-159",
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
            "obj-163",
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
            "obj-164",
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
            "obj-163",
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
            "obj-169",
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
            "obj-170",
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
            "obj-172",
            0
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
            "obj-163",
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
            "obj-176",
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
            "obj-164",
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
            "obj-177",
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
            "obj-180",
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
            "obj-164",
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
            "obj-163",
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
            "obj-182",
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
            "obj-184",
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
            "obj-163",
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
            "obj-188",
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
            "obj-164",
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
            "obj-157",
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
            "obj-190",
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
            "obj-191",
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
            "obj-195",
            2
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
            3
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
            4
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
            "obj-195",
            5
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
            "obj-195",
            6
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
            "obj-195",
            7
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
            "obj-195",
            8
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
            "obj-195",
            9
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
            "obj-195",
            10
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
            "obj-195",
            11
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
            "obj-208",
            2
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
            "obj-208",
            3
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
            "obj-208",
            4
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
            "obj-208",
            5
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
            "obj-208",
            6
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
            "obj-208",
            7
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
            "obj-208",
            8
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
            "obj-208",
            9
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
            "obj-208",
            10
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
            "obj-208",
            11
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
            "obj-229",
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
            "obj-222",
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
            "obj-223",
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
            "obj-224",
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
            "obj-225",
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
            "obj-226",
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
            "obj-227",
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
            "obj-227",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-231",
            1
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
            "obj-232",
            1
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
            "obj-233",
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
            "obj-230",
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
            1
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
            "obj-241",
            0
          ],
          "source": [
            "obj-239",
            1
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
            "obj-245",
            0
          ],
          "source": [
            "obj-243",
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
