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
      1000.0
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
          "text": "Face Capture",
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
            216.0,
            22.0
          ],
          "text": "loadmess 100 100 300 640 360"
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 5,
          "outlettype": [
            "",
            "",
            "",
            "",
            ""
          ],
          "patching_rect": [
            250.0,
            60.0,
            132.0,
            22.0
          ],
          "text": "unpack 0 0 0 0 0"
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
            440.0,
            45.0,
            62.0,
            22.0
          ],
          "text": "camera",
          "presentation": 1,
          "presentation_rect": [
            15.0,
            5.0,
            62.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "umenu",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            425.0,
            60.0,
            200.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            22.0,
            200.0,
            22.0
          ]
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
            425.0,
            30.0,
            160.0,
            22.0
          ],
          "text": "loadmess getvdevlist"
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
            425.0,
            90.0,
            125.0,
            22.0
          ],
          "text": "prepend vdevice"
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
            30.0,
            80.0,
            111.0,
            22.0
          ],
          "text": "loadmess open"
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            30.0,
            110.0,
            76.0,
            22.0
          ],
          "text": "jit.grab"
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
            190.0,
            110.0,
            153.0,
            22.0
          ],
          "text": "--- output size ---"
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            190.0,
            128.0,
            55.0,
            22.0
          ],
          "text": "width",
          "presentation": 1,
          "presentation_rect": [
            225.0,
            55.0,
            55.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            175.0,
            145.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            220.0,
            72.0,
            55.0,
            22.0
          ],
          "minimum": 32,
          "maximum": 3840
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
            260.0,
            128.0,
            62.0,
            22.0
          ],
          "text": "height",
          "presentation": 1,
          "presentation_rect": [
            290.0,
            55.0,
            62.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-13",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            245.0,
            145.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            285.0,
            72.0,
            55.0,
            22.0
          ],
          "minimum": 32,
          "maximum": 2160
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            175.0,
            175.0,
            125.0,
            22.0
          ],
          "text": "pak dim 640 360"
        }
      },
      {
        "box": {
          "id": "obj-15",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            30.0,
            210.0,
            286.0,
            22.0
          ],
          "text": "jit.matrix 4 char 640 360 @usedstdim 1"
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
            240.0,
            139.0,
            22.0
          ],
          "text": "capture rate (ms)",
          "presentation": 1,
          "presentation_rect": [
            15.0,
            55.0,
            139.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            30.0,
            257.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            72.0,
            60.0,
            22.0
          ],
          "minimum": 33,
          "maximum": 1000
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
            145.0,
            240.0,
            69.0,
            22.0
          ],
          "text": "capture",
          "presentation": 1,
          "presentation_rect": [
            90.0,
            55.0,
            69.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            130.0,
            257.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            90.0,
            72.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            30.0,
            290.0,
            83.0,
            22.0
          ],
          "text": "metro 100"
        }
      },
      {
        "box": {
          "id": "obj-21",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            320.0,
            41.0,
            22.0
          ],
          "text": "t b"
        }
      },
      {
        "box": {
          "id": "obj-22",
          "maxclass": "jit.pwindow",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            30.0,
            365.0,
            320.0,
            240.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            105.0,
            320.0,
            240.0
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
            415.0,
            365.0,
            174.0,
            22.0
          ],
          "text": "--- face detection ---"
        }
      },
      {
        "box": {
          "id": "obj-24",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            400.0,
            385.0,
            104.0,
            22.0
          ],
          "text": "jit.rgb2luma"
        }
      },
      {
        "box": {
          "id": "obj-25",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            400.0,
            420.0,
            104.0,
            22.0
          ],
          "text": "cv.jit.faces"
        }
      },
      {
        "box": {
          "id": "obj-26",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            400.0,
            455.0,
            41.0,
            22.0
          ],
          "text": "> 0"
        }
      },
      {
        "box": {
          "id": "obj-27",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            535.0,
            470.0,
            111.0,
            22.0
          ],
          "text": "face detected",
          "presentation": 1,
          "presentation_rect": [
            345.0,
            105.0,
            111.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-28",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            520.0,
            485.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            345.0,
            122.0,
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
            415.0,
            520.0,
            167.0,
            22.0
          ],
          "text": "--- frame storage ---"
        }
      },
      {
        "box": {
          "id": "obj-30",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            400.0,
            540.0,
            62.0,
            22.0
          ],
          "text": "gate 1"
        }
      },
      {
        "box": {
          "id": "obj-31",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            400.0,
            570.0,
            55.0,
            22.0
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "obj-32",
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
            400.0,
            605.0,
            69.0,
            22.0
          ],
          "text": "counter"
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
            400.0,
            635.0,
            111.0,
            22.0
          ],
          "text": "prepend index"
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
            645.0,
            585.0,
            90.0,
            22.0
          ],
          "text": "max frames",
          "presentation": 1,
          "presentation_rect": [
            345.0,
            155.0,
            90.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-35",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            630.0,
            602.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            345.0,
            172.0,
            55.0,
            22.0
          ],
          "minimum": 1,
          "maximum": 9999
        }
      },
      {
        "box": {
          "id": "obj-36",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            645.0,
            625.0,
            111.0,
            22.0
          ],
          "text": "frames stored",
          "presentation": 1,
          "presentation_rect": [
            345.0,
            200.0,
            111.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-37",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            630.0,
            642.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            345.0,
            217.0,
            55.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-38",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            400.0,
            675.0,
            286.0,
            22.0
          ],
          "text": "jit.matrixset @matrixcount 300 @thru 0"
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
            415.0,
            715.0,
            132.0,
            22.0
          ],
          "text": "--- playback ---"
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
            415.0,
            735.0,
            48.0,
            22.0
          ],
          "text": "play",
          "presentation": 1,
          "presentation_rect": [
            345.0,
            250.0,
            48.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-41",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            400.0,
            750.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            345.0,
            267.0,
            24.0,
            24.0
          ]
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
            475.0,
            735.0,
            118.0,
            22.0
          ],
          "text": "play rate (ms)",
          "presentation": 1,
          "presentation_rect": [
            385.0,
            250.0,
            118.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-43",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            460.0,
            750.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            380.0,
            267.0,
            60.0,
            22.0
          ],
          "minimum": 10,
          "maximum": 2000
        }
      },
      {
        "box": {
          "id": "obj-44",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            400.0,
            785.0,
            83.0,
            22.0
          ],
          "text": "metro 100"
        }
      },
      {
        "box": {
          "id": "obj-45",
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
            400.0,
            820.0,
            69.0,
            22.0
          ],
          "text": "counter"
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
            400.0,
            850.0,
            160.0,
            22.0
          ],
          "text": "prepend outputmatrix"
        }
      },
      {
        "box": {
          "id": "obj-47",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            400.0,
            890.0,
            132.0,
            22.0
          ],
          "text": "jit.gl.layer ctx"
        }
      },
      {
        "box": {
          "id": "obj-48",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            ""
          ],
          "patching_rect": [
            550.0,
            925.0,
            314.0,
            22.0
          ],
          "text": "jit.gl.render ctx @erase_color 0. 0. 0. 1."
        }
      },
      {
        "box": {
          "id": "obj-49",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            400.0,
            925.0,
            55.0,
            22.0
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "obj-50",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            ""
          ],
          "patching_rect": [
            400.0,
            960.0,
            433.0,
            22.0
          ],
          "text": "jit.window ctx @size 640 480 @title \"Face Capture Playback\""
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
            30.0,
            970.0,
            769.0,
            22.0
          ],
          "text": "Select camera, click capture. Detected faces trigger frame storage. Click play to sequence captured frames.",
          "presentation": 1,
          "presentation_rect": [
            10.0,
            355.0,
            430.0,
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
            1032.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"name\": \"Face Capture\",\n  \"width\": 900,\n  \"height\": 1000,\n  \"objects\": {\n    \"loadmess_init\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 100 100 300 640 360\",\n      \"pos\": [\n        250,\n        30\n      ]\n    },\n    \"unpack_init\": {\n      \"type\": \"newobj\",\n      \"text\": \"unpack 0 0 0 0 0\",\n      \"pos\": [\n        250,\n        60\n      ]\n    },\n    \"cam_label\": {\n      \"type\": \"comment\",\n      \"text\": \"camera\",\n      \"pos\": [\n        440,\n        45\n      ],\n      \"presentation\": [\n        15,\n        5\n      ]\n    },\n    \"cam_menu\": {\n      \"type\": \"umenu\",\n      \"pos\": [\n        425,\n        60\n      ],\n      \"size\": [\n        200,\n        22\n      ],\n      \"presentation\": [\n        10,\n        22,\n        200,\n        22\n      ]\n    },\n    \"getdevlist_msg\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess getvdevlist\",\n      \"pos\": [\n        425,\n        30\n      ]\n    },\n    \"getdevlist\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend vdevice\",\n      \"pos\": [\n        425,\n        90\n      ]\n    },\n    \"loadmess_open\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess open\",\n      \"pos\": [\n        30,\n        80\n      ]\n    },\n    \"grab\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.grab\",\n      \"pos\": [\n        30,\n        110\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ]\n    },\n    \"comment_resize\": {\n      \"type\": \"comment\",\n      \"text\": \"--- output size ---\",\n      \"pos\": [\n        190,\n        110\n      ]\n    },\n    \"out_w_label\": {\n      \"type\": \"comment\",\n      \"text\": \"width\",\n      \"pos\": [\n        190,\n        128\n      ],\n      \"presentation\": [\n        225,\n        55\n      ]\n    },\n    \"out_w\": {\n      \"type\": \"number\",\n      \"pos\": [\n        175,\n        145\n      ],\n      \"attrs\": {\n        \"minimum\": 32,\n        \"maximum\": 3840\n      },\n      \"presentation\": [\n        220,\n        72,\n        55,\n        22\n      ]\n    },\n    \"out_h_label\": {\n      \"type\": \"comment\",\n      \"text\": \"height\",\n      \"pos\": [\n        260,\n        128\n      ],\n      \"presentation\": [\n        290,\n        55\n      ]\n    },\n    \"out_h\": {\n      \"type\": \"number\",\n      \"pos\": [\n        245,\n        145\n      ],\n      \"attrs\": {\n        \"minimum\": 32,\n        \"maximum\": 2160\n      },\n      \"presentation\": [\n        285,\n        72,\n        55,\n        22\n      ]\n    },\n    \"pak_dim\": {\n      \"type\": \"newobj\",\n      \"text\": \"pak dim 640 360\",\n      \"pos\": [\n        175,\n        175\n      ]\n    },\n    \"resize\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.matrix 4 char 640 360 @usedstdim 1\",\n      \"pos\": [\n        30,\n        210\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ]\n    },\n    \"cap_metro_label\": {\n      \"type\": \"comment\",\n      \"text\": \"capture rate (ms)\",\n      \"pos\": [\n        45,\n        240\n      ],\n      \"presentation\": [\n        15,\n        55\n      ]\n    },\n    \"cap_rate\": {\n      \"type\": \"number\",\n      \"pos\": [\n        30,\n        257\n      ],\n      \"attrs\": {\n        \"minimum\": 33,\n        \"maximum\": 1000\n      },\n      \"presentation\": [\n        10,\n        72,\n        60,\n        22\n      ]\n    },\n    \"cap_toggle_label\": {\n      \"type\": \"comment\",\n      \"text\": \"capture\",\n      \"pos\": [\n        145,\n        240\n      ],\n      \"presentation\": [\n        90,\n        55\n      ]\n    },\n    \"cap_toggle\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        130,\n        257\n      ],\n      \"presentation\": [\n        90,\n        72\n      ]\n    },\n    \"cap_metro\": {\n      \"type\": \"newobj\",\n      \"text\": \"metro 100\",\n      \"pos\": [\n        30,\n        290\n      ]\n    },\n    \"bang_grab\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b\",\n      \"pos\": [\n        30,\n        320\n      ]\n    },\n    \"preview\": {\n      \"type\": \"jit.pwindow\",\n      \"pos\": [\n        30,\n        365\n      ],\n      \"size\": [\n        320,\n        240\n      ],\n      \"presentation\": [\n        10,\n        105,\n        320,\n        240\n      ]\n    },\n    \"comment_detect\": {\n      \"type\": \"comment\",\n      \"text\": \"--- face detection ---\",\n      \"pos\": [\n        415,\n        365\n      ]\n    },\n    \"luma\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.rgb2luma\",\n      \"pos\": [\n        400,\n        385\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ]\n    },\n    \"faces\": {\n      \"type\": \"newobj\",\n      \"text\": \"cv.jit.faces\",\n      \"pos\": [\n        400,\n        420\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ]\n    },\n    \"face_thresh\": {\n      \"type\": \"newobj\",\n      \"text\": \"> 0\",\n      \"pos\": [\n        400,\n        455\n      ]\n    },\n    \"face_indicator_label\": {\n      \"type\": \"comment\",\n      \"text\": \"face detected\",\n      \"pos\": [\n        535,\n        470\n      ],\n      \"presentation\": [\n        345,\n        105\n      ]\n    },\n    \"face_indicator\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        520,\n        485\n      ],\n      \"presentation\": [\n        345,\n        122\n      ]\n    },\n    \"comment_capture\": {\n      \"type\": \"comment\",\n      \"text\": \"--- frame storage ---\",\n      \"pos\": [\n        415,\n        520\n      ]\n    },\n    \"gate_capture\": {\n      \"type\": \"newobj\",\n      \"text\": \"gate 1\",\n      \"pos\": [\n        400,\n        540\n      ]\n    },\n    \"trig_store\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b b\",\n      \"pos\": [\n        400,\n        570\n      ]\n    },\n    \"write_counter\": {\n      \"type\": \"newobj\",\n      \"text\": \"counter\",\n      \"pos\": [\n        400,\n        605\n      ]\n    },\n    \"prepend_idx\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend index\",\n      \"pos\": [\n        400,\n        635\n      ]\n    },\n    \"max_frames_label\": {\n      \"type\": \"comment\",\n      \"text\": \"max frames\",\n      \"pos\": [\n        645,\n        585\n      ],\n      \"presentation\": [\n        345,\n        155\n      ]\n    },\n    \"max_frames\": {\n      \"type\": \"number\",\n      \"pos\": [\n        630,\n        602\n      ],\n      \"attrs\": {\n        \"minimum\": 1,\n        \"maximum\": 9999\n      },\n      \"presentation\": [\n        345,\n        172,\n        55,\n        22\n      ]\n    },\n    \"frame_count_label\": {\n      \"type\": \"comment\",\n      \"text\": \"frames stored\",\n      \"pos\": [\n        645,\n        625\n      ],\n      \"presentation\": [\n        345,\n        200\n      ]\n    },\n    \"frame_count\": {\n      \"type\": \"number\",\n      \"pos\": [\n        630,\n        642\n      ],\n      \"presentation\": [\n        345,\n        217,\n        55,\n        22\n      ]\n    },\n    \"matrixset\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.matrixset @matrixcount 300 @thru 0\",\n      \"pos\": [\n        400,\n        675\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ]\n    },\n    \"comment_playback\": {\n      \"type\": \"comment\",\n      \"text\": \"--- playback ---\",\n      \"pos\": [\n        415,\n        715\n      ]\n    },\n    \"play_toggle_label\": {\n      \"type\": \"comment\",\n      \"text\": \"play\",\n      \"pos\": [\n        415,\n        735\n      ],\n      \"presentation\": [\n        345,\n        250\n      ]\n    },\n    \"play_toggle\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        400,\n        750\n      ],\n      \"presentation\": [\n        345,\n        267\n      ]\n    },\n    \"play_rate_label\": {\n      \"type\": \"comment\",\n      \"text\": \"play rate (ms)\",\n      \"pos\": [\n        475,\n        735\n      ],\n      \"presentation\": [\n        385,\n        250\n      ]\n    },\n    \"play_rate\": {\n      \"type\": \"number\",\n      \"pos\": [\n        460,\n        750\n      ],\n      \"attrs\": {\n        \"minimum\": 10,\n        \"maximum\": 2000\n      },\n      \"presentation\": [\n        380,\n        267,\n        60,\n        22\n      ]\n    },\n    \"play_metro\": {\n      \"type\": \"newobj\",\n      \"text\": \"metro 100\",\n      \"pos\": [\n        400,\n        785\n      ]\n    },\n    \"read_counter\": {\n      \"type\": \"newobj\",\n      \"text\": \"counter\",\n      \"pos\": [\n        400,\n        820\n      ]\n    },\n    \"prepend_out\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend outputmatrix\",\n      \"pos\": [\n        400,\n        850\n      ]\n    },\n    \"layer\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.gl.layer ctx\",\n      \"pos\": [\n        400,\n        890\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ]\n    },\n    \"render\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.gl.render ctx @erase_color 0. 0. 0. 1.\",\n      \"pos\": [\n        550,\n        925\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"bang\",\n        \"\"\n      ]\n    },\n    \"render_trig\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b b\",\n      \"pos\": [\n        400,\n        925\n      ]\n    },\n    \"window\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.window ctx @size 640 480 @title \\\"Face Capture Playback\\\"\",\n      \"pos\": [\n        400,\n        960\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"bang\",\n        \"\"\n      ]\n    },\n    \"info\": {\n      \"type\": \"comment\",\n      \"text\": \"Select camera, click capture. Detected faces trigger frame storage. Click play to sequence captured frames.\",\n      \"pos\": [\n        30,\n        970\n      ],\n      \"presentation\": [\n        10,\n        355,\n        430,\n        22\n      ]\n    }\n  },\n  \"connections\": [\n    [\n      \"loadmess_init\",\n      0,\n      \"unpack_init\",\n      0\n    ],\n    [\n      \"unpack_init\",\n      0,\n      \"cap_rate\",\n      0\n    ],\n    [\n      \"unpack_init\",\n      1,\n      \"play_rate\",\n      0\n    ],\n    [\n      \"unpack_init\",\n      2,\n      \"max_frames\",\n      0\n    ],\n    [\n      \"unpack_init\",\n      3,\n      \"out_w\",\n      0\n    ],\n    [\n      \"unpack_init\",\n      4,\n      \"out_h\",\n      0\n    ],\n    [\n      \"getdevlist_msg\",\n      0,\n      \"grab\",\n      0\n    ],\n    [\n      \"loadmess_open\",\n      0,\n      \"grab\",\n      0\n    ],\n    [\n      \"cam_menu\",\n      0,\n      \"getdevlist\",\n      0\n    ],\n    [\n      \"getdevlist\",\n      0,\n      \"grab\",\n      0\n    ],\n    [\n      \"grab\",\n      1,\n      \"cam_menu\",\n      0\n    ],\n    [\n      \"out_w\",\n      0,\n      \"pak_dim\",\n      1\n    ],\n    [\n      \"out_h\",\n      0,\n      \"pak_dim\",\n      2\n    ],\n    [\n      \"pak_dim\",\n      0,\n      \"resize\",\n      0\n    ],\n    [\n      \"cap_toggle\",\n      0,\n      \"cap_metro\",\n      0\n    ],\n    [\n      \"cap_rate\",\n      0,\n      \"cap_metro\",\n      1\n    ],\n    [\n      \"cap_metro\",\n      0,\n      \"bang_grab\",\n      0\n    ],\n    [\n      \"bang_grab\",\n      0,\n      \"grab\",\n      0\n    ],\n    [\n      \"grab\",\n      0,\n      \"resize\",\n      0\n    ],\n    [\n      \"resize\",\n      0,\n      \"preview\",\n      0\n    ],\n    [\n      \"resize\",\n      0,\n      \"luma\",\n      0\n    ],\n    [\n      \"luma\",\n      0,\n      \"faces\",\n      0\n    ],\n    [\n      \"faces\",\n      1,\n      \"face_thresh\",\n      0\n    ],\n    [\n      \"face_thresh\",\n      0,\n      \"face_indicator\",\n      0\n    ],\n    [\n      \"face_thresh\",\n      0,\n      \"gate_capture\",\n      0\n    ],\n    [\n      \"bang_grab\",\n      0,\n      \"gate_capture\",\n      1\n    ],\n    [\n      \"gate_capture\",\n      0,\n      \"trig_store\",\n      0\n    ],\n    [\n      \"trig_store\",\n      1,\n      \"write_counter\",\n      0\n    ],\n    [\n      \"write_counter\",\n      0,\n      \"prepend_idx\",\n      0\n    ],\n    [\n      \"write_counter\",\n      0,\n      \"frame_count\",\n      0\n    ],\n    [\n      \"prepend_idx\",\n      0,\n      \"matrixset\",\n      0\n    ],\n    [\n      \"trig_store\",\n      0,\n      \"matrixset\",\n      0\n    ],\n    [\n      \"max_frames\",\n      0,\n      \"write_counter\",\n      3\n    ],\n    [\n      \"play_toggle\",\n      0,\n      \"play_metro\",\n      0\n    ],\n    [\n      \"play_rate\",\n      0,\n      \"play_metro\",\n      1\n    ],\n    [\n      \"play_metro\",\n      0,\n      \"read_counter\",\n      0\n    ],\n    [\n      \"frame_count\",\n      0,\n      \"read_counter\",\n      3\n    ],\n    [\n      \"read_counter\",\n      0,\n      \"prepend_out\",\n      0\n    ],\n    [\n      \"prepend_out\",\n      0,\n      \"matrixset\",\n      0\n    ],\n    [\n      \"matrixset\",\n      0,\n      \"layer\",\n      0\n    ],\n    [\n      \"layer\",\n      0,\n      \"render_trig\",\n      0\n    ],\n    [\n      \"render_trig\",\n      1,\n      \"render\",\n      0\n    ],\n    [\n      \"render_trig\",\n      0,\n      \"window\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
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
            "obj-17",
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
            "obj-43",
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
            "obj-35",
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
            "obj-11",
            0
          ],
          "source": [
            "obj-2",
            3
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
            "obj-2",
            4
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
            "obj-8",
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
            "obj-4",
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
            1
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
            "obj-14",
            2
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
            "obj-15",
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
            "obj-8",
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
            "obj-15",
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
            "obj-22",
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
            "obj-24",
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
            "obj-26",
            0
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
            "obj-30",
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
            "obj-30",
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
            "obj-37",
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
            "obj-38",
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
            "obj-38",
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
            "obj-32",
            3
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
            "obj-44",
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
            "obj-44",
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
            "obj-45",
            3
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
            "obj-46",
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
            "obj-38",
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
            "obj-48",
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
            "obj-50",
            0
          ],
          "source": [
            "obj-49",
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
