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
      950.0,
      821.0
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
          "text": "jit-grab-scale",
          "fontsize": 16.0,
          "fontface": 1,
          "varname": "obj-title"
        }
      },
      {
        "box": {
          "id": "obj-1",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            38.0,
            37.0,
            198.0,
            43.0
          ],
          "text": "jit.world @fsaa 1 @enable 1 @visible 0",
          "varname": "obj-1"
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
            321.0,
            46.0,
            24.0,
            24.0
          ],
          "varname": "obj-2"
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "matrix / texture",
            "matrix / texture"
          ],
          "patching_rect": [
            321.0,
            89.0,
            100.0,
            26.0
          ],
          "text": "jit.grab",
          "varname": "obj-3"
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "jit.fpsgui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            108.0,
            165.0,
            118.0,
            40.0
          ],
          "fontname": "Monaco",
          "fontsize": 14.0,
          "mode": 3,
          "varname": "obj-4"
        }
      },
      {
        "box": {
          "id": "obj-5",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "matrix"
          ],
          "patching_rect": [
            374.0,
            136.0,
            126.0,
            26.0
          ],
          "text": "jit.matrixinfo",
          "varname": "obj-5"
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
            514.0,
            136.0,
            139.0,
            22.0
          ],
          "text": "analyze the image",
          "varname": "obj-6"
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            374.0,
            172.0,
            126.0,
            26.0
          ],
          "text": "route dim",
          "varname": "obj-7"
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
            514.0,
            173.0,
            118.0,
            22.0
          ],
          "text": "report the dim",
          "varname": "obj-8"
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            374.0,
            211.0,
            269.0,
            26.0
          ],
          "text": "vexpr $f1 / $f2 @scalarmode 1",
          "varname": "obj-9"
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "list"
          ],
          "patching_rect": [
            699.0,
            140.0,
            90.0,
            22.0
          ],
          "text": "loadmess 5",
          "varname": "obj-10"
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            661.0,
            211.0,
            75.0,
            26.0
          ],
          "varname": "obj-11"
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
            746.0,
            212.0,
            151.0,
            41.0
          ],
          "text": "scale image and pwindow",
          "varname": "obj-12"
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
            265.0,
            250.0,
            93.0,
            26.0
          ],
          "text": "dim $1 $2",
          "varname": "obj-13"
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
            374.0,
            250.0,
            93.0,
            26.0
          ],
          "text": "size $1 $2",
          "varname": "obj-14"
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
            475.0,
            251.0,
            195.0,
            41.0
          ],
          "text": "set size of pwindow & dim of matrix",
          "varname": "obj-15"
        }
      },
      {
        "box": {
          "id": "obj-16",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "matrix",
            "matrix"
          ],
          "patching_rect": [
            141.0,
            301.0,
            168.0,
            26.0
          ],
          "text": "jit.matrix @adapt 0",
          "varname": "obj-16"
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "jit.fpsgui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            141.0,
            354.0,
            80.0,
            40.0
          ],
          "fontname": "Monaco",
          "fontsize": 14.0,
          "mode": 3,
          "varname": "obj-17"
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "jit.pwindow",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            374.0,
            354.0,
            313.0,
            313.0
          ],
          "varname": "obj-18"
        }
      },
      {
        "box": {
          "id": "tut-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            15.0,
            702.0,
            75.0,
            22.0
          ],
          "text": "Tutorial:",
          "fontface": 1
        }
      },
      {
        "box": {
          "id": "tut-umenu",
          "maxclass": "umenu",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            ""
          ],
          "patching_rect": [
            95.0,
            702.0,
            320.0,
            22.0
          ],
          "items": [
            "Overview",
            ",",
            "jit.world",
            "+2",
            ",",
            "jit.grab",
            "+",
            "flonum",
            ",",
            "jit.fpsgui",
            "+",
            "jit.matrixinfo",
            ",",
            "route",
            ",",
            "vexpr",
            ",",
            "message",
            ",",
            "jit.matrix",
            ",",
            "jit.fpsgui",
            "+",
            "jit.pwindow"
          ]
        }
      },
      {
        "box": {
          "id": "tut-prev",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            425.0,
            702.0,
            30.0,
            22.0
          ],
          "text": "prev"
        }
      },
      {
        "box": {
          "id": "tut-next",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            465.0,
            702.0,
            30.0,
            22.0
          ],
          "text": "next"
        }
      },
      {
        "box": {
          "id": "tut-loadbang",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            505.0,
            702.0,
            70.0,
            22.0
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "tut-v8",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            15.0,
            734.0,
            200.0,
            22.0
          ],
          "text": "v8 jit-grab-scale-tutorial.js"
        }
      },
      {
        "box": {
          "id": "tut-ann-0",
          "varname": "tut-ann-0",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            50.0,
            15.0,
            850.0,
            44.0
          ],
          "text": "Step 0 \u2014 Overview: This patch has 14 processing objects across 8 data-flow stages. Use the umenu or the next button to step through each stage.",
          "hidden": 1,
          "bgcolor": [
            0.94,
            0.97,
            0.75,
            1.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0
        }
      },
      {
        "box": {
          "id": "tut-ann-1",
          "varname": "tut-ann-1",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            38.0,
            170.0,
            600.0,
            44.0
          ],
          "text": "Step 1 \u2014 jit.world +2: jit.world: Provides a hidden OpenGL rendering context for Jitter | toggle: Sends 1 (on) or 0 (off) when clicked \u2014 starts/stops loops | loadmess: Sends a stored message when the patch loads (initializes defaults)",
          "hidden": 1,
          "bgcolor": [
            0.94,
            0.97,
            0.75,
            1.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0
        }
      },
      {
        "box": {
          "id": "tut-ann-2",
          "varname": "tut-ann-2",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            321.0,
            245.0,
            600.0,
            44.0
          ],
          "text": "Step 2 \u2014 jit.grab + flonum: jit.grab: Captures frames from a live camera or video source | flonum (scale image and pwindow)",
          "hidden": 1,
          "bgcolor": [
            0.94,
            0.97,
            0.75,
            1.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0
        }
      },
      {
        "box": {
          "id": "tut-ann-3",
          "varname": "tut-ann-3",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            108.0,
            213.0,
            600.0,
            44.0
          ],
          "text": "Step 3 \u2014 jit.fpsgui + jit.matrixinfo: jit.fpsgui: Shows the current processing frame rate | jit.matrixinfo (analyze the image)",
          "hidden": 1,
          "bgcolor": [
            0.94,
            0.97,
            0.75,
            1.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0
        }
      },
      {
        "box": {
          "id": "tut-ann-4",
          "varname": "tut-ann-4",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            374.0,
            206.0,
            561.0,
            44.0
          ],
          "text": "Step 4 \u2014 route: route (report the dim)",
          "hidden": 1,
          "bgcolor": [
            0.94,
            0.97,
            0.75,
            1.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0
        }
      },
      {
        "box": {
          "id": "tut-ann-5",
          "varname": "tut-ann-5",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            374.0,
            245.0,
            561.0,
            44.0
          ],
          "text": "Step 5 \u2014 vexpr: vexpr: Evaluates a math expression on lists/vectors element-by-element",
          "hidden": 1,
          "bgcolor": [
            0.94,
            0.97,
            0.75,
            1.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0
        }
      },
      {
        "box": {
          "id": "tut-ann-6",
          "varname": "tut-ann-6",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            265.0,
            284.0,
            600.0,
            44.0
          ],
          "text": "Step 6 \u2014 message: message (set size of pwindow & dim of matrix) | message (set size of pwindow & dim of matrix)",
          "hidden": 1,
          "bgcolor": [
            0.94,
            0.97,
            0.75,
            1.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0
        }
      },
      {
        "box": {
          "id": "tut-ann-7",
          "varname": "tut-ann-7",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            141.0,
            335.0,
            600.0,
            44.0
          ],
          "text": "Step 7 \u2014 jit.matrix: jit.matrix: Stores and processes a matrix of data (adapt 0 = fixed size)",
          "hidden": 1,
          "bgcolor": [
            0.94,
            0.97,
            0.75,
            1.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0
        }
      },
      {
        "box": {
          "id": "tut-ann-8",
          "varname": "tut-ann-8",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            141.0,
            675.0,
            600.0,
            44.0
          ],
          "text": "Step 8 \u2014 jit.fpsgui + jit.pwindow: jit.fpsgui: Shows the current processing frame rate | jit.pwindow: Displays a Jitter matrix as a video preview window",
          "hidden": 1,
          "bgcolor": [
            0.94,
            0.97,
            0.75,
            1.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "fontsize": 11.0
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
            796.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"name\": \"jit-grab-scale\",\n  \"width\": 950,\n  \"height\": 821,\n  \"objects\": {\n    \"jit_world\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        38,\n        37\n      ],\n      \"text\": \"jit.world @fsaa 1 @enable 1 @visible 0\",\n      \"size\": [\n        198,\n        43\n      ]\n    },\n    \"toggle\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        321,\n        46\n      ]\n    },\n    \"jit_grab\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        321,\n        89\n      ],\n      \"text\": \"jit.grab\",\n      \"size\": [\n        100,\n        26\n      ]\n    },\n    \"jit_fpsgui\": {\n      \"type\": \"jit.fpsgui\",\n      \"pos\": [\n        108,\n        165\n      ],\n      \"size\": [\n        118,\n        40\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 14.0,\n        \"mode\": 3\n      }\n    },\n    \"jit_matrixinfo\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        374,\n        136\n      ],\n      \"text\": \"jit.matrixinfo\",\n      \"size\": [\n        126,\n        26\n      ]\n    },\n    \"analyze\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        514,\n        136\n      ],\n      \"text\": \"analyze the image\"\n    },\n    \"route\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        374,\n        172\n      ],\n      \"text\": \"route dim\",\n      \"size\": [\n        126,\n        26\n      ]\n    },\n    \"report\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        514,\n        173\n      ],\n      \"text\": \"report the dim\"\n    },\n    \"vexpr\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        374,\n        211\n      ],\n      \"text\": \"vexpr $f1 / $f2 @scalarmode 1\",\n      \"size\": [\n        269,\n        26\n      ]\n    },\n    \"loadmess\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        699,\n        140\n      ],\n      \"text\": \"loadmess 5\"\n    },\n    \"flonum\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        661,\n        211\n      ],\n      \"size\": [\n        75,\n        26\n      ]\n    },\n    \"scale\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        746,\n        212\n      ],\n      \"text\": \"scale image and pwindow\",\n      \"size\": [\n        151,\n        41\n      ]\n    },\n    \"dim\": {\n      \"type\": \"message\",\n      \"pos\": [\n        265,\n        250\n      ],\n      \"text\": \"dim $1 $2\",\n      \"size\": [\n        93,\n        26\n      ]\n    },\n    \"size\": {\n      \"type\": \"message\",\n      \"pos\": [\n        374,\n        250\n      ],\n      \"text\": \"size $1 $2\",\n      \"size\": [\n        93,\n        26\n      ]\n    },\n    \"set\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        475,\n        251\n      ],\n      \"text\": \"set size of pwindow & dim of matrix\",\n      \"size\": [\n        195,\n        41\n      ]\n    },\n    \"jit_matrix\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        141,\n        301\n      ],\n      \"text\": \"jit.matrix @adapt 0\",\n      \"size\": [\n        168,\n        26\n      ]\n    },\n    \"jit_fpsgui_2\": {\n      \"type\": \"jit.fpsgui\",\n      \"pos\": [\n        141,\n        354\n      ],\n      \"size\": [\n        80,\n        40\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 14.0,\n        \"mode\": 3\n      }\n    },\n    \"jit_pwindow\": {\n      \"type\": \"jit.pwindow\",\n      \"pos\": [\n        374,\n        354\n      ],\n      \"size\": [\n        313,\n        313\n      ]\n    },\n    \"Tutorial\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        15,\n        702\n      ],\n      \"text\": \"Tutorial:\",\n      \"attrs\": {\n        \"fontface\": 1\n      }\n    },\n    \"umenu\": {\n      \"type\": \"umenu\",\n      \"pos\": [\n        95,\n        702\n      ],\n      \"size\": [\n        320,\n        22\n      ]\n    },\n    \"prev\": {\n      \"type\": \"message\",\n      \"pos\": [\n        425,\n        702\n      ],\n      \"text\": \"prev\"\n    },\n    \"next\": {\n      \"type\": \"message\",\n      \"pos\": [\n        465,\n        702\n      ],\n      \"text\": \"next\"\n    },\n    \"loadbang\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        505,\n        702\n      ],\n      \"text\": \"loadbang\"\n    },\n    \"v8\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        15,\n        734\n      ],\n      \"text\": \"v8 jit-grab-scale-tutorial.js\"\n    },\n    \"Step\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        141,\n        675\n      ],\n      \"text\": \"Step 8 \\u2014 jit.fpsgui + jit.pwindow: jit.fpsgui: Shows the current processing frame rate | jit.pwindow: Displays a Jitter matrix as a video preview window\",\n      \"size\": [\n        880,\n        44\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.94,\n          0.97,\n          0.75,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"Step_10\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        50,\n        15\n      ],\n      \"text\": \"Step 0 \\u2014 Overview: This patch has 14 processing objects across 8 data-flow stages. Use the umenu or the next button to step through each stage.\",\n      \"size\": [\n        880,\n        44\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.94,\n          0.97,\n          0.75,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"Step_11\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        38,\n        170\n      ],\n      \"text\": \"Step 1 \\u2014 jit.world +2: jit.world: Provides a hidden OpenGL rendering context for Jitter | toggle: Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops | loadmess: Sends a stored message when the patch loads (initializes defaults)\",\n      \"size\": [\n        880,\n        44\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.94,\n          0.97,\n          0.75,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"Step_12\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        321,\n        245\n      ],\n      \"text\": \"Step 2 \\u2014 jit.grab + flonum: jit.grab: Captures frames from a live camera or video source | flonum (scale image and pwindow)\",\n      \"size\": [\n        880,\n        44\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.94,\n          0.97,\n          0.75,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"Step_13\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        108,\n        213\n      ],\n      \"text\": \"Step 3 \\u2014 jit.fpsgui + jit.matrixinfo: jit.fpsgui: Shows the current processing frame rate | jit.matrixinfo (analyze the image)\",\n      \"size\": [\n        880,\n        44\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.94,\n          0.97,\n          0.75,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"Step_14\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        374,\n        206\n      ],\n      \"text\": \"Step 4 \\u2014 route: route (report the dim)\",\n      \"size\": [\n        880,\n        44\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.94,\n          0.97,\n          0.75,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"Step_15\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        374,\n        245\n      ],\n      \"text\": \"Step 5 \\u2014 vexpr: vexpr: Evaluates a math expression on lists/vectors element-by-element\",\n      \"size\": [\n        880,\n        44\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.94,\n          0.97,\n          0.75,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"Step_16\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        265,\n        284\n      ],\n      \"text\": \"Step 6 \\u2014 message: message (set size of pwindow & dim of matrix) | message (set size of pwindow & dim of matrix)\",\n      \"size\": [\n        880,\n        44\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.94,\n          0.97,\n          0.75,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    },\n    \"Step_17\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        141,\n        335\n      ],\n      \"text\": \"Step 7 \\u2014 jit.matrix: jit.matrix: Stores and processes a matrix of data (adapt 0 = fixed size)\",\n      \"size\": [\n        880,\n        44\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.94,\n          0.97,\n          0.75,\n          1.0\n        ],\n        \"fontsize\": 11.0\n      }\n    }\n  },\n  \"connections\": [\n    [\n      \"toggle\",\n      0,\n      \"jit_grab\",\n      0\n    ],\n    [\n      \"jit_grab\",\n      0,\n      \"jit_matrixinfo\",\n      0\n    ],\n    [\n      \"jit_grab\",\n      0,\n      \"jit_fpsgui\",\n      0\n    ],\n    [\n      \"jit_grab\",\n      0,\n      \"jit_matrix\",\n      0\n    ],\n    [\n      \"jit_matrixinfo\",\n      0,\n      \"route\",\n      0\n    ],\n    [\n      \"route\",\n      0,\n      \"vexpr\",\n      0\n    ],\n    [\n      \"loadmess\",\n      0,\n      \"flonum\",\n      0\n    ],\n    [\n      \"flonum\",\n      0,\n      \"vexpr\",\n      1\n    ],\n    [\n      \"vexpr\",\n      0,\n      \"dim\",\n      0\n    ],\n    [\n      \"vexpr\",\n      0,\n      \"size\",\n      0\n    ],\n    [\n      \"dim\",\n      0,\n      \"jit_matrix\",\n      0\n    ],\n    [\n      \"jit_matrix\",\n      0,\n      \"jit_pwindow\",\n      0\n    ],\n    [\n      \"jit_matrix\",\n      0,\n      \"jit_fpsgui_2\",\n      0\n    ],\n    [\n      \"size\",\n      0,\n      \"jit_pwindow\",\n      0\n    ],\n    [\n      \"umenu\",\n      0,\n      \"v8\",\n      0\n    ],\n    [\n      \"prev\",\n      0,\n      \"v8\",\n      0\n    ],\n    [\n      \"next\",\n      0,\n      \"v8\",\n      0\n    ],\n    [\n      \"loadbang\",\n      0,\n      \"v8\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
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
            "obj-16",
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
            "obj-7",
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
            "obj-9",
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
            "obj-9",
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
            "obj-13",
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
            "obj-14",
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
            "obj-16",
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
            "obj-18",
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
            "obj-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "tut-umenu",
            0
          ],
          "destination": [
            "tut-v8",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "tut-prev",
            0
          ],
          "destination": [
            "tut-v8",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "tut-next",
            0
          ],
          "destination": [
            "tut-v8",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "tut-loadbang",
            0
          ],
          "destination": [
            "tut-v8",
            0
          ]
        }
      }
    ],
    "default_fontsize": 12.0,
    "default_fontname": "Arial"
  }
}
