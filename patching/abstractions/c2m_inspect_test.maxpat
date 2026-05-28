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
          "text": "c2m_inspect_test",
          "fontsize": 16.0,
          "fontface": 1
        }
      },
      {
        "box": {
          "id": "obj-1",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            20.0,
            16.0,
            840.0,
            22.0
          ],
          "text": "c2m.inspect test harness \u2014 every route has a button; run dumps from Max OR from `python3 tools/c2m_inspect_send.py \u2026`"
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            40.0,
            90.0,
            97.0,
            22.0
          ],
          "text": "c2m.inspect"
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
            200.0,
            90.0,
            560.0,
            20.0
          ],
          "text": "\u2191 OSC listener abstraction (UDP 7474). Also accepts direct messages on inlet 0."
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
            40.0,
            130.0,
            118.0,
            22.0
          ],
          "text": "print c2m.test"
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
            40.0,
            180.0,
            500.0,
            20.0
          ],
          "text": "TEST DATA  \u2014 loadbang populates each below with known values"
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            40.0,
            210.0,
            76.0,
            22.0
          ],
          "text": "loadbang"
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
            40.0,
            250.0,
            468.0,
            22.0
          ],
          "text": "clear, store 1 alpha, store 2 beta, store 3 gamma, store 4 delta"
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 4,
          "outlettype": [
            "",
            "",
            "",
            ""
          ],
          "patching_rect": [
            40.0,
            310.0,
            118.0,
            22.0
          ],
          "text": "coll TEST_COLL"
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
            40.0,
            290.0,
            160.0,
            18.0
          ],
          "text": "coll TEST_COLL"
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            280.0,
            250.0,
            405.0,
            22.0
          ],
          "text": "clear, set tempo 120, set key Cmajor, set steps 1 2 3 4"
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 4,
          "outlettype": [
            "dictionary",
            "",
            "",
            ""
          ],
          "patching_rect": [
            280.0,
            310.0,
            118.0,
            22.0
          ],
          "text": "dict TEST_DICT"
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            280.0,
            290.0,
            160.0,
            18.0
          ],
          "text": "dict TEST_DICT"
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
            520.0,
            250.0,
            671.0,
            22.0
          ],
          "text": "clear, set 0 100, set 1 200, set 2 300, set 3 400, set 4 500, set 5 600, set 6 700, set 7 800"
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "int",
            "bang"
          ],
          "patching_rect": [
            520.0,
            310.0,
            195.0,
            22.0
          ],
          "text": "table TEST_TABLE @size 16"
        }
      },
      {
        "box": {
          "id": "obj-15",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            520.0,
            290.0,
            220.0,
            18.0
          ],
          "text": "table TEST_TABLE (size 16)"
        }
      },
      {
        "box": {
          "id": "obj-16",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            40.0,
            380.0,
            160.0,
            22.0
          ],
          "text": "buffer~ TEST_BUF 250"
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            40.0,
            360.0,
            300.0,
            18.0
          ],
          "text": "buffer~ TEST_BUF (250 ms, empty samples)"
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            340.0,
            360.0,
            83.0,
            22.0
          ],
          "text": "setall 99"
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            340.0,
            410.0,
            230.0,
            22.0
          ],
          "text": "jit.matrix TEST_MAT 3 char 4 4"
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            340.0,
            390.0,
            320.0,
            18.0
          ],
          "text": "jit.matrix TEST_MAT (3 char 4x4, all cells = 99)"
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
            40.0,
            470.0,
            620.0,
            20.0
          ],
          "text": "DIRECT TEST BUTTONS \u2014 fire each route locally (bypasses OSC, exercises v8 dumper)"
        }
      },
      {
        "box": {
          "id": "obj-22",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            40.0,
            500.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            12.0,
            60.0,
            24.0,
            24.0
          ]
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
            40.0,
            530.0,
            40.0,
            18.0
          ],
          "text": "ping",
          "presentation": 1,
          "presentation_rect": [
            40.0,
            60.0,
            40.0,
            18.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-24",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            40.0,
            555.0,
            48.0,
            22.0
          ],
          "text": "ping",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-25",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            110.0,
            500.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            92.0,
            60.0,
            24.0,
            24.0
          ]
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
            110.0,
            530.0,
            40.0,
            18.0
          ],
          "text": "scan",
          "presentation": 1,
          "presentation_rect": [
            120.0,
            60.0,
            40.0,
            18.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-27",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            110.0,
            555.0,
            48.0,
            22.0
          ],
          "text": "scan",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-28",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            200.0,
            500.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            172.0,
            60.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-29",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            200.0,
            530.0,
            70.0,
            18.0
          ],
          "text": "dump dict",
          "presentation": 1,
          "presentation_rect": [
            200.0,
            60.0,
            80.0,
            18.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-30",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            200.0,
            555.0,
            167.0,
            22.0
          ],
          "text": "dump d dict TEST_DICT",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-31",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            310.0,
            500.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            284.0,
            60.0,
            24.0,
            24.0
          ]
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
            310.0,
            530.0,
            70.0,
            18.0
          ],
          "text": "dump coll",
          "presentation": 1,
          "presentation_rect": [
            312.0,
            60.0,
            80.0,
            18.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-33",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            310.0,
            555.0,
            167.0,
            22.0
          ],
          "text": "dump c coll TEST_COLL",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-34",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            420.0,
            500.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            396.0,
            60.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-35",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            420.0,
            530.0,
            80.0,
            18.0
          ],
          "text": "dump table",
          "presentation": 1,
          "presentation_rect": [
            424.0,
            60.0,
            80.0,
            18.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-36",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            420.0,
            555.0,
            181.0,
            22.0
          ],
          "text": "dump u table TEST_TABLE",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-37",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            530.0,
            500.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            508.0,
            60.0,
            24.0,
            24.0
          ]
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
            530.0,
            530.0,
            90.0,
            18.0
          ],
          "text": "dump buffer~",
          "presentation": 1,
          "presentation_rect": [
            536.0,
            60.0,
            100.0,
            18.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-39",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            530.0,
            555.0,
            181.0,
            22.0
          ],
          "text": "dump b buffer~ TEST_BUF",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-40",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            660.0,
            500.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            640.0,
            60.0,
            24.0,
            24.0
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
            660.0,
            530.0,
            110.0,
            18.0
          ],
          "text": "dump jit.matrix",
          "presentation": 1,
          "presentation_rect": [
            668.0,
            60.0,
            120.0,
            18.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-42",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            660.0,
            555.0,
            202.0,
            22.0
          ],
          "text": "dump m jit.matrix TEST_MAT",
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "obj-43",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            40.0,
            620.0,
            820.0,
            130.0
          ],
          "text": "OSC TEST \u2014 from the repo root:\n  python3 tools/c2m_inspect_send.py --timeout 2 ping\n  python3 tools/c2m_inspect_send.py --timeout 2 scan\n  python3 tools/c2m_inspect_send.py --timeout 2 dump d dict       TEST_DICT\n  python3 tools/c2m_inspect_send.py --timeout 2 dump c coll       TEST_COLL\n  python3 tools/c2m_inspect_send.py --timeout 2 dump u table      TEST_TABLE\n  python3 tools/c2m_inspect_send.py --timeout 2 dump b buffer~    TEST_BUF\n  python3 tools/c2m_inspect_send.py --timeout 2 dump m jit.matrix TEST_MAT",
          "presentation": 1,
          "presentation_rect": [
            12.0,
            100.0,
            820.0,
            130.0
          ],
          "linecount": 8
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
            40.0,
            760.0,
            400.0,
            22.0
          ],
          "text": "c2m.inspect test harness",
          "presentation": 1,
          "presentation_rect": [
            10.0,
            8.0,
            400.0,
            22.0
          ],
          "fontsize": 14.0
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
            40.0,
            790.0,
            600.0,
            22.0
          ],
          "text": "TEST_COLL \u00b7 TEST_DICT \u00b7 TEST_TABLE \u00b7 TEST_BUF \u00b7 TEST_MAT",
          "presentation": 1,
          "presentation_rect": [
            10.0,
            34.0,
            600.0,
            22.0
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
            852.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"name\": \"c2m_inspect_test\",\n  \"width\": 900,\n  \"height\": 760,\n  \"openinpresentation\": 1,\n  \"objects\": {\n    \"title\": {\n      \"type\": \"comment\",\n      \"text\": \"c2m.inspect test harness \\u2014 every route has a button; run dumps from Max OR from `python3 tools/c2m_inspect_send.py \\u2026`\",\n      \"pos\": [\n        20,\n        16\n      ],\n      \"size\": [\n        840,\n        22\n      ]\n    },\n    \"abs\": {\n      \"type\": \"newobj\",\n      \"text\": \"c2m.inspect\",\n      \"pos\": [\n        40,\n        90\n      ]\n    },\n    \"abs_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"\\u2191 OSC listener abstraction (UDP 7474). Also accepts direct messages on inlet 0.\",\n      \"pos\": [\n        200,\n        90\n      ],\n      \"size\": [\n        560,\n        20\n      ]\n    },\n    \"abs_print\": {\n      \"type\": \"newobj\",\n      \"text\": \"print c2m.test\",\n      \"pos\": [\n        40,\n        130\n      ]\n    },\n    \"data_section_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"TEST DATA  \\u2014 loadbang populates each below with known values\",\n      \"pos\": [\n        40,\n        180\n      ],\n      \"size\": [\n        500,\n        20\n      ]\n    },\n    \"loadbang_box\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        40,\n        210\n      ]\n    },\n    \"init_coll_msg\": {\n      \"type\": \"message\",\n      \"text\": \"clear, store 1 alpha, store 2 beta, store 3 gamma, store 4 delta\",\n      \"pos\": [\n        40,\n        250\n      ]\n    },\n    \"test_coll\": {\n      \"type\": \"newobj\",\n      \"text\": \"coll TEST_COLL\",\n      \"pos\": [\n        40,\n        310\n      ]\n    },\n    \"test_coll_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"coll TEST_COLL\",\n      \"pos\": [\n        40,\n        290\n      ],\n      \"size\": [\n        160,\n        18\n      ]\n    },\n    \"init_dict_msg\": {\n      \"type\": \"message\",\n      \"text\": \"clear, set tempo 120, set key Cmajor, set steps 1 2 3 4\",\n      \"pos\": [\n        280,\n        250\n      ]\n    },\n    \"test_dict\": {\n      \"type\": \"newobj\",\n      \"text\": \"dict TEST_DICT\",\n      \"pos\": [\n        280,\n        310\n      ]\n    },\n    \"test_dict_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"dict TEST_DICT\",\n      \"pos\": [\n        280,\n        290\n      ],\n      \"size\": [\n        160,\n        18\n      ]\n    },\n    \"init_table_msg\": {\n      \"type\": \"message\",\n      \"text\": \"clear, set 0 100, set 1 200, set 2 300, set 3 400, set 4 500, set 5 600, set 6 700, set 7 800\",\n      \"pos\": [\n        520,\n        250\n      ]\n    },\n    \"test_table\": {\n      \"type\": \"newobj\",\n      \"text\": \"table TEST_TABLE @size 16\",\n      \"pos\": [\n        520,\n        310\n      ]\n    },\n    \"test_table_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"table TEST_TABLE (size 16)\",\n      \"pos\": [\n        520,\n        290\n      ],\n      \"size\": [\n        220,\n        18\n      ]\n    },\n    \"test_buffer\": {\n      \"type\": \"newobj\",\n      \"text\": \"buffer~ TEST_BUF 250\",\n      \"pos\": [\n        40,\n        380\n      ]\n    },\n    \"test_buffer_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"buffer~ TEST_BUF (250 ms, empty samples)\",\n      \"pos\": [\n        40,\n        360\n      ],\n      \"size\": [\n        300,\n        18\n      ]\n    },\n    \"init_matrix_msg\": {\n      \"type\": \"message\",\n      \"text\": \"setall 99\",\n      \"pos\": [\n        340,\n        360\n      ]\n    },\n    \"test_matrix\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.matrix TEST_MAT 3 char 4 4\",\n      \"pos\": [\n        340,\n        410\n      ]\n    },\n    \"test_matrix_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"jit.matrix TEST_MAT (3 char 4x4, all cells = 99)\",\n      \"pos\": [\n        340,\n        390\n      ],\n      \"size\": [\n        320,\n        18\n      ]\n    },\n    \"btn_section_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"DIRECT TEST BUTTONS \\u2014 fire each route locally (bypasses OSC, exercises v8 dumper)\",\n      \"pos\": [\n        40,\n        470\n      ],\n      \"size\": [\n        620,\n        20\n      ]\n    },\n    \"btn_ping\": {\n      \"type\": \"button\",\n      \"pos\": [\n        40,\n        500\n      ],\n      \"presentation\": [\n        12,\n        60,\n        24,\n        24\n      ]\n    },\n    \"btn_ping_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"ping\",\n      \"pos\": [\n        40,\n        530\n      ],\n      \"size\": [\n        40,\n        18\n      ],\n      \"presentation\": [\n        40,\n        60,\n        40,\n        18\n      ]\n    },\n    \"msg_ping\": {\n      \"type\": \"message\",\n      \"text\": \"ping\",\n      \"pos\": [\n        40,\n        555\n      ],\n      \"attrs\": {\n        \"hidden\": 1\n      }\n    },\n    \"btn_scan\": {\n      \"type\": \"button\",\n      \"pos\": [\n        110,\n        500\n      ],\n      \"presentation\": [\n        92,\n        60,\n        24,\n        24\n      ]\n    },\n    \"btn_scan_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"scan\",\n      \"pos\": [\n        110,\n        530\n      ],\n      \"size\": [\n        40,\n        18\n      ],\n      \"presentation\": [\n        120,\n        60,\n        40,\n        18\n      ]\n    },\n    \"msg_scan\": {\n      \"type\": \"message\",\n      \"text\": \"scan\",\n      \"pos\": [\n        110,\n        555\n      ],\n      \"attrs\": {\n        \"hidden\": 1\n      }\n    },\n    \"btn_dict\": {\n      \"type\": \"button\",\n      \"pos\": [\n        200,\n        500\n      ],\n      \"presentation\": [\n        172,\n        60,\n        24,\n        24\n      ]\n    },\n    \"btn_dict_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"dump dict\",\n      \"pos\": [\n        200,\n        530\n      ],\n      \"size\": [\n        70,\n        18\n      ],\n      \"presentation\": [\n        200,\n        60,\n        80,\n        18\n      ]\n    },\n    \"msg_dict\": {\n      \"type\": \"message\",\n      \"text\": \"dump d dict TEST_DICT\",\n      \"pos\": [\n        200,\n        555\n      ],\n      \"attrs\": {\n        \"hidden\": 1\n      }\n    },\n    \"btn_coll\": {\n      \"type\": \"button\",\n      \"pos\": [\n        310,\n        500\n      ],\n      \"presentation\": [\n        284,\n        60,\n        24,\n        24\n      ]\n    },\n    \"btn_coll_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"dump coll\",\n      \"pos\": [\n        310,\n        530\n      ],\n      \"size\": [\n        70,\n        18\n      ],\n      \"presentation\": [\n        312,\n        60,\n        80,\n        18\n      ]\n    },\n    \"msg_coll\": {\n      \"type\": \"message\",\n      \"text\": \"dump c coll TEST_COLL\",\n      \"pos\": [\n        310,\n        555\n      ],\n      \"attrs\": {\n        \"hidden\": 1\n      }\n    },\n    \"btn_table\": {\n      \"type\": \"button\",\n      \"pos\": [\n        420,\n        500\n      ],\n      \"presentation\": [\n        396,\n        60,\n        24,\n        24\n      ]\n    },\n    \"btn_table_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"dump table\",\n      \"pos\": [\n        420,\n        530\n      ],\n      \"size\": [\n        80,\n        18\n      ],\n      \"presentation\": [\n        424,\n        60,\n        80,\n        18\n      ]\n    },\n    \"msg_table\": {\n      \"type\": \"message\",\n      \"text\": \"dump u table TEST_TABLE\",\n      \"pos\": [\n        420,\n        555\n      ],\n      \"attrs\": {\n        \"hidden\": 1\n      }\n    },\n    \"btn_buffer\": {\n      \"type\": \"button\",\n      \"pos\": [\n        530,\n        500\n      ],\n      \"presentation\": [\n        508,\n        60,\n        24,\n        24\n      ]\n    },\n    \"btn_buffer_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"dump buffer~\",\n      \"pos\": [\n        530,\n        530\n      ],\n      \"size\": [\n        90,\n        18\n      ],\n      \"presentation\": [\n        536,\n        60,\n        100,\n        18\n      ]\n    },\n    \"msg_buffer\": {\n      \"type\": \"message\",\n      \"text\": \"dump b buffer~ TEST_BUF\",\n      \"pos\": [\n        530,\n        555\n      ],\n      \"attrs\": {\n        \"hidden\": 1\n      }\n    },\n    \"btn_matrix\": {\n      \"type\": \"button\",\n      \"pos\": [\n        660,\n        500\n      ],\n      \"presentation\": [\n        640,\n        60,\n        24,\n        24\n      ]\n    },\n    \"btn_matrix_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"dump jit.matrix\",\n      \"pos\": [\n        660,\n        530\n      ],\n      \"size\": [\n        110,\n        18\n      ],\n      \"presentation\": [\n        668,\n        60,\n        120,\n        18\n      ]\n    },\n    \"msg_matrix\": {\n      \"type\": \"message\",\n      \"text\": \"dump m jit.matrix TEST_MAT\",\n      \"pos\": [\n        660,\n        555\n      ],\n      \"attrs\": {\n        \"hidden\": 1\n      }\n    },\n    \"osc_section_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"OSC TEST \\u2014 from the repo root:\\n  python3 tools/c2m_inspect_send.py --timeout 2 ping\\n  python3 tools/c2m_inspect_send.py --timeout 2 scan\\n  python3 tools/c2m_inspect_send.py --timeout 2 dump d dict       TEST_DICT\\n  python3 tools/c2m_inspect_send.py --timeout 2 dump c coll       TEST_COLL\\n  python3 tools/c2m_inspect_send.py --timeout 2 dump u table      TEST_TABLE\\n  python3 tools/c2m_inspect_send.py --timeout 2 dump b buffer~    TEST_BUF\\n  python3 tools/c2m_inspect_send.py --timeout 2 dump m jit.matrix TEST_MAT\",\n      \"pos\": [\n        40,\n        620\n      ],\n      \"size\": [\n        820,\n        130\n      ],\n      \"presentation\": [\n        12,\n        100,\n        820,\n        130\n      ]\n    },\n    \"ui_title\": {\n      \"type\": \"comment\",\n      \"text\": \"c2m.inspect test harness\",\n      \"pos\": [\n        40,\n        760\n      ],\n      \"size\": [\n        400,\n        22\n      ],\n      \"presentation\": [\n        10,\n        8,\n        400,\n        22\n      ],\n      \"attrs\": {\n        \"fontsize\": 14.0\n      }\n    },\n    \"ui_subtitle\": {\n      \"type\": \"comment\",\n      \"text\": \"TEST_COLL \\u00b7 TEST_DICT \\u00b7 TEST_TABLE \\u00b7 TEST_BUF \\u00b7 TEST_MAT\",\n      \"pos\": [\n        40,\n        790\n      ],\n      \"size\": [\n        600,\n        22\n      ],\n      \"presentation\": [\n        10,\n        34,\n        600,\n        22\n      ]\n    }\n  },\n  \"connections\": [\n    [\n      \"loadbang_box\",\n      0,\n      \"init_coll_msg\",\n      0\n    ],\n    [\n      \"loadbang_box\",\n      0,\n      \"init_dict_msg\",\n      0\n    ],\n    [\n      \"loadbang_box\",\n      0,\n      \"init_table_msg\",\n      0\n    ],\n    [\n      \"loadbang_box\",\n      0,\n      \"init_matrix_msg\",\n      0\n    ],\n    [\n      \"init_coll_msg\",\n      0,\n      \"test_coll\",\n      0\n    ],\n    [\n      \"init_dict_msg\",\n      0,\n      \"test_dict\",\n      0\n    ],\n    [\n      \"init_table_msg\",\n      0,\n      \"test_table\",\n      0\n    ],\n    [\n      \"init_matrix_msg\",\n      0,\n      \"test_matrix\",\n      0\n    ],\n    [\n      \"btn_ping\",\n      0,\n      \"msg_ping\",\n      0\n    ],\n    [\n      \"btn_scan\",\n      0,\n      \"msg_scan\",\n      0\n    ],\n    [\n      \"btn_dict\",\n      0,\n      \"msg_dict\",\n      0\n    ],\n    [\n      \"btn_coll\",\n      0,\n      \"msg_coll\",\n      0\n    ],\n    [\n      \"btn_table\",\n      0,\n      \"msg_table\",\n      0\n    ],\n    [\n      \"btn_buffer\",\n      0,\n      \"msg_buffer\",\n      0\n    ],\n    [\n      \"btn_matrix\",\n      0,\n      \"msg_matrix\",\n      0\n    ],\n    [\n      \"msg_ping\",\n      0,\n      \"abs\",\n      0\n    ],\n    [\n      \"msg_scan\",\n      0,\n      \"abs\",\n      0\n    ],\n    [\n      \"msg_dict\",\n      0,\n      \"abs\",\n      0\n    ],\n    [\n      \"msg_coll\",\n      0,\n      \"abs\",\n      0\n    ],\n    [\n      \"msg_table\",\n      0,\n      \"abs\",\n      0\n    ],\n    [\n      \"msg_buffer\",\n      0,\n      \"abs\",\n      0\n    ],\n    [\n      \"msg_matrix\",\n      0,\n      \"abs\",\n      0\n    ],\n    [\n      \"abs\",\n      0,\n      \"abs_print\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
          "fontsize": 9.0,
          "hidden": 1
        }
      }
    ],
    "lines": [
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
            "obj-10",
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
            "obj-13",
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
            "obj-18",
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
            "obj-7",
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
            "obj-24",
            0
          ],
          "source": [
            "obj-22",
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-27",
            0
          ],
          "source": [
            "obj-25",
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-30",
            0
          ],
          "source": [
            "obj-28",
            0
          ],
          "hidden": 1
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
          ],
          "hidden": 1
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
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-39",
            0
          ],
          "source": [
            "obj-37",
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-42",
            0
          ],
          "source": [
            "obj-40",
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            0
          ],
          "source": [
            "obj-24",
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            0
          ],
          "source": [
            "obj-27",
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            0
          ],
          "source": [
            "obj-30",
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            0
          ],
          "source": [
            "obj-33",
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            0
          ],
          "source": [
            "obj-36",
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            0
          ],
          "source": [
            "obj-39",
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
            0
          ],
          "source": [
            "obj-42",
            0
          ],
          "hidden": 1
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
      }
    ],
    "default_fontsize": 12.0,
    "default_fontname": "Arial",
    "openinpresentation": 1
  }
}
