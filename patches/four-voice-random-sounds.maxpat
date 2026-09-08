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
      1320.0,
      1000.0
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
            45.0,
            108.0,
            119.0,
            20.0
          ],
          "text": "PLAY / STOP",
          "presentation": 1,
          "presentation_rect": [
            68.0,
            58.0,
            110.0,
            18.0
          ],
          "textcolor": [
            0.88,
            0.89,
            0.91,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 11.0
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            30.0,
            130.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            36.0,
            54.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            170.0,
            55.0,
            22.0
          ],
          "text": "t i i"
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            150.0,
            210.0,
            55.0,
            22.0
          ],
          "text": "s RUN"
        }
      },
      {
        "box": {
          "id": "obj-5",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            ""
          ],
          "patching_rect": [
            30.0,
            210.0,
            76.0,
            22.0
          ],
          "text": "select 0"
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            248.0,
            30.0,
            24.0
          ],
          "text": "0"
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            100.0,
            160.0,
            22.0
          ],
          "text": "loadmess 4000 8000 1"
        }
      },
      {
        "box": {
          "id": "obj-8",
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
            230.0,
            138.0,
            76.0,
            22.0
          ],
          "text": "unjoin 3"
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            245.0,
            168.0,
            74.0,
            20.0
          ],
          "text": "MIN MS",
          "presentation": 1,
          "presentation_rect": [
            262.0,
            58.0,
            70.0,
            18.0
          ],
          "textcolor": [
            0.88,
            0.89,
            0.91,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 11.0
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            230.0,
            192.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            200.0,
            55.0,
            56.0,
            22.0
          ],
          "minimum": 100
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            345.0,
            168.0,
            74.0,
            20.0
          ],
          "text": "MAX MS",
          "presentation": 1,
          "presentation_rect": [
            412.0,
            58.0,
            70.0,
            18.0
          ],
          "textcolor": [
            0.88,
            0.89,
            0.91,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 11.0
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            330.0,
            192.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            350.0,
            55.0,
            56.0,
            22.0
          ],
          "minimum": 100
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
            445.0,
            168.0,
            137.0,
            20.0
          ],
          "text": "SOUNDS LOADED",
          "presentation": 1,
          "presentation_rect": [
            916.0,
            58.0,
            150.0,
            18.0
          ],
          "textcolor": [
            0.88,
            0.89,
            0.91,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 11.0
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            430.0,
            192.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            860.0,
            55.0,
            50.0,
            22.0
          ],
          "minimum": 1
        }
      },
      {
        "box": {
          "id": "obj-15",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            620.0,
            130.0,
            100.0,
            24.0
          ],
          "text": "add sound",
          "presentation": 1,
          "presentation_rect": [
            636.0,
            52.0,
            104.0,
            26.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-16",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            620.0,
            168.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            620.0,
            205.0,
            90.0,
            22.0
          ],
          "text": "opendialog"
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
            620.0,
            242.0,
            118.0,
            22.0
          ],
          "text": "prepend append"
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            750.0,
            130.0,
            60.0,
            24.0
          ],
          "text": "clear",
          "presentation": 1,
          "presentation_rect": [
            752.0,
            52.0,
            66.0,
            26.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            620.0,
            290.0,
            76.0,
            22.0
          ],
          "text": "s SOUNDS"
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
            45.0,
            400.0,
            83.0,
            20.0
          ],
          "text": "VOICE 1",
          "presentation": 1,
          "presentation_rect": [
            36.0,
            154.0,
            90.0,
            18.0
          ],
          "textcolor": [
            0.88,
            0.89,
            0.91,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 11.0
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
            30.0,
            424.0,
            55.0,
            22.0
          ],
          "text": "r RUN"
        }
      },
      {
        "box": {
          "id": "obj-23",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            30.0,
            458.0,
            90.0,
            22.0
          ],
          "text": "metro 4000"
        }
      },
      {
        "box": {
          "id": "obj-24",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            492.0,
            55.0,
            22.0
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "obj-25",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            30.0,
            530.0,
            139.0,
            22.0
          ],
          "text": "random @range 1 2"
        }
      },
      {
        "box": {
          "id": "obj-26",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            180.0,
            566.0,
            181.0,
            22.0
          ],
          "text": "random @range 4000 8001"
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
            180.0,
            464.0,
            76.0,
            22.0
          ],
          "text": "r SOUNDS"
        }
      },
      {
        "box": {
          "id": "obj-28",
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
            610.0,
            260.0,
            96.0
          ],
          "presentation": 1,
          "presentation_rect": [
            36.0,
            178.0,
            243.0,
            300.0
          ]
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
            30.0,
            728.0,
            136.0,
            30.0
          ],
          "presentation": 1,
          "presentation_rect": [
            36.0,
            494.0,
            136.0,
            26.0
          ],
          "orientation": 1
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
            175.0,
            732.0,
            65.0,
            20.0
          ],
          "text": "LEVEL",
          "presentation": 1,
          "presentation_rect": [
            182.0,
            498.0,
            60.0,
            18.0
          ],
          "textcolor": [
            0.88,
            0.89,
            0.91,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 11.0
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
            345.0,
            400.0,
            83.0,
            20.0
          ],
          "text": "VOICE 2",
          "presentation": 1,
          "presentation_rect": [
            331.0,
            154.0,
            90.0,
            18.0
          ],
          "textcolor": [
            0.88,
            0.89,
            0.91,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 11.0
        }
      },
      {
        "box": {
          "id": "obj-32",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            330.0,
            424.0,
            55.0,
            22.0
          ],
          "text": "r RUN"
        }
      },
      {
        "box": {
          "id": "obj-33",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            330.0,
            458.0,
            90.0,
            22.0
          ],
          "text": "metro 4000"
        }
      },
      {
        "box": {
          "id": "obj-34",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            330.0,
            492.0,
            55.0,
            22.0
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "obj-35",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            330.0,
            530.0,
            139.0,
            22.0
          ],
          "text": "random @range 1 2"
        }
      },
      {
        "box": {
          "id": "obj-36",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            480.0,
            566.0,
            181.0,
            22.0
          ],
          "text": "random @range 4000 8001"
        }
      },
      {
        "box": {
          "id": "obj-37",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            480.0,
            464.0,
            76.0,
            22.0
          ],
          "text": "r SOUNDS"
        }
      },
      {
        "box": {
          "id": "obj-38",
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
            330.0,
            610.0,
            260.0,
            96.0
          ],
          "presentation": 1,
          "presentation_rect": [
            331.0,
            178.0,
            243.0,
            300.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-39",
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
            330.0,
            728.0,
            136.0,
            30.0
          ],
          "presentation": 1,
          "presentation_rect": [
            331.0,
            494.0,
            136.0,
            26.0
          ],
          "orientation": 1
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
            475.0,
            732.0,
            65.0,
            20.0
          ],
          "text": "LEVEL",
          "presentation": 1,
          "presentation_rect": [
            477.0,
            498.0,
            60.0,
            18.0
          ],
          "textcolor": [
            0.88,
            0.89,
            0.91,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 11.0
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
            645.0,
            400.0,
            83.0,
            20.0
          ],
          "text": "VOICE 3",
          "presentation": 1,
          "presentation_rect": [
            626.0,
            154.0,
            90.0,
            18.0
          ],
          "textcolor": [
            0.88,
            0.89,
            0.91,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 11.0
        }
      },
      {
        "box": {
          "id": "obj-42",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            630.0,
            424.0,
            55.0,
            22.0
          ],
          "text": "r RUN"
        }
      },
      {
        "box": {
          "id": "obj-43",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            630.0,
            458.0,
            90.0,
            22.0
          ],
          "text": "metro 4000"
        }
      },
      {
        "box": {
          "id": "obj-44",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            630.0,
            492.0,
            55.0,
            22.0
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "obj-45",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            630.0,
            530.0,
            139.0,
            22.0
          ],
          "text": "random @range 1 2"
        }
      },
      {
        "box": {
          "id": "obj-46",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            780.0,
            566.0,
            181.0,
            22.0
          ],
          "text": "random @range 4000 8001"
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
            780.0,
            464.0,
            76.0,
            22.0
          ],
          "text": "r SOUNDS"
        }
      },
      {
        "box": {
          "id": "obj-48",
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
            630.0,
            610.0,
            260.0,
            96.0
          ],
          "presentation": 1,
          "presentation_rect": [
            626.0,
            178.0,
            243.0,
            300.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-49",
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
            630.0,
            728.0,
            136.0,
            30.0
          ],
          "presentation": 1,
          "presentation_rect": [
            626.0,
            494.0,
            136.0,
            26.0
          ],
          "orientation": 1
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
            775.0,
            732.0,
            65.0,
            20.0
          ],
          "text": "LEVEL",
          "presentation": 1,
          "presentation_rect": [
            772.0,
            498.0,
            60.0,
            18.0
          ],
          "textcolor": [
            0.88,
            0.89,
            0.91,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 11.0
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
            945.0,
            400.0,
            83.0,
            20.0
          ],
          "text": "VOICE 4",
          "presentation": 1,
          "presentation_rect": [
            921.0,
            154.0,
            90.0,
            18.0
          ],
          "textcolor": [
            0.88,
            0.89,
            0.91,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 11.0
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
            930.0,
            424.0,
            55.0,
            22.0
          ],
          "text": "r RUN"
        }
      },
      {
        "box": {
          "id": "obj-53",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            930.0,
            458.0,
            90.0,
            22.0
          ],
          "text": "metro 4000"
        }
      },
      {
        "box": {
          "id": "obj-54",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            930.0,
            492.0,
            55.0,
            22.0
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "obj-55",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            930.0,
            530.0,
            139.0,
            22.0
          ],
          "text": "random @range 1 2"
        }
      },
      {
        "box": {
          "id": "obj-56",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            1080.0,
            566.0,
            181.0,
            22.0
          ],
          "text": "random @range 4000 8001"
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
            1080.0,
            464.0,
            76.0,
            22.0
          ],
          "text": "r SOUNDS"
        }
      },
      {
        "box": {
          "id": "obj-58",
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
            930.0,
            610.0,
            260.0,
            96.0
          ],
          "presentation": 1,
          "presentation_rect": [
            921.0,
            178.0,
            243.0,
            300.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-59",
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
            930.0,
            728.0,
            136.0,
            30.0
          ],
          "presentation": 1,
          "presentation_rect": [
            921.0,
            494.0,
            136.0,
            26.0
          ],
          "orientation": 1
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
            1075.0,
            732.0,
            65.0,
            20.0
          ],
          "text": "LEVEL",
          "presentation": 1,
          "presentation_rect": [
            1067.0,
            498.0,
            60.0,
            18.0
          ],
          "textcolor": [
            0.88,
            0.89,
            0.91,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 11.0
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
            175.0,
            870.0,
            74.0,
            20.0
          ],
          "text": "MASTER",
          "presentation": 1,
          "presentation_rect": [
            246.0,
            616.0,
            80.0,
            18.0
          ],
          "textcolor": [
            0.88,
            0.89,
            0.91,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 11.0
        }
      },
      {
        "box": {
          "id": "obj-62",
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
            866.0,
            136.0,
            30.0
          ],
          "presentation": 1,
          "presentation_rect": [
            36.0,
            612.0,
            200.0,
            28.0
          ],
          "orientation": 1
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
            85.0,
            924.0,
            92.0,
            20.0
          ],
          "text": "AUDIO ON",
          "presentation": 1,
          "presentation_rect": [
            396.0,
            616.0,
            90.0,
            18.0
          ],
          "textcolor": [
            0.88,
            0.89,
            0.91,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 11.0
        }
      },
      {
        "box": {
          "id": "obj-64",
          "maxclass": "ezdac~",
          "numinlets": 2,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            920.0,
            45.0,
            45.0
          ],
          "presentation": 1,
          "presentation_rect": [
            340.0,
            604.0,
            45.0,
            45.0
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
            880.0,
            96.0,
            101.0,
            20.0
          ],
          "text": "TRANSPORT",
          "presentation": 1,
          "presentation_rect": [
            36.0,
            26.0,
            120.0,
            18.0
          ],
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 11.0
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
            880.0,
            122.0,
            300.0,
            34.0
          ],
          "text": "each voice picks a new clip every MIN..MAX milliseconds, on its own clock",
          "presentation": 1,
          "presentation_rect": [
            36.0,
            90.0,
            540.0,
            18.0
          ],
          "textcolor": [
            0.62,
            0.65,
            0.7,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 10.0
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
            880.0,
            172.0,
            74.0,
            20.0
          ],
          "text": "SOUNDS",
          "presentation": 1,
          "presentation_rect": [
            636.0,
            26.0,
            100.0,
            18.0
          ],
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 11.0
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
            880.0,
            198.0,
            300.0,
            48.0
          ],
          "text": "ADD SOUND puts one file into all four voices \u2014 set SOUNDS LOADED to match, then click the speaker and switch PLAY on",
          "presentation": 1,
          "presentation_rect": [
            636.0,
            90.0,
            540.0,
            18.0
          ],
          "textcolor": [
            0.62,
            0.65,
            0.7,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 10.0
        }
      },
      {
        "box": {
          "id": "obj-69",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            880.0,
            254.0,
            74.0,
            20.0
          ],
          "text": "OUTPUT",
          "presentation": 1,
          "presentation_rect": [
            36.0,
            586.0,
            100.0,
            18.0
          ],
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 11.0
        }
      },
      {
        "box": {
          "id": "obj-70",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            880.0,
            300.0,
            40.0,
            40.0
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            16.0,
            580.0,
            112.0
          ],
          "bgcolor": [
            0.145,
            0.156,
            0.176,
            1.0
          ],
          "bordercolor": [
            0.35,
            0.37,
            0.4,
            1.0
          ],
          "border": 1,
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-71",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            925.0,
            300.0,
            40.0,
            40.0
          ],
          "presentation": 1,
          "presentation_rect": [
            620.0,
            16.0,
            580.0,
            112.0
          ],
          "bgcolor": [
            0.145,
            0.156,
            0.176,
            1.0
          ],
          "bordercolor": [
            0.35,
            0.37,
            0.4,
            1.0
          ],
          "border": 1,
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-72",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            970.0,
            300.0,
            40.0,
            40.0
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            144.0,
            275.0,
            416.0
          ],
          "bgcolor": [
            0.145,
            0.156,
            0.176,
            1.0
          ],
          "bordercolor": [
            0.35,
            0.37,
            0.4,
            1.0
          ],
          "border": 1,
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-73",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1015.0,
            300.0,
            40.0,
            40.0
          ],
          "presentation": 1,
          "presentation_rect": [
            315.0,
            144.0,
            275.0,
            416.0
          ],
          "bgcolor": [
            0.145,
            0.156,
            0.176,
            1.0
          ],
          "bordercolor": [
            0.35,
            0.37,
            0.4,
            1.0
          ],
          "border": 1,
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
            1060.0,
            300.0,
            40.0,
            40.0
          ],
          "presentation": 1,
          "presentation_rect": [
            610.0,
            144.0,
            275.0,
            416.0
          ],
          "bgcolor": [
            0.145,
            0.156,
            0.176,
            1.0
          ],
          "bordercolor": [
            0.35,
            0.37,
            0.4,
            1.0
          ],
          "border": 1,
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-75",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1105.0,
            300.0,
            40.0,
            40.0
          ],
          "presentation": 1,
          "presentation_rect": [
            905.0,
            144.0,
            275.0,
            416.0
          ],
          "bgcolor": [
            0.145,
            0.156,
            0.176,
            1.0
          ],
          "bordercolor": [
            0.35,
            0.37,
            0.4,
            1.0
          ],
          "border": 1,
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-76",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            1150.0,
            300.0,
            40.0,
            40.0
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            576.0,
            1180.0,
            88.0
          ],
          "bgcolor": [
            0.145,
            0.156,
            0.176,
            1.0
          ],
          "bordercolor": [
            0.35,
            0.37,
            0.4,
            1.0
          ],
          "border": 1,
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-77",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            330.0,
            230.0,
            41.0,
            22.0
          ],
          "text": "+ 1"
        }
      },
      {
        "box": {
          "id": "obj-78",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            230.0,
            266.0,
            139.0,
            22.0
          ],
          "text": "join @triggers -1"
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
            230.0,
            302.0,
            111.0,
            22.0
          ],
          "text": "prepend range"
        }
      },
      {
        "box": {
          "id": "obj-80",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            230.0,
            338.0,
            90.0,
            22.0
          ],
          "text": "s INTRANGE"
        }
      },
      {
        "box": {
          "id": "obj-81",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            430.0,
            230.0,
            41.0,
            22.0
          ],
          "text": "+ 1"
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
            430.0,
            266.0,
            125.0,
            22.0
          ],
          "text": "prepend range 1"
        }
      },
      {
        "box": {
          "id": "obj-83",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            430.0,
            302.0,
            97.0,
            22.0
          ],
          "text": "s CLIPRANGE"
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
            620.0,
            340.0,
            240.0,
            48.0
          ],
          "text": "+ 1 on both: random's @range high value is EXCLUSIVE (see random.maxhelp)",
          "textcolor": [
            0.62,
            0.65,
            0.7,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 10.0
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
            400.0,
            340.0,
            200.0,
            48.0
          ],
          "text": "t i i fires its RIGHT outlet first, so s RUN sits right of the stop cleanup - the cords never cross",
          "textcolor": [
            0.62,
            0.65,
            0.7,
            1.0
          ],
          "fontname": "<Monospaced>",
          "fontsize": 10.0
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
            180.0,
            400.0,
            97.0,
            22.0
          ],
          "text": "r CLIPRANGE"
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
            180.0,
            432.0,
            90.0,
            22.0
          ],
          "text": "r INTRANGE"
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
            30.0,
            772.0,
            76.0,
            22.0
          ],
          "text": "s~ MIX_L"
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
            130.0,
            772.0,
            76.0,
            22.0
          ],
          "text": "s~ MIX_R"
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
            480.0,
            400.0,
            97.0,
            22.0
          ],
          "text": "r CLIPRANGE"
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
            480.0,
            432.0,
            90.0,
            22.0
          ],
          "text": "r INTRANGE"
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
            330.0,
            772.0,
            76.0,
            22.0
          ],
          "text": "s~ MIX_L"
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
            430.0,
            772.0,
            76.0,
            22.0
          ],
          "text": "s~ MIX_R"
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
            780.0,
            400.0,
            97.0,
            22.0
          ],
          "text": "r CLIPRANGE"
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
            780.0,
            432.0,
            90.0,
            22.0
          ],
          "text": "r INTRANGE"
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
            630.0,
            772.0,
            76.0,
            22.0
          ],
          "text": "s~ MIX_L"
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
            730.0,
            772.0,
            76.0,
            22.0
          ],
          "text": "s~ MIX_R"
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
            1080.0,
            400.0,
            97.0,
            22.0
          ],
          "text": "r CLIPRANGE"
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
            1080.0,
            432.0,
            90.0,
            22.0
          ],
          "text": "r INTRANGE"
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
            930.0,
            772.0,
            76.0,
            22.0
          ],
          "text": "s~ MIX_L"
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
            1030.0,
            772.0,
            76.0,
            22.0
          ],
          "text": "s~ MIX_R"
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
            30.0,
            830.0,
            76.0,
            22.0
          ],
          "text": "r~ MIX_L"
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
            130.0,
            830.0,
            76.0,
            22.0
          ],
          "text": "r~ MIX_R"
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
            1005.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"width\": 1320,\n  \"height\": 1000,\n  \"openinpresentation\": 1,\n  \"objects\": {\n    \"cmt_p_play\": {\n      \"type\": \"comment\",\n      \"text\": \"PLAY / STOP\",\n      \"size\": [\n        119,\n        20\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.88,\n          0.89,\n          0.91,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 11.0\n      },\n      \"presentation\": [\n        68,\n        58,\n        110,\n        18\n      ],\n      \"pos\": [\n        45,\n        108\n      ]\n    },\n    \"tog_play\": {\n      \"type\": \"toggle\",\n      \"presentation\": [\n        36,\n        54,\n        24,\n        24\n      ],\n      \"pos\": [\n        30,\n        130\n      ]\n    },\n    \"trg_run\": {\n      \"type\": \"newobj\",\n      \"text\": \"t i i\",\n      \"pos\": [\n        30,\n        170\n      ]\n    },\n    \"snd_run\": {\n      \"type\": \"newobj\",\n      \"text\": \"s RUN\",\n      \"pos\": [\n        150,\n        210\n      ]\n    },\n    \"sel_stop\": {\n      \"type\": \"newobj\",\n      \"text\": \"select 0\",\n      \"pos\": [\n        30,\n        210\n      ]\n    },\n    \"msg_stop\": {\n      \"type\": \"message\",\n      \"text\": \"0\",\n      \"size\": [\n        30,\n        24\n      ],\n      \"attrs\": {},\n      \"pos\": [\n        30,\n        248\n      ]\n    },\n    \"lm_init\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 4000 8000 1\",\n      \"pos\": [\n        230,\n        100\n      ]\n    },\n    \"unp_init\": {\n      \"type\": \"newobj\",\n      \"text\": \"unjoin 3\",\n      \"pos\": [\n        230,\n        138\n      ]\n    },\n    \"cmt_p_min\": {\n      \"type\": \"comment\",\n      \"text\": \"MIN MS\",\n      \"size\": [\n        74,\n        20\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.88,\n          0.89,\n          0.91,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 11.0\n      },\n      \"presentation\": [\n        262,\n        58,\n        70,\n        18\n      ],\n      \"pos\": [\n        245,\n        168\n      ]\n    },\n    \"num_min\": {\n      \"type\": \"number\",\n      \"presentation\": [\n        200,\n        55,\n        56,\n        22\n      ],\n      \"attrs\": {\n        \"minimum\": 100\n      },\n      \"pos\": [\n        230,\n        192\n      ]\n    },\n    \"cmt_p_max\": {\n      \"type\": \"comment\",\n      \"text\": \"MAX MS\",\n      \"size\": [\n        74,\n        20\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.88,\n          0.89,\n          0.91,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 11.0\n      },\n      \"presentation\": [\n        412,\n        58,\n        70,\n        18\n      ],\n      \"pos\": [\n        345,\n        168\n      ]\n    },\n    \"num_max\": {\n      \"type\": \"number\",\n      \"presentation\": [\n        350,\n        55,\n        56,\n        22\n      ],\n      \"attrs\": {\n        \"minimum\": 100\n      },\n      \"pos\": [\n        330,\n        192\n      ]\n    },\n    \"cmt_p_n\": {\n      \"type\": \"comment\",\n      \"text\": \"SOUNDS LOADED\",\n      \"size\": [\n        137,\n        20\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.88,\n          0.89,\n          0.91,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 11.0\n      },\n      \"presentation\": [\n        916,\n        58,\n        150,\n        18\n      ],\n      \"pos\": [\n        445,\n        168\n      ]\n    },\n    \"num_n\": {\n      \"type\": \"number\",\n      \"presentation\": [\n        860,\n        55,\n        50,\n        22\n      ],\n      \"attrs\": {\n        \"minimum\": 1\n      },\n      \"pos\": [\n        430,\n        192\n      ]\n    },\n    \"msg_add\": {\n      \"type\": \"message\",\n      \"text\": \"add sound\",\n      \"size\": [\n        100,\n        24\n      ],\n      \"presentation\": [\n        636,\n        52,\n        104,\n        26\n      ],\n      \"pos\": [\n        620,\n        130\n      ]\n    },\n    \"trg_add\": {\n      \"type\": \"button\",\n      \"pos\": [\n        620,\n        168\n      ]\n    },\n    \"dlg_add\": {\n      \"type\": \"newobj\",\n      \"text\": \"opendialog\",\n      \"pos\": [\n        620,\n        205\n      ]\n    },\n    \"pre_append\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend append\",\n      \"attrs\": {},\n      \"pos\": [\n        620,\n        242\n      ]\n    },\n    \"msg_clear\": {\n      \"type\": \"message\",\n      \"text\": \"clear\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"presentation\": [\n        752,\n        52,\n        66,\n        26\n      ],\n      \"pos\": [\n        750,\n        130\n      ]\n    },\n    \"snd_sounds\": {\n      \"type\": \"newobj\",\n      \"text\": \"s SOUNDS\",\n      \"pos\": [\n        620,\n        290\n      ]\n    },\n    \"cmt_v1\": {\n      \"type\": \"comment\",\n      \"text\": \"VOICE 1\",\n      \"size\": [\n        83,\n        20\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.88,\n          0.89,\n          0.91,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 11.0\n      },\n      \"presentation\": [\n        36,\n        154,\n        90,\n        18\n      ],\n      \"pos\": [\n        45,\n        400\n      ]\n    },\n    \"rcv_run1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r RUN\",\n      \"pos\": [\n        30,\n        424\n      ]\n    },\n    \"met1\": {\n      \"type\": \"newobj\",\n      \"text\": \"metro 4000\",\n      \"pos\": [\n        30,\n        458\n      ]\n    },\n    \"trg1\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b b\",\n      \"pos\": [\n        30,\n        492\n      ]\n    },\n    \"rnd_clip1\": {\n      \"type\": \"newobj\",\n      \"text\": \"random @range 1 2\",\n      \"pos\": [\n        30,\n        530\n      ]\n    },\n    \"rnd_time1\": {\n      \"type\": \"newobj\",\n      \"text\": \"random @range 4000 8001\",\n      \"pos\": [\n        180,\n        566\n      ]\n    },\n    \"rcv_snd1\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SOUNDS\",\n      \"pos\": [\n        180,\n        464\n      ]\n    },\n    \"pl1\": {\n      \"type\": \"playlist~\",\n      \"inlets\": 1,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"dictionary\"\n      ],\n      \"size\": [\n        260,\n        96\n      ],\n      \"presentation\": [\n        36,\n        178,\n        243,\n        300\n      ],\n      \"pos\": [\n        30,\n        610\n      ]\n    },\n    \"gain1\": {\n      \"type\": \"live.gain~\",\n      \"size\": [\n        136,\n        30\n      ],\n      \"presentation\": [\n        36,\n        494,\n        136,\n        26\n      ],\n      \"attrs\": {\n        \"orientation\": 1\n      },\n      \"pos\": [\n        30,\n        728\n      ]\n    },\n    \"cmt_lvl1\": {\n      \"type\": \"comment\",\n      \"text\": \"LEVEL\",\n      \"size\": [\n        65,\n        20\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.88,\n          0.89,\n          0.91,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 11.0\n      },\n      \"presentation\": [\n        182,\n        498,\n        60,\n        18\n      ],\n      \"pos\": [\n        175,\n        732\n      ]\n    },\n    \"cmt_v2\": {\n      \"type\": \"comment\",\n      \"text\": \"VOICE 2\",\n      \"size\": [\n        83,\n        20\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.88,\n          0.89,\n          0.91,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 11.0\n      },\n      \"presentation\": [\n        331,\n        154,\n        90,\n        18\n      ],\n      \"pos\": [\n        345,\n        400\n      ]\n    },\n    \"rcv_run2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r RUN\",\n      \"pos\": [\n        330,\n        424\n      ]\n    },\n    \"met2\": {\n      \"type\": \"newobj\",\n      \"text\": \"metro 4000\",\n      \"pos\": [\n        330,\n        458\n      ]\n    },\n    \"trg2\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b b\",\n      \"pos\": [\n        330,\n        492\n      ]\n    },\n    \"rnd_clip2\": {\n      \"type\": \"newobj\",\n      \"text\": \"random @range 1 2\",\n      \"pos\": [\n        330,\n        530\n      ]\n    },\n    \"rnd_time2\": {\n      \"type\": \"newobj\",\n      \"text\": \"random @range 4000 8001\",\n      \"pos\": [\n        480,\n        566\n      ]\n    },\n    \"rcv_snd2\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SOUNDS\",\n      \"pos\": [\n        480,\n        464\n      ]\n    },\n    \"pl2\": {\n      \"type\": \"playlist~\",\n      \"inlets\": 1,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"dictionary\"\n      ],\n      \"size\": [\n        260,\n        96\n      ],\n      \"presentation\": [\n        331,\n        178,\n        243,\n        300\n      ],\n      \"pos\": [\n        330,\n        610\n      ]\n    },\n    \"gain2\": {\n      \"type\": \"live.gain~\",\n      \"size\": [\n        136,\n        30\n      ],\n      \"presentation\": [\n        331,\n        494,\n        136,\n        26\n      ],\n      \"attrs\": {\n        \"orientation\": 1\n      },\n      \"pos\": [\n        330,\n        728\n      ]\n    },\n    \"cmt_lvl2\": {\n      \"type\": \"comment\",\n      \"text\": \"LEVEL\",\n      \"size\": [\n        65,\n        20\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.88,\n          0.89,\n          0.91,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 11.0\n      },\n      \"presentation\": [\n        477,\n        498,\n        60,\n        18\n      ],\n      \"pos\": [\n        475,\n        732\n      ]\n    },\n    \"cmt_v3\": {\n      \"type\": \"comment\",\n      \"text\": \"VOICE 3\",\n      \"size\": [\n        83,\n        20\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.88,\n          0.89,\n          0.91,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 11.0\n      },\n      \"presentation\": [\n        626,\n        154,\n        90,\n        18\n      ],\n      \"pos\": [\n        645,\n        400\n      ]\n    },\n    \"rcv_run3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r RUN\",\n      \"pos\": [\n        630,\n        424\n      ]\n    },\n    \"met3\": {\n      \"type\": \"newobj\",\n      \"text\": \"metro 4000\",\n      \"pos\": [\n        630,\n        458\n      ]\n    },\n    \"trg3\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b b\",\n      \"pos\": [\n        630,\n        492\n      ]\n    },\n    \"rnd_clip3\": {\n      \"type\": \"newobj\",\n      \"text\": \"random @range 1 2\",\n      \"pos\": [\n        630,\n        530\n      ]\n    },\n    \"rnd_time3\": {\n      \"type\": \"newobj\",\n      \"text\": \"random @range 4000 8001\",\n      \"pos\": [\n        780,\n        566\n      ]\n    },\n    \"rcv_snd3\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SOUNDS\",\n      \"pos\": [\n        780,\n        464\n      ]\n    },\n    \"pl3\": {\n      \"type\": \"playlist~\",\n      \"inlets\": 1,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"dictionary\"\n      ],\n      \"size\": [\n        260,\n        96\n      ],\n      \"presentation\": [\n        626,\n        178,\n        243,\n        300\n      ],\n      \"pos\": [\n        630,\n        610\n      ]\n    },\n    \"gain3\": {\n      \"type\": \"live.gain~\",\n      \"size\": [\n        136,\n        30\n      ],\n      \"presentation\": [\n        626,\n        494,\n        136,\n        26\n      ],\n      \"attrs\": {\n        \"orientation\": 1\n      },\n      \"pos\": [\n        630,\n        728\n      ]\n    },\n    \"cmt_lvl3\": {\n      \"type\": \"comment\",\n      \"text\": \"LEVEL\",\n      \"size\": [\n        65,\n        20\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.88,\n          0.89,\n          0.91,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 11.0\n      },\n      \"presentation\": [\n        772,\n        498,\n        60,\n        18\n      ],\n      \"pos\": [\n        775,\n        732\n      ]\n    },\n    \"cmt_v4\": {\n      \"type\": \"comment\",\n      \"text\": \"VOICE 4\",\n      \"size\": [\n        83,\n        20\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.88,\n          0.89,\n          0.91,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 11.0\n      },\n      \"presentation\": [\n        921,\n        154,\n        90,\n        18\n      ],\n      \"pos\": [\n        945,\n        400\n      ]\n    },\n    \"rcv_run4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r RUN\",\n      \"pos\": [\n        930,\n        424\n      ]\n    },\n    \"met4\": {\n      \"type\": \"newobj\",\n      \"text\": \"metro 4000\",\n      \"pos\": [\n        930,\n        458\n      ]\n    },\n    \"trg4\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b b\",\n      \"pos\": [\n        930,\n        492\n      ]\n    },\n    \"rnd_clip4\": {\n      \"type\": \"newobj\",\n      \"text\": \"random @range 1 2\",\n      \"pos\": [\n        930,\n        530\n      ]\n    },\n    \"rnd_time4\": {\n      \"type\": \"newobj\",\n      \"text\": \"random @range 4000 8001\",\n      \"pos\": [\n        1080,\n        566\n      ]\n    },\n    \"rcv_snd4\": {\n      \"type\": \"newobj\",\n      \"text\": \"r SOUNDS\",\n      \"pos\": [\n        1080,\n        464\n      ]\n    },\n    \"pl4\": {\n      \"type\": \"playlist~\",\n      \"inlets\": 1,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"signal\",\n        \"\",\n        \"dictionary\"\n      ],\n      \"size\": [\n        260,\n        96\n      ],\n      \"presentation\": [\n        921,\n        178,\n        243,\n        300\n      ],\n      \"pos\": [\n        930,\n        610\n      ]\n    },\n    \"gain4\": {\n      \"type\": \"live.gain~\",\n      \"size\": [\n        136,\n        30\n      ],\n      \"presentation\": [\n        921,\n        494,\n        136,\n        26\n      ],\n      \"attrs\": {\n        \"orientation\": 1\n      },\n      \"pos\": [\n        930,\n        728\n      ]\n    },\n    \"cmt_lvl4\": {\n      \"type\": \"comment\",\n      \"text\": \"LEVEL\",\n      \"size\": [\n        65,\n        20\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.88,\n          0.89,\n          0.91,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 11.0\n      },\n      \"presentation\": [\n        1067,\n        498,\n        60,\n        18\n      ],\n      \"pos\": [\n        1075,\n        732\n      ]\n    },\n    \"cmt_p_mgain\": {\n      \"type\": \"comment\",\n      \"text\": \"MASTER\",\n      \"size\": [\n        74,\n        20\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.88,\n          0.89,\n          0.91,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 11.0\n      },\n      \"presentation\": [\n        246,\n        616,\n        80,\n        18\n      ],\n      \"pos\": [\n        175,\n        870\n      ]\n    },\n    \"gain_master\": {\n      \"type\": \"live.gain~\",\n      \"size\": [\n        136,\n        30\n      ],\n      \"presentation\": [\n        36,\n        612,\n        200,\n        28\n      ],\n      \"attrs\": {\n        \"orientation\": 1\n      },\n      \"pos\": [\n        30,\n        866\n      ]\n    },\n    \"cmt_p_dac\": {\n      \"type\": \"comment\",\n      \"text\": \"AUDIO ON\",\n      \"size\": [\n        92,\n        20\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.88,\n          0.89,\n          0.91,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 11.0\n      },\n      \"presentation\": [\n        396,\n        616,\n        90,\n        18\n      ],\n      \"pos\": [\n        85,\n        924\n      ]\n    },\n    \"dac\": {\n      \"type\": \"ezdac~\",\n      \"presentation\": [\n        340,\n        604,\n        45,\n        45\n      ],\n      \"pos\": [\n        30,\n        920\n      ]\n    },\n    \"hdr_transport\": {\n      \"type\": \"comment\",\n      \"text\": \"TRANSPORT\",\n      \"size\": [\n        101,\n        20\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 11.0\n      },\n      \"presentation\": [\n        36,\n        26,\n        120,\n        18\n      ],\n      \"pos\": [\n        880,\n        96\n      ]\n    },\n    \"cmt_transport_help\": {\n      \"type\": \"comment\",\n      \"text\": \"each voice picks a new clip every MIN..MAX milliseconds, on its own clock\",\n      \"size\": [\n        300,\n        34\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.62,\n          0.65,\n          0.7,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 10.0\n      },\n      \"presentation\": [\n        36,\n        90,\n        540,\n        18\n      ],\n      \"pos\": [\n        880,\n        122\n      ]\n    },\n    \"hdr_sounds\": {\n      \"type\": \"comment\",\n      \"text\": \"SOUNDS\",\n      \"size\": [\n        74,\n        20\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 11.0\n      },\n      \"presentation\": [\n        636,\n        26,\n        100,\n        18\n      ],\n      \"pos\": [\n        880,\n        172\n      ]\n    },\n    \"cmt_sounds_help\": {\n      \"type\": \"comment\",\n      \"text\": \"ADD SOUND puts one file into all four voices \\u2014 set SOUNDS LOADED to match, then click the speaker and switch PLAY on\",\n      \"size\": [\n        300,\n        48\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.62,\n          0.65,\n          0.7,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 10.0\n      },\n      \"presentation\": [\n        636,\n        90,\n        540,\n        18\n      ],\n      \"pos\": [\n        880,\n        198\n      ]\n    },\n    \"hdr_output\": {\n      \"type\": \"comment\",\n      \"text\": \"OUTPUT\",\n      \"size\": [\n        74,\n        20\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 11.0\n      },\n      \"presentation\": [\n        36,\n        586,\n        100,\n        18\n      ],\n      \"pos\": [\n        880,\n        254\n      ]\n    },\n    \"pnl_transport\": {\n      \"type\": \"panel\",\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"pos\": [\n        880,\n        300\n      ],\n      \"size\": [\n        40,\n        40\n      ],\n      \"presentation\": [\n        20,\n        16,\n        580,\n        112\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.145,\n          0.156,\n          0.176,\n          1.0\n        ],\n        \"bordercolor\": [\n          0.35,\n          0.37,\n          0.4,\n          1.0\n        ],\n        \"border\": 1,\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"pnl_sounds\": {\n      \"type\": \"panel\",\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"pos\": [\n        925,\n        300\n      ],\n      \"size\": [\n        40,\n        40\n      ],\n      \"presentation\": [\n        620,\n        16,\n        580,\n        112\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.145,\n          0.156,\n          0.176,\n          1.0\n        ],\n        \"bordercolor\": [\n          0.35,\n          0.37,\n          0.4,\n          1.0\n        ],\n        \"border\": 1,\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"pnl_v1\": {\n      \"type\": \"panel\",\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"pos\": [\n        970,\n        300\n      ],\n      \"size\": [\n        40,\n        40\n      ],\n      \"presentation\": [\n        20,\n        144,\n        275,\n        416\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.145,\n          0.156,\n          0.176,\n          1.0\n        ],\n        \"bordercolor\": [\n          0.35,\n          0.37,\n          0.4,\n          1.0\n        ],\n        \"border\": 1,\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"pnl_v2\": {\n      \"type\": \"panel\",\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"pos\": [\n        1015,\n        300\n      ],\n      \"size\": [\n        40,\n        40\n      ],\n      \"presentation\": [\n        315,\n        144,\n        275,\n        416\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.145,\n          0.156,\n          0.176,\n          1.0\n        ],\n        \"bordercolor\": [\n          0.35,\n          0.37,\n          0.4,\n          1.0\n        ],\n        \"border\": 1,\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"pnl_v3\": {\n      \"type\": \"panel\",\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"pos\": [\n        1060,\n        300\n      ],\n      \"size\": [\n        40,\n        40\n      ],\n      \"presentation\": [\n        610,\n        144,\n        275,\n        416\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.145,\n          0.156,\n          0.176,\n          1.0\n        ],\n        \"bordercolor\": [\n          0.35,\n          0.37,\n          0.4,\n          1.0\n        ],\n        \"border\": 1,\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"pnl_v4\": {\n      \"type\": \"panel\",\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"pos\": [\n        1105,\n        300\n      ],\n      \"size\": [\n        40,\n        40\n      ],\n      \"presentation\": [\n        905,\n        144,\n        275,\n        416\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.145,\n          0.156,\n          0.176,\n          1.0\n        ],\n        \"bordercolor\": [\n          0.35,\n          0.37,\n          0.4,\n          1.0\n        ],\n        \"border\": 1,\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"pnl_output\": {\n      \"type\": \"panel\",\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"pos\": [\n        1150,\n        300\n      ],\n      \"size\": [\n        40,\n        40\n      ],\n      \"presentation\": [\n        20,\n        576,\n        1180,\n        88\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.145,\n          0.156,\n          0.176,\n          1.0\n        ],\n        \"bordercolor\": [\n          0.35,\n          0.37,\n          0.4,\n          1.0\n        ],\n        \"border\": 1,\n        \"rounded\": 8,\n        \"background\": 1\n      }\n    },\n    \"inc_max\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        330,\n        230\n      ],\n      \"text\": \"+ 1\"\n    },\n    \"pak_range\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        230,\n        266\n      ],\n      \"text\": \"join @triggers -1\"\n    },\n    \"pre_range\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        230,\n        302\n      ],\n      \"text\": \"prepend range\"\n    },\n    \"snd_range\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        230,\n        338\n      ],\n      \"text\": \"s INTRANGE\"\n    },\n    \"inc_n\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        430,\n        230\n      ],\n      \"text\": \"+ 1\"\n    },\n    \"pre_nrange\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        430,\n        266\n      ],\n      \"text\": \"prepend range 1\"\n    },\n    \"snd_nrange\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        430,\n        302\n      ],\n      \"text\": \"s CLIPRANGE\"\n    },\n    \"cmt_excl\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        620,\n        340\n      ],\n      \"size\": [\n        240,\n        48\n      ],\n      \"text\": \"+ 1 on both: random's @range high value is EXCLUSIVE (see random.maxhelp)\",\n      \"attrs\": {\n        \"textcolor\": [\n          0.62,\n          0.65,\n          0.7,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 10.0\n      }\n    },\n    \"cmt_rl\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        400,\n        340\n      ],\n      \"size\": [\n        200,\n        48\n      ],\n      \"text\": \"t i i fires its RIGHT outlet first, so s RUN sits right of the stop cleanup - the cords never cross\",\n      \"attrs\": {\n        \"textcolor\": [\n          0.62,\n          0.65,\n          0.7,\n          1.0\n        ],\n        \"fontname\": \"<Monospaced>\",\n        \"fontsize\": 10.0\n      }\n    },\n    \"rcv_crange1\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        180,\n        400\n      ],\n      \"text\": \"r CLIPRANGE\"\n    },\n    \"rcv_irange1\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        180,\n        432\n      ],\n      \"text\": \"r INTRANGE\"\n    },\n    \"sndl1\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        30,\n        772\n      ],\n      \"text\": \"s~ MIX_L\"\n    },\n    \"sndr1\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        130,\n        772\n      ],\n      \"text\": \"s~ MIX_R\"\n    },\n    \"rcv_crange2\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        480,\n        400\n      ],\n      \"text\": \"r CLIPRANGE\"\n    },\n    \"rcv_irange2\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        480,\n        432\n      ],\n      \"text\": \"r INTRANGE\"\n    },\n    \"sndl2\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        330,\n        772\n      ],\n      \"text\": \"s~ MIX_L\"\n    },\n    \"sndr2\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        430,\n        772\n      ],\n      \"text\": \"s~ MIX_R\"\n    },\n    \"rcv_crange3\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        780,\n        400\n      ],\n      \"text\": \"r CLIPRANGE\"\n    },\n    \"rcv_irange3\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        780,\n        432\n      ],\n      \"text\": \"r INTRANGE\"\n    },\n    \"sndl3\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        630,\n        772\n      ],\n      \"text\": \"s~ MIX_L\"\n    },\n    \"sndr3\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        730,\n        772\n      ],\n      \"text\": \"s~ MIX_R\"\n    },\n    \"rcv_crange4\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        1080,\n        400\n      ],\n      \"text\": \"r CLIPRANGE\"\n    },\n    \"rcv_irange4\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        1080,\n        432\n      ],\n      \"text\": \"r INTRANGE\"\n    },\n    \"sndl4\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        930,\n        772\n      ],\n      \"text\": \"s~ MIX_L\"\n    },\n    \"sndr4\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        1030,\n        772\n      ],\n      \"text\": \"s~ MIX_R\"\n    },\n    \"rcv_mixl\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        30,\n        830\n      ],\n      \"text\": \"r~ MIX_L\"\n    },\n    \"rcv_mixr\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        130,\n        830\n      ],\n      \"text\": \"r~ MIX_R\"\n    }\n  },\n  \"connections\": [\n    [\n      \"tog_play\",\n      0,\n      \"trg_run\",\n      0\n    ],\n    [\n      \"trg_run\",\n      1,\n      \"snd_run\",\n      0\n    ],\n    [\n      \"trg_run\",\n      0,\n      \"sel_stop\",\n      0\n    ],\n    [\n      \"sel_stop\",\n      0,\n      \"msg_stop\",\n      0\n    ],\n    [\n      \"lm_init\",\n      0,\n      \"unp_init\",\n      0\n    ],\n    [\n      \"unp_init\",\n      0,\n      \"num_min\",\n      0\n    ],\n    [\n      \"unp_init\",\n      1,\n      \"num_max\",\n      0\n    ],\n    [\n      \"unp_init\",\n      2,\n      \"num_n\",\n      0\n    ],\n    [\n      \"msg_add\",\n      0,\n      \"trg_add\",\n      0\n    ],\n    [\n      \"trg_add\",\n      0,\n      \"dlg_add\",\n      0\n    ],\n    [\n      \"dlg_add\",\n      0,\n      \"pre_append\",\n      0\n    ],\n    [\n      \"pre_append\",\n      0,\n      \"snd_sounds\",\n      0\n    ],\n    [\n      \"msg_clear\",\n      0,\n      \"snd_sounds\",\n      0\n    ],\n    [\n      \"msg_stop\",\n      0,\n      \"snd_sounds\",\n      0\n    ],\n    [\n      \"rcv_run1\",\n      0,\n      \"met1\",\n      0\n    ],\n    [\n      \"met1\",\n      0,\n      \"trg1\",\n      0\n    ],\n    [\n      \"trg1\",\n      1,\n      \"rnd_time1\",\n      0\n    ],\n    [\n      \"trg1\",\n      0,\n      \"rnd_clip1\",\n      0\n    ],\n    [\n      \"rcv_snd1\",\n      0,\n      \"pl1\",\n      0\n    ],\n    [\n      \"pl1\",\n      0,\n      \"gain1\",\n      0\n    ],\n    [\n      \"pl1\",\n      1,\n      \"gain1\",\n      1\n    ],\n    [\n      \"rcv_run2\",\n      0,\n      \"met2\",\n      0\n    ],\n    [\n      \"met2\",\n      0,\n      \"trg2\",\n      0\n    ],\n    [\n      \"trg2\",\n      1,\n      \"rnd_time2\",\n      0\n    ],\n    [\n      \"trg2\",\n      0,\n      \"rnd_clip2\",\n      0\n    ],\n    [\n      \"rcv_snd2\",\n      0,\n      \"pl2\",\n      0\n    ],\n    [\n      \"pl2\",\n      0,\n      \"gain2\",\n      0\n    ],\n    [\n      \"pl2\",\n      1,\n      \"gain2\",\n      1\n    ],\n    [\n      \"rcv_run3\",\n      0,\n      \"met3\",\n      0\n    ],\n    [\n      \"met3\",\n      0,\n      \"trg3\",\n      0\n    ],\n    [\n      \"trg3\",\n      1,\n      \"rnd_time3\",\n      0\n    ],\n    [\n      \"trg3\",\n      0,\n      \"rnd_clip3\",\n      0\n    ],\n    [\n      \"rcv_snd3\",\n      0,\n      \"pl3\",\n      0\n    ],\n    [\n      \"pl3\",\n      0,\n      \"gain3\",\n      0\n    ],\n    [\n      \"pl3\",\n      1,\n      \"gain3\",\n      1\n    ],\n    [\n      \"rcv_run4\",\n      0,\n      \"met4\",\n      0\n    ],\n    [\n      \"met4\",\n      0,\n      \"trg4\",\n      0\n    ],\n    [\n      \"trg4\",\n      1,\n      \"rnd_time4\",\n      0\n    ],\n    [\n      \"trg4\",\n      0,\n      \"rnd_clip4\",\n      0\n    ],\n    [\n      \"rcv_snd4\",\n      0,\n      \"pl4\",\n      0\n    ],\n    [\n      \"pl4\",\n      0,\n      \"gain4\",\n      0\n    ],\n    [\n      \"pl4\",\n      1,\n      \"gain4\",\n      1\n    ],\n    [\n      \"gain_master\",\n      0,\n      \"dac\",\n      0\n    ],\n    [\n      \"gain_master\",\n      1,\n      \"dac\",\n      1\n    ],\n    [\n      \"num_min\",\n      0,\n      \"pak_range\",\n      0\n    ],\n    [\n      \"num_max\",\n      0,\n      \"inc_max\",\n      0\n    ],\n    [\n      \"inc_max\",\n      0,\n      \"pak_range\",\n      1\n    ],\n    [\n      \"pak_range\",\n      0,\n      \"pre_range\",\n      0\n    ],\n    [\n      \"pre_range\",\n      0,\n      \"snd_range\",\n      0\n    ],\n    [\n      \"num_n\",\n      0,\n      \"inc_n\",\n      0\n    ],\n    [\n      \"inc_n\",\n      0,\n      \"pre_nrange\",\n      0\n    ],\n    [\n      \"pre_nrange\",\n      0,\n      \"snd_nrange\",\n      0\n    ],\n    [\n      \"rcv_crange1\",\n      0,\n      \"rnd_clip1\",\n      0\n    ],\n    [\n      \"rcv_irange1\",\n      0,\n      \"rnd_time1\",\n      0\n    ],\n    [\n      \"rnd_clip1\",\n      0,\n      \"pl1\",\n      0\n    ],\n    [\n      \"gain1\",\n      0,\n      \"sndl1\",\n      0\n    ],\n    [\n      \"gain1\",\n      1,\n      \"sndr1\",\n      0\n    ],\n    [\n      \"rcv_crange2\",\n      0,\n      \"rnd_clip2\",\n      0\n    ],\n    [\n      \"rcv_irange2\",\n      0,\n      \"rnd_time2\",\n      0\n    ],\n    [\n      \"rnd_clip2\",\n      0,\n      \"pl2\",\n      0\n    ],\n    [\n      \"gain2\",\n      0,\n      \"sndl2\",\n      0\n    ],\n    [\n      \"gain2\",\n      1,\n      \"sndr2\",\n      0\n    ],\n    [\n      \"rcv_crange3\",\n      0,\n      \"rnd_clip3\",\n      0\n    ],\n    [\n      \"rcv_irange3\",\n      0,\n      \"rnd_time3\",\n      0\n    ],\n    [\n      \"rnd_clip3\",\n      0,\n      \"pl3\",\n      0\n    ],\n    [\n      \"gain3\",\n      0,\n      \"sndl3\",\n      0\n    ],\n    [\n      \"gain3\",\n      1,\n      \"sndr3\",\n      0\n    ],\n    [\n      \"rcv_crange4\",\n      0,\n      \"rnd_clip4\",\n      0\n    ],\n    [\n      \"rcv_irange4\",\n      0,\n      \"rnd_time4\",\n      0\n    ],\n    [\n      \"rnd_clip4\",\n      0,\n      \"pl4\",\n      0\n    ],\n    [\n      \"gain4\",\n      0,\n      \"sndl4\",\n      0\n    ],\n    [\n      \"gain4\",\n      1,\n      \"sndr4\",\n      0\n    ],\n    [\n      \"rcv_mixl\",\n      0,\n      \"gain_master\",\n      0\n    ],\n    [\n      \"rcv_mixr\",\n      0,\n      \"gain_master\",\n      1\n    ],\n    [\n      \"rnd_time1\",\n      0,\n      \"met1\",\n      1\n    ],\n    [\n      \"rnd_time2\",\n      0,\n      \"met2\",\n      1\n    ],\n    [\n      \"rnd_time3\",\n      0,\n      \"met3\",\n      1\n    ],\n    [\n      \"rnd_time4\",\n      0,\n      \"met4\",\n      1\n    ]\n  ]\n}\n--- END SPEC ---",
          "fontsize": 9.0,
          "hidden": 1
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "obj-3",
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
            "obj-4",
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
            "obj-5",
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
            "obj-12",
            0
          ],
          "source": [
            "obj-8",
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
            "obj-8",
            2
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
            "obj-20",
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
            "obj-20",
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
            "obj-23",
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
            "obj-26",
            0
          ],
          "source": [
            "obj-24",
            1
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
            "obj-33",
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
            "obj-34",
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
            "obj-36",
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
            "obj-38",
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
            "obj-39",
            1
          ],
          "source": [
            "obj-38",
            1
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
            "obj-46",
            0
          ],
          "source": [
            "obj-44",
            1
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
            "obj-48",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-49",
            1
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
            "obj-56",
            0
          ],
          "source": [
            "obj-54",
            1
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
            "obj-59",
            1
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
            "obj-64",
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
            "obj-64",
            1
          ],
          "source": [
            "obj-62",
            1
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
            "obj-10",
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
            "obj-12",
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
            "obj-79",
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
            "obj-14",
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
            "obj-83",
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
            "obj-25",
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
            "obj-26",
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
            "obj-28",
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
            "obj-88",
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
            "obj-89",
            0
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
            "obj-35",
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
            "obj-38",
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
            "obj-92",
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
            "obj-93",
            0
          ],
          "source": [
            "obj-39",
            1
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
            "obj-94",
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
            "obj-95",
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
            "obj-45",
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
            "obj-49",
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
            "obj-49",
            1
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
            "obj-98",
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
            "obj-99",
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
            "obj-100",
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
            "obj-101",
            0
          ],
          "source": [
            "obj-59",
            1
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
            "obj-102",
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
            "obj-103",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-23",
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
            "obj-33",
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
            "obj-43",
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
            "obj-53",
            1
          ],
          "source": [
            "obj-56",
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
