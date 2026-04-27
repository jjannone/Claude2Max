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
      1144.0,
      826.0
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
            90.0,
            125.0,
            22.0
          ],
          "text": "prepend vdevice"
        }
      },
      {
        "box": {
          "id": "obj-6",
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
          "id": "obj-7",
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
          "id": "obj-8",
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
          "id": "obj-9",
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
          "id": "obj-10",
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
          "id": "obj-11",
          "maxclass": "newobj",
          "numinlets": 2,
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
          "id": "obj-12",
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
          "id": "obj-13",
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
          "id": "obj-14",
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
          "id": "obj-15",
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
          "id": "obj-16",
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
          "id": "obj-17",
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
          "id": "obj-18",
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
          "id": "obj-19",
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
          "id": "obj-20",
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
          "id": "obj-21",
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
          "id": "obj-22",
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
          "id": "obj-23",
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
          "id": "obj-24",
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
          "id": "obj-25",
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
          "id": "obj-26",
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
          "id": "obj-27",
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
          "id": "obj-28",
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
          "id": "obj-29",
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
          "id": "obj-30",
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
          "id": "obj-31",
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
          "id": "obj-32",
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
          "id": "obj-33",
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
          "id": "obj-34",
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
          "id": "obj-35",
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
          "id": "obj-36",
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
          "id": "obj-37",
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
          "id": "obj-38",
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
          "id": "obj-39",
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
          "id": "obj-40",
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
          "id": "obj-41",
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
          "id": "obj-42",
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
          "id": "obj-43",
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
          "id": "obj-44",
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
          "id": "obj-45",
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
          "id": "obj-46",
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
          "id": "obj-47",
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
          "id": "obj-48",
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
          "id": "obj-49",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            482.0,
            30.0,
            160.0,
            22.0
          ],
          "text": "loadmess getvdevlist"
        }
      },
      {
        "box": {
          "id": "obj-50",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            50.0,
            111.0,
            22.0
          ],
          "text": "loadmess open"
        }
      },
      {
        "box": {
          "id": "obj-51",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            54.0,
            127.0,
            76.0,
            22.0
          ],
          "text": "jit.grab"
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
            502.0,
            215.0,
            216.0,
            49.0
          ],
          "text": "vdevlist \"MacBook Air Camera\" \"John\u2019s phone Camera\" \"John\u2019s phone Camera\""
        }
      },
      {
        "box": {
          "id": "obj-53",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            0.0,
            0.0,
            4.0,
            4.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ]
        }
      },
      {
        "box": {
          "id": "obj-54",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            238.0,
            18.0,
            359.0,
            106.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ]
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
            18.0,
            68.0,
            310.0,
            176.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ]
        }
      },
      {
        "box": {
          "id": "obj-56",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            18.0,
            245.0,
            148.0,
            109.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ]
        }
      },
      {
        "box": {
          "id": "obj-57",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            388.0,
            738.0,
            134.0,
            116.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ]
        }
      },
      {
        "box": {
          "id": "obj-58",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            163.0,
            133.0,
            149.0,
            76.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ]
        }
      },
      {
        "box": {
          "id": "obj-59",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            618.0,
            590.0,
            74.0,
            46.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ]
        }
      },
      {
        "box": {
          "id": "obj-60",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            413.0,
            48.0,
            224.0,
            46.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ]
        }
      },
      {
        "box": {
          "id": "obj-61",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            18.0,
            353.0,
            344.0,
            264.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ]
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
            388.0,
            373.0,
            128.0,
            116.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ]
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
            388.0,
            473.0,
            168.0,
            166.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ]
        }
      },
      {
        "box": {
          "id": "obj-64",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            388.0,
            623.0,
            310.0,
            86.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ]
        }
      },
      {
        "box": {
          "id": "obj-65",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            388.0,
            838.0,
            184.0,
            121.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ]
        }
      },
      {
        "box": {
          "id": "obj-66",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            388.0,
            913.0,
            488.0,
            81.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ]
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
            754.0,
            5.0,
            65.0,
            20.0
          ],
          "text": "Tutorial:",
          "fontface": 1
        }
      },
      {
        "box": {
          "id": "obj-68",
          "maxclass": "umenu",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            822.0,
            5.0,
            200.0,
            22.0
          ]
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
            1028.0,
            5.0,
            48.0,
            22.0
          ],
          "text": "prev"
        }
      },
      {
        "box": {
          "id": "obj-70",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1064.0,
            5.0,
            48.0,
            22.0
          ],
          "text": "next"
        }
      },
      {
        "box": {
          "id": "obj-71",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1100.0,
            5.0,
            76.0,
            22.0
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "obj-72",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            754.0,
            32.0,
            209.0,
            22.0
          ],
          "text": "v8 face-capture-tutorial.js"
        }
      },
      {
        "box": {
          "id": "obj-73",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            754.0,
            60.0,
            220.0,
            60.0
          ],
          "text": "Overview\nThis patch has 36 processing objects across 13 stages. Use the menu or prev/next to step through each stage.",
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0,
          "linecount": 2
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
            612.0,
            5.0,
            220.0,
            112.0
          ],
          "text": "loadmess +2\nloadmess: camera. loadmess \u2014 Sends a stored message when the patch loads (initializes defaults). unpack \u2014 Unpacks a list into individual outlet values. prepend \u2014 Prepends a fixed message selector before incoming data.",
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0,
          "linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-75",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            343.0,
            104.0,
            220.0,
            75.0
          ],
          "text": "loadmess +2\nloadmess: --- output size ---. jit.grab \u2014 Captures frames from a live camera or video source. jit.matrix: capture rate (ms).",
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0,
          "linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-76",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            181.0,
            220.0,
            220.0,
            112.0
          ],
          "text": "toggle +3\ntoggle \u2014 Sends 1 (on) or 0 (off) when clicked \u2014 starts/stops loops. metro \u2014 Generates repeated bangs at a set interval (ms). t \u2014 Fires a series of typed outputs in right-to-left order. number \u2014 Displays and edits an integer number.",
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0,
          "linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-77",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            537.0,
            717.0,
            220.0,
            112.0
          ],
          "text": "toggle +3\ntoggle \u2014 Sends 1 (on) or 0 (off) when clicked \u2014 starts/stops loops. metro \u2014 Generates repeated bangs at a set interval (ms). counter \u2014 Counts bangs up/down between min and max. number \u2014 Displays and edits an integer number.",
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0,
          "linecount": 2
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
            327.0,
            128.0,
            220.0,
            75.0
          ],
          "text": "number + pak\nnumber \u2014 Displays and edits an integer number. number \u2014 Displays and edits an integer number. pak.",
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0,
          "linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-79",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            707.0,
            588.0,
            124.0,
            50.0
          ],
          "text": "number\nnumber: frames stored.",
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0,
          "linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-80",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            652.0,
            37.0,
            347.0,
            50.0
          ],
          "text": "umenu\numenu \u2014 A drop-down menu \u2014 outputs index when item is selected.",
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0,
          "linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-81",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            377.0,
            451.0,
            328.0,
            50.0
          ],
          "text": "jit.pwindow\njit.pwindow \u2014 Displays a Jitter matrix as a video preview window.",
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0,
          "linecount": 2
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
            531.0,
            397.0,
            212.0,
            50.0
          ],
          "text": "jit.rgb2luma +2\njit.rgb2luma. cv.jit.faces. >: face detected.",
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0,
          "linecount": 2
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
            571.0,
            477.0,
            220.0,
            124.0
          ],
          "text": "toggle +3\ntoggle \u2014 Sends 1 (on) or 0 (off) when clicked \u2014 starts/stops loops. gate \u2014 Routes input to one of N outlets based on a control value. t \u2014 Fires a series of typed outputs in right-to-left order. counter \u2014 Counts bangs up/down between min and max.",
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0,
          "linecount": 2
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
            713.0,
            614.0,
            220.0,
            87.0
          ],
          "text": "prepend +2\nprepend \u2014 Prepends a fixed message selector before incoming data. number \u2014 Displays and edits an integer number. jit.matrixset.",
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0,
          "linecount": 2
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
            587.0,
            846.0,
            220.0,
            87.0
          ],
          "text": "prepend +2\nprepend \u2014 Prepends a fixed message selector before incoming data. jit.gl.layer. t \u2014 Fires a series of typed outputs in right-to-left order.",
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0,
          "linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-86",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            891.0,
            919.0,
            331.0,
            50.0
          ],
          "text": "jit.gl.render + jit.window\njit.gl.render \u2014 Renders OpenGL geometry to a texture. jit.window.",
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0,
          "linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-87",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            570.0,
            115.0,
            118.0,
            22.0
          ],
          "text": "route vdevlist"
        }
      },
      {
        "box": {
          "id": "obj-88",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            570.0,
            145.0,
            55.0,
            22.0
          ],
          "text": "t b l"
        }
      },
      {
        "box": {
          "id": "obj-89",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            660.0,
            160.0,
            55.0,
            22.0
          ],
          "text": "clear"
        }
      },
      {
        "box": {
          "id": "obj-90",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            570.0,
            175.0,
            48.0,
            22.0
          ],
          "text": "iter"
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
            570.0,
            205.0,
            118.0,
            22.0
          ],
          "text": "prepend append"
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
            1034.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"name\": \"Face Capture\",\n  \"width\": 1144,\n  \"height\": 826,\n  \"objects\": {\n    \"loadmess_init\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 100 100 300 640 360\",\n      \"pos\": [\n        250,\n        30\n      ]\n    },\n    \"unpack_init\": {\n      \"type\": \"newobj\",\n      \"text\": \"unpack 0 0 0 0 0\",\n      \"pos\": [\n        250,\n        60\n      ]\n    },\n    \"cam_label\": {\n      \"type\": \"comment\",\n      \"text\": \"camera\",\n      \"pos\": [\n        440,\n        45\n      ],\n      \"presentation\": [\n        15,\n        5\n      ]\n    },\n    \"cam_menu\": {\n      \"type\": \"umenu\",\n      \"pos\": [\n        425,\n        60\n      ],\n      \"size\": [\n        200,\n        22\n      ],\n      \"presentation\": [\n        10,\n        22,\n        200,\n        22\n      ]\n    },\n    \"getdevlist\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend vdevice\",\n      \"pos\": [\n        425,\n        90\n      ]\n    },\n    \"comment_resize\": {\n      \"type\": \"comment\",\n      \"text\": \"--- output size ---\",\n      \"pos\": [\n        190,\n        110\n      ]\n    },\n    \"out_w_label\": {\n      \"type\": \"comment\",\n      \"text\": \"width\",\n      \"pos\": [\n        190,\n        128\n      ],\n      \"presentation\": [\n        225,\n        55\n      ]\n    },\n    \"out_w\": {\n      \"type\": \"number\",\n      \"pos\": [\n        175,\n        145\n      ],\n      \"attrs\": {\n        \"minimum\": 32,\n        \"maximum\": 3840\n      },\n      \"presentation\": [\n        220,\n        72,\n        55,\n        22\n      ]\n    },\n    \"out_h_label\": {\n      \"type\": \"comment\",\n      \"text\": \"height\",\n      \"pos\": [\n        260,\n        128\n      ],\n      \"presentation\": [\n        290,\n        55\n      ]\n    },\n    \"out_h\": {\n      \"type\": \"number\",\n      \"pos\": [\n        245,\n        145\n      ],\n      \"attrs\": {\n        \"minimum\": 32,\n        \"maximum\": 2160\n      },\n      \"presentation\": [\n        285,\n        72,\n        55,\n        22\n      ]\n    },\n    \"pak_dim\": {\n      \"type\": \"newobj\",\n      \"text\": \"pak dim 640 360\",\n      \"pos\": [\n        175,\n        175\n      ]\n    },\n    \"resize\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.matrix 4 char 640 360 @usedstdim 1\",\n      \"pos\": [\n        30,\n        210\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ]\n    },\n    \"cap_metro_label\": {\n      \"type\": \"comment\",\n      \"text\": \"capture rate (ms)\",\n      \"pos\": [\n        45,\n        240\n      ],\n      \"presentation\": [\n        15,\n        55\n      ]\n    },\n    \"cap_rate\": {\n      \"type\": \"number\",\n      \"pos\": [\n        30,\n        257\n      ],\n      \"attrs\": {\n        \"minimum\": 33,\n        \"maximum\": 1000\n      },\n      \"presentation\": [\n        10,\n        72,\n        60,\n        22\n      ]\n    },\n    \"cap_toggle_label\": {\n      \"type\": \"comment\",\n      \"text\": \"capture\",\n      \"pos\": [\n        145,\n        240\n      ],\n      \"presentation\": [\n        90,\n        55\n      ]\n    },\n    \"cap_toggle\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        130,\n        257\n      ],\n      \"presentation\": [\n        90,\n        72\n      ]\n    },\n    \"cap_metro\": {\n      \"type\": \"newobj\",\n      \"text\": \"metro 100\",\n      \"pos\": [\n        30,\n        290\n      ]\n    },\n    \"bang_grab\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b\",\n      \"pos\": [\n        30,\n        320\n      ]\n    },\n    \"preview\": {\n      \"type\": \"jit.pwindow\",\n      \"pos\": [\n        30,\n        365\n      ],\n      \"size\": [\n        320,\n        240\n      ],\n      \"presentation\": [\n        10,\n        105,\n        320,\n        240\n      ]\n    },\n    \"comment_detect\": {\n      \"type\": \"comment\",\n      \"text\": \"--- face detection ---\",\n      \"pos\": [\n        415,\n        365\n      ]\n    },\n    \"luma\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.rgb2luma\",\n      \"pos\": [\n        400,\n        385\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ]\n    },\n    \"faces\": {\n      \"type\": \"newobj\",\n      \"text\": \"cv.jit.faces\",\n      \"pos\": [\n        400,\n        420\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ]\n    },\n    \"face_thresh\": {\n      \"type\": \"newobj\",\n      \"text\": \"> 0\",\n      \"pos\": [\n        400,\n        455\n      ]\n    },\n    \"face_indicator_label\": {\n      \"type\": \"comment\",\n      \"text\": \"face detected\",\n      \"pos\": [\n        535,\n        470\n      ],\n      \"presentation\": [\n        345,\n        105\n      ]\n    },\n    \"face_indicator\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        520,\n        485\n      ],\n      \"presentation\": [\n        345,\n        122\n      ]\n    },\n    \"comment_capture\": {\n      \"type\": \"comment\",\n      \"text\": \"--- frame storage ---\",\n      \"pos\": [\n        415,\n        520\n      ]\n    },\n    \"gate_capture\": {\n      \"type\": \"newobj\",\n      \"text\": \"gate 1\",\n      \"pos\": [\n        400,\n        540\n      ]\n    },\n    \"trig_store\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b b\",\n      \"pos\": [\n        400,\n        570\n      ]\n    },\n    \"write_counter\": {\n      \"type\": \"newobj\",\n      \"text\": \"counter\",\n      \"pos\": [\n        400,\n        605\n      ]\n    },\n    \"prepend_idx\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend index\",\n      \"pos\": [\n        400,\n        635\n      ]\n    },\n    \"max_frames_label\": {\n      \"type\": \"comment\",\n      \"text\": \"max frames\",\n      \"pos\": [\n        645,\n        585\n      ],\n      \"presentation\": [\n        345,\n        155\n      ]\n    },\n    \"max_frames\": {\n      \"type\": \"number\",\n      \"pos\": [\n        630,\n        602\n      ],\n      \"attrs\": {\n        \"minimum\": 1,\n        \"maximum\": 9999\n      },\n      \"presentation\": [\n        345,\n        172,\n        55,\n        22\n      ]\n    },\n    \"frame_count_label\": {\n      \"type\": \"comment\",\n      \"text\": \"frames stored\",\n      \"pos\": [\n        645,\n        625\n      ],\n      \"presentation\": [\n        345,\n        200\n      ]\n    },\n    \"frame_count\": {\n      \"type\": \"number\",\n      \"pos\": [\n        630,\n        642\n      ],\n      \"presentation\": [\n        345,\n        217,\n        55,\n        22\n      ]\n    },\n    \"matrixset\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.matrixset @matrixcount 300 @thru 0\",\n      \"pos\": [\n        400,\n        675\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ]\n    },\n    \"comment_playback\": {\n      \"type\": \"comment\",\n      \"text\": \"--- playback ---\",\n      \"pos\": [\n        415,\n        715\n      ]\n    },\n    \"play_toggle_label\": {\n      \"type\": \"comment\",\n      \"text\": \"play\",\n      \"pos\": [\n        415,\n        735\n      ],\n      \"presentation\": [\n        345,\n        250\n      ]\n    },\n    \"play_toggle\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        400,\n        750\n      ],\n      \"presentation\": [\n        345,\n        267\n      ]\n    },\n    \"play_rate_label\": {\n      \"type\": \"comment\",\n      \"text\": \"play rate (ms)\",\n      \"pos\": [\n        475,\n        735\n      ],\n      \"presentation\": [\n        385,\n        250\n      ]\n    },\n    \"play_rate\": {\n      \"type\": \"number\",\n      \"pos\": [\n        460,\n        750\n      ],\n      \"attrs\": {\n        \"minimum\": 10,\n        \"maximum\": 2000\n      },\n      \"presentation\": [\n        380,\n        267,\n        60,\n        22\n      ]\n    },\n    \"play_metro\": {\n      \"type\": \"newobj\",\n      \"text\": \"metro 100\",\n      \"pos\": [\n        400,\n        785\n      ]\n    },\n    \"read_counter\": {\n      \"type\": \"newobj\",\n      \"text\": \"counter\",\n      \"pos\": [\n        400,\n        820\n      ]\n    },\n    \"prepend_out\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend outputmatrix\",\n      \"pos\": [\n        400,\n        850\n      ]\n    },\n    \"layer\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.gl.layer ctx\",\n      \"pos\": [\n        400,\n        890\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ]\n    },\n    \"render\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.gl.render ctx @erase_color 0. 0. 0. 1.\",\n      \"pos\": [\n        550,\n        925\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"bang\",\n        \"\"\n      ]\n    },\n    \"render_trig\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b b\",\n      \"pos\": [\n        400,\n        925\n      ]\n    },\n    \"window\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.window ctx @size 640 480 @title \\\"Face Capture Playback\\\"\",\n      \"pos\": [\n        400,\n        960\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"bang\",\n        \"\"\n      ]\n    },\n    \"info\": {\n      \"type\": \"comment\",\n      \"text\": \"Select camera, click capture. Detected faces trigger frame storage. Click play to sequence captured frames.\",\n      \"pos\": [\n        30,\n        970\n      ],\n      \"presentation\": [\n        10,\n        355,\n        430,\n        22\n      ]\n    },\n    \"getdevlist_msg\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess getvdevlist\",\n      \"pos\": [\n        482,\n        30\n      ]\n    },\n    \"loadmess_open\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess open\",\n      \"pos\": [\n        30,\n        50\n      ]\n    },\n    \"grab\": {\n      \"type\": \"newobj\",\n      \"text\": \"jit.grab\",\n      \"pos\": [\n        54,\n        127\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ]\n    },\n    \"vdevlist\": {\n      \"type\": \"message\",\n      \"pos\": [\n        502,\n        215\n      ],\n      \"text\": \"vdevlist \\\"MacBook Air Camera\\\" \\\"John\\u2019s phone Camera\\\" \\\"John\\u2019s phone Camera\\\"\",\n      \"size\": [\n        216,\n        49\n      ]\n    },\n    \"panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        0,\n        0\n      ],\n      \"size\": [\n        4,\n        4\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ]\n      }\n    },\n    \"panel_2\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        238,\n        18\n      ],\n      \"size\": [\n        359,\n        106\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ]\n      }\n    },\n    \"panel_3\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        18,\n        68\n      ],\n      \"size\": [\n        310,\n        176\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ]\n      }\n    },\n    \"panel_4\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        18,\n        245\n      ],\n      \"size\": [\n        148,\n        109\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ]\n      }\n    },\n    \"panel_5\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        388,\n        738\n      ],\n      \"size\": [\n        134,\n        116\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ]\n      }\n    },\n    \"panel_6\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        163,\n        133\n      ],\n      \"size\": [\n        149,\n        76\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ]\n      }\n    },\n    \"panel_7\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        618,\n        590\n      ],\n      \"size\": [\n        74,\n        46\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ]\n      }\n    },\n    \"panel_8\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        413,\n        48\n      ],\n      \"size\": [\n        224,\n        46\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ]\n      }\n    },\n    \"panel_9\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        18,\n        353\n      ],\n      \"size\": [\n        344,\n        264\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ]\n      }\n    },\n    \"panel_10\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        388,\n        373\n      ],\n      \"size\": [\n        128,\n        116\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ]\n      }\n    },\n    \"panel_11\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        388,\n        473\n      ],\n      \"size\": [\n        168,\n        166\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ]\n      }\n    },\n    \"panel_12\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        388,\n        623\n      ],\n      \"size\": [\n        310,\n        86\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ]\n      }\n    },\n    \"panel_13\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        388,\n        838\n      ],\n      \"size\": [\n        184,\n        121\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ]\n      }\n    },\n    \"panel_14\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        388,\n        913\n      ],\n      \"size\": [\n        488,\n        81\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ]\n      }\n    },\n    \"Tutorial\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        754,\n        5\n      ],\n      \"text\": \"Tutorial:\",\n      \"size\": [\n        65,\n        20\n      ],\n      \"attrs\": {\n        \"fontface\": 1\n      }\n    },\n    \"umenu\": {\n      \"type\": \"umenu\",\n      \"pos\": [\n        822,\n        5\n      ],\n      \"size\": [\n        200,\n        22\n      ]\n    },\n    \"prev\": {\n      \"type\": \"message\",\n      \"pos\": [\n        1028,\n        5\n      ],\n      \"text\": \"prev\"\n    },\n    \"next\": {\n      \"type\": \"message\",\n      \"pos\": [\n        1064,\n        5\n      ],\n      \"text\": \"next\"\n    },\n    \"loadbang\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        1100,\n        5\n      ],\n      \"text\": \"loadbang\"\n    },\n    \"v8\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        754,\n        32\n      ],\n      \"text\": \"v8 face-capture-tutorial.js\"\n    },\n    \"Overview\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        754,\n        60\n      ],\n      \"text\": \"Overview\\nThis patch has 36 processing objects across 13 stages. Use the menu or prev/next to step through each stage.\",\n      \"size\": [\n        220,\n        60\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"loadmess\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        612,\n        5\n      ],\n      \"text\": \"loadmess +2\\nloadmess: camera. loadmess \\u2014 Sends a stored message when the patch loads (initializes defaults). unpack \\u2014 Unpacks a list into individual outlet values. prepend \\u2014 Prepends a fixed message selector before incoming data.\",\n      \"size\": [\n        220,\n        112\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"loadmess_2\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        343,\n        104\n      ],\n      \"text\": \"loadmess +2\\nloadmess: --- output size ---. jit.grab \\u2014 Captures frames from a live camera or video source. jit.matrix: capture rate (ms).\",\n      \"size\": [\n        220,\n        75\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"toggle\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        181,\n        220\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). t \\u2014 Fires a series of typed outputs in right-to-left order. number \\u2014 Displays and edits an integer number.\",\n      \"size\": [\n        220,\n        112\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"toggle_2\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        537,\n        717\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. metro \\u2014 Generates repeated bangs at a set interval (ms). counter \\u2014 Counts bangs up/down between min and max. number \\u2014 Displays and edits an integer number.\",\n      \"size\": [\n        220,\n        112\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"number\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        327,\n        128\n      ],\n      \"text\": \"number + pak\\nnumber \\u2014 Displays and edits an integer number. number \\u2014 Displays and edits an integer number. pak.\",\n      \"size\": [\n        220,\n        75\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"number_2\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        707,\n        588\n      ],\n      \"text\": \"number\\nnumber: frames stored.\",\n      \"size\": [\n        124,\n        50\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"umenu_2\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        652,\n        37\n      ],\n      \"text\": \"umenu\\numenu \\u2014 A drop-down menu \\u2014 outputs index when item is selected.\",\n      \"size\": [\n        347,\n        50\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"jit_pwindow\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        377,\n        451\n      ],\n      \"text\": \"jit.pwindow\\njit.pwindow \\u2014 Displays a Jitter matrix as a video preview window.\",\n      \"size\": [\n        328,\n        50\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"jit_rgb2luma\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        531,\n        397\n      ],\n      \"text\": \"jit.rgb2luma +2\\njit.rgb2luma. cv.jit.faces. >: face detected.\",\n      \"size\": [\n        212,\n        50\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"toggle_3\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        571,\n        477\n      ],\n      \"text\": \"toggle +3\\ntoggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. gate \\u2014 Routes input to one of N outlets based on a control value. t \\u2014 Fires a series of typed outputs in right-to-left order. counter \\u2014 Counts bangs up/down between min and max.\",\n      \"size\": [\n        220,\n        124\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"prepend\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        713,\n        614\n      ],\n      \"text\": \"prepend +2\\nprepend \\u2014 Prepends a fixed message selector before incoming data. number \\u2014 Displays and edits an integer number. jit.matrixset.\",\n      \"size\": [\n        220,\n        87\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"prepend_2\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        587,\n        846\n      ],\n      \"text\": \"prepend +2\\nprepend \\u2014 Prepends a fixed message selector before incoming data. jit.gl.layer. t \\u2014 Fires a series of typed outputs in right-to-left order.\",\n      \"size\": [\n        220,\n        87\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"jit_gl_render\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        891,\n        919\n      ],\n      \"text\": \"jit.gl.render + jit.window\\njit.gl.render \\u2014 Renders OpenGL geometry to a texture. jit.window.\",\n      \"size\": [\n        331,\n        50\n      ],\n      \"attrs\": {\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"route_vdevlist\": {\n      \"type\": \"newobj\",\n      \"text\": \"route vdevlist\",\n      \"pos\": [\n        570,\n        115\n      ]\n    },\n    \"trig_vdev\": {\n      \"type\": \"newobj\",\n      \"text\": \"t b l\",\n      \"pos\": [\n        570,\n        145\n      ]\n    },\n    \"msg_clear\": {\n      \"type\": \"message\",\n      \"text\": \"clear\",\n      \"pos\": [\n        660,\n        160\n      ]\n    },\n    \"iter_vdev\": {\n      \"type\": \"newobj\",\n      \"text\": \"iter\",\n      \"pos\": [\n        570,\n        175\n      ]\n    },\n    \"prepend_append\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend append\",\n      \"pos\": [\n        570,\n        205\n      ]\n    }\n  },\n  \"connections\": [\n    [\n      \"loadmess_init\",\n      0,\n      \"unpack_init\",\n      0\n    ],\n    [\n      \"out_w\",\n      0,\n      \"pak_dim\",\n      1\n    ],\n    [\n      \"out_h\",\n      0,\n      \"pak_dim\",\n      2\n    ],\n    [\n      \"pak_dim\",\n      0,\n      \"resize\",\n      0\n    ],\n    [\n      \"resize\",\n      0,\n      \"preview\",\n      0\n    ],\n    [\n      \"resize\",\n      0,\n      \"luma\",\n      0\n    ],\n    [\n      \"cap_rate\",\n      0,\n      \"cap_metro\",\n      1\n    ],\n    [\n      \"cap_toggle\",\n      0,\n      \"cap_metro\",\n      0\n    ],\n    [\n      \"unpack_init\",\n      3,\n      \"out_w\",\n      0\n    ],\n    [\n      \"unpack_init\",\n      4,\n      \"out_h\",\n      0\n    ],\n    [\n      \"unpack_init\",\n      0,\n      \"cap_rate\",\n      0\n    ],\n    [\n      \"unpack_init\",\n      2,\n      \"max_frames\",\n      0\n    ],\n    [\n      \"unpack_init\",\n      1,\n      \"play_rate\",\n      0\n    ],\n    [\n      \"cap_metro\",\n      0,\n      \"bang_grab\",\n      0\n    ],\n    [\n      \"bang_grab\",\n      0,\n      \"gate_capture\",\n      1\n    ],\n    [\n      \"bang_grab\",\n      0,\n      \"grab\",\n      0\n    ],\n    [\n      \"luma\",\n      0,\n      \"faces\",\n      0\n    ],\n    [\n      \"faces\",\n      1,\n      \"face_thresh\",\n      0\n    ],\n    [\n      \"face_thresh\",\n      0,\n      \"face_indicator\",\n      0\n    ],\n    [\n      \"face_thresh\",\n      0,\n      \"gate_capture\",\n      0\n    ],\n    [\n      \"gate_capture\",\n      0,\n      \"trig_store\",\n      0\n    ],\n    [\n      \"trig_store\",\n      1,\n      \"write_counter\",\n      0\n    ],\n    [\n      \"trig_store\",\n      0,\n      \"matrixset\",\n      0\n    ],\n    [\n      \"write_counter\",\n      0,\n      \"prepend_idx\",\n      0\n    ],\n    [\n      \"write_counter\",\n      0,\n      \"frame_count\",\n      0\n    ],\n    [\n      \"prepend_idx\",\n      0,\n      \"matrixset\",\n      0\n    ],\n    [\n      \"max_frames\",\n      0,\n      \"write_counter\",\n      3\n    ],\n    [\n      \"frame_count\",\n      0,\n      \"read_counter\",\n      3\n    ],\n    [\n      \"matrixset\",\n      0,\n      \"layer\",\n      0\n    ],\n    [\n      \"cam_menu\",\n      0,\n      \"getdevlist\",\n      0\n    ],\n    [\n      \"play_toggle\",\n      0,\n      \"play_metro\",\n      0\n    ],\n    [\n      \"play_rate\",\n      0,\n      \"play_metro\",\n      1\n    ],\n    [\n      \"play_metro\",\n      0,\n      \"read_counter\",\n      0\n    ],\n    [\n      \"read_counter\",\n      0,\n      \"prepend_out\",\n      0\n    ],\n    [\n      \"prepend_out\",\n      0,\n      \"matrixset\",\n      0\n    ],\n    [\n      \"layer\",\n      0,\n      \"render_trig\",\n      0\n    ],\n    [\n      \"render_trig\",\n      1,\n      \"render\",\n      0\n    ],\n    [\n      \"getdevlist_msg\",\n      0,\n      \"grab\",\n      0\n    ],\n    [\n      \"getdevlist\",\n      0,\n      \"grab\",\n      0\n    ],\n    [\n      \"loadmess_open\",\n      0,\n      \"grab\",\n      0\n    ],\n    [\n      \"grab\",\n      0,\n      \"resize\",\n      0\n    ],\n    [\n      \"grab\",\n      1,\n      \"vdevlist\",\n      1\n    ],\n    [\n      \"loadbang\",\n      0,\n      \"v8\",\n      0\n    ],\n    [\n      \"next\",\n      0,\n      \"v8\",\n      0\n    ],\n    [\n      \"prev\",\n      0,\n      \"v8\",\n      0\n    ],\n    [\n      \"umenu\",\n      0,\n      \"v8\",\n      0\n    ],\n    [\n      \"grab\",\n      1,\n      \"route_vdevlist\",\n      0\n    ],\n    [\n      \"route_vdevlist\",\n      0,\n      \"trig_vdev\",\n      0\n    ],\n    [\n      \"trig_vdev\",\n      1,\n      \"msg_clear\",\n      0\n    ],\n    [\n      \"trig_vdev\",\n      0,\n      \"iter_vdev\",\n      0\n    ],\n    [\n      \"msg_clear\",\n      0,\n      \"cam_menu\",\n      0\n    ],\n    [\n      \"iter_vdev\",\n      0,\n      \"prepend_append\",\n      0\n    ],\n    [\n      \"prepend_append\",\n      0,\n      \"cam_menu\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
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
            1
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
            "obj-11",
            2
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
            "obj-11",
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
            "obj-12",
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
            "obj-12",
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
            "obj-14",
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
            "obj-8",
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
            "obj-10",
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
            "obj-14",
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
            "obj-32",
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
            "obj-40",
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
            "obj-27",
            1
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
            "obj-51",
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
            "obj-23",
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
            "obj-28",
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
            "obj-29",
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
            "obj-30",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-29",
            3
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
            "obj-42",
            3
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
            "obj-44",
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
            "obj-41",
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
            "obj-41",
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
            "obj-35",
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
            "obj-46",
            1
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
            "obj-49",
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
            "obj-5",
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
            "obj-50",
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
            "obj-51",
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
            "obj-51",
            1
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
            "obj-68",
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
            "obj-51",
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
            "obj-87",
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
            "obj-88",
            1
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
            "obj-88",
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
            "obj-89",
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
            "obj-90",
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
            "obj-91",
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
