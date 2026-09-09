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
          "text": "SPECIAL FX SHOOTOUT \u2014 granular, rhythmic and other Max for Live package effects that fit no other category. One source bus (s~ SRC_L / SRC_R / SRC_M), every effect runs in parallel, the tab picks which one reaches the master via two selector~ (30 ms crossfade). Each effect is set 100% wet where it has a mix control; the master DRY/WET slider does the global mix (loads at 0.25 wet)."
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
          "text": "EFFECT SELECT \u2014 live.tab, one column of 12, conventional order. The v8 maps item index \u2192 slot number (1 = DRY: wet bus muted, master dry only) and lights the pane title"
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
            260.0
          ],
          "num_lines_patching": 12,
          "num_lines_presentation": 12,
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
                "2 amxd Fragulator",
                "3 amxd Granular-to-go",
                "4 amxd Stutterer",
                "5 amxd SquirrelParade",
                "6 amxd Raindrops",
                "7 amxd Rye",
                "8 amxd Wheat",
                "9 amxd Xformer",
                "10 amxd CutKiller",
                "11 amxd EffectMatrix",
                "12 amxd Average Injector"
              ],
              "parameter_initial": [
                0
              ],
              "parameter_longname": "FX_SELECT",
              "parameter_mmax": 11,
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
          "text": "v8 fx-shootout-highlight.js 12 @embed 1",
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
          "text": "TRANSPORT \u2014 the global transport; followed by: Xformer, CutKiller"
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
            263.0,
            20.0
          ],
          "text": "TRANSPORT \u2014 Xformer, CutKiller",
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
            169.0,
            20.0
          ],
          "text": "2 \u00b7 amxd Fragulator",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            406.0,
            209.0,
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
            589.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            406.0,
            209.0,
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
            589.0,
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
            589.0,
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
            549.0,
            20.0
          ],
          "text": "2 \u00b7 amxd~ Fragulator.amxd \u2014 chops the input into fragments and loops them"
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
            237.0,
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
            265.0,
            196.0
          ],
          "text": "amxd~ Fragulator.amxd",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            432.0,
            265.0,
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
          "text": "wet_dry 100."
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
            203.0,
            20.0
          ],
          "text": "3 \u00b7 amxd Granular-to-go",
          "presentation": 1,
          "presentation_rect": [
            311.0,
            406.0,
            371.0,
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
            1199.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            311.0,
            406.0,
            371.0,
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
            1199.0,
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
            1199.0,
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
            729.0,
            520.0,
            460.0,
            20.0
          ],
          "text": "3 \u00b7 amxd~ Granular-to-go.amxd \u2014 live granular synthesis"
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
            729.0,
            550.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            692.0,
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
            799.0,
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
            879.0,
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
            729.0,
            630.0,
            427.0,
            196.0
          ],
          "text": "amxd~ Granular-to-go.amxd",
          "presentation": 1,
          "presentation_rect": [
            311.0,
            432.0,
            427.0,
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
            1029.0,
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
            1029.0,
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
            729.0,
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
            869.0,
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
            161.0,
            20.0
          ],
          "text": "4 \u00b7 amxd Stutterer",
          "presentation": 1,
          "presentation_rect": [
            766.0,
            406.0,
            419.0,
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
            1844.0,
            520.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            766.0,
            406.0,
            419.0,
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
            1844.0,
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
            1844.0,
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
            1339.0,
            520.0,
            495.0,
            20.0
          ],
          "text": "4 \u00b7 amxd~ Stutterer.amxd \u2014 snapshot-and-loop stutter effect"
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
            1339.0,
            550.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            1195.0,
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
            1409.0,
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
            1489.0,
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
            1339.0,
            630.0,
            475.0,
            196.0
          ],
          "text": "amxd~ Stutterer.amxd",
          "presentation": 1,
          "presentation_rect": [
            766.0,
            432.0,
            475.0,
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
            1639.0,
            550.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-88",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1639.0,
            590.0,
            104.0,
            22.0
          ],
          "text": "wet_dry 100."
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
            1339.0,
            861.0,
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
            1479.0,
            861.0,
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
            203.0,
            20.0
          ],
          "text": "5 \u00b7 amxd SquirrelParade",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            658.0,
            350.0,
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
            632.0,
            961.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            658.0,
            350.0,
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
            632.0,
            991.0,
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
            632.0,
            1021.0,
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
            961.0,
            592.0,
            20.0
          ],
          "text": "5 \u00b7 amxd~ SquirrelParade.amxd \u2014 four granular channels with a modulation matrix"
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
            30.0,
            991.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            378.0,
            658.0,
            50.0,
            22.0
          ]
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
          "id": "obj-99",
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
          "id": "obj-100",
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
            406.0,
            196.0
          ],
          "text": "amxd~ SquirrelParade.amxd",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            684.0,
            406.0,
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
          "id": "obj-101",
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
          "id": "obj-102",
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
          "text": "wet/dry 100."
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
          "id": "obj-104",
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
          "id": "obj-106",
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
          "text": "6 \u00b7 amxd Raindrops",
          "presentation": 1,
          "presentation_rect": [
            452.0,
            658.0,
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
          "varname": "TITLE_06"
        }
      },
      {
        "box": {
          "id": "obj-107",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1259.0,
            961.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            452.0,
            658.0,
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
          "id": "obj-108",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1259.0,
            991.0,
            40.0,
            22.0
          ],
          "text": "5"
        }
      },
      {
        "box": {
          "id": "obj-109",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1259.0,
            1021.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            772.0,
            961.0,
            477.0,
            20.0
          ],
          "text": "6 \u00b7 amxd~ Raindrops.amxd \u2014 a field of moving bandpass particles"
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
            772.0,
            991.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            666.0,
            658.0,
            50.0,
            22.0
          ]
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
            842.0,
            991.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            922.0,
            991.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-114",
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
            772.0,
            1071.0,
            250.0,
            196.0
          ],
          "text": "amxd~ Raindrops.amxd",
          "presentation": 1,
          "presentation_rect": [
            452.0,
            684.0,
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
          "varname": "DEV_06"
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
            1072.0,
            991.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-116",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1072.0,
            1031.0,
            104.0,
            22.0
          ],
          "text": "wet/dry 100."
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
            772.0,
            1302.0,
            83.0,
            22.0
          ],
          "text": "s~ FX06_L"
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
            912.0,
            1302.0,
            83.0,
            22.0
          ],
          "text": "s~ FX06_R"
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
            2520.0,
            268.0,
            110.0,
            20.0
          ],
          "text": "7 \u00b7 amxd Rye",
          "presentation": 1,
          "presentation_rect": [
            740.0,
            658.0,
            209.0,
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
          "id": "obj-121",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1886.0,
            961.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            740.0,
            658.0,
            209.0,
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
          "id": "obj-122",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1886.0,
            991.0,
            40.0,
            22.0
          ],
          "text": "6"
        }
      },
      {
        "box": {
          "id": "obj-123",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1886.0,
            1021.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-124",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1399.0,
            961.0,
            477.0,
            20.0
          ],
          "text": "7 \u00b7 amxd~ Rye.amxd \u2014 Pluggo granular with phase-reversal stereo"
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
            1399.0,
            991.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            959.0,
            658.0,
            50.0,
            22.0
          ]
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
            1469.0,
            991.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            1549.0,
            991.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-128",
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
            1399.0,
            1071.0,
            265.0,
            196.0
          ],
          "text": "amxd~ Rye.amxd",
          "presentation": 1,
          "presentation_rect": [
            740.0,
            684.0,
            265.0,
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
          "id": "obj-129",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1699.0,
            991.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-130",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1699.0,
            1031.0,
            104.0,
            22.0
          ],
          "text": "wet/dry 100."
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
            1399.0,
            1302.0,
            83.0,
            22.0
          ],
          "text": "s~ FX07_L"
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
            1539.0,
            1302.0,
            83.0,
            22.0
          ],
          "text": "s~ FX07_R"
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
            2520.0,
            294.0,
            127.0,
            20.0
          ],
          "text": "8 \u00b7 amxd Wheat",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            910.0,
            458.0,
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
          "id": "obj-135",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            574.0,
            1402.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            910.0,
            458.0,
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
          "id": "obj-136",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            574.0,
            1432.0,
            40.0,
            22.0
          ],
          "text": "7"
        }
      },
      {
        "box": {
          "id": "obj-137",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            574.0,
            1462.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            30.0,
            1402.0,
            534.0,
            20.0
          ],
          "text": "8 \u00b7 amxd~ Wheat.amxd \u2014 Pluggo granular with a per-grain pitch envelope"
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
            30.0,
            1432.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            486.0,
            910.0,
            50.0,
            22.0
          ]
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
          "id": "obj-141",
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
          "id": "obj-142",
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
            514.0,
            196.0
          ],
          "text": "amxd~ Wheat.amxd",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            936.0,
            514.0,
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
          "id": "obj-143",
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
          "id": "obj-144",
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
          "text": "wet_dry 100."
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
          "id": "obj-146",
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
          "id": "obj-148",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            320.0,
            144.0,
            20.0
          ],
          "text": "9 \u00b7 amxd Xformer",
          "presentation": 1,
          "presentation_rect": [
            560.0,
            910.0,
            548.0,
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
          "id": "obj-149",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1348.0,
            1402.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            560.0,
            910.0,
            548.0,
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
          "id": "obj-150",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1348.0,
            1432.0,
            40.0,
            22.0
          ],
          "text": "8"
        }
      },
      {
        "box": {
          "id": "obj-151",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1348.0,
            1462.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-152",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            714.0,
            1402.0,
            624.0,
            20.0
          ],
          "text": "9 \u00b7 amxd~ Xformer.amxd \u2014 rhythmic mute / accent groove (transport-driven)"
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
            714.0,
            1432.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            1118.0,
            910.0,
            50.0,
            22.0
          ]
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
            784.0,
            1432.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            864.0,
            1432.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-156",
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
            714.0,
            1512.0,
            604.0,
            196.0
          ],
          "text": "amxd~ Xformer.amxd",
          "presentation": 1,
          "presentation_rect": [
            560.0,
            936.0,
            604.0,
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
          "id": "obj-157",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            714.0,
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
            854.0,
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
          "text": "10 \u00b7 amxd CutKiller",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1162.0,
            428.0,
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
            2040.0,
            1402.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1162.0,
            428.0,
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
            2040.0,
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
            2040.0,
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
            1488.0,
            1402.0,
            542.0,
            20.0
          ],
          "text": "10 \u00b7 amxd~ Max CutKiller.amxd \u2014 rhythmic cutting synced to the transport"
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
            1488.0,
            1432.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            456.0,
            1162.0,
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
            1558.0,
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
            1638.0,
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
            1488.0,
            1512.0,
            484.0,
            196.0
          ],
          "text": "amxd~ \"Max CutKiller.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1188.0,
            484.0,
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
            1788.0,
            1432.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
        }
      },
      {
        "box": {
          "id": "obj-170",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1788.0,
            1472.0,
            104.0,
            22.0
          ],
          "text": "Dry/wet 100."
        }
      },
      {
        "box": {
          "id": "obj-171",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1488.0,
            1743.0,
            83.0,
            22.0
          ],
          "text": "s~ FX10_L"
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
            1628.0,
            1743.0,
            83.0,
            22.0
          ],
          "text": "s~ FX10_R"
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
            2520.0,
            372.0,
            195.0,
            20.0
          ],
          "text": "11 \u00b7 amxd EffectMatrix",
          "presentation": 1,
          "presentation_rect": [
            530.0,
            1162.0,
            518.0,
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
          "id": "obj-175",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            634.0,
            1843.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            530.0,
            1162.0,
            518.0,
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
          "id": "obj-176",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            634.0,
            1873.0,
            40.0,
            22.0
          ],
          "text": "10"
        }
      },
      {
        "box": {
          "id": "obj-177",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            634.0,
            1903.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
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
            30.0,
            1843.0,
            594.0,
            20.0
          ],
          "text": "11 \u00b7 amxd~ Max EffectMatrix.amxd \u2014 several effects routed through a matrix~"
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
            30.0,
            1873.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            1058.0,
            1162.0,
            50.0,
            22.0
          ]
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
            100.0,
            1873.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            180.0,
            1873.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-182",
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
            1953.0,
            574.0,
            196.0
          ],
          "text": "amxd~ \"Max EffectMatrix.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            530.0,
            1188.0,
            574.0,
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
          "id": "obj-183",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            2184.0,
            83.0,
            22.0
          ],
          "text": "s~ FX11_L"
        }
      },
      {
        "box": {
          "id": "obj-184",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            170.0,
            2184.0,
            83.0,
            22.0
          ],
          "text": "s~ FX11_R"
        }
      },
      {
        "box": {
          "id": "obj-186",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            398.0,
            229.0,
            20.0
          ],
          "text": "12 \u00b7 amxd Average Injector",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1414.0,
            304.0,
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
          "id": "obj-187",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1420.0,
            1843.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1414.0,
            304.0,
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
          "id": "obj-188",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1420.0,
            1873.0,
            40.0,
            22.0
          ],
          "text": "11"
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
            1420.0,
            1903.0,
            76.0,
            22.0
          ],
          "text": "s TABSEL"
        }
      },
      {
        "box": {
          "id": "obj-190",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            774.0,
            1843.0,
            636.0,
            20.0
          ],
          "text": "12 \u00b7 amxd~ Average Injector.amxd \u2014 delay and amplitude modulated by the average level"
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
            774.0,
            1873.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            332.0,
            1414.0,
            50.0,
            22.0
          ]
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
            844.0,
            1873.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            924.0,
            1873.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-194",
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
            774.0,
            1953.0,
            360.0,
            196.0
          ],
          "text": "amxd~ \"Average Injector.amxd\"",
          "presentation": 1,
          "presentation_rect": [
            18.0,
            1440.0,
            360.0,
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
          "id": "obj-195",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1074.0,
            1873.0,
            83.0,
            22.0
          ],
          "text": "r WETONLY"
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
            1074.0,
            1913.0,
            104.0,
            22.0
          ],
          "text": "wet_dry 100."
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
            774.0,
            2184.0,
            83.0,
            22.0
          ],
          "text": "s~ FX12_L"
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
            914.0,
            2184.0,
            83.0,
            22.0
          ],
          "text": "s~ FX12_R"
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
            30.0,
            2284.0,
            1200.0,
            34.0
          ],
          "text": "MIXER \u2014 selector~ inlet n = tab item n. Inlet 1 (DRY) is left unconnected so DRY is silence on the wet bus (the master dry path is always live); inlets 2\u201312 are the effects"
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
            2344.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-201",
          "maxclass": "newobj",
          "numinlets": 13,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            2394.0,
            209.0,
            22.0
          ],
          "text": "selector~ 12 1 @ramptime 30"
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
            30.0,
            2444.0,
            76.0,
            22.0
          ],
          "text": "s~ WET_L"
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
            120.0,
            2344.0,
            83.0,
            22.0
          ],
          "text": "r~ FX02_L"
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
            210.0,
            2344.0,
            83.0,
            22.0
          ],
          "text": "r~ FX03_L"
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
            300.0,
            2344.0,
            83.0,
            22.0
          ],
          "text": "r~ FX04_L"
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
            390.0,
            2344.0,
            83.0,
            22.0
          ],
          "text": "r~ FX05_L"
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
            480.0,
            2344.0,
            83.0,
            22.0
          ],
          "text": "r~ FX06_L"
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
            570.0,
            2344.0,
            83.0,
            22.0
          ],
          "text": "r~ FX07_L"
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
            660.0,
            2344.0,
            83.0,
            22.0
          ],
          "text": "r~ FX08_L"
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
            750.0,
            2344.0,
            83.0,
            22.0
          ],
          "text": "r~ FX09_L"
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
            840.0,
            2344.0,
            83.0,
            22.0
          ],
          "text": "r~ FX10_L"
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
            930.0,
            2344.0,
            83.0,
            22.0
          ],
          "text": "r~ FX11_L"
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
            1020.0,
            2344.0,
            83.0,
            22.0
          ],
          "text": "r~ FX12_L"
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
            30.0,
            2474.0,
            55.0,
            22.0
          ],
          "text": "r SEL"
        }
      },
      {
        "box": {
          "id": "obj-215",
          "maxclass": "newobj",
          "numinlets": 13,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            2524.0,
            209.0,
            22.0
          ],
          "text": "selector~ 12 1 @ramptime 30"
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
            2574.0,
            76.0,
            22.0
          ],
          "text": "s~ WET_R"
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
            120.0,
            2474.0,
            83.0,
            22.0
          ],
          "text": "r~ FX02_R"
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
            210.0,
            2474.0,
            83.0,
            22.0
          ],
          "text": "r~ FX03_R"
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
            300.0,
            2474.0,
            83.0,
            22.0
          ],
          "text": "r~ FX04_R"
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
            390.0,
            2474.0,
            83.0,
            22.0
          ],
          "text": "r~ FX05_R"
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
            480.0,
            2474.0,
            83.0,
            22.0
          ],
          "text": "r~ FX06_R"
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
            570.0,
            2474.0,
            83.0,
            22.0
          ],
          "text": "r~ FX07_R"
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
            660.0,
            2474.0,
            83.0,
            22.0
          ],
          "text": "r~ FX08_R"
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
            750.0,
            2474.0,
            83.0,
            22.0
          ],
          "text": "r~ FX09_R"
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
            840.0,
            2474.0,
            83.0,
            22.0
          ],
          "text": "r~ FX10_R"
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
            930.0,
            2474.0,
            83.0,
            22.0
          ],
          "text": "r~ FX11_R"
        }
      },
      {
        "box": {
          "id": "obj-227",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1020.0,
            2474.0,
            83.0,
            22.0
          ],
          "text": "r~ FX12_R"
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
            30.0,
            2624.0,
            700.0,
            20.0
          ],
          "text": "MASTER \u2014 global dry/wet crossfade (equal power); wet and dry paths sum at the live.gain~ inlets \u2192 ezdac~"
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
            30.0,
            2654.0,
            76.0,
            22.0
          ],
          "text": "r~ WET_L"
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
            110.0,
            2654.0,
            69.0,
            22.0
          ],
          "text": "r WET_G"
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
            200.0,
            2654.0,
            76.0,
            22.0
          ],
          "text": "r~ WET_R"
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
            330.0,
            2654.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_L"
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
            410.0,
            2654.0,
            69.0,
            22.0
          ],
          "text": "r DRY_G"
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
            500.0,
            2654.0,
            76.0,
            22.0
          ],
          "text": "r~ SRC_R"
        }
      },
      {
        "box": {
          "id": "obj-235",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "patching_rect": [
            110.0,
            2694.0,
            55.0,
            22.0
          ],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "obj-236",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "patching_rect": [
            410.0,
            2694.0,
            55.0,
            22.0
          ],
          "text": "line~"
        }
      },
      {
        "box": {
          "id": "obj-237",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            2744.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-238",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            200.0,
            2744.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-239",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            330.0,
            2744.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-240",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            500.0,
            2744.0,
            40.0,
            22.0
          ],
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "obj-241",
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
            2804.0,
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
          "id": "obj-242",
          "maxclass": "ezdac~",
          "numinlets": 2,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            2884.0,
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
          "id": "obj-243",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            780.0,
            2624.0,
            400.0,
            20.0
          ],
          "text": "DRY/WET 0..1 \u2014 wet = sqrt(x), dry = sqrt(1-x); loads at 0.25"
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
            780.0,
            2654.0,
            111.0,
            22.0
          ],
          "text": "loadmess 0.25"
        }
      },
      {
        "box": {
          "id": "obj-245",
          "maxclass": "slider",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            780.0,
            2694.0,
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
          "id": "obj-246",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            780.0,
            2734.0,
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
          "id": "obj-247",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            780.0,
            2774.0,
            55.0,
            22.0
          ],
          "text": "t f f"
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
            780.0,
            2814.0,
            118.0,
            22.0
          ],
          "text": "expr sqrt($f1)"
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
            930.0,
            2814.0,
            139.0,
            22.0
          ],
          "text": "expr sqrt(1.-$f1)"
        }
      },
      {
        "box": {
          "id": "obj-250",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            780.0,
            2854.0,
            55.0,
            22.0
          ],
          "text": "$1 20"
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
            930.0,
            2854.0,
            55.0,
            22.0
          ],
          "text": "$1 20"
        }
      },
      {
        "box": {
          "id": "obj-252",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            780.0,
            2894.0,
            69.0,
            22.0
          ],
          "text": "s WET_G"
        }
      },
      {
        "box": {
          "id": "obj-253",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            930.0,
            2894.0,
            69.0,
            22.0
          ],
          "text": "s DRY_G"
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
            424.0,
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
          "id": "obj-257",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            450.0,
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
          "id": "obj-258",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            476.0,
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
          "id": "obj-259",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            502.0,
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
          "id": "obj-260",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            528.0,
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
          "id": "obj-261",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            554.0,
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
          "id": "obj-262",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            580.0,
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
          "id": "obj-263",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            606.0,
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
          "id": "obj-264",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            632.0,
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
          "id": "obj-265",
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
          "id": "obj-266",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            684.0,
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
          "id": "obj-267",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            2520.0,
            710.0,
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
          "id": "obj-268",
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
            2954.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            400.0,
            285.0,
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
            2954.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            303.0,
            400.0,
            447.0,
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
            2954.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            758.0,
            400.0,
            495.0,
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
          "id": "obj-91",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            240.0,
            2954.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            652.0,
            426.0,
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
          "id": "obj-105",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            310.0,
            2954.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            444.0,
            652.0,
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
          "id": "obj-119",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            380.0,
            2954.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            732.0,
            652.0,
            285.0,
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
          "id": "obj-133",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            450.0,
            2954.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            904.0,
            534.0,
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
          "id": "obj-147",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            520.0,
            2954.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            552.0,
            904.0,
            624.0,
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
            2954.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            1156.0,
            504.0,
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
          "id": "obj-173",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            660.0,
            2954.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            522.0,
            1156.0,
            594.0,
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
          "id": "obj-185",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            730.0,
            2954.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            1408.0,
            380.0,
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
          "id": "obj-254",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            800.0,
            2954.0,
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
          "id": "obj-255",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            870.0,
            2954.0,
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
            3014.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"width\": 1444,\n  \"height\": 900,\n  \"bglocked\": 1,\n  \"objects\": {\n    \"hdr_note\": {\n      \"type\": \"comment\",\n      \"text\": \"SPECIAL FX SHOOTOUT \\u2014 granular, rhythmic and other Max for Live package effects that fit no other category. One source bus (s~ SRC_L / SRC_R / SRC_M), every effect runs in parallel, the tab picks which one reaches the master via two selector~ (30 ms crossfade). Each effect is set 100% wet where it has a mix control; the master DRY/WET slider does the global mix (loads at 0.25 wet).\",\n      \"pos\": [\n        20,\n        12\n      ],\n      \"size\": [\n        900,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_src\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE \\u2014 file player, live input (muted on load) and test signals all sum on the bus\",\n      \"pos\": [\n        30,\n        66\n      ],\n      \"size\": [\n        560,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"playlist\": {\n      \"type\": \"playlist~\",\n      \"pos\": [\n        30,\n        90\n      ],\n      \"size\": [\n        300,\n        120\n      ],\n      \"inlets\": 1,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"dictionary\"\n      ],\n      \"presentation\": [\n        20,\n        40,\n        300,\n        200\n      ]\n    },\n    \"ezadc\": {\n      \"type\": \"ezadc~\",\n      \"pos\": [\n        360,\n        210\n      ],\n      \"presentation\": [\n        340,\n        40,\n        45,\n        45\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"mute\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        460,\n        210\n      ],\n      \"presentation\": [\n        340,\n        92,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"mute_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        360,\n        300\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"mute_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        430,\n        300\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"c_mute\": {\n      \"type\": \"comment\",\n      \"text\": \"live-input mute: toggle \\u00d7 signal, starts closed\",\n      \"pos\": [\n        360,\n        260\n      ],\n      \"size\": [\n        300,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"btn_impulse\": {\n      \"type\": \"button\",\n      \"pos\": [\n        700,\n        90\n      ],\n      \"presentation\": [\n        340,\n        130,\n        24,\n        24\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"click\": {\n      \"type\": \"newobj\",\n      \"text\": \"click~\",\n      \"pos\": [\n        700,\n        130\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_test1\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ TEST\",\n      \"pos\": [\n        700,\n        170\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"btn_burst\": {\n      \"type\": \"button\",\n      \"pos\": [\n        860,\n        90\n      ],\n      \"presentation\": [\n        340,\n        170,\n        24,\n        24\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"burst_env\": {\n      \"type\": \"message\",\n      \"text\": \"0.5, 0. 120\",\n      \"pos\": [\n        860,\n        130\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"noise\": {\n      \"type\": \"newobj\",\n      \"text\": \"noise~\",\n      \"pos\": [\n        780,\n        130\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"burst_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        860,\n        170\n      ],\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"bang\"\n      ]\n    },\n    \"burst_mul\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        780,\n        210\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_test2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ TEST\",\n      \"pos\": [\n        780,\n        250\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_test\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ TEST\",\n      \"pos\": [\n        250,\n        300\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s_src_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_L\",\n      \"pos\": [\n        30,\n        385\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s_src_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_R\",\n      \"pos\": [\n        150,\n        385\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_mono\": {\n      \"type\": \"comment\",\n      \"text\": \"mono downmix for the mono-input effects (signals sum at the *~ inlet)\",\n      \"pos\": [\n        620,\n        300\n      ],\n      \"size\": [\n        420,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"r_mono_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        620,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_mono_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        700,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mono_half\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~ 0.5\",\n      \"pos\": [\n        620,\n        385\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_src_M\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ SRC_M\",\n      \"pos\": [\n        620,\n        425\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_tab\": {\n      \"type\": \"comment\",\n      \"text\": \"EFFECT SELECT \\u2014 live.tab, one column of 12, conventional order. The v8 maps item index \\u2192 slot number (1 = DRY: wet bus muted, master dry only) and lights the pane title\",\n      \"pos\": [\n        1120,\n        36\n      ],\n      \"size\": [\n        460,\n        47\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"lm_tab\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0\",\n      \"pos\": [\n        1600,\n        36\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"tab\": {\n      \"type\": \"live.tab\",\n      \"pos\": [\n        1140,\n        90\n      ],\n      \"size\": [\n        340,\n        150\n      ],\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"float\"\n      ],\n      \"presentation\": [\n        630,\n        40,\n        340,\n        260\n      ],\n      \"attrs\": {\n        \"num_lines_patching\": 12,\n        \"num_lines_presentation\": 12,\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"rounded\": 4.0,\n        \"bgcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1,\n        \"saved_attribute_attributes\": {\n          \"bgcolor\": {\n            \"expression\": \"\"\n          },\n          \"bgoncolor\": {\n            \"expression\": \"\"\n          },\n          \"textcolor\": {\n            \"expression\": \"\"\n          },\n          \"textoncolor\": {\n            \"expression\": \"\"\n          },\n          \"valueof\": {\n            \"parameter_enum\": [\n              \"1 DRY\",\n              \"2 amxd Fragulator\",\n              \"3 amxd Granular-to-go\",\n              \"4 amxd Stutterer\",\n              \"5 amxd SquirrelParade\",\n              \"6 amxd Raindrops\",\n              \"7 amxd Rye\",\n              \"8 amxd Wheat\",\n              \"9 amxd Xformer\",\n              \"10 amxd CutKiller\",\n              \"11 amxd EffectMatrix\",\n              \"12 amxd Average Injector\"\n            ],\n            \"parameter_initial\": [\n              0\n            ],\n            \"parameter_longname\": \"FX_SELECT\",\n            \"parameter_mmax\": 11,\n            \"parameter_modmode\": 0,\n            \"parameter_shortname\": \"FX\",\n            \"parameter_type\": 2,\n            \"parameter_unitstyle\": 9\n          }\n        },\n        \"varname\": \"FX_TAB\"\n      },\n      \"inlets\": 1,\n      \"box_extras\": {\n        \"num_lines_patching\": 12,\n        \"num_lines_presentation\": 12,\n        \"spacing_x\": 4.0,\n        \"spacing_y\": 4.0,\n        \"bgoncolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textoncolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ],\n        \"parameter_enable\": 1\n      }\n    },\n    \"r_tabsel\": {\n      \"type\": \"newobj\",\n      \"text\": \"r TABSEL\",\n      \"pos\": [\n        1500,\n        8\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_tabsel\": {\n      \"type\": \"comment\",\n      \"text\": \"r TABSEL: the transparent button over each pane title sends its tab index here\",\n      \"pos\": [\n        1590,\n        8\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"hl_v8\": {\n      \"type\": \"newobj\",\n      \"text\": \"v8 fx-shootout-highlight.js 12 @embed 1\",\n      \"pos\": [\n        1140,\n        330\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"attrs\": {\n        \"textfile\": {\n          \"filename\": \"fx-shootout-highlight.js\",\n          \"flags\": 0,\n          \"autowatch\": 1,\n          \"embed\": 1,\n          \"text\": \"// fx-shootout-highlight.js \\u2014 turns the [live.tab] index into the slot\\n// number, lights the selected pane's title, dims every other title.\\n// Shared by every *-shootout patch; the box arguments size it:\\n//\\n//     v8 fx-shootout-highlight.js <lastslot> [<rows> <cols>]\\n//\\n// inlet 0  : int \\u2014 the live.tab item index (row-major, 0-based).\\n// outlet 0 : int \\u2014 the slot number (1 = DRY, 2..lastslot = the panes) \\u2192 [s SEL].\\n//\\n// The numbers must read DOWN each column, then across (MAX_PATCHING.md >\\n// Number UI controls down each column). A tab fills row by row, so for a\\n// grid with more than one column the items are stored transposed and this\\n// script maps the index back:\\n//     row = index / COLS, col = index % COLS, slot = col * ROWS + row + 1\\n// With one column (the default) the stored order is the shown order and the\\n// mapping is index + 1. ROWS / COLS must match what Max draws.\\n// Each pane's title comment carries the scripting name TITLE_<slot>, two\\n// digits (TITLE_02 \\u2026 TITLE_nn); patcher.getnamed() reaches them and their\\n// colors are set by sending the attribute name as a message.\\n\\ninlets = 1;\\noutlets = 1;\\nautowatch = 1;\\n\\nsetinletassist(0, \\\"int: live.tab item index (row-major) \\u2014 lights TITLE_<slot>\\\");\\nsetoutletassist(0, \\\"int: slot number (1 = DRY, 2..lastslot = panes) \\u2192 s SEL\\\");\\n\\nvar FIRST_SLOT = 2;                        // slot 1 is DRY and has no pane\\nvar LAST_SLOT  = (jsarguments.length > 1) ? parseInt(jsarguments[1], 10) : 12;\\nvar ROWS       = (jsarguments.length > 2) ? parseInt(jsarguments[2], 10) : LAST_SLOT;\\nvar COLS       = (jsarguments.length > 3) ? parseInt(jsarguments[3], 10) : 1;\\n\\n// amber on dark is the panel palette; the selected title inverts it\\nvar ON_BG  = [1.0,  0.55, 0.0,  1.0];\\nvar ON_TX  = [0.05, 0.05, 0.05, 1.0];\\nvar OFF_BG = [0.13, 0.13, 0.15, 1.0];\\nvar OFF_TX = [1.0,  0.55, 0.0,  1.0];\\n\\nfunction pad2(n) { return (n < 10 ? \\\"0\\\" : \\\"\\\") + n; }\\n\\nfunction paint(obj, bg, tx) {\\n    obj.message(\\\"bgcolor\\\",   bg[0], bg[1], bg[2], bg[3]);\\n    obj.message(\\\"textcolor\\\", tx[0], tx[1], tx[2], tx[3]);\\n}\\n\\nfunction msg_int(index) {\\n    var row = Math.floor(index / COLS), col = index % COLS;\\n    var slot = col * ROWS + row + 1;\\n    for (var n = FIRST_SLOT; n <= LAST_SLOT; n++) {\\n        var obj = this.patcher.getnamed(\\\"TITLE_\\\" + pad2(n));\\n        if (!obj) {\\n            post(\\\"fx-shootout-highlight: no comment named TITLE_\\\" + pad2(n) + \\\"\\\\n\\\");\\n            continue;\\n        }\\n        if (n === slot) paint(obj, ON_BG, ON_TX);\\n        else            paint(obj, OFF_BG, OFF_TX);\\n    }\\n    outlet(0, slot);\\n}\\n\"\n        },\n        \"filename\": \"fx-shootout-highlight.js\"\n      }\n    },\n    \"c_hl\": {\n      \"type\": \"comment\",\n      \"text\": \"index \\u2192 slot number (one column, so index + 1) \\u2192 s SEL; also lights TITLE_nn\",\n      \"pos\": [\n        1450,\n        330\n      ],\n      \"size\": [\n        520,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"s_sel\": {\n      \"type\": \"newobj\",\n      \"text\": \"s SEL\",\n      \"pos\": [\n        1140,\n        370\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_wetonly\": {\n      \"type\": \"comment\",\n      \"text\": \"WET-ONLY \\u2014 re-sends every effect's mix / dry-wet setting: 500 ms after load, and from the presented wet-only button\",\n      \"pos\": [\n        1640,\n        66\n      ],\n      \"size\": [\n        560,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"wo_lb\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        1640,\n        100\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"wo_delay\": {\n      \"type\": \"newobj\",\n      \"text\": \"delay 500\",\n      \"pos\": [\n        1640,\n        140\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"wo_send\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WETONLY\",\n      \"pos\": [\n        1640,\n        180\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"wo_btn\": {\n      \"type\": \"message\",\n      \"text\": \"wet-only\",\n      \"pos\": [\n        1760,\n        140\n      ],\n      \"presentation\": [\n        980,\n        200,\n        90,\n        22\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"bgcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"textcolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ]\n      },\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"wo_send2\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WETONLY\",\n      \"pos\": [\n        1760,\n        180\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_transport\": {\n      \"type\": \"comment\",\n      \"text\": \"TRANSPORT \\u2014 the global transport; followed by: Xformer, CutKiller\",\n      \"pos\": [\n        2000,\n        230\n      ],\n      \"size\": [\n        500,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"tr_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 120.\",\n      \"pos\": [\n        2000,\n        260\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"tr_bpm\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        2000,\n        290\n      ],\n      \"attrs\": {\n        \"minimum\": 20.0,\n        \"maximum\": 300.0\n      },\n      \"presentation\": [\n        1110,\n        262,\n        54,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 20.0,\n        \"maximum\": 300.0\n      }\n    },\n    \"tr_tempo\": {\n      \"type\": \"message\",\n      \"text\": \"tempo $1\",\n      \"pos\": [\n        2000,\n        320\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"tr_run\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        2120,\n        290\n      ],\n      \"presentation\": [\n        980,\n        262,\n        22,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"tr_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"transport\",\n      \"pos\": [\n        2000,\n        360\n      ],\n      \"inlets\": 2,\n      \"outlets\": 9,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\"\n      ]\n    },\n    \"p_tr_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"TRANSPORT \\u2014 Xformer, CutKiller\",\n      \"pos\": [\n        2520,\n        60\n      ],\n      \"size\": [\n        263,\n        20\n      ],\n      \"presentation\": [\n        980,\n        240,\n        300,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_tr_run\": {\n      \"type\": \"comment\",\n      \"text\": \"start / stop\",\n      \"pos\": [\n        2520,\n        86\n      ],\n      \"size\": [\n        110,\n        20\n      ],\n      \"presentation\": [\n        1010,\n        264,\n        90,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_tr_bpm\": {\n      \"type\": \"comment\",\n      \"text\": \"bpm\",\n      \"pos\": [\n        2520,\n        112\n      ],\n      \"size\": [\n        40,\n        20\n      ],\n      \"presentation\": [\n        1170,\n        264,\n        50,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        30,\n        2954\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        400,\n        285,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f02_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 amxd Fragulator\",\n      \"pos\": [\n        2520,\n        138\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        18,\n        406,\n        209,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_02\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        589,\n        520\n      ],\n      \"presentation\": [\n        18,\n        406,\n        209,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f02_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"1\",\n      \"pos\": [\n        589,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        589,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"2 \\u00b7 amxd~ Fragulator.amxd \\u2014 chops the input into fragments and loops them\",\n      \"pos\": [\n        30,\n        520\n      ],\n      \"size\": [\n        549,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f02_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        30,\n        550\n      ],\n      \"presentation\": [\n        237,\n        406,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        100,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        180,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ Fragulator.amxd\",\n      \"pos\": [\n        30,\n        630\n      ],\n      \"size\": [\n        265,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        432,\n        265,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_02\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f02_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        330,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet_dry 100.\",\n      \"pos\": [\n        330,\n        590\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX02_L\",\n      \"pos\": [\n        30,\n        861\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f02_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX02_R\",\n      \"pos\": [\n        170,\n        861\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        100,\n        2954\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        303,\n        400,\n        447,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f03_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 amxd Granular-to-go\",\n      \"pos\": [\n        2520,\n        164\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        311,\n        406,\n        371,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_03\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1199,\n        520\n      ],\n      \"presentation\": [\n        311,\n        406,\n        371,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f03_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"2\",\n      \"pos\": [\n        1199,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1199,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"3 \\u00b7 amxd~ Granular-to-go.amxd \\u2014 live granular synthesis\",\n      \"pos\": [\n        729,\n        520\n      ],\n      \"size\": [\n        460,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f03_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        729,\n        550\n      ],\n      \"presentation\": [\n        692,\n        406,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        799,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        879,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ Granular-to-go.amxd\",\n      \"pos\": [\n        729,\n        630\n      ],\n      \"size\": [\n        427,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        311,\n        432,\n        427,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_03\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f03_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1029,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet_dry 100.\",\n      \"pos\": [\n        1029,\n        590\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX03_L\",\n      \"pos\": [\n        729,\n        861\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f03_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX03_R\",\n      \"pos\": [\n        869,\n        861\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        170,\n        2954\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        758,\n        400,\n        495,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f04_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 amxd Stutterer\",\n      \"pos\": [\n        2520,\n        190\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        766,\n        406,\n        419,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_04\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1844,\n        520\n      ],\n      \"presentation\": [\n        766,\n        406,\n        419,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f04_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"3\",\n      \"pos\": [\n        1844,\n        550\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1844,\n        580\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"4 \\u00b7 amxd~ Stutterer.amxd \\u2014 snapshot-and-loop stutter effect\",\n      \"pos\": [\n        1339,\n        520\n      ],\n      \"size\": [\n        495,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f04_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        1339,\n        550\n      ],\n      \"presentation\": [\n        1195,\n        406,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1409,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1489,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ Stutterer.amxd\",\n      \"pos\": [\n        1339,\n        630\n      ],\n      \"size\": [\n        475,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        766,\n        432,\n        475,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_04\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f04_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1639,\n        550\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet_dry 100.\",\n      \"pos\": [\n        1639,\n        590\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX04_L\",\n      \"pos\": [\n        1339,\n        861\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f04_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX04_R\",\n      \"pos\": [\n        1479,\n        861\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        240,\n        2954\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        652,\n        426,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f05_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 amxd SquirrelParade\",\n      \"pos\": [\n        2520,\n        216\n      ],\n      \"size\": [\n        203,\n        20\n      ],\n      \"presentation\": [\n        18,\n        658,\n        350,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_05\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        632,\n        961\n      ],\n      \"presentation\": [\n        18,\n        658,\n        350,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f05_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"4\",\n      \"pos\": [\n        632,\n        991\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        632,\n        1021\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"5 \\u00b7 amxd~ SquirrelParade.amxd \\u2014 four granular channels with a modulation matrix\",\n      \"pos\": [\n        30,\n        961\n      ],\n      \"size\": [\n        592,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f05_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        30,\n        991\n      ],\n      \"presentation\": [\n        378,\n        658,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        100,\n        991\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        180,\n        991\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ SquirrelParade.amxd\",\n      \"pos\": [\n        30,\n        1071\n      ],\n      \"size\": [\n        406,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        684,\n        406,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_05\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f05_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        330,\n        991\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet/dry 100.\",\n      \"pos\": [\n        330,\n        1031\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX05_L\",\n      \"pos\": [\n        30,\n        1302\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f05_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX05_R\",\n      \"pos\": [\n        170,\n        1302\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        310,\n        2954\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        444,\n        652,\n        280,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f06_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 amxd Raindrops\",\n      \"pos\": [\n        2520,\n        242\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        452,\n        658,\n        204,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_06\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1259,\n        961\n      ],\n      \"presentation\": [\n        452,\n        658,\n        204,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f06_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"5\",\n      \"pos\": [\n        1259,\n        991\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1259,\n        1021\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"6 \\u00b7 amxd~ Raindrops.amxd \\u2014 a field of moving bandpass particles\",\n      \"pos\": [\n        772,\n        961\n      ],\n      \"size\": [\n        477,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f06_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        772,\n        991\n      ],\n      \"presentation\": [\n        666,\n        658,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        842,\n        991\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        922,\n        991\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ Raindrops.amxd\",\n      \"pos\": [\n        772,\n        1071\n      ],\n      \"size\": [\n        250,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        452,\n        684,\n        250,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_06\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f06_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1072,\n        991\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet/dry 100.\",\n      \"pos\": [\n        1072,\n        1031\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX06_L\",\n      \"pos\": [\n        772,\n        1302\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f06_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX06_R\",\n      \"pos\": [\n        912,\n        1302\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        380,\n        2954\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        732,\n        652,\n        285,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f07_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 amxd Rye\",\n      \"pos\": [\n        2520,\n        268\n      ],\n      \"size\": [\n        110,\n        20\n      ],\n      \"presentation\": [\n        740,\n        658,\n        209,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_07\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1886,\n        961\n      ],\n      \"presentation\": [\n        740,\n        658,\n        209,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f07_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"6\",\n      \"pos\": [\n        1886,\n        991\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1886,\n        1021\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"7 \\u00b7 amxd~ Rye.amxd \\u2014 Pluggo granular with phase-reversal stereo\",\n      \"pos\": [\n        1399,\n        961\n      ],\n      \"size\": [\n        477,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f07_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        1399,\n        991\n      ],\n      \"presentation\": [\n        959,\n        658,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1469,\n        991\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1549,\n        991\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ Rye.amxd\",\n      \"pos\": [\n        1399,\n        1071\n      ],\n      \"size\": [\n        265,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        740,\n        684,\n        265,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_07\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f07_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1699,\n        991\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet/dry 100.\",\n      \"pos\": [\n        1699,\n        1031\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX07_L\",\n      \"pos\": [\n        1399,\n        1302\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f07_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX07_R\",\n      \"pos\": [\n        1539,\n        1302\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        450,\n        2954\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        904,\n        534,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f08_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 amxd Wheat\",\n      \"pos\": [\n        2520,\n        294\n      ],\n      \"size\": [\n        127,\n        20\n      ],\n      \"presentation\": [\n        18,\n        910,\n        458,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_08\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        574,\n        1402\n      ],\n      \"presentation\": [\n        18,\n        910,\n        458,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f08_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"7\",\n      \"pos\": [\n        574,\n        1432\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        574,\n        1462\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"8 \\u00b7 amxd~ Wheat.amxd \\u2014 Pluggo granular with a per-grain pitch envelope\",\n      \"pos\": [\n        30,\n        1402\n      ],\n      \"size\": [\n        534,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f08_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        30,\n        1432\n      ],\n      \"presentation\": [\n        486,\n        910,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        100,\n        1432\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        180,\n        1432\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ Wheat.amxd\",\n      \"pos\": [\n        30,\n        1512\n      ],\n      \"size\": [\n        514,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        936,\n        514,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_08\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f08_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        330,\n        1432\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet_dry 100.\",\n      \"pos\": [\n        330,\n        1472\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX08_L\",\n      \"pos\": [\n        30,\n        1743\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f08_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX08_R\",\n      \"pos\": [\n        170,\n        1743\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        520,\n        2954\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        552,\n        904,\n        624,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f09_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 amxd Xformer\",\n      \"pos\": [\n        2520,\n        320\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        560,\n        910,\n        548,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_09\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1348,\n        1402\n      ],\n      \"presentation\": [\n        560,\n        910,\n        548,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f09_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"8\",\n      \"pos\": [\n        1348,\n        1432\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1348,\n        1462\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"9 \\u00b7 amxd~ Xformer.amxd \\u2014 rhythmic mute / accent groove (transport-driven)\",\n      \"pos\": [\n        714,\n        1402\n      ],\n      \"size\": [\n        624,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f09_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        714,\n        1432\n      ],\n      \"presentation\": [\n        1118,\n        910,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        784,\n        1432\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        864,\n        1432\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ Xformer.amxd\",\n      \"pos\": [\n        714,\n        1512\n      ],\n      \"size\": [\n        604,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        560,\n        936,\n        604,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_09\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f09_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX09_L\",\n      \"pos\": [\n        714,\n        1743\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f09_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX09_R\",\n      \"pos\": [\n        854,\n        1743\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        590,\n        2954\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        1156,\n        504,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f10_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 amxd CutKiller\",\n      \"pos\": [\n        2520,\n        346\n      ],\n      \"size\": [\n        169,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1162,\n        428,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_10\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        2040,\n        1402\n      ],\n      \"presentation\": [\n        18,\n        1162,\n        428,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f10_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"9\",\n      \"pos\": [\n        2040,\n        1432\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        2040,\n        1462\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"10 \\u00b7 amxd~ Max CutKiller.amxd \\u2014 rhythmic cutting synced to the transport\",\n      \"pos\": [\n        1488,\n        1402\n      ],\n      \"size\": [\n        542,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f10_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        1488,\n        1432\n      ],\n      \"presentation\": [\n        456,\n        1162,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        1558,\n        1432\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        1638,\n        1432\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Max CutKiller.amxd\\\"\",\n      \"pos\": [\n        1488,\n        1512\n      ],\n      \"size\": [\n        484,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        1188,\n        484,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_10\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f10_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1788,\n        1432\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_wet\": {\n      \"type\": \"message\",\n      \"text\": \"Dry/wet 100.\",\n      \"pos\": [\n        1788,\n        1472\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX10_L\",\n      \"pos\": [\n        1488,\n        1743\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f10_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX10_R\",\n      \"pos\": [\n        1628,\n        1743\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        660,\n        2954\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        522,\n        1156,\n        594,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f11_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 amxd EffectMatrix\",\n      \"pos\": [\n        2520,\n        372\n      ],\n      \"size\": [\n        195,\n        20\n      ],\n      \"presentation\": [\n        530,\n        1162,\n        518,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_11\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        634,\n        1843\n      ],\n      \"presentation\": [\n        530,\n        1162,\n        518,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f11_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"10\",\n      \"pos\": [\n        634,\n        1873\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        634,\n        1903\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"11 \\u00b7 amxd~ Max EffectMatrix.amxd \\u2014 several effects routed through a matrix~\",\n      \"pos\": [\n        30,\n        1843\n      ],\n      \"size\": [\n        594,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f11_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        30,\n        1873\n      ],\n      \"presentation\": [\n        1058,\n        1162,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        100,\n        1873\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        180,\n        1873\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Max EffectMatrix.amxd\\\"\",\n      \"pos\": [\n        30,\n        1953\n      ],\n      \"size\": [\n        574,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        530,\n        1188,\n        574,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_11\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f11_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX11_L\",\n      \"pos\": [\n        30,\n        2184\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f11_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX11_R\",\n      \"pos\": [\n        170,\n        2184\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        730,\n        2954\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        1408,\n        380,\n        242\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"f12_ptitle\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 amxd Average Injector\",\n      \"pos\": [\n        2520,\n        398\n      ],\n      \"size\": [\n        229,\n        20\n      ],\n      \"presentation\": [\n        18,\n        1414,\n        304,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1,\n        \"varname\": \"TITLE_12\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_tbtn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        1420,\n        1843\n      ],\n      \"presentation\": [\n        18,\n        1414,\n        304,\n        20\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"outlinecolor\": [\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ],\n        \"blinkcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          0.35\n        ]\n      }\n    },\n    \"f12_tsel\": {\n      \"type\": \"message\",\n      \"text\": \"11\",\n      \"pos\": [\n        1420,\n        1873\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_tsend\": {\n      \"type\": \"newobj\",\n      \"text\": \"s TABSEL\",\n      \"pos\": [\n        1420,\n        1903\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"12 \\u00b7 amxd~ Average Injector.amxd \\u2014 delay and amplitude modulated by the average level\",\n      \"pos\": [\n        774,\n        1843\n      ],\n      \"size\": [\n        636,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"f12_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        774,\n        1873\n      ],\n      \"presentation\": [\n        332,\n        1414,\n        50,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        844,\n        1873\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        924,\n        1873\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_obj\": {\n      \"type\": \"newobj\",\n      \"text\": \"amxd~ \\\"Average Injector.amxd\\\"\",\n      \"pos\": [\n        774,\n        1953\n      ],\n      \"size\": [\n        360,\n        196\n      ],\n      \"inlets\": 3,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"\"\n      ],\n      \"presentation\": [\n        18,\n        1440,\n        360,\n        196\n      ],\n      \"attrs\": {\n        \"viewvisibility\": 1,\n        \"bgmode\": 1,\n        \"border\": 0,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ],\n        \"varname\": \"DEV_12\"\n      },\n      \"box_extras\": {\n        \"bgmode\": 1,\n        \"clickthrough\": 0,\n        \"enablehscroll\": 0,\n        \"enablevscroll\": 0,\n        \"lockeddragscroll\": 0,\n        \"lockedsize\": 0,\n        \"offset\": [\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"f12_rwo\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WETONLY\",\n      \"pos\": [\n        1074,\n        1873\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_wet\": {\n      \"type\": \"message\",\n      \"text\": \"wet_dry 100.\",\n      \"pos\": [\n        1074,\n        1913\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_sL\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX12_L\",\n      \"pos\": [\n        774,\n        2184\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"f12_sR\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ FX12_R\",\n      \"pos\": [\n        914,\n        2184\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_mix\": {\n      \"type\": \"comment\",\n      \"text\": \"MIXER \\u2014 selector~ inlet n = tab item n. Inlet 1 (DRY) is left unconnected so DRY is silence on the wet bus (the master dry path is always live); inlets 2\\u201312 are the effects\",\n      \"pos\": [\n        30,\n        2284\n      ],\n      \"size\": [\n        1200,\n        34\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"r_sel_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        2344\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sel_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"selector~ 12 1 @ramptime 30\",\n      \"pos\": [\n        30,\n        2394\n      ],\n      \"inlets\": 13,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_wet_L\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ WET_L\",\n      \"pos\": [\n        30,\n        2444\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX02_L\",\n      \"pos\": [\n        120,\n        2344\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX03_L\",\n      \"pos\": [\n        210,\n        2344\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX04_L\",\n      \"pos\": [\n        300,\n        2344\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX05_L\",\n      \"pos\": [\n        390,\n        2344\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX06_L\",\n      \"pos\": [\n        480,\n        2344\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX07_L\",\n      \"pos\": [\n        570,\n        2344\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX08_L\",\n      \"pos\": [\n        660,\n        2344\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX09_L\",\n      \"pos\": [\n        750,\n        2344\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX10_L\",\n      \"pos\": [\n        840,\n        2344\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX11_L\",\n      \"pos\": [\n        930,\n        2344\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_L_12\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX12_L\",\n      \"pos\": [\n        1020,\n        2344\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_sel_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SEL\",\n      \"pos\": [\n        30,\n        2474\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"sel_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"selector~ 12 1 @ramptime 30\",\n      \"pos\": [\n        30,\n        2524\n      ],\n      \"inlets\": 13,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"s_wet_R\": {\n      \"type\": \"newobj\",\n      \"text\": \"s~ WET_R\",\n      \"pos\": [\n        30,\n        2574\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX02_R\",\n      \"pos\": [\n        120,\n        2474\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX03_R\",\n      \"pos\": [\n        210,\n        2474\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX04_R\",\n      \"pos\": [\n        300,\n        2474\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_5\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX05_R\",\n      \"pos\": [\n        390,\n        2474\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_6\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX06_R\",\n      \"pos\": [\n        480,\n        2474\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_7\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX07_R\",\n      \"pos\": [\n        570,\n        2474\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_8\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX08_R\",\n      \"pos\": [\n        660,\n        2474\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_9\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX09_R\",\n      \"pos\": [\n        750,\n        2474\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_10\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX10_R\",\n      \"pos\": [\n        840,\n        2474\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_11\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX11_R\",\n      \"pos\": [\n        930,\n        2474\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mx_R_12\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ FX12_R\",\n      \"pos\": [\n        1020,\n        2474\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"c_master\": {\n      \"type\": \"comment\",\n      \"text\": \"MASTER \\u2014 global dry/wet crossfade (equal power); wet and dry paths sum at the live.gain~ inlets \\u2192 ezdac~\",\n      \"pos\": [\n        30,\n        2624\n      ],\n      \"size\": [\n        700,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"mw_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ WET_L\",\n      \"pos\": [\n        30,\n        2654\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mw_gain\": {\n      \"type\": \"newobj\",\n      \"text\": \"r WET_G\",\n      \"pos\": [\n        110,\n        2654\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mw_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ WET_R\",\n      \"pos\": [\n        200,\n        2654\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"md_rL\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_L\",\n      \"pos\": [\n        330,\n        2654\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"md_gain\": {\n      \"type\": \"newobj\",\n      \"text\": \"r DRY_G\",\n      \"pos\": [\n        410,\n        2654\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"md_rR\": {\n      \"type\": \"newobj\",\n      \"text\": \"r~ SRC_R\",\n      \"pos\": [\n        500,\n        2654\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"mw_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        110,\n        2694\n      ],\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"bang\"\n      ]\n    },\n    \"md_line\": {\n      \"type\": \"newobj\",\n      \"text\": \"line~\",\n      \"pos\": [\n        410,\n        2694\n      ],\n      \"inlets\": 3,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"bang\"\n      ]\n    },\n    \"wetL\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        30,\n        2744\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"wetR\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        200,\n        2744\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"dryL\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        330,\n        2744\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"dryR\": {\n      \"type\": \"newobj\",\n      \"text\": \"*~\",\n      \"pos\": [\n        500,\n        2744\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"gain\": {\n      \"type\": \"live.gain~\",\n      \"pos\": [\n        30,\n        2804\n      ],\n      \"size\": [\n        50,\n        47\n      ],\n      \"attrs\": {\n        \"orientation\": 1\n      },\n      \"presentation\": [\n        980,\n        130,\n        250,\n        47\n      ],\n      \"inlets\": 2,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"float\",\n        \"list\"\n      ],\n      \"box_extras\": {\n        \"orientation\": 1\n      }\n    },\n    \"dac\": {\n      \"type\": \"ezdac~\",\n      \"pos\": [\n        30,\n        2884\n      ],\n      \"presentation\": [\n        1235,\n        130,\n        45,\n        45\n      ],\n      \"inlets\": 2,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_dw\": {\n      \"type\": \"comment\",\n      \"text\": \"DRY/WET 0..1 \\u2014 wet = sqrt(x), dry = sqrt(1-x); loads at 0.25\",\n      \"pos\": [\n        780,\n        2624\n      ],\n      \"size\": [\n        400,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"dw_lm\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 0.25\",\n      \"pos\": [\n        780,\n        2654\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_slider\": {\n      \"type\": \"slider\",\n      \"pos\": [\n        780,\n        2694\n      ],\n      \"size\": [\n        200,\n        22\n      ],\n      \"attrs\": {\n        \"floatoutput\": 1,\n        \"size\": 1.0,\n        \"knobcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"elementcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.08,\n          0.08,\n          0.09,\n          1.0\n        ]\n      },\n      \"presentation\": [\n        980,\n        62,\n        240,\n        36\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"floatoutput\": 1,\n        \"size\": 1.0,\n        \"knobcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"elementcolor\": [\n          0.3,\n          0.3,\n          0.32,\n          1.0\n        ]\n      }\n    },\n    \"dw\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        780,\n        2734\n      ],\n      \"attrs\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      },\n      \"presentation\": [\n        1226,\n        69,\n        54,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"minimum\": 0.0,\n        \"maximum\": 1.0\n      }\n    },\n    \"dw_t\": {\n      \"type\": \"newobj\",\n      \"text\": \"t f f\",\n      \"pos\": [\n        780,\n        2774\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"dw_wet\": {\n      \"type\": \"newobj\",\n      \"text\": \"expr sqrt($f1)\",\n      \"pos\": [\n        780,\n        2814\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_dry\": {\n      \"type\": \"newobj\",\n      \"text\": \"expr sqrt(1.-$f1)\",\n      \"pos\": [\n        930,\n        2814\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_wet_ramp\": {\n      \"type\": \"message\",\n      \"text\": \"$1 20\",\n      \"pos\": [\n        780,\n        2854\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_dry_ramp\": {\n      \"type\": \"message\",\n      \"text\": \"$1 20\",\n      \"pos\": [\n        930,\n        2854\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dw_s_wet\": {\n      \"type\": \"newobj\",\n      \"text\": \"s WET_G\",\n      \"pos\": [\n        780,\n        2894\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"dw_s_dry\": {\n      \"type\": \"newobj\",\n      \"text\": \"s DRY_G\",\n      \"pos\": [\n        930,\n        2894\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_src_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        800,\n        2954\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        10,\n        600,\n        380\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_shoot_panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        870,\n        2954\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        620,\n        10,\n        670,\n        380\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"p_src_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SOURCE\",\n      \"pos\": [\n        2520,\n        424\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        20,\n        16,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_playlist_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"drop audio files on the player, click a clip to play\",\n      \"pos\": [\n        2520,\n        450\n      ],\n      \"size\": [\n        450,\n        20\n      ],\n      \"presentation\": [\n        20,\n        244,\n        306,\n        37\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"presentation_linecount\": 2\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_ezadc_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"live in (DSP on/off)\",\n      \"pos\": [\n        2520,\n        476\n      ],\n      \"size\": [\n        178,\n        20\n      ],\n      \"presentation\": [\n        392,\n        52,\n        200,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_mute_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"live in OPEN \\u2014 loads muted\",\n      \"pos\": [\n        2520,\n        502\n      ],\n      \"size\": [\n        229,\n        20\n      ],\n      \"presentation\": [\n        372,\n        94,\n        220,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_impulse_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"impulse (click~)\",\n      \"pos\": [\n        2520,\n        528\n      ],\n      \"size\": [\n        144,\n        20\n      ],\n      \"presentation\": [\n        372,\n        133,\n        150,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_burst_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"noise burst 120 ms\",\n      \"pos\": [\n        2520,\n        554\n      ],\n      \"size\": [\n        161,\n        20\n      ],\n      \"presentation\": [\n        372,\n        173,\n        150,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_shoot_title\": {\n      \"type\": \"comment\",\n      \"text\": \"SHOOTOUT \\u2014 click an effect; all run in parallel, crossfade in 30 ms\",\n      \"pos\": [\n        2520,\n        580\n      ],\n      \"size\": [\n        577,\n        20\n      ],\n      \"presentation\": [\n        630,\n        16,\n        640,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_dw_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"DRY / WET  \\u25c4 dry \\u00b7 wet \\u25ba  (loads 0.25)\",\n      \"pos\": [\n        2520,\n        606\n      ],\n      \"size\": [\n        331,\n        20\n      ],\n      \"presentation\": [\n        980,\n        40,\n        300,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"fontface\": 1\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_dw_val\": {\n      \"type\": \"comment\",\n      \"text\": \"wet\",\n      \"pos\": [\n        2520,\n        632\n      ],\n      \"size\": [\n        40,\n        20\n      ],\n      \"presentation\": [\n        1226,\n        93,\n        54,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_gain_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"master\",\n      \"pos\": [\n        2520,\n        658\n      ],\n      \"size\": [\n        59,\n        20\n      ],\n      \"presentation\": [\n        980,\n        110,\n        80,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_dac_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"audio\",\n      \"pos\": [\n        2520,\n        684\n      ],\n      \"size\": [\n        50,\n        20\n      ],\n      \"presentation\": [\n        1235,\n        178,\n        50,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_wo_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"re-apply wet-only everywhere\",\n      \"pos\": [\n        2520,\n        710\n      ],\n      \"size\": [\n        246,\n        20\n      ],\n      \"presentation\": [\n        1075,\n        203,\n        205,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"c_plbl\": {\n      \"type\": \"comment\",\n      \"text\": \"presentation-only labels (they show in the panels)\",\n      \"pos\": [\n        2520,\n        30\n      ],\n      \"size\": [\n        330,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    }\n  },\n  \"connections\": [\n    [\n      \"ezadc\",\n      0,\n      \"mute_L\",\n      0\n    ],\n    [\n      \"ezadc\",\n      1,\n      \"mute_R\",\n      0\n    ],\n    [\n      \"mute\",\n      0,\n      \"mute_L\",\n      1\n    ],\n    [\n      \"mute\",\n      0,\n      \"mute_R\",\n      1\n    ],\n    [\n      \"btn_impulse\",\n      0,\n      \"click\",\n      0\n    ],\n    [\n      \"click\",\n      0,\n      \"s_test1\",\n      0\n    ],\n    [\n      \"btn_burst\",\n      0,\n      \"burst_env\",\n      0\n    ],\n    [\n      \"burst_env\",\n      0,\n      \"burst_line\",\n      0\n    ],\n    [\n      \"noise\",\n      0,\n      \"burst_mul\",\n      0\n    ],\n    [\n      \"burst_line\",\n      0,\n      \"burst_mul\",\n      1\n    ],\n    [\n      \"burst_mul\",\n      0,\n      \"s_test2\",\n      0\n    ],\n    [\n      \"playlist\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"playlist\",\n      1,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"mute_L\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"mute_R\",\n      0,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"r_test\",\n      0,\n      \"s_src_L\",\n      0\n    ],\n    [\n      \"r_test\",\n      0,\n      \"s_src_R\",\n      0\n    ],\n    [\n      \"r_mono_L\",\n      0,\n      \"mono_half\",\n      0\n    ],\n    [\n      \"r_mono_R\",\n      0,\n      \"mono_half\",\n      0\n    ],\n    [\n      \"mono_half\",\n      0,\n      \"s_src_M\",\n      0\n    ],\n    [\n      \"lm_tab\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"r_tabsel\",\n      0,\n      \"tab\",\n      0\n    ],\n    [\n      \"tab\",\n      0,\n      \"hl_v8\",\n      0\n    ],\n    [\n      \"hl_v8\",\n      0,\n      \"s_sel\",\n      0\n    ],\n    [\n      \"wo_lb\",\n      0,\n      \"wo_delay\",\n      0\n    ],\n    [\n      \"wo_delay\",\n      0,\n      \"wo_send\",\n      0\n    ],\n    [\n      \"wo_btn\",\n      0,\n      \"wo_send2\",\n      0\n    ],\n    [\n      \"tr_lm\",\n      0,\n      \"tr_bpm\",\n      0\n    ],\n    [\n      \"tr_bpm\",\n      0,\n      \"tr_tempo\",\n      0\n    ],\n    [\n      \"tr_tempo\",\n      0,\n      \"tr_obj\",\n      0\n    ],\n    [\n      \"tr_run\",\n      0,\n      \"tr_obj\",\n      0\n    ],\n    [\n      \"f02_tbtn\",\n      0,\n      \"f02_tsel\",\n      0\n    ],\n    [\n      \"f02_tsel\",\n      0,\n      \"f02_tsend\",\n      0\n    ],\n    [\n      \"f02_open\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_rL\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_rR\",\n      0,\n      \"f02_obj\",\n      1\n    ],\n    [\n      \"f02_rwo\",\n      0,\n      \"f02_wet\",\n      0\n    ],\n    [\n      \"f02_wet\",\n      0,\n      \"f02_obj\",\n      0\n    ],\n    [\n      \"f02_obj\",\n      0,\n      \"f02_sL\",\n      0\n    ],\n    [\n      \"f02_obj\",\n      1,\n      \"f02_sR\",\n      0\n    ],\n    [\n      \"f03_tbtn\",\n      0,\n      \"f03_tsel\",\n      0\n    ],\n    [\n      \"f03_tsel\",\n      0,\n      \"f03_tsend\",\n      0\n    ],\n    [\n      \"f03_open\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_rL\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_rR\",\n      0,\n      \"f03_obj\",\n      1\n    ],\n    [\n      \"f03_rwo\",\n      0,\n      \"f03_wet\",\n      0\n    ],\n    [\n      \"f03_wet\",\n      0,\n      \"f03_obj\",\n      0\n    ],\n    [\n      \"f03_obj\",\n      0,\n      \"f03_sL\",\n      0\n    ],\n    [\n      \"f03_obj\",\n      1,\n      \"f03_sR\",\n      0\n    ],\n    [\n      \"f04_tbtn\",\n      0,\n      \"f04_tsel\",\n      0\n    ],\n    [\n      \"f04_tsel\",\n      0,\n      \"f04_tsend\",\n      0\n    ],\n    [\n      \"f04_open\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_rL\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_rR\",\n      0,\n      \"f04_obj\",\n      1\n    ],\n    [\n      \"f04_rwo\",\n      0,\n      \"f04_wet\",\n      0\n    ],\n    [\n      \"f04_wet\",\n      0,\n      \"f04_obj\",\n      0\n    ],\n    [\n      \"f04_obj\",\n      0,\n      \"f04_sL\",\n      0\n    ],\n    [\n      \"f04_obj\",\n      1,\n      \"f04_sR\",\n      0\n    ],\n    [\n      \"f05_tbtn\",\n      0,\n      \"f05_tsel\",\n      0\n    ],\n    [\n      \"f05_tsel\",\n      0,\n      \"f05_tsend\",\n      0\n    ],\n    [\n      \"f05_open\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_rL\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_rR\",\n      0,\n      \"f05_obj\",\n      1\n    ],\n    [\n      \"f05_rwo\",\n      0,\n      \"f05_wet\",\n      0\n    ],\n    [\n      \"f05_wet\",\n      0,\n      \"f05_obj\",\n      0\n    ],\n    [\n      \"f05_obj\",\n      0,\n      \"f05_sL\",\n      0\n    ],\n    [\n      \"f05_obj\",\n      1,\n      \"f05_sR\",\n      0\n    ],\n    [\n      \"f06_tbtn\",\n      0,\n      \"f06_tsel\",\n      0\n    ],\n    [\n      \"f06_tsel\",\n      0,\n      \"f06_tsend\",\n      0\n    ],\n    [\n      \"f06_open\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_rL\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_rR\",\n      0,\n      \"f06_obj\",\n      1\n    ],\n    [\n      \"f06_rwo\",\n      0,\n      \"f06_wet\",\n      0\n    ],\n    [\n      \"f06_wet\",\n      0,\n      \"f06_obj\",\n      0\n    ],\n    [\n      \"f06_obj\",\n      0,\n      \"f06_sL\",\n      0\n    ],\n    [\n      \"f06_obj\",\n      1,\n      \"f06_sR\",\n      0\n    ],\n    [\n      \"f07_tbtn\",\n      0,\n      \"f07_tsel\",\n      0\n    ],\n    [\n      \"f07_tsel\",\n      0,\n      \"f07_tsend\",\n      0\n    ],\n    [\n      \"f07_open\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_rL\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_rR\",\n      0,\n      \"f07_obj\",\n      1\n    ],\n    [\n      \"f07_rwo\",\n      0,\n      \"f07_wet\",\n      0\n    ],\n    [\n      \"f07_wet\",\n      0,\n      \"f07_obj\",\n      0\n    ],\n    [\n      \"f07_obj\",\n      0,\n      \"f07_sL\",\n      0\n    ],\n    [\n      \"f07_obj\",\n      1,\n      \"f07_sR\",\n      0\n    ],\n    [\n      \"f08_tbtn\",\n      0,\n      \"f08_tsel\",\n      0\n    ],\n    [\n      \"f08_tsel\",\n      0,\n      \"f08_tsend\",\n      0\n    ],\n    [\n      \"f08_open\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_rL\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_rR\",\n      0,\n      \"f08_obj\",\n      1\n    ],\n    [\n      \"f08_rwo\",\n      0,\n      \"f08_wet\",\n      0\n    ],\n    [\n      \"f08_wet\",\n      0,\n      \"f08_obj\",\n      0\n    ],\n    [\n      \"f08_obj\",\n      0,\n      \"f08_sL\",\n      0\n    ],\n    [\n      \"f08_obj\",\n      1,\n      \"f08_sR\",\n      0\n    ],\n    [\n      \"f09_tbtn\",\n      0,\n      \"f09_tsel\",\n      0\n    ],\n    [\n      \"f09_tsel\",\n      0,\n      \"f09_tsend\",\n      0\n    ],\n    [\n      \"f09_open\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_rL\",\n      0,\n      \"f09_obj\",\n      0\n    ],\n    [\n      \"f09_rR\",\n      0,\n      \"f09_obj\",\n      1\n    ],\n    [\n      \"f09_obj\",\n      0,\n      \"f09_sL\",\n      0\n    ],\n    [\n      \"f09_obj\",\n      1,\n      \"f09_sR\",\n      0\n    ],\n    [\n      \"f10_tbtn\",\n      0,\n      \"f10_tsel\",\n      0\n    ],\n    [\n      \"f10_tsel\",\n      0,\n      \"f10_tsend\",\n      0\n    ],\n    [\n      \"f10_open\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_rL\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_rR\",\n      0,\n      \"f10_obj\",\n      1\n    ],\n    [\n      \"f10_rwo\",\n      0,\n      \"f10_wet\",\n      0\n    ],\n    [\n      \"f10_wet\",\n      0,\n      \"f10_obj\",\n      0\n    ],\n    [\n      \"f10_obj\",\n      0,\n      \"f10_sL\",\n      0\n    ],\n    [\n      \"f10_obj\",\n      1,\n      \"f10_sR\",\n      0\n    ],\n    [\n      \"f11_tbtn\",\n      0,\n      \"f11_tsel\",\n      0\n    ],\n    [\n      \"f11_tsel\",\n      0,\n      \"f11_tsend\",\n      0\n    ],\n    [\n      \"f11_open\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_rL\",\n      0,\n      \"f11_obj\",\n      0\n    ],\n    [\n      \"f11_rR\",\n      0,\n      \"f11_obj\",\n      1\n    ],\n    [\n      \"f11_obj\",\n      0,\n      \"f11_sL\",\n      0\n    ],\n    [\n      \"f11_obj\",\n      1,\n      \"f11_sR\",\n      0\n    ],\n    [\n      \"f12_tbtn\",\n      0,\n      \"f12_tsel\",\n      0\n    ],\n    [\n      \"f12_tsel\",\n      0,\n      \"f12_tsend\",\n      0\n    ],\n    [\n      \"f12_open\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_rL\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_rR\",\n      0,\n      \"f12_obj\",\n      1\n    ],\n    [\n      \"f12_rwo\",\n      0,\n      \"f12_wet\",\n      0\n    ],\n    [\n      \"f12_wet\",\n      0,\n      \"f12_obj\",\n      0\n    ],\n    [\n      \"f12_obj\",\n      0,\n      \"f12_sL\",\n      0\n    ],\n    [\n      \"f12_obj\",\n      1,\n      \"f12_sR\",\n      0\n    ],\n    [\n      \"r_sel_L\",\n      0,\n      \"sel_L\",\n      0\n    ],\n    [\n      \"sel_L\",\n      0,\n      \"s_wet_L\",\n      0\n    ],\n    [\n      \"mx_L_2\",\n      0,\n      \"sel_L\",\n      2\n    ],\n    [\n      \"mx_L_3\",\n      0,\n      \"sel_L\",\n      3\n    ],\n    [\n      \"mx_L_4\",\n      0,\n      \"sel_L\",\n      4\n    ],\n    [\n      \"mx_L_5\",\n      0,\n      \"sel_L\",\n      5\n    ],\n    [\n      \"mx_L_6\",\n      0,\n      \"sel_L\",\n      6\n    ],\n    [\n      \"mx_L_7\",\n      0,\n      \"sel_L\",\n      7\n    ],\n    [\n      \"mx_L_8\",\n      0,\n      \"sel_L\",\n      8\n    ],\n    [\n      \"mx_L_9\",\n      0,\n      \"sel_L\",\n      9\n    ],\n    [\n      \"mx_L_10\",\n      0,\n      \"sel_L\",\n      10\n    ],\n    [\n      \"mx_L_11\",\n      0,\n      \"sel_L\",\n      11\n    ],\n    [\n      \"mx_L_12\",\n      0,\n      \"sel_L\",\n      12\n    ],\n    [\n      \"r_sel_R\",\n      0,\n      \"sel_R\",\n      0\n    ],\n    [\n      \"sel_R\",\n      0,\n      \"s_wet_R\",\n      0\n    ],\n    [\n      \"mx_R_2\",\n      0,\n      \"sel_R\",\n      2\n    ],\n    [\n      \"mx_R_3\",\n      0,\n      \"sel_R\",\n      3\n    ],\n    [\n      \"mx_R_4\",\n      0,\n      \"sel_R\",\n      4\n    ],\n    [\n      \"mx_R_5\",\n      0,\n      \"sel_R\",\n      5\n    ],\n    [\n      \"mx_R_6\",\n      0,\n      \"sel_R\",\n      6\n    ],\n    [\n      \"mx_R_7\",\n      0,\n      \"sel_R\",\n      7\n    ],\n    [\n      \"mx_R_8\",\n      0,\n      \"sel_R\",\n      8\n    ],\n    [\n      \"mx_R_9\",\n      0,\n      \"sel_R\",\n      9\n    ],\n    [\n      \"mx_R_10\",\n      0,\n      \"sel_R\",\n      10\n    ],\n    [\n      \"mx_R_11\",\n      0,\n      \"sel_R\",\n      11\n    ],\n    [\n      \"mx_R_12\",\n      0,\n      \"sel_R\",\n      12\n    ],\n    [\n      \"mw_rL\",\n      0,\n      \"wetL\",\n      0\n    ],\n    [\n      \"mw_gain\",\n      0,\n      \"mw_line\",\n      0\n    ],\n    [\n      \"mw_rR\",\n      0,\n      \"wetR\",\n      0\n    ],\n    [\n      \"md_rL\",\n      0,\n      \"dryL\",\n      0\n    ],\n    [\n      \"md_gain\",\n      0,\n      \"md_line\",\n      0\n    ],\n    [\n      \"md_rR\",\n      0,\n      \"dryR\",\n      0\n    ],\n    [\n      \"mw_line\",\n      0,\n      \"wetL\",\n      1\n    ],\n    [\n      \"mw_line\",\n      0,\n      \"wetR\",\n      1\n    ],\n    [\n      \"md_line\",\n      0,\n      \"dryL\",\n      1\n    ],\n    [\n      \"md_line\",\n      0,\n      \"dryR\",\n      1\n    ],\n    [\n      \"wetL\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"dryL\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"wetR\",\n      0,\n      \"gain\",\n      1\n    ],\n    [\n      \"dryR\",\n      0,\n      \"gain\",\n      1\n    ],\n    [\n      \"gain\",\n      0,\n      \"dac\",\n      0\n    ],\n    [\n      \"gain\",\n      1,\n      \"dac\",\n      1\n    ],\n    [\n      \"dw_lm\",\n      0,\n      \"dw_slider\",\n      0\n    ],\n    [\n      \"dw_slider\",\n      0,\n      \"dw\",\n      0\n    ],\n    [\n      \"dw\",\n      0,\n      \"dw_t\",\n      0\n    ],\n    [\n      \"dw_t\",\n      0,\n      \"dw_wet\",\n      0\n    ],\n    [\n      \"dw_t\",\n      1,\n      \"dw_dry\",\n      0\n    ],\n    [\n      \"dw_wet\",\n      0,\n      \"dw_wet_ramp\",\n      0\n    ],\n    [\n      \"dw_dry\",\n      0,\n      \"dw_dry_ramp\",\n      0\n    ],\n    [\n      \"dw_wet_ramp\",\n      0,\n      \"dw_s_wet\",\n      0\n    ],\n    [\n      \"dw_dry_ramp\",\n      0,\n      \"dw_s_dry\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
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
            "obj-86",
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
            "obj-89",
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
            "obj-86",
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
            "obj-100",
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
            1
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
            "obj-100",
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
            "obj-103",
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
            "obj-104",
            0
          ],
          "source": [
            "obj-100",
            1
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
            "obj-108",
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
            "obj-112",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-114",
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
            "obj-114",
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
            "obj-118",
            0
          ],
          "source": [
            "obj-114",
            1
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
            "obj-128",
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
            "obj-128",
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
            1
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
            "obj-128",
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
            "obj-132",
            0
          ],
          "source": [
            "obj-128",
            1
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
            "obj-142",
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
            "obj-142",
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
            1
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
            "obj-142",
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
            "obj-142",
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
            "obj-142",
            1
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
            "obj-156",
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
            "obj-156",
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
            "obj-156",
            1
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
            "obj-156",
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
            "obj-168",
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
            "obj-171",
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
            "obj-172",
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
            "obj-176",
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
            "obj-179",
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
            "obj-180",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-182",
            1
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
            "obj-184",
            0
          ],
          "source": [
            "obj-182",
            1
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
            "obj-194",
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
            "obj-194",
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
            "obj-197",
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
            "obj-198",
            0
          ],
          "source": [
            "obj-194",
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
            "obj-201",
            2
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
            "obj-201",
            3
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
            "obj-201",
            4
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
            "obj-201",
            5
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
            "obj-201",
            6
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
            "obj-201",
            7
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
            "obj-201",
            8
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
            "obj-201",
            9
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
            "obj-201",
            10
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
            "obj-201",
            11
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
            "obj-201",
            12
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
            "obj-215",
            2
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
            "obj-215",
            3
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
            "obj-215",
            4
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
            "obj-215",
            5
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
            "obj-215",
            6
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
            "obj-215",
            7
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
            "obj-215",
            8
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
            "obj-215",
            9
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
            "obj-215",
            10
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
            "obj-215",
            11
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
            "obj-215",
            12
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
            "obj-237",
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
            "obj-235",
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
            "obj-231",
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
            "obj-232",
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
            "obj-240",
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
            1
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
            "obj-238",
            1
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
            "obj-239",
            1
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
            "obj-240",
            1
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
            "obj-241",
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
            "obj-238",
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
            "obj-242",
            1
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
            "obj-248",
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
            "obj-250",
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
            "obj-250",
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
            "obj-251",
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
