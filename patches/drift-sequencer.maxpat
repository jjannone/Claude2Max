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
      500.0,
      465.0
    ],
    "gridsize": [
      15.0,
      15.0
    ],
    "boxes": [
      {
        "box": {
          "id": "obj-title",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            50.0,
            15.0,
            400.0,
            24.0
          ],
          "text": "Drift Sequencer",
          "fontsize": 16.0,
          "fontface": 1
        }
      },
      {
        "box": {
          "id": "obj-1",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            250.0,
            30.0,
            160.0,
            22.0
          ],
          "text": "loadmess 200 100 150"
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            250.0,
            55.0,
            104.0,
            22.0
          ],
          "text": "unpack 0 0 0"
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            45.0,
            110.0,
            62.0,
            22.0
          ],
          "text": "on/off",
          "presentation": 1,
          "presentation_rect": [
            11.0,
            46.0,
            62.0,
            22.0
          ],
          "fontname": "Courier",
          "fontsize": 11.0,
          "textcolor": [
            0.039,
            0.039,
            0.039,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            30.0,
            125.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            15.0,
            62.0,
            22.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-5",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            80.0,
            77.0,
            90.0,
            22.0
          ],
          "text": "tempo (ms)",
          "presentation": 1,
          "presentation_rect": [
            101.0,
            46.0,
            90.0,
            22.0
          ],
          "fontname": "Courier",
          "fontsize": 11.0,
          "textcolor": [
            0.039,
            0.039,
            0.039,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            65.0,
            92.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            105.0,
            62.0,
            70.0,
            22.0
          ],
          "minimum": 50,
          "maximum": 2000
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            30.0,
            150.0,
            83.0,
            22.0
          ],
          "text": "metro 200"
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "newobj",
          "numinlets": 5,
          "numoutlets": 4,
          "outlettype": [
            "int",
            "bang",
            "int",
            "int"
          ],
          "patching_rect": [
            30.0,
            180.0,
            97.0,
            22.0
          ],
          "text": "counter 0 7"
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            30.0,
            210.0,
            41.0,
            22.0
          ],
          "text": "+ 1"
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            240.0,
            55.0,
            22.0
          ],
          "text": "t i i"
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
            30.0,
            270.0,
            111.0,
            22.0
          ],
          "text": "prepend fetch"
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            150.0,
            270.0,
            111.0,
            22.0
          ],
          "text": "prepend fetch"
        }
      },
      {
        "box": {
          "id": "obj-13",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            45.0,
            303.0,
            146.0,
            22.0
          ],
          "text": "pitch (MIDI 36-84)",
          "presentation": 1,
          "presentation_rect": [
            11.0,
            99.0,
            146.0,
            22.0
          ],
          "fontname": "Courier",
          "fontsize": 13.0,
          "textcolor": [
            0.039,
            0.039,
            0.039,
            1.0
          ],
          "fontface": 1
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "multislider",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            320.0,
            400.0,
            100.0
          ],
          "presentation": 1,
          "presentation_rect": [
            15.0,
            118.0,
            400.0,
            100.0
          ],
          "size": 8,
          "setminmax": [
            36.0,
            84.0
          ],
          "setstyle": 1,
          "candicane2": [
            0.8,
            0.122,
            0.102,
            1.0
          ],
          "slidercolor": [
            0.8,
            0.122,
            0.102,
            1.0
          ],
          "bgcolor": [
            0.847,
            0.816,
            0.714,
            1.0
          ],
          "orientation": 1
        }
      },
      {
        "box": {
          "id": "obj-15",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            428.0,
            90.0,
            22.0
          ],
          "text": "loadmess 1"
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
            45.0,
            448.0,
            174.0,
            22.0
          ],
          "text": "rests (0=rest, 1=note)",
          "presentation": 1,
          "presentation_rect": [
            11.0,
            232.0,
            174.0,
            22.0
          ],
          "fontname": "Courier",
          "fontsize": 13.0,
          "textcolor": [
            0.039,
            0.039,
            0.039,
            1.0
          ],
          "fontface": 1
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "multislider",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            465.0,
            400.0,
            25.0
          ],
          "presentation": 1,
          "presentation_rect": [
            15.0,
            249.0,
            400.0,
            25.0
          ],
          "size": 8,
          "setminmax": [
            0.0,
            1.0
          ],
          "setstyle": 1,
          "settype": 0,
          "candicane2": [
            0.8,
            0.122,
            0.102,
            1.0
          ],
          "slidercolor": [
            0.8,
            0.122,
            0.102,
            1.0
          ],
          "bgcolor": [
            0.847,
            0.816,
            0.714,
            1.0
          ],
          "orientation": 1
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            265.0,
            485.0,
            48.0,
            22.0
          ],
          "text": "note",
          "presentation": 1,
          "presentation_rect": [
            201.0,
            46.0,
            48.0,
            22.0
          ],
          "fontname": "Courier",
          "fontsize": 11.0,
          "textcolor": [
            0.039,
            0.039,
            0.039,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            250.0,
            500.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            205.0,
            62.0,
            55.0,
            22.0
          ],
          "ignoreclick": 1,
          "triangle": 0
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            250.0,
            535.0,
            62.0,
            22.0
          ],
          "text": "gate 1"
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
            355.0,
            555.0,
            76.0,
            22.0
          ],
          "text": "velocity",
          "presentation": 1,
          "presentation_rect": [
            11.0,
            282.0,
            76.0,
            22.0
          ],
          "fontname": "Courier",
          "fontsize": 11.0,
          "textcolor": [
            0.039,
            0.039,
            0.039,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-22",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            340.0,
            573.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            15.0,
            298.0,
            60.0,
            22.0
          ],
          "minimum": 1,
          "maximum": 127
        }
      },
      {
        "box": {
          "id": "obj-23",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            445.0,
            555.0,
            111.0,
            22.0
          ],
          "text": "duration (ms)",
          "presentation": 1,
          "presentation_rect": [
            103.0,
            282.0,
            111.0,
            22.0
          ],
          "fontname": "Courier",
          "fontsize": 11.0,
          "textcolor": [
            0.039,
            0.039,
            0.039,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-24",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            430.0,
            573.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            107.0,
            298.0,
            75.0,
            22.0
          ],
          "minimum": 10,
          "maximum": 2000
        }
      },
      {
        "box": {
          "id": "obj-25",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "float"
          ],
          "patching_rect": [
            250.0,
            610.0,
            132.0,
            22.0
          ],
          "text": "makenote 100 150"
        }
      },
      {
        "box": {
          "id": "obj-26",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            250.0,
            640.0,
            97.0,
            22.0
          ],
          "text": "pack 60 100"
        }
      },
      {
        "box": {
          "id": "obj-27",
          "maxclass": "newobj",
          "numinlets": 7,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            250.0,
            670.0,
            90.0,
            22.0
          ],
          "text": "midiformat"
        }
      },
      {
        "box": {
          "id": "obj-28",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            250.0,
            700.0,
            139.0,
            22.0
          ],
          "text": "abl.device.drift~"
        }
      },
      {
        "box": {
          "id": "obj-29",
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
            250.0,
            745.0,
            350.0,
            36.0
          ],
          "presentation": 1,
          "presentation_rect": [
            15.0,
            364.0,
            360.0,
            36.0
          ],
          "orientation": 1,
          "varname": "live.gain~",
          "trioncolor": [
            0.039,
            0.039,
            0.039,
            1.0
          ],
          "tricolor": [
            0.039,
            0.039,
            0.039,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-30",
          "maxclass": "ezdac~",
          "numinlets": 2,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            250.0,
            800.0,
            45.0,
            45.0
          ],
          "presentation": 1,
          "presentation_rect": [
            383.0,
            372.0,
            45.0,
            45.0
          ]
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
            30.0,
            855.0,
            370.0,
            22.0
          ],
          "text": "Turn on audio, set pitches and rests, click toggle",
          "presentation": 1,
          "presentation_rect": [
            11.0,
            330.0,
            370.0,
            22.0
          ],
          "fontname": "Courier",
          "fontsize": 11.0,
          "textcolor": [
            0.039,
            0.039,
            0.039,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-32",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            0.0,
            0.0,
            0.0,
            0.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ],
          "varname": "tut-panel-0",
          "bordercolor": [
            0.1,
            0.4,
            0.85,
            0.75
          ],
          "background": 1,
          "border": 2,
          "rounded": 8,
          "hidden": 1,
          "locked_bgcolor": 1
        }
      },
      {
        "box": {
          "id": "obj-33",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            238.0,
            18.0,
            184.0,
            71.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ],
          "varname": "tut-panel-1",
          "bordercolor": [
            0.1,
            0.4,
            0.85,
            0.75
          ],
          "background": 1,
          "border": 2,
          "rounded": 8,
          "hidden": 1,
          "locked_bgcolor": 1
        }
      },
      {
        "box": {
          "id": "obj-34",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            18.0,
            113.0,
            121.0,
            131.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ],
          "varname": "tut-panel-2",
          "bordercolor": [
            0.1,
            0.4,
            0.85,
            0.75
          ],
          "background": 1,
          "border": 2,
          "rounded": 8,
          "hidden": 1,
          "locked_bgcolor": 1
        }
      },
      {
        "box": {
          "id": "obj-35",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            18.0,
            416.0,
            376.0,
            228.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ],
          "varname": "tut-panel-3",
          "bordercolor": [
            0.1,
            0.4,
            0.85,
            0.75
          ],
          "background": 1,
          "border": 2,
          "rounded": 8,
          "hidden": 1,
          "locked_bgcolor": 1
        }
      },
      {
        "box": {
          "id": "obj-36",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            53.0,
            80.0,
            74.0,
            46.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ],
          "varname": "tut-panel-4",
          "bordercolor": [
            0.1,
            0.4,
            0.85,
            0.75
          ],
          "background": 1,
          "border": 2,
          "rounded": 8,
          "hidden": 1,
          "locked_bgcolor": 1
        }
      },
      {
        "box": {
          "id": "obj-37",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            328.0,
            561.0,
            164.0,
            46.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ],
          "varname": "tut-panel-5",
          "bordercolor": [
            0.1,
            0.4,
            0.85,
            0.75
          ],
          "background": 1,
          "border": 2,
          "rounded": 8,
          "hidden": 1,
          "locked_bgcolor": 1
        }
      },
      {
        "box": {
          "id": "obj-38",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            18.0,
            228.0,
            255.0,
            204.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ],
          "varname": "tut-panel-6",
          "bordercolor": [
            0.1,
            0.4,
            0.85,
            0.75
          ],
          "background": 1,
          "border": 2,
          "rounded": 8,
          "hidden": 1,
          "locked_bgcolor": 1
        }
      },
      {
        "box": {
          "id": "obj-39",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            238.0,
            488.0,
            74.0,
            46.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ],
          "varname": "tut-panel-7",
          "bordercolor": [
            0.1,
            0.4,
            0.85,
            0.75
          ],
          "background": 1,
          "border": 2,
          "rounded": 8,
          "hidden": 1,
          "locked_bgcolor": 1
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
            238.0,
            628.0,
            224.0,
            165.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ],
          "varname": "tut-panel-8",
          "bordercolor": [
            0.1,
            0.4,
            0.85,
            0.75
          ],
          "background": 1,
          "border": 2,
          "rounded": 8,
          "hidden": 1,
          "locked_bgcolor": 1
        }
      },
      {
        "box": {
          "id": "obj-41",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            238.0,
            788.0,
            69.0,
            69.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ],
          "varname": "tut-panel-9",
          "bordercolor": [
            0.1,
            0.4,
            0.85,
            0.75
          ],
          "background": 1,
          "border": 2,
          "rounded": 8,
          "hidden": 1,
          "locked_bgcolor": 1
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
            370.0,
            5.0,
            83.0,
            20.0
          ],
          "text": "Tutorial:",
          "fontface": 1
        }
      },
      {
        "box": {
          "id": "obj-43",
          "maxclass": "umenu",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            438.0,
            5.0,
            200.0,
            22.0
          ],
          "items": [
            "0:",
            "Overview",
            ",",
            "1:",
            "loadmess",
            "+",
            "unpack",
            ",",
            "2:",
            "toggle",
            "+3",
            ",",
            "3:",
            "loadmess",
            "+3",
            ",",
            "4:",
            "number",
            ",",
            "5:",
            "number",
            ",",
            "6:",
            "t",
            "+2",
            ",",
            "7:",
            "number",
            ",",
            "8:",
            "pack",
            "+3",
            ",",
            "9:",
            "ezdac~"
          ]
        }
      },
      {
        "box": {
          "id": "obj-44",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            644.0,
            5.0,
            48.0,
            22.0
          ],
          "text": "prev"
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
            680.0,
            5.0,
            48.0,
            22.0
          ],
          "text": "next"
        }
      },
      {
        "box": {
          "id": "obj-46",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            716.0,
            5.0,
            76.0,
            22.0
          ],
          "text": "loadbang"
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
            370.0,
            32.0,
            230.0,
            22.0
          ],
          "text": "v8 drift-sequencer-tutorial.js"
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
            10.0,
            900.0,
            220.0,
            68.0
          ],
          "text": "loadmess +3\nloadmess: rests (0=rest, 1=note). multislider. gate: velocity. makenote \u2014 Generates a MIDI note-on followed by a note-off.",
          "fontsize": 11.0,
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "varname": "tut-ann-3",
          "hidden": 1,
          "bubble": 1,
          "bubbleside": 1,
          "bubble_bgcolor": [
            1.0,
            0.98,
            0.72,
            1.0
          ],
          "linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-49",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            10.0,
            900.0,
            220.0,
            86.0
          ],
          "text": "loadmess +3\nloadmess: rests (0=rest, 1=note). multislider. gate: velocity. makenote \u2014 Generates a MIDI note-on followed by a note-off.",
          "fontsize": 11.0,
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "varname": "tut-ann-3",
          "hidden": 1,
          "bubble": 1,
          "bubbleside": 1,
          "bubble_bgcolor": [
            1.0,
            0.98,
            0.72,
            1.0
          ],
          "linecount": 2
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
            10.0,
            900.0,
            220.0,
            122.0
          ],
          "text": "loadmess +3\nloadmess: rests (0=rest, 1=note). multislider. gate: velocity. makenote \u2014 Generates a MIDI note-on followed by a note-off.",
          "fontsize": 11.0,
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "varname": "tut-ann-3",
          "hidden": 1,
          "bubble": 1,
          "bubbleside": 1,
          "bubble_bgcolor": [
            1.0,
            0.98,
            0.72,
            1.0
          ],
          "linecount": 2
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
            10.0,
            900.0,
            220.0,
            68.0
          ],
          "text": "loadmess +3\nloadmess: rests (0=rest, 1=note). multislider. gate: velocity. makenote \u2014 Generates a MIDI note-on followed by a note-off.",
          "fontsize": 11.0,
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "varname": "tut-ann-3",
          "hidden": 1,
          "bubble": 1,
          "bubbleside": 1,
          "bubble_bgcolor": [
            1.0,
            0.98,
            0.72,
            1.0
          ],
          "linecount": 2
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
            10.0,
            900.0,
            220.0,
            140.0
          ],
          "text": "loadmess +3\nloadmess: rests (0=rest, 1=note). multislider. gate: velocity. makenote \u2014 Generates a MIDI note-on followed by a note-off.",
          "fontsize": 11.0,
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "varname": "tut-ann-3",
          "hidden": 1,
          "bubble": 1,
          "bubbleside": 1,
          "bubble_bgcolor": [
            1.0,
            0.98,
            0.72,
            1.0
          ],
          "linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-53",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            10.0,
            900.0,
            220.0,
            68.0
          ],
          "text": "loadmess +3\nloadmess: rests (0=rest, 1=note). multislider. gate: velocity. makenote \u2014 Generates a MIDI note-on followed by a note-off.",
          "fontsize": 11.0,
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "varname": "tut-ann-3",
          "hidden": 1,
          "bubble": 1,
          "bubbleside": 1,
          "bubble_bgcolor": [
            1.0,
            0.98,
            0.72,
            1.0
          ],
          "linecount": 2
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
            10.0,
            900.0,
            542.0,
            31.0
          ],
          "text": "loadmess +3\nloadmess: rests (0=rest, 1=note). multislider. gate: velocity. makenote \u2014 Generates a MIDI note-on followed by a note-off.",
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0,
          "varname": "tut-ann-3",
          "hidden": 1,
          "bubble": 1,
          "bubbleside": 1,
          "bubble_bgcolor": [
            1.0,
            0.98,
            0.72,
            1.0
          ],
          "linecount": 2
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
            10.0,
            900.0,
            664.0,
            31.0
          ],
          "text": "loadmess +3\nloadmess: rests (0=rest, 1=note). multislider. gate: velocity. makenote \u2014 Generates a MIDI note-on followed by a note-off.",
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0,
          "varname": "tut-ann-3",
          "hidden": 1,
          "bubble": 1,
          "bubbleside": 1,
          "bubble_bgcolor": [
            1.0,
            0.98,
            0.72,
            1.0
          ],
          "linecount": 2
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
            10.0,
            900.0,
            916.0,
            31.0
          ],
          "text": "loadmess +3\nloadmess: rests (0=rest, 1=note). multislider. gate: velocity. makenote \u2014 Generates a MIDI note-on followed by a note-off.",
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0,
          "varname": "tut-ann-3",
          "hidden": 1,
          "bubble": 1,
          "bubbleside": 1,
          "bubble_bgcolor": [
            1.0,
            0.98,
            0.72,
            1.0
          ],
          "linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-57",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            10.0,
            900.0,
            602.0,
            31.0
          ],
          "text": "loadmess +3\nloadmess: rests (0=rest, 1=note). multislider. gate: velocity. makenote \u2014 Generates a MIDI note-on followed by a note-off.",
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0,
          "varname": "tut-ann-3",
          "hidden": 1,
          "bubble": 1,
          "bubbleside": 1,
          "bubble_bgcolor": [
            1.0,
            0.98,
            0.72,
            1.0
          ],
          "linecount": 2
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
            10.0,
            900.0,
            60.0,
            24.0
          ],
          "text": "number\nnumber \u2014 Displays and edits an integer number.",
          "fontsize": 11.0,
          "bubble": 1,
          "hidden": 1,
          "varname": "tut-ann-4",
          "bubble_bgcolor": [
            1.0,
            0.98,
            0.72,
            1.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "bubbleside": 1,
          "linecount": 2
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
            10.0,
            900.0,
            60.0,
            24.0
          ],
          "text": "number\nnumber \u2014 Displays and edits an integer number. number \u2014 Displays and edits an integer number.",
          "fontsize": 11.0,
          "bubble": 1,
          "hidden": 1,
          "varname": "tut-ann-5",
          "bubble_bgcolor": [
            1.0,
            0.98,
            0.72,
            1.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "bubbleside": 1,
          "linecount": 2
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
            10.0,
            900.0,
            60.0,
            24.0
          ],
          "text": "t +2\nt \u2014 Fires a series of typed outputs in right-to-left order. prepend: pitch (MIDI 36-84). prepend \u2014 Prepends a fixed message selector before incoming data. multislider.",
          "fontsize": 11.0,
          "bubble": 1,
          "hidden": 1,
          "varname": "tut-ann-6",
          "bubble_bgcolor": [
            1.0,
            0.98,
            0.72,
            1.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "bubbleside": 1,
          "linecount": 2
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
            10.0,
            900.0,
            60.0,
            24.0
          ],
          "text": "number\nnumber \u2014 Displays and edits an integer number.",
          "fontsize": 11.0,
          "bubble": 1,
          "hidden": 1,
          "varname": "tut-ann-7",
          "bubble_bgcolor": [
            1.0,
            0.98,
            0.72,
            1.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "bubbleside": 1,
          "linecount": 2
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
            10.0,
            900.0,
            60.0,
            24.0
          ],
          "text": "pack +3\npack \u2014 Packs individual values into a single output list. midiformat \u2014 Assembles raw MIDI bytes from component values. abl.device.drift~. live.gain~ \u2014 A stereo volume fader (Max for Live).",
          "fontsize": 11.0,
          "bubble": 1,
          "hidden": 1,
          "varname": "tut-ann-8",
          "bubble_bgcolor": [
            1.0,
            0.98,
            0.72,
            1.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "bubbleside": 1,
          "linecount": 2
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
            10.0,
            900.0,
            60.0,
            24.0
          ],
          "text": "ezdac~\nezdac~ \u2014 A stereo audio output with built-in gain slider.",
          "fontsize": 11.0,
          "bubble": 1,
          "hidden": 1,
          "varname": "tut-ann-9",
          "bubble_bgcolor": [
            1.0,
            0.98,
            0.72,
            1.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "bubbleside": 1,
          "linecount": 2
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
            10.0,
            900.0,
            60.0,
            24.0
          ],
          "text": "Overview\nThis patch has 23 processing objects across 9 stages. Use the menu or prev/next to step through each stage.",
          "fontsize": 11.0,
          "bubble": 1,
          "hidden": 1,
          "varname": "tut-ann-0",
          "bubble_bgcolor": [
            1.0,
            0.98,
            0.72,
            1.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "bubbleside": 0,
          "linecount": 2
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
            10.0,
            900.0,
            60.0,
            24.0
          ],
          "text": "loadmess + unpack\nloadmess \u2014 Sends a stored message when the patch loads (initializes defaults). unpack \u2014 Unpacks a list into individual outlet values.",
          "fontsize": 11.0,
          "bubble": 1,
          "hidden": 1,
          "varname": "tut-ann-1",
          "bubble_bgcolor": [
            1.0,
            0.98,
            0.72,
            1.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "bubbleside": 1,
          "linecount": 2
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
            10.0,
            900.0,
            60.0,
            24.0
          ],
          "text": "toggle +3\ntoggle \u2014 Sends 1 (on) or 0 (off) when clicked \u2014 starts/stops loops. metro \u2014 Generates repeated bangs at a set interval (ms). counter \u2014 Counts bangs up/down between min and max. +.",
          "fontsize": 11.0,
          "bubble": 1,
          "hidden": 1,
          "varname": "tut-ann-2",
          "bubble_bgcolor": [
            1.0,
            0.98,
            0.72,
            1.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "bubbleside": 1,
          "linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-67",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            0.0,
            480.0,
            420.0
          ],
          "presentation": 1,
          "presentation_rect": [
            0.0,
            0.0,
            480.0,
            430.0
          ],
          "bgcolor": [
            0.945,
            0.918,
            0.831,
            1.0
          ],
          "border": 0,
          "rounded": 0,
          "background": 1
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
            500.0,
            30.0,
            125.0,
            22.0
          ],
          "text": "DRIFT SEQUENCER",
          "presentation": 1,
          "presentation_rect": [
            11.0,
            10.0,
            400.0,
            30.0
          ],
          "fontname": "Helvetica Neue",
          "fontface": 1,
          "fontsize": 22.0,
          "textcolor": [
            0.039,
            0.039,
            0.039,
            1.0
          ]
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
            500.0,
            190.0,
            460.0,
            5.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            34.0,
            460.0,
            5.0
          ],
          "bgcolor": [
            0.8,
            0.122,
            0.102,
            1.0
          ],
          "border": 0,
          "rounded": 0,
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
            500.0,
            190.0,
            460.0,
            4.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            90.0,
            460.0,
            4.0
          ],
          "bgcolor": [
            0.8,
            0.122,
            0.102,
            1.0
          ],
          "border": 0,
          "rounded": 0,
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
            500.0,
            180.0,
            460.0,
            4.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            224.0,
            460.0,
            4.0
          ],
          "bgcolor": [
            0.8,
            0.122,
            0.102,
            1.0
          ],
          "border": 0,
          "rounded": 0,
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
            1080.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"name\": \"Drift Sequencer\",\n  \"width\": 500,\n  \"height\": 465,\n  \"objects\": {\n    \"loadmess\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 200 100 150\",\n      \"pos\": [\n        250,\n        30\n      ]\n    },\n    \"unpack_init\": {\n      \"type\": \"newobj\",\n      \"text\": \"unpack 0 0 0\",\n      \"pos\": [\n        250,\n        55\n      ]\n    },\n    \"onoff_label\": {\n      \"type\": \"comment\",\n      \"text\": \"on/off\",\n      \"pos\": [\n        45,\n        110\n      ],\n      \"presentation\": [\n        11,\n        46\n      ],\n      \"attrs\": {\n        \"fontname\": \"Courier\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.039,\n          0.039,\n          0.039,\n          1.0\n        ]\n      }\n    },\n    \"onoff\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        30,\n        125\n      ],\n      \"presentation\": [\n        15,\n        62,\n        22,\n        22\n      ]\n    },\n    \"tempo_label\": {\n      \"type\": \"comment\",\n      \"text\": \"tempo (ms)\",\n      \"pos\": [\n        80,\n        77\n      ],\n      \"presentation\": [\n        101,\n        46\n      ],\n      \"attrs\": {\n        \"fontname\": \"Courier\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.039,\n          0.039,\n          0.039,\n          1.0\n        ]\n      }\n    },\n    \"tempo\": {\n      \"type\": \"number\",\n      \"pos\": [\n        65,\n        92\n      ],\n      \"attrs\": {\n        \"minimum\": 50,\n        \"maximum\": 2000\n      },\n      \"presentation\": [\n        105,\n        62,\n        70,\n        22\n      ]\n    },\n    \"metro\": {\n      \"type\": \"newobj\",\n      \"text\": \"metro 200\",\n      \"pos\": [\n        30,\n        150\n      ]\n    },\n    \"steps\": {\n      \"type\": \"newobj\",\n      \"text\": \"counter 0 7\",\n      \"pos\": [\n        30,\n        180\n      ]\n    },\n    \"step_plus1\": {\n      \"type\": \"newobj\",\n      \"text\": \"+ 1\",\n      \"pos\": [\n        30,\n        210\n      ]\n    },\n    \"trig\": {\n      \"type\": \"newobj\",\n      \"text\": \"t i i\",\n      \"pos\": [\n        30,\n        240\n      ]\n    },\n    \"fetch_pitch\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend fetch\",\n      \"pos\": [\n        30,\n        270\n      ]\n    },\n    \"fetch_rest\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend fetch\",\n      \"pos\": [\n        150,\n        270\n      ]\n    },\n    \"pitch_label\": {\n      \"type\": \"comment\",\n      \"text\": \"pitch (MIDI 36-84)\",\n      \"pos\": [\n        45,\n        303\n      ],\n      \"presentation\": [\n        11,\n        99\n      ],\n      \"attrs\": {\n        \"fontname\": \"Courier\",\n        \"fontsize\": 13.0,\n        \"textcolor\": [\n          0.039,\n          0.039,\n          0.039,\n          1.0\n        ],\n        \"fontface\": 1\n      }\n    },\n    \"slider\": {\n      \"type\": \"multislider\",\n      \"pos\": [\n        30,\n        320\n      ],\n      \"size\": [\n        400,\n        100\n      ],\n      \"presentation\": [\n        15,\n        118,\n        400,\n        100\n      ],\n      \"attrs\": {\n        \"size\": 8,\n        \"setminmax\": [\n          36.0,\n          84.0\n        ],\n        \"setstyle\": 1,\n        \"candicane2\": [\n          0.8,\n          0.122,\n          0.102,\n          1.0\n        ],\n        \"slidercolor\": [\n          0.8,\n          0.122,\n          0.102,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.847,\n          0.816,\n          0.714,\n          1.0\n        ],\n        \"orientation\": 1\n      }\n    },\n    \"rest_init\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 1\",\n      \"pos\": [\n        30,\n        428\n      ]\n    },\n    \"rest_label\": {\n      \"type\": \"comment\",\n      \"text\": \"rests (0=rest, 1=note)\",\n      \"pos\": [\n        45,\n        448\n      ],\n      \"presentation\": [\n        11,\n        232\n      ],\n      \"attrs\": {\n        \"fontname\": \"Courier\",\n        \"fontsize\": 13.0,\n        \"textcolor\": [\n          0.039,\n          0.039,\n          0.039,\n          1.0\n        ],\n        \"fontface\": 1\n      }\n    },\n    \"rest_slider\": {\n      \"type\": \"multislider\",\n      \"pos\": [\n        30,\n        465\n      ],\n      \"size\": [\n        400,\n        25\n      ],\n      \"presentation\": [\n        15,\n        249,\n        400,\n        25\n      ],\n      \"attrs\": {\n        \"size\": 8,\n        \"setminmax\": [\n          0.0,\n          1.0\n        ],\n        \"setstyle\": 1,\n        \"settype\": 0,\n        \"candicane2\": [\n          0.8,\n          0.122,\n          0.102,\n          1.0\n        ],\n        \"slidercolor\": [\n          0.8,\n          0.122,\n          0.102,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.847,\n          0.816,\n          0.714,\n          1.0\n        ],\n        \"orientation\": 1\n      }\n    },\n    \"pitch_display_label\": {\n      \"type\": \"comment\",\n      \"text\": \"note\",\n      \"pos\": [\n        265,\n        485\n      ],\n      \"presentation\": [\n        201,\n        46\n      ],\n      \"attrs\": {\n        \"fontname\": \"Courier\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.039,\n          0.039,\n          0.039,\n          1.0\n        ]\n      }\n    },\n    \"pitch_display\": {\n      \"type\": \"number\",\n      \"pos\": [\n        250,\n        500\n      ],\n      \"presentation\": [\n        205,\n        62,\n        55,\n        22\n      ],\n      \"attrs\": {\n        \"ignoreclick\": 1,\n        \"triangle\": 0\n      }\n    },\n    \"note_gate\": {\n      \"type\": \"newobj\",\n      \"text\": \"gate 1\",\n      \"pos\": [\n        250,\n        535\n      ]\n    },\n    \"vel_label\": {\n      \"type\": \"comment\",\n      \"text\": \"velocity\",\n      \"pos\": [\n        355,\n        555\n      ],\n      \"presentation\": [\n        11,\n        282\n      ],\n      \"attrs\": {\n        \"fontname\": \"Courier\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.039,\n          0.039,\n          0.039,\n          1.0\n        ]\n      }\n    },\n    \"velocity\": {\n      \"type\": \"number\",\n      \"pos\": [\n        340,\n        573\n      ],\n      \"attrs\": {\n        \"minimum\": 1,\n        \"maximum\": 127\n      },\n      \"presentation\": [\n        15,\n        298,\n        60,\n        22\n      ]\n    },\n    \"dur_label\": {\n      \"type\": \"comment\",\n      \"text\": \"duration (ms)\",\n      \"pos\": [\n        445,\n        555\n      ],\n      \"presentation\": [\n        103,\n        282\n      ],\n      \"attrs\": {\n        \"fontname\": \"Courier\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.039,\n          0.039,\n          0.039,\n          1.0\n        ]\n      }\n    },\n    \"duration\": {\n      \"type\": \"number\",\n      \"pos\": [\n        430,\n        573\n      ],\n      \"attrs\": {\n        \"minimum\": 10,\n        \"maximum\": 2000\n      },\n      \"presentation\": [\n        107,\n        298,\n        75,\n        22\n      ]\n    },\n    \"makenote\": {\n      \"type\": \"newobj\",\n      \"text\": \"makenote 100 150\",\n      \"pos\": [\n        250,\n        610\n      ]\n    },\n    \"pack_note\": {\n      \"type\": \"newobj\",\n      \"text\": \"pack 60 100\",\n      \"pos\": [\n        250,\n        640\n      ]\n    },\n    \"midiformat\": {\n      \"type\": \"newobj\",\n      \"text\": \"midiformat\",\n      \"pos\": [\n        250,\n        670\n      ]\n    },\n    \"drift\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.device.drift~\",\n      \"pos\": [\n        250,\n        700\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"gain\": {\n      \"type\": \"live.gain~\",\n      \"pos\": [\n        250,\n        745\n      ],\n      \"size\": [\n        350,\n        36\n      ],\n      \"presentation\": [\n        15,\n        364,\n        360,\n        36\n      ],\n      \"attrs\": {\n        \"orientation\": 1,\n        \"varname\": \"live.gain~\",\n        \"trioncolor\": [\n          0.039,\n          0.039,\n          0.039,\n          1.0\n        ],\n        \"tricolor\": [\n          0.039,\n          0.039,\n          0.039,\n          1.0\n        ]\n      }\n    },\n    \"dac\": {\n      \"type\": \"ezdac~\",\n      \"pos\": [\n        250,\n        800\n      ],\n      \"presentation\": [\n        383,\n        372\n      ]\n    },\n    \"info\": {\n      \"type\": \"comment\",\n      \"text\": \"Turn on audio, set pitches and rests, click toggle\",\n      \"pos\": [\n        30,\n        855\n      ],\n      \"presentation\": [\n        11,\n        330\n      ],\n      \"attrs\": {\n        \"fontname\": \"Courier\",\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.039,\n          0.039,\n          0.039,\n          1.0\n        ]\n      }\n    },\n    \"panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        0,\n        0\n      ],\n      \"size\": [\n        0,\n        0\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ],\n        \"varname\": \"tut-panel-0\",\n        \"bordercolor\": [\n          0.1,\n          0.4,\n          0.85,\n          0.75\n        ],\n        \"background\": 1,\n        \"border\": 2,\n        \"rounded\": 8,\n        \"hidden\": 1,\n        \"locked_bgcolor\": 1\n      }\n    },\n    \"panel_2\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        238,\n        18\n      ],\n      \"size\": [\n        184,\n        71\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ],\n        \"varname\": \"tut-panel-1\",\n        \"bordercolor\": [\n          0.1,\n          0.4,\n          0.85,\n          0.75\n        ],\n        \"background\": 1,\n        \"border\": 2,\n        \"rounded\": 8,\n        \"hidden\": 1,\n        \"locked_bgcolor\": 1\n      }\n    },\n    \"panel_3\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        18,\n        113\n      ],\n      \"size\": [\n        121,\n        131\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ],\n        \"varname\": \"tut-panel-2\",\n        \"bordercolor\": [\n          0.1,\n          0.4,\n          0.85,\n          0.75\n        ],\n        \"background\": 1,\n        \"border\": 2,\n        \"rounded\": 8,\n        \"hidden\": 1,\n        \"locked_bgcolor\": 1\n      }\n    },\n    \"panel_4\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        18,\n        416\n      ],\n      \"size\": [\n        376,\n        228\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ],\n        \"varname\": \"tut-panel-3\",\n        \"bordercolor\": [\n          0.1,\n          0.4,\n          0.85,\n          0.75\n        ],\n        \"background\": 1,\n        \"border\": 2,\n        \"rounded\": 8,\n        \"hidden\": 1,\n        \"locked_bgcolor\": 1\n      }\n    },\n    \"panel_5\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        53,\n        80\n      ],\n      \"size\": [\n        74,\n        46\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ],\n        \"varname\": \"tut-panel-4\",\n        \"bordercolor\": [\n          0.1,\n          0.4,\n          0.85,\n          0.75\n        ],\n        \"background\": 1,\n        \"border\": 2,\n        \"rounded\": 8,\n        \"hidden\": 1,\n        \"locked_bgcolor\": 1\n      }\n    },\n    \"panel_6\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        328,\n        561\n      ],\n      \"size\": [\n        164,\n        46\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ],\n        \"varname\": \"tut-panel-5\",\n        \"bordercolor\": [\n          0.1,\n          0.4,\n          0.85,\n          0.75\n        ],\n        \"background\": 1,\n        \"border\": 2,\n        \"rounded\": 8,\n        \"hidden\": 1,\n        \"locked_bgcolor\": 1\n      }\n    },\n    \"panel_7\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        18,\n        228\n      ],\n      \"size\": [\n        255,\n        204\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ],\n        \"varname\": \"tut-panel-6\",\n        \"bordercolor\": [\n          0.1,\n          0.4,\n          0.85,\n          0.75\n        ],\n        \"background\": 1,\n        \"border\": 2,\n        \"rounded\": 8,\n        \"hidden\": 1,\n        \"locked_bgcolor\": 1\n      }\n    },\n    \"panel_8\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        238,\n        488\n      ],\n      \"size\": [\n        74,\n        46\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ],\n        \"varname\": \"tut-panel-7\",\n        \"bordercolor\": [\n          0.1,\n          0.4,\n          0.85,\n          0.75\n        ],\n        \"background\": 1,\n        \"border\": 2,\n        \"rounded\": 8,\n        \"hidden\": 1,\n        \"locked_bgcolor\": 1\n      }\n    },\n    \"panel_9\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        238,\n        628\n      ],\n      \"size\": [\n        224,\n        165\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ],\n        \"varname\": \"tut-panel-8\",\n        \"bordercolor\": [\n          0.1,\n          0.4,\n          0.85,\n          0.75\n        ],\n        \"background\": 1,\n        \"border\": 2,\n        \"rounded\": 8,\n        \"hidden\": 1,\n        \"locked_bgcolor\": 1\n      }\n    },\n    \"panel_10\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        238,\n        788\n      ],\n      \"size\": [\n        69,\n        69\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ],\n        \"varname\": \"tut-panel-9\",\n        \"bordercolor\": [\n          0.1,\n          0.4,\n          0.85,\n          0.75\n        ],\n        \"background\": 1,\n        \"border\": 2,\n        \"rounded\": 8,\n        \"hidden\": 1,\n        \"locked_bgcolor\": 1\n      }\n    },\n    \"Tutorial\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        370,\n        5\n      ],\n      \"text\": \"Tutorial:\",\n      \"size\": [\n        83,\n        20\n      ],\n      \"attrs\": {\n        \"fontface\": 1\n      }\n    },\n    \"umenu\": {\n      \"type\": \"umenu\",\n      \"pos\": [\n        438,\n        5\n      ],\n      \"size\": [\n        200,\n        22\n      ],\n      \"attrs\": {\n        \"items\": [\n          \"0:\",\n          \"Overview\",\n          \",\",\n          \"1:\",\n          \"loadmess\",\n          \"+\",\n          \"unpack\",\n          \",\",\n          \"2:\",\n          \"toggle\",\n          \"+3\",\n          \",\",\n          \"3:\",\n          \"loadmess\",\n          \"+3\",\n          \",\",\n          \"4:\",\n          \"number\",\n          \",\",\n          \"5:\",\n          \"number\",\n          \",\",\n          \"6:\",\n          \"t\",\n          \"+2\",\n          \",\",\n          \"7:\",\n          \"number\",\n          \",\",\n          \"8:\",\n          \"pack\",\n          \"+3\",\n          \",\",\n          \"9:\",\n          \"ezdac~\"\n        ]\n      }\n    },\n    \"prev\": {\n      \"type\": \"message\",\n      \"pos\": [\n        644,\n        5\n      ],\n      \"text\": \"prev\"\n    },\n    \"next\": {\n      \"type\": \"message\",\n      \"pos\": [\n        680,\n        5\n      ],\n      \"text\": \"next\"\n    },\n    \"loadbang\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        716,\n        5\n      ],\n      \"text\": \"loadbang\"\n    },\n    \"v8\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        370,\n        32\n      ],\n      \"text\": \"v8 drift-sequencer-tutorial.js\"\n    },\n    \"number\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        220,\n        68\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"varname\": \"tut-ann-2\",\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"bubbleside\": 1,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ]\n      }\n    },\n    \"number_2\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        220,\n        86\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"varname\": \"tut-ann-2\",\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"bubbleside\": 1,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ]\n      }\n    },\n    \"t\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        220,\n        122\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"varname\": \"tut-ann-2\",\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"bubbleside\": 1,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ]\n      }\n    },\n    \"number_3\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        220,\n        68\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"varname\": \"tut-ann-2\",\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"bubbleside\": 1,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ]\n      }\n    },\n    \"pack\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        220,\n        140\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"varname\": \"tut-ann-2\",\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"bubbleside\": 1,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ]\n      }\n    },\n    \"ezdac\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        220,\n        68\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"varname\": \"tut-ann-2\",\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"bubbleside\": 1,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ]\n      }\n    },\n    \"Overview\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        542,\n        31\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"varname\": \"tut-ann-2\",\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"bubbleside\": 1,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ]\n      }\n    },\n    \"loadmess_2\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        664,\n        31\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"varname\": \"tut-ann-2\",\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"bubbleside\": 1,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ]\n      }\n    },\n    \"toggle\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        916,\n        31\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"varname\": \"tut-ann-2\",\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"bubbleside\": 1,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ]\n      }\n    },\n    \"loadmess_3\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        602,\n        31\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"varname\": \"tut-ann-2\",\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"bubbleside\": 1,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ]\n      }\n    },\n    \"number_4\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"bubble\": 1,\n        \"hidden\": 1,\n        \"varname\": \"tut-ann-2\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1\n      }\n    },\n    \"number_5\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"bubble\": 1,\n        \"hidden\": 1,\n        \"varname\": \"tut-ann-2\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1\n      }\n    },\n    \"t_2\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"bubble\": 1,\n        \"hidden\": 1,\n        \"varname\": \"tut-ann-2\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1\n      }\n    },\n    \"number_6\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"bubble\": 1,\n        \"hidden\": 1,\n        \"varname\": \"tut-ann-2\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1\n      }\n    },\n    \"pack_2\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"bubble\": 1,\n        \"hidden\": 1,\n        \"varname\": \"tut-ann-2\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1\n      }\n    },\n    \"ezdac_2\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"bubble\": 1,\n        \"hidden\": 1,\n        \"varname\": \"tut-ann-2\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1\n      }\n    },\n    \"Overview_2\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"bubble\": 1,\n        \"hidden\": 1,\n        \"varname\": \"tut-ann-2\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1\n      }\n    },\n    \"loadmess_4\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"bubble\": 1,\n        \"hidden\": 1,\n        \"varname\": \"tut-ann-2\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1\n      }\n    },\n    \"toggle_2\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"bubble\": 1,\n        \"hidden\": 1,\n        \"varname\": \"tut-ann-2\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1\n      }\n    },\n    \"sov_bg\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        500,\n        0\n      ],\n      \"size\": [\n        480,\n        420\n      ],\n      \"presentation\": [\n        0,\n        0,\n        480,\n        430\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.945,\n          0.918,\n          0.831,\n          1.0\n        ],\n        \"border\": 0,\n        \"rounded\": 0,\n        \"background\": 1\n      }\n    },\n    \"sov_title\": {\n      \"type\": \"comment\",\n      \"text\": \"DRIFT SEQUENCER\",\n      \"pos\": [\n        500,\n        30\n      ],\n      \"presentation\": [\n        11,\n        10,\n        400,\n        30\n      ],\n      \"attrs\": {\n        \"fontname\": \"Helvetica Neue\",\n        \"fontface\": 1,\n        \"fontsize\": 22.0,\n        \"textcolor\": [\n          0.039,\n          0.039,\n          0.039,\n          1.0\n        ]\n      }\n    },\n    \"sov_bar_title\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        500,\n        190\n      ],\n      \"size\": [\n        460,\n        5\n      ],\n      \"presentation\": [\n        10,\n        34,\n        460,\n        5\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.8,\n          0.122,\n          0.102,\n          1.0\n        ],\n        \"border\": 0,\n        \"rounded\": 0,\n        \"background\": 1\n      }\n    },\n    \"sov_bar_pitch\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        500,\n        190\n      ],\n      \"size\": [\n        460,\n        4\n      ],\n      \"presentation\": [\n        10,\n        90,\n        460,\n        4\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.8,\n          0.122,\n          0.102,\n          1.0\n        ],\n        \"border\": 0,\n        \"rounded\": 0,\n        \"background\": 1\n      }\n    },\n    \"sov_bar_rest\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        500,\n        180\n      ],\n      \"size\": [\n        460,\n        4\n      ],\n      \"presentation\": [\n        10,\n        224,\n        460,\n        4\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.8,\n          0.122,\n          0.102,\n          1.0\n        ],\n        \"border\": 0,\n        \"rounded\": 0,\n        \"background\": 1\n      }\n    },\n    \"loadmess_5\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        220,\n        68\n      ],\n      \"attrs\": {\n        \"varname\": \"tut-ann-2\",\n        \"bubble\": 1,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubbleside\": 1\n      }\n    },\n    \"loadmess_6\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        220,\n        86\n      ],\n      \"attrs\": {\n        \"varname\": \"tut-ann-2\",\n        \"bubble\": 1,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubbleside\": 1\n      }\n    },\n    \"loadmess_7\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        220,\n        122\n      ],\n      \"attrs\": {\n        \"varname\": \"tut-ann-2\",\n        \"bubble\": 1,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubbleside\": 1\n      }\n    },\n    \"loadmess_8\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        220,\n        68\n      ],\n      \"attrs\": {\n        \"varname\": \"tut-ann-2\",\n        \"bubble\": 1,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubbleside\": 1\n      }\n    },\n    \"loadmess_9\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        220,\n        140\n      ],\n      \"attrs\": {\n        \"varname\": \"tut-ann-2\",\n        \"bubble\": 1,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubbleside\": 1\n      }\n    },\n    \"loadmess_10\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        220,\n        68\n      ],\n      \"attrs\": {\n        \"varname\": \"tut-ann-2\",\n        \"bubble\": 1,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubbleside\": 1\n      }\n    },\n    \"loadmess_11\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        542,\n        31\n      ],\n      \"attrs\": {\n        \"varname\": \"tut-ann-2\",\n        \"bubble\": 1,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubbleside\": 1\n      }\n    },\n    \"loadmess_12\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        664,\n        31\n      ],\n      \"attrs\": {\n        \"varname\": \"tut-ann-2\",\n        \"bubble\": 1,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubbleside\": 1\n      }\n    },\n    \"loadmess_13\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        916,\n        31\n      ],\n      \"attrs\": {\n        \"varname\": \"tut-ann-2\",\n        \"bubble\": 1,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubbleside\": 1\n      }\n    },\n    \"loadmess_14\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        602,\n        31\n      ],\n      \"attrs\": {\n        \"varname\": \"tut-ann-2\",\n        \"bubble\": 1,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubbleside\": 1\n      }\n    },\n    \"number_7\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"varname\": \"tut-ann-2\",\n        \"bubble\": 1,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubbleside\": 1\n      }\n    },\n    \"number_8\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"varname\": \"tut-ann-2\",\n        \"bubble\": 1,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubbleside\": 1\n      }\n    },\n    \"t_3\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"varname\": \"tut-ann-2\",\n        \"bubble\": 1,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubbleside\": 1\n      }\n    },\n    \"number_9\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"varname\": \"tut-ann-2\",\n        \"bubble\": 1,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubbleside\": 1\n      }\n    },\n    \"pack_3\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"varname\": \"tut-ann-2\",\n        \"bubble\": 1,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubbleside\": 1\n      }\n    },\n    \"ezdac_3\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"varname\": \"tut-ann-2\",\n        \"bubble\": 1,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubbleside\": 1\n      }\n    },\n    \"Overview_3\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"varname\": \"tut-ann-2\",\n        \"bubble\": 1,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubbleside\": 1\n      }\n    },\n    \"loadmess_15\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. +.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"varname\": \"tut-ann-2\",\n        \"bubble\": 1,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubbleside\": 1\n      }\n    },\n    \"panel_11\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        500,\n        190\n      ],\n      \"size\": [\n        460,\n        5\n      ],\n      \"presentation\": [\n        10,\n        34,\n        460,\n        5\n      ],\n      \"attrs\": {\n        \"border\": 0,\n        \"bgcolor\": [\n          0.8,\n          0.122,\n          0.102,\n          1.0\n        ],\n        \"rounded\": 0,\n        \"background\": 1\n      }\n    },\n    \"loadmess_16\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"loadmess +3\\nloadmess: rests (0=rest, 1=note). multislider. gate: velocity. makenote \\u2014 Generates a MIDI note-on followed by a note-off.\",\n      \"size\": [\n        220,\n        68\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-3\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"fontsize\": 11.0\n      }\n    },\n    \"loadmess_17\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"loadmess +3\\nloadmess: rests (0=rest, 1=note). multislider. gate: velocity. makenote \\u2014 Generates a MIDI note-on followed by a note-off.\",\n      \"size\": [\n        220,\n        86\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-3\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"fontsize\": 11.0\n      }\n    },\n    \"loadmess_18\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"loadmess +3\\nloadmess: rests (0=rest, 1=note). multislider. gate: velocity. makenote \\u2014 Generates a MIDI note-on followed by a note-off.\",\n      \"size\": [\n        220,\n        122\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-3\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"fontsize\": 11.0\n      }\n    },\n    \"loadmess_19\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"loadmess +3\\nloadmess: rests (0=rest, 1=note). multislider. gate: velocity. makenote \\u2014 Generates a MIDI note-on followed by a note-off.\",\n      \"size\": [\n        220,\n        68\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-3\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"fontsize\": 11.0\n      }\n    },\n    \"loadmess_20\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"loadmess +3\\nloadmess: rests (0=rest, 1=note). multislider. gate: velocity. makenote \\u2014 Generates a MIDI note-on followed by a note-off.\",\n      \"size\": [\n        220,\n        140\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-3\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"fontsize\": 11.0\n      }\n    },\n    \"loadmess_21\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"loadmess +3\\nloadmess: rests (0=rest, 1=note). multislider. gate: velocity. makenote \\u2014 Generates a MIDI note-on followed by a note-off.\",\n      \"size\": [\n        220,\n        68\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-3\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"fontsize\": 11.0\n      }\n    },\n    \"loadmess_22\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"loadmess +3\\nloadmess: rests (0=rest, 1=note). multislider. gate: velocity. makenote \\u2014 Generates a MIDI note-on followed by a note-off.\",\n      \"size\": [\n        542,\n        31\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-3\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"fontsize\": 11.0\n      }\n    },\n    \"loadmess_23\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"loadmess +3\\nloadmess: rests (0=rest, 1=note). multislider. gate: velocity. makenote \\u2014 Generates a MIDI note-on followed by a note-off.\",\n      \"size\": [\n        664,\n        31\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-3\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"fontsize\": 11.0\n      }\n    },\n    \"loadmess_24\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"loadmess +3\\nloadmess: rests (0=rest, 1=note). multislider. gate: velocity. makenote \\u2014 Generates a MIDI note-on followed by a note-off.\",\n      \"size\": [\n        916,\n        31\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-3\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"fontsize\": 11.0\n      }\n    },\n    \"loadmess_25\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"loadmess +3\\nloadmess: rests (0=rest, 1=note). multislider. gate: velocity. makenote \\u2014 Generates a MIDI note-on followed by a note-off.\",\n      \"size\": [\n        602,\n        31\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-3\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"fontsize\": 11.0\n      }\n    },\n    \"number_10\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"number\\nnumber \\u2014 Displays and edits an integer number.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-4\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"fontsize\": 11.0\n      }\n    },\n    \"number_11\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"number\\nnumber \\u2014 Displays and edits an integer number. number \\u2014 Displays and edits an integer number.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-5\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"fontsize\": 11.0\n      }\n    },\n    \"t_4\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"t +2\\nt \\u2014 Fires a series of typed outputs in right-to-left order. prepend: pitch (MIDI 36-84). prepend \\u2014 Prepends a fixed message selector before incoming data. multislider.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-6\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"fontsize\": 11.0\n      }\n    },\n    \"number_12\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"number\\nnumber \\u2014 Displays and edits an integer number.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-7\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"fontsize\": 11.0\n      }\n    },\n    \"pack_4\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"pack +3\\npack \\u2014 Packs individual values into a single output list. midiformat \\u2014 Assembles raw MIDI bytes from component values. abl.device.drift~. live.gain~ \\u2014 A stereo volume fader (Max for Live).\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-8\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"fontsize\": 11.0\n      }\n    },\n    \"ezdac_4\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"ezdac~\\nezdac~ \\u2014 A stereo audio output with built-in gain slider.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-9\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"fontsize\": 11.0\n      }\n    },\n    \"Overview_4\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"Overview\\nThis patch has 23 processing objects across 9 stages. Use the menu or prev/next to step through each stage.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 0,\n        \"varname\": \"tut-ann-0\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"fontsize\": 11.0\n      }\n    },\n    \"loadmess_26\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        900\n      ],\n      \"text\": \"loadmess + unpack\\nloadmess \\u2014 Sends a stored message when the patch loads (initializes defaults). unpack \\u2014 Unpacks a list into individual outlet values.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-1\",\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"hidden\": 1,\n        \"bubble\": 1,\n        \"fontsize\": 11.0\n      }\n    },\n    \"panel_12\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        500,\n        190\n      ],\n      \"size\": [\n        460,\n        5\n      ],\n      \"presentation\": [\n        10,\n        34,\n        460,\n        5\n      ],\n      \"attrs\": {\n        \"rounded\": 0,\n        \"border\": 0,\n        \"bgcolor\": [\n          0.8,\n          0.122,\n          0.102,\n          1.0\n        ],\n        \"background\": 1\n      }\n    }\n  },\n  \"connections\": [\n    [\n      \"loadmess\",\n      0,\n      \"unpack_init\",\n      0\n    ],\n    [\n      \"trig\",\n      0,\n      \"fetch_pitch\",\n      0\n    ],\n    [\n      \"trig\",\n      1,\n      \"fetch_rest\",\n      0\n    ],\n    [\n      \"fetch_pitch\",\n      0,\n      \"slider\",\n      0\n    ],\n    [\n      \"fetch_rest\",\n      0,\n      \"rest_slider\",\n      0\n    ],\n    [\n      \"slider\",\n      1,\n      \"pitch_display\",\n      0\n    ],\n    [\n      \"rest_init\",\n      0,\n      \"rest_slider\",\n      0\n    ],\n    [\n      \"rest_slider\",\n      1,\n      \"note_gate\",\n      0\n    ],\n    [\n      \"pitch_display\",\n      0,\n      \"note_gate\",\n      1\n    ],\n    [\n      \"unpack_init\",\n      1,\n      \"velocity\",\n      0\n    ],\n    [\n      \"unpack_init\",\n      2,\n      \"duration\",\n      0\n    ],\n    [\n      \"unpack_init\",\n      0,\n      \"tempo\",\n      0\n    ],\n    [\n      \"note_gate\",\n      0,\n      \"makenote\",\n      0\n    ],\n    [\n      \"velocity\",\n      0,\n      \"makenote\",\n      1\n    ],\n    [\n      \"duration\",\n      0,\n      \"makenote\",\n      2\n    ],\n    [\n      \"makenote\",\n      1,\n      \"pack_note\",\n      1\n    ],\n    [\n      \"makenote\",\n      0,\n      \"pack_note\",\n      0\n    ],\n    [\n      \"pack_note\",\n      0,\n      \"midiformat\",\n      0\n    ],\n    [\n      \"midiformat\",\n      0,\n      \"drift\",\n      0\n    ],\n    [\n      \"drift\",\n      1,\n      \"gain\",\n      1\n    ],\n    [\n      \"drift\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"gain\",\n      1,\n      \"dac\",\n      1\n    ],\n    [\n      \"gain\",\n      0,\n      \"dac\",\n      0\n    ],\n    [\n      \"onoff\",\n      0,\n      \"metro\",\n      0\n    ],\n    [\n      \"tempo\",\n      0,\n      \"metro\",\n      1\n    ],\n    [\n      \"metro\",\n      0,\n      \"steps\",\n      0\n    ],\n    [\n      \"steps\",\n      0,\n      \"step_plus1\",\n      0\n    ],\n    [\n      \"step_plus1\",\n      0,\n      \"trig\",\n      0\n    ],\n    [\n      \"umenu\",\n      0,\n      \"v8\",\n      0\n    ],\n    [\n      \"prev\",\n      0,\n      \"v8\",\n      0\n    ],\n    [\n      \"next\",\n      0,\n      \"v8\",\n      0\n    ],\n    [\n      \"loadbang\",\n      0,\n      \"v8\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
          "fontsize": 9.0,
          "hidden": 1
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
          "source": [
            "obj-10",
            1
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
            "obj-17",
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
            "obj-19",
            0
          ],
          "source": [
            "obj-14",
            1
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
            1
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
            "obj-22",
            0
          ],
          "source": [
            "obj-2",
            1
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
            "obj-2",
            2
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
            "obj-25",
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
            "obj-25",
            1
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
            "obj-25",
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
            "obj-26",
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
            1
          ],
          "source": [
            "obj-28",
            1
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
            "obj-30",
            1
          ],
          "source": [
            "obj-29",
            1
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
            "obj-29",
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
            "obj-47",
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
            "obj-44",
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
            0
          ],
          "source": [
            "obj-46",
            0
          ]
        }
      }
    ],
    "default_fontsize": 12.0,
    "default_fontname": "Arial",
    "openinpresentation": 1
  }
}
