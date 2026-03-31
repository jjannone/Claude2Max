{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 8,
      "minor": 6,
      "revision": 5,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      100.0,
      100.0,
      900.0,
      760.0
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
          "text": "one-sound-a-day-js",
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
            20.0,
            20.0,
            90.0,
            22.0
          ],
          "text": "loadmess 1"
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            20.0,
            55.0,
            90.0,
            22.0
          ],
          "text": "metro 1000"
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 6,
          "outlettype": [
            "",
            "",
            "",
            "bang",
            "bang",
            "int"
          ],
          "patching_rect": [
            20.0,
            90.0,
            190.0,
            22.0
          ],
          "text": "v8 onesound.js"
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            20.0,
            140.0,
            97.0,
            22.0
          ],
          "text": "prepend set"
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
            20.0,
            175.0,
            180.0,
            49.0
          ],
          "text": "11:21:26",
          "presentation": 1,
          "presentation_rect": [
            193.0,
            128.0,
            180.0,
            49.0
          ],
          "fontsize": 36.0,
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ]
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
            215.0,
            140.0,
            97.0,
            22.0
          ],
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            215.0,
            175.0,
            200.0,
            49.0
          ],
          "text": "3/30/2026",
          "presentation": 1,
          "presentation_rect": [
            377.0,
            128.0,
            208.0,
            49.0
          ],
          "fontsize": 24.0,
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            430.0,
            140.0,
            97.0,
            22.0
          ],
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            430.0,
            175.0,
            180.0,
            49.0
          ],
          "text": "13:11:14",
          "presentation": 1,
          "presentation_rect": [
            9.0,
            128.0,
            173.0,
            49.0
          ],
          "fontsize": 36.0,
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            ""
          ],
          "patching_rect": [
            430.0,
            245.0,
            55.0,
            22.0
          ],
          "text": "sel 1"
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            430.0,
            280.0,
            55.0,
            22.0
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            430.0,
            315.0,
            139.0,
            22.0
          ],
          "text": "textcolor 1 0 0 1"
        }
      },
      {
        "box": {
          "id": "obj-13",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            530.0,
            280.0,
            83.0,
            22.0
          ],
          "text": "delay 250"
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            530.0,
            315.0,
            139.0,
            22.0
          ],
          "text": "textcolor 0 0 0 1"
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
            20.0,
            350.0,
            40.0,
            22.0
          ],
          "text": "1"
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
            665.0,
            50.0,
            76.0,
            22.0
          ],
          "text": "day mode"
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "umenu",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            650.0,
            68.0,
            220.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            13.0,
            175.0,
            222.0,
            22.0
          ],
          "items": [
            "keep",
            "same",
            "target",
            "time",
            "each",
            "day",
            ",",
            "new",
            "random",
            "target",
            "time",
            "each",
            "day"
          ]
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
            650.0,
            103.0,
            125.0,
            22.0
          ],
          "text": "prepend setmode"
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
            650.0,
            143.0,
            174.0,
            22.0
          ],
          "text": "random new target time",
          "presentation": 1,
          "presentation_rect": [
            13.0,
            68.0,
            135.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            650.0,
            178.0,
            174.0,
            22.0
          ],
          "text": "select new target time",
          "presentation": 1,
          "presentation_rect": [
            13.0,
            92.0,
            135.0,
            22.0
          ]
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
          "patching_rect": [
            650.0,
            215.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-22",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 3,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            650.0,
            250.0,
            286.0,
            22.0
          ],
          "text": "dialog \"enter target time in HH:MM:SS\""
        }
      },
      {
        "box": {
          "id": "obj-23",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            650.0,
            290.0,
            104.0,
            22.0
          ],
          "text": "route symbol"
        }
      },
      {
        "box": {
          "id": "obj-24",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            650.0,
            325.0,
            153.0,
            22.0
          ],
          "text": "prepend parsetarget"
        }
      },
      {
        "box": {
          "id": "obj-25",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            530.0,
            390.0,
            125.0,
            22.0
          ],
          "text": "load sound file",
          "presentation": 1,
          "presentation_rect": [
            581.0,
            262.0,
            86.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-26",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            530.0,
            425.0,
            62.0,
            22.0
          ],
          "text": "append"
        }
      },
      {
        "box": {
          "id": "obj-27",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 5,
          "outlettype": [
            "signal",
            "signal",
            "bang",
            "int",
            "int"
          ],
          "patching_rect": [
            130.0,
            460.0,
            600.0,
            83.0
          ],
          "text": "playlist~",
          "presentation": 1,
          "presentation_rect": [
            70.0,
            286.0,
            597.0,
            83.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-28",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            185.0,
            555.0,
            90.0,
            22.0
          ],
          "text": "loadmess 1"
        }
      },
      {
        "box": {
          "id": "obj-29",
          "maxclass": "ezdac~",
          "numinlets": 2,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            130.0,
            590.0,
            45.0,
            45.0
          ],
          "presentation": 1,
          "presentation_rect": [
            17.0,
            324.0,
            45.0,
            45.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-30",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            800.0,
            20.0,
            90.0,
            22.0
          ],
          "text": "loadmess 1"
        }
      },
      {
        "box": {
          "id": "obj-31",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            800.0,
            55.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            16.0,
            425.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-32",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            800.0,
            90.0,
            125.0,
            22.0
          ],
          "text": "presentation $1"
        }
      },
      {
        "box": {
          "id": "obj-33",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            800.0,
            125.0,
            97.0,
            22.0
          ],
          "text": "thispatcher"
        }
      },
      {
        "box": {
          "id": "obj-34",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            800.0,
            165.0,
            76.0,
            22.0
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "obj-35",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            800.0,
            200.0,
            300.0,
            22.0
          ],
          "text": "window size 100 100 780 480, window exec"
        }
      },
      {
        "box": {
          "id": "obj-36",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            800.0,
            240.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            17.0,
            396.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-37",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            20.0,
            660.0,
            125.0,
            22.0
          ],
          "text": "one sound a day",
          "presentation": 1,
          "presentation_rect": [
            13.0,
            4.0,
            363.0,
            60.0
          ],
          "fontsize": 18.0
        }
      },
      {
        "box": {
          "id": "obj-38",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            35.0,
            165.0,
            104.0,
            22.0
          ],
          "text": "current time",
          "presentation": 1,
          "presentation_rect": [
            201.0,
            119.0,
            150.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-39",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            445.0,
            165.0,
            97.0,
            22.0
          ],
          "text": "target time",
          "presentation": 1,
          "presentation_rect": [
            13.0,
            119.0,
            150.0,
            20.0
          ]
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
            830.0,
            243.0,
            125.0,
            22.0
          ],
          "text": "fix window size",
          "presentation": 1,
          "presentation_rect": [
            46.0,
            398.0,
            92.0,
            20.0
          ]
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
            830.0,
            57.0,
            139.0,
            22.0
          ],
          "text": "presentation mode",
          "presentation": 1,
          "presentation_rect": [
            45.0,
            425.0,
            108.0,
            20.0
          ]
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
            722.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"name\": \"one-sound-a-day-js\",\n  \"width\": 900,\n  \"height\": 760,\n  \"objects\": {\n    \"loadmess_start\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 1\",\n      \"pos\": [\n        20,\n        20\n      ]\n    },\n    \"metro_clock\": {\n      \"type\": \"newobj\",\n      \"text\": \"metro 1000\",\n      \"pos\": [\n        20,\n        55\n      ]\n    },\n    \"v8_clock\": {\n      \"type\": \"newobj\",\n      \"text\": \"v8 onesound.js\",\n      \"pos\": [\n        20,\n        90\n      ],\n      \"size\": [\n        190,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 6,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\",\n        \"bang\",\n        \"bang\",\n        \"int\"\n      ]\n    },\n    \"set_curtime\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend set\",\n      \"pos\": [\n        20,\n        140\n      ]\n    },\n    \"disp_curtime\": {\n      \"type\": \"message\",\n      \"text\": \"11:21:26\",\n      \"pos\": [\n        20,\n        175\n      ],\n      \"size\": [\n        180,\n        49\n      ],\n      \"attrs\": {\n        \"fontsize\": 36.0,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ]\n      },\n      \"presentation\": [\n        193,\n        128,\n        180,\n        49\n      ]\n    },\n    \"set_date\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend set\",\n      \"pos\": [\n        215,\n        140\n      ]\n    },\n    \"disp_date\": {\n      \"type\": \"message\",\n      \"text\": \"3/30/2026\",\n      \"pos\": [\n        215,\n        175\n      ],\n      \"size\": [\n        200,\n        49\n      ],\n      \"attrs\": {\n        \"fontsize\": 24.0,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ]\n      },\n      \"presentation\": [\n        377,\n        128,\n        208,\n        49\n      ]\n    },\n    \"set_target\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend set\",\n      \"pos\": [\n        430,\n        140\n      ]\n    },\n    \"disp_target\": {\n      \"type\": \"message\",\n      \"text\": \"13:11:14\",\n      \"pos\": [\n        430,\n        175\n      ],\n      \"size\": [\n        180,\n        49\n      ],\n      \"attrs\": {\n        \"fontsize\": 36.0,\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ]\n      },\n      \"presentation\": [\n        9,\n        128,\n        173,\n        49\n      ]\n    },\n    \"sel_active\": {\n      \"type\": \"newobj\",\n      \"text\": \"sel 1\",\n      \"pos\": [\n        430,\n        245\n      ]\n    },\n    \"trig_blink\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b b\",\n      \"pos\": [\n        430,\n        280\n      ]\n    },\n    \"msg_red\": {\n      \"type\": \"message\",\n      \"text\": \"textcolor 1 0 0 1\",\n      \"pos\": [\n        430,\n        315\n      ]\n    },\n    \"delay_blink\": {\n      \"type\": \"newobj\",\n      \"text\": \"delay 250\",\n      \"pos\": [\n        530,\n        280\n      ]\n    },\n    \"msg_black\": {\n      \"type\": \"message\",\n      \"text\": \"textcolor 0 0 0 1\",\n      \"pos\": [\n        530,\n        315\n      ]\n    },\n    \"msg_play1\": {\n      \"type\": \"message\",\n      \"text\": \"1\",\n      \"pos\": [\n        20,\n        350\n      ]\n    },\n    \"lbl_mode\": {\n      \"type\": \"comment\",\n      \"text\": \"day mode\",\n      \"pos\": [\n        665,\n        50\n      ]\n    },\n    \"umenu_mode\": {\n      \"type\": \"umenu\",\n      \"pos\": [\n        650,\n        68\n      ],\n      \"size\": [\n        220,\n        22\n      ],\n      \"attrs\": {\n        \"items\": [\n          \"keep\",\n          \"same\",\n          \"target\",\n          \"time\",\n          \"each\",\n          \"day\",\n          \",\",\n          \"new\",\n          \"random\",\n          \"target\",\n          \"time\",\n          \"each\",\n          \"day\"\n        ]\n      },\n      \"presentation\": [\n        13,\n        175,\n        222,\n        22\n      ]\n    },\n    \"prepend_mode\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend setmode\",\n      \"pos\": [\n        650,\n        103\n      ]\n    },\n    \"msg_random\": {\n      \"type\": \"message\",\n      \"text\": \"random new target time\",\n      \"pos\": [\n        650,\n        143\n      ],\n      \"presentation\": [\n        13,\n        68,\n        135,\n        22\n      ]\n    },\n    \"msg_select\": {\n      \"type\": \"message\",\n      \"text\": \"select new target time\",\n      \"pos\": [\n        650,\n        178\n      ],\n      \"presentation\": [\n        13,\n        92,\n        135,\n        22\n      ]\n    },\n    \"btn_dialog\": {\n      \"type\": \"button\",\n      \"pos\": [\n        650,\n        215\n      ]\n    },\n    \"dialog_time\": {\n      \"type\": \"newobj\",\n      \"text\": \"dialog \\\"enter target time in HH:MM:SS\\\"\",\n      \"pos\": [\n        650,\n        250\n      ],\n      \"inlets\": 2,\n      \"outlets\": 3\n    },\n    \"route_sym\": {\n      \"type\": \"newobj\",\n      \"text\": \"route symbol\",\n      \"pos\": [\n        650,\n        290\n      ]\n    },\n    \"prepend_parse\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend parsetarget\",\n      \"pos\": [\n        650,\n        325\n      ]\n    },\n    \"msg_load_ui\": {\n      \"type\": \"message\",\n      \"text\": \"load sound file\",\n      \"pos\": [\n        530,\n        390\n      ],\n      \"presentation\": [\n        581,\n        262,\n        86,\n        22\n      ]\n    },\n    \"msg_append_msg\": {\n      \"type\": \"message\",\n      \"text\": \"append\",\n      \"pos\": [\n        530,\n        425\n      ]\n    },\n    \"playlist_\": {\n      \"type\": \"newobj\",\n      \"text\": \"playlist~\",\n      \"pos\": [\n        130,\n        460\n      ],\n      \"size\": [\n        600,\n        83\n      ],\n      \"inlets\": 1,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\",\n        \"bang\",\n        \"int\",\n        \"int\"\n      ],\n      \"presentation\": [\n        70,\n        286,\n        597,\n        83\n      ]\n    },\n    \"loadmess_dac\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 1\",\n      \"pos\": [\n        185,\n        555\n      ]\n    },\n    \"ezdac_\": {\n      \"type\": \"ezdac~\",\n      \"pos\": [\n        130,\n        590\n      ],\n      \"presentation\": [\n        17,\n        324,\n        45,\n        45\n      ]\n    },\n    \"loadmess_pres\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 1\",\n      \"pos\": [\n        800,\n        20\n      ]\n    },\n    \"toggle_pres\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        800,\n        55\n      ],\n      \"presentation\": [\n        16,\n        425,\n        24,\n        24\n      ]\n    },\n    \"msg_pres\": {\n      \"type\": \"message\",\n      \"text\": \"presentation $1\",\n      \"pos\": [\n        800,\n        90\n      ]\n    },\n    \"thispatcher\": {\n      \"type\": \"newobj\",\n      \"text\": \"thispatcher\",\n      \"pos\": [\n        800,\n        125\n      ]\n    },\n    \"loadbang_win\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        800,\n        165\n      ]\n    },\n    \"msg_win\": {\n      \"type\": \"message\",\n      \"text\": \"window size 100 100 780 480, window exec\",\n      \"pos\": [\n        800,\n        200\n      ]\n    },\n    \"btn_fix_win\": {\n      \"type\": \"button\",\n      \"pos\": [\n        800,\n        240\n      ],\n      \"presentation\": [\n        17,\n        396,\n        24,\n        24\n      ]\n    },\n    \"lbl_title\": {\n      \"type\": \"comment\",\n      \"text\": \"one sound a day\",\n      \"pos\": [\n        20,\n        660\n      ],\n      \"attrs\": {\n        \"fontsize\": 18.0\n      },\n      \"presentation\": [\n        13,\n        4,\n        363,\n        60\n      ]\n    },\n    \"lbl_curtime_p\": {\n      \"type\": \"comment\",\n      \"text\": \"current time\",\n      \"pos\": [\n        35,\n        165\n      ],\n      \"presentation\": [\n        201,\n        119,\n        150,\n        20\n      ]\n    },\n    \"lbl_target_p\": {\n      \"type\": \"comment\",\n      \"text\": \"target time\",\n      \"pos\": [\n        445,\n        165\n      ],\n      \"presentation\": [\n        13,\n        119,\n        150,\n        20\n      ]\n    },\n    \"lbl_fix_win\": {\n      \"type\": \"comment\",\n      \"text\": \"fix window size\",\n      \"pos\": [\n        830,\n        243\n      ],\n      \"presentation\": [\n        46,\n        398,\n        92,\n        20\n      ]\n    },\n    \"lbl_pres_mode\": {\n      \"type\": \"comment\",\n      \"text\": \"presentation mode\",\n      \"pos\": [\n        830,\n        57\n      ],\n      \"presentation\": [\n        45,\n        425,\n        108,\n        20\n      ]\n    }\n  },\n  \"connections\": [\n    [\n      \"loadmess_start\",\n      0,\n      \"metro_clock\",\n      0\n    ],\n    [\n      \"metro_clock\",\n      0,\n      \"v8_clock\",\n      0\n    ],\n    [\n      \"v8_clock\",\n      0,\n      \"set_curtime\",\n      0\n    ],\n    [\n      \"set_curtime\",\n      0,\n      \"disp_curtime\",\n      0\n    ],\n    [\n      \"v8_clock\",\n      1,\n      \"set_date\",\n      0\n    ],\n    [\n      \"set_date\",\n      0,\n      \"disp_date\",\n      0\n    ],\n    [\n      \"v8_clock\",\n      2,\n      \"set_target\",\n      0\n    ],\n    [\n      \"set_target\",\n      0,\n      \"disp_target\",\n      0\n    ],\n    [\n      \"v8_clock\",\n      3,\n      \"msg_play1\",\n      0\n    ],\n    [\n      \"v8_clock\",\n      4,\n      \"msg_play1\",\n      0\n    ],\n    [\n      \"msg_play1\",\n      0,\n      \"playlist_\",\n      0\n    ],\n    [\n      \"v8_clock\",\n      5,\n      \"sel_active\",\n      0\n    ],\n    [\n      \"sel_active\",\n      0,\n      \"trig_blink\",\n      0\n    ],\n    [\n      \"sel_active\",\n      1,\n      \"msg_black\",\n      0\n    ],\n    [\n      \"trig_blink\",\n      0,\n      \"msg_red\",\n      0\n    ],\n    [\n      \"trig_blink\",\n      1,\n      \"delay_blink\",\n      0\n    ],\n    [\n      \"msg_red\",\n      0,\n      \"disp_target\",\n      0\n    ],\n    [\n      \"delay_blink\",\n      0,\n      \"msg_black\",\n      0\n    ],\n    [\n      \"msg_black\",\n      0,\n      \"disp_target\",\n      0\n    ],\n    [\n      \"umenu_mode\",\n      0,\n      \"prepend_mode\",\n      0\n    ],\n    [\n      \"prepend_mode\",\n      0,\n      \"v8_clock\",\n      0\n    ],\n    [\n      \"msg_random\",\n      0,\n      \"v8_clock\",\n      0\n    ],\n    [\n      \"msg_select\",\n      0,\n      \"btn_dialog\",\n      0\n    ],\n    [\n      \"btn_dialog\",\n      0,\n      \"dialog_time\",\n      0\n    ],\n    [\n      \"dialog_time\",\n      0,\n      \"route_sym\",\n      0\n    ],\n    [\n      \"route_sym\",\n      0,\n      \"prepend_parse\",\n      0\n    ],\n    [\n      \"prepend_parse\",\n      0,\n      \"v8_clock\",\n      0\n    ],\n    [\n      \"msg_load_ui\",\n      0,\n      \"msg_append_msg\",\n      0\n    ],\n    [\n      \"msg_append_msg\",\n      0,\n      \"playlist_\",\n      0\n    ],\n    [\n      \"playlist_\",\n      0,\n      \"ezdac_\",\n      0\n    ],\n    [\n      \"playlist_\",\n      1,\n      \"ezdac_\",\n      1\n    ],\n    [\n      \"loadmess_dac\",\n      0,\n      \"ezdac_\",\n      0\n    ],\n    [\n      \"loadmess_pres\",\n      0,\n      \"toggle_pres\",\n      0\n    ],\n    [\n      \"toggle_pres\",\n      0,\n      \"msg_pres\",\n      0\n    ],\n    [\n      \"msg_pres\",\n      0,\n      \"thispatcher\",\n      0\n    ],\n    [\n      \"loadbang_win\",\n      0,\n      \"msg_win\",\n      0\n    ],\n    [\n      \"msg_win\",\n      0,\n      \"thispatcher\",\n      0\n    ],\n    [\n      \"btn_fix_win\",\n      0,\n      \"msg_win\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
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
            "obj-6",
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
            "obj-7",
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
            "obj-8",
            0
          ],
          "source": [
            "obj-3",
            2
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
            "obj-15",
            0
          ],
          "source": [
            "obj-3",
            3
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
            "obj-3",
            4
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
            "obj-15",
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
            "obj-3",
            5
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
            "obj-14",
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
            "obj-12",
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
            "obj-13",
            0
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
            "obj-9",
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
            "obj-14",
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
            "obj-9",
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
            "obj-3",
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
            "obj-21",
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
            "obj-3",
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
            "obj-29",
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
            "obj-27",
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
            "obj-31",
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
            "obj-32",
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
            "obj-33",
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
            "obj-35",
            0
          ],
          "source": [
            "obj-36",
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
