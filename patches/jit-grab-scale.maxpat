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
      1079.0,
      821.0
    ],
    "gridsize": [
      15.0,
      15.0
    ],
    "boxes": [
      {
        "box": {
          "id": "tut-ann-0",
          "varname": "tut-ann-0",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            10.0,
            700.0,
            60.0,
            24.0
          ],
          "text": "Overview\nThis patch has 14 processing objects across 5 stages. Use the menu or prev/next to step through each stage.",
          "hidden": 1,
          "bubble": 1,
          "bubbleside": 0,
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
          "patching_rect": [
            10.0,
            700.0,
            60.0,
            24.0
          ],
          "text": "jit.world +3\njit.world \u2014 Provides a hidden OpenGL rendering context for Jitter. toggle \u2014 Sends 1 (on) or 0 (off) when clicked \u2014 starts/stops loops. jit.grab \u2014 Captures frames from a live camera or video source. jit.fpsgui \u2014 Shows the current processing frame rate.",
          "hidden": 1,
          "bubble": 1,
          "bubbleside": 1,
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
          "patching_rect": [
            10.0,
            700.0,
            60.0,
            24.0
          ],
          "text": "loadmess + flonum\nloadmess \u2014 Sends a stored message when the patch loads (initializes defaults). flonum: scale image and pwindow.",
          "hidden": 1,
          "bubble": 1,
          "bubbleside": 1,
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
          "patching_rect": [
            10.0,
            700.0,
            60.0,
            24.0
          ],
          "text": "jit.matrixinfo +2\njit.matrixinfo: analyze the image. route: report the dim. vexpr \u2014 Evaluates a math expression on lists/vectors element-by-element.",
          "hidden": 1,
          "bubble": 1,
          "bubbleside": 1,
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
          "patching_rect": [
            10.0,
            700.0,
            60.0,
            24.0
          ],
          "text": "message +2\nmessage: set size of pwindow & dim of matrix. message. jit.matrix \u2014 Stores and processes a matrix of data (adapt 0 = fixed size). jit.fpsgui \u2014 Shows the current processing frame rate.",
          "hidden": 1,
          "bubble": 1,
          "bubbleside": 1,
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
          "patching_rect": [
            10.0,
            700.0,
            60.0,
            24.0
          ],
          "text": "jit.pwindow\njit.pwindow \u2014 Displays a Jitter matrix as a video preview window.",
          "hidden": 1,
          "bubble": 1,
          "bubbleside": 1,
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
          "fontsize": 11.0
        }
      },
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
            689.0,
            5.0,
            65.0,
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
            757.0,
            5.0,
            200.0,
            22.0
          ],
          "items": [
            "Overview",
            ",",
            "jit.world",
            "+3",
            ",",
            "loadmess",
            "+",
            "flonum",
            ",",
            "jit.matrixinfo",
            "+2",
            ",",
            "message",
            "+2",
            ",",
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
            963.0,
            5.0,
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
            999.0,
            5.0,
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
            1035.0,
            5.0,
            44.0,
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
            689.0,
            32.0,
            240.0,
            22.0
          ],
          "text": "v8 jit-grab-scale-tutorial.js"
        }
      },
      {
        "box": {
          "id": "tut-panel-0",
          "varname": "tut-panel-0",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
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
          "bordercolor": [
            0.1,
            0.4,
            0.85,
            0.75
          ],
          "border": 2,
          "rounded": 8,
          "background": 1,
          "locked_bgcolor": 1,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "tut-panel-1",
          "varname": "tut-panel-1",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            26.0,
            25.0,
            407.0,
            192.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ],
          "bordercolor": [
            0.1,
            0.4,
            0.85,
            0.75
          ],
          "border": 2,
          "rounded": 8,
          "background": 1,
          "locked_bgcolor": 1,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "tut-panel-2",
          "varname": "tut-panel-2",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            649.0,
            128.0,
            152.0,
            121.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ],
          "bordercolor": [
            0.1,
            0.4,
            0.85,
            0.75
          ],
          "border": 2,
          "rounded": 8,
          "background": 1,
          "locked_bgcolor": 1,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "tut-panel-3",
          "varname": "tut-panel-3",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            362.0,
            124.0,
            293.0,
            125.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ],
          "bordercolor": [
            0.1,
            0.4,
            0.85,
            0.75
          ],
          "border": 2,
          "rounded": 8,
          "background": 1,
          "locked_bgcolor": 1,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "tut-panel-4",
          "varname": "tut-panel-4",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            129.0,
            238.0,
            350.0,
            168.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ],
          "bordercolor": [
            0.1,
            0.4,
            0.85,
            0.75
          ],
          "border": 2,
          "rounded": 8,
          "background": 1,
          "locked_bgcolor": 1,
          "hidden": 1
        }
      },
      {
        "box": {
          "id": "tut-panel-5",
          "varname": "tut-panel-5",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            362.0,
            342.0,
            337.0,
            337.0
          ],
          "bgcolor": [
            0.15,
            0.55,
            0.95,
            0.15
          ],
          "bordercolor": [
            0.1,
            0.4,
            0.85,
            0.75
          ],
          "border": 2,
          "rounded": 8,
          "background": 1,
          "locked_bgcolor": 1,
          "hidden": 1
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
            764.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"name\": \"jit-grab-scale\",\n  \"width\": 1079,\n  \"height\": 821,\n  \"objects\": {\n    \"jit_world\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        38,\n        37\n      ],\n      \"text\": \"jit.world @fsaa 1 @enable 1 @visible 0\",\n      \"size\": [\n        198,\n        43\n      ],\n      \"attrs\": {\n        \"varname\": \"obj-1\"\n      }\n    },\n    \"toggle\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        321,\n        46\n      ],\n      \"attrs\": {\n        \"varname\": \"obj-2\"\n      }\n    },\n    \"jit_grab\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        321,\n        89\n      ],\n      \"text\": \"jit.grab\",\n      \"size\": [\n        100,\n        26\n      ],\n      \"attrs\": {\n        \"varname\": \"obj-3\"\n      }\n    },\n    \"jit_fpsgui\": {\n      \"type\": \"jit.fpsgui\",\n      \"pos\": [\n        108,\n        165\n      ],\n      \"size\": [\n        118,\n        40\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 14.0,\n        \"mode\": 3,\n        \"varname\": \"obj-4\"\n      }\n    },\n    \"jit_matrixinfo\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        374,\n        136\n      ],\n      \"text\": \"jit.matrixinfo\",\n      \"size\": [\n        126,\n        26\n      ],\n      \"attrs\": {\n        \"varname\": \"obj-5\"\n      }\n    },\n    \"analyze\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        514,\n        136\n      ],\n      \"text\": \"analyze the image\",\n      \"attrs\": {\n        \"varname\": \"obj-6\"\n      }\n    },\n    \"route\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        374,\n        172\n      ],\n      \"text\": \"route dim\",\n      \"size\": [\n        126,\n        26\n      ],\n      \"attrs\": {\n        \"varname\": \"obj-7\"\n      }\n    },\n    \"report\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        514,\n        173\n      ],\n      \"text\": \"report the dim\",\n      \"attrs\": {\n        \"varname\": \"obj-8\"\n      }\n    },\n    \"vexpr\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        374,\n        211\n      ],\n      \"text\": \"vexpr $f1 / $f2 @scalarmode 1\",\n      \"size\": [\n        269,\n        26\n      ],\n      \"attrs\": {\n        \"varname\": \"obj-9\"\n      }\n    },\n    \"loadmess\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        699,\n        140\n      ],\n      \"text\": \"loadmess 5\",\n      \"attrs\": {\n        \"varname\": \"obj-10\"\n      }\n    },\n    \"flonum\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        661,\n        211\n      ],\n      \"size\": [\n        75,\n        26\n      ],\n      \"attrs\": {\n        \"varname\": \"obj-11\"\n      }\n    },\n    \"scale\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        746,\n        212\n      ],\n      \"text\": \"scale image and pwindow\",\n      \"size\": [\n        151,\n        41\n      ],\n      \"attrs\": {\n        \"varname\": \"obj-12\"\n      }\n    },\n    \"dim\": {\n      \"type\": \"message\",\n      \"pos\": [\n        265,\n        250\n      ],\n      \"text\": \"dim $1 $2\",\n      \"size\": [\n        93,\n        26\n      ],\n      \"attrs\": {\n        \"varname\": \"obj-13\"\n      }\n    },\n    \"size\": {\n      \"type\": \"message\",\n      \"pos\": [\n        374,\n        250\n      ],\n      \"text\": \"size $1 $2\",\n      \"size\": [\n        93,\n        26\n      ],\n      \"attrs\": {\n        \"varname\": \"obj-14\"\n      }\n    },\n    \"set\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        475,\n        251\n      ],\n      \"text\": \"set size of pwindow & dim of matrix\",\n      \"size\": [\n        195,\n        41\n      ],\n      \"attrs\": {\n        \"varname\": \"obj-15\"\n      }\n    },\n    \"jit_matrix\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        141,\n        301\n      ],\n      \"text\": \"jit.matrix @adapt 0\",\n      \"size\": [\n        168,\n        26\n      ],\n      \"attrs\": {\n        \"varname\": \"obj-16\"\n      }\n    },\n    \"jit_fpsgui_2\": {\n      \"type\": \"jit.fpsgui\",\n      \"pos\": [\n        141,\n        354\n      ],\n      \"size\": [\n        80,\n        40\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 14.0,\n        \"mode\": 3,\n        \"varname\": \"obj-17\"\n      }\n    },\n    \"jit_pwindow\": {\n      \"type\": \"jit.pwindow\",\n      \"pos\": [\n        374,\n        354\n      ],\n      \"size\": [\n        313,\n        313\n      ],\n      \"attrs\": {\n        \"varname\": \"obj-18\"\n      }\n    },\n    \"panel\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        0,\n        0\n      ],\n      \"size\": [\n        0,\n        0\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ],\n        \"background\": 1,\n        \"bordercolor\": [\n          0.1,\n          0.4,\n          0.85,\n          0.75\n        ],\n        \"locked_bgcolor\": 1,\n        \"border\": 2,\n        \"hidden\": 1,\n        \"varname\": \"tut-panel-0\",\n        \"rounded\": 8\n      }\n    },\n    \"Tutorial\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        689,\n        5\n      ],\n      \"text\": \"Tutorial:\",\n      \"attrs\": {\n        \"fontface\": 1\n      }\n    },\n    \"umenu\": {\n      \"type\": \"umenu\",\n      \"pos\": [\n        757,\n        5\n      ],\n      \"size\": [\n        320,\n        22\n      ],\n      \"attrs\": {\n        \"items\": [\n          \"Overview\",\n          \",\",\n          \"jit.world\",\n          \"+3\",\n          \",\",\n          \"loadmess\",\n          \"+\",\n          \"flonum\",\n          \",\",\n          \"jit.matrixinfo\",\n          \"+2\",\n          \",\",\n          \"message\",\n          \"+2\",\n          \",\",\n          \"jit.pwindow\"\n        ]\n      }\n    },\n    \"prev\": {\n      \"type\": \"message\",\n      \"pos\": [\n        963,\n        5\n      ],\n      \"text\": \"prev\"\n    },\n    \"next\": {\n      \"type\": \"message\",\n      \"pos\": [\n        999,\n        5\n      ],\n      \"text\": \"next\"\n    },\n    \"loadbang\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        1035,\n        5\n      ],\n      \"text\": \"loadbang\"\n    },\n    \"v8\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        689,\n        32\n      ],\n      \"text\": \"v8 jit-grab-scale-tutorial.js\"\n    },\n    \"panel_2\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        26,\n        25\n      ],\n      \"size\": [\n        771,\n        145\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ],\n        \"background\": 1,\n        \"bordercolor\": [\n          0.1,\n          0.4,\n          0.85,\n          0.75\n        ],\n        \"locked_bgcolor\": 1,\n        \"border\": 2,\n        \"hidden\": 1,\n        \"varname\": \"tut-panel-1\",\n        \"rounded\": 8\n      }\n    },\n    \"panel_3\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        649,\n        128\n      ],\n      \"size\": [\n        435,\n        168\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ],\n        \"background\": 1,\n        \"bordercolor\": [\n          0.1,\n          0.4,\n          0.85,\n          0.75\n        ],\n        \"locked_bgcolor\": 1,\n        \"border\": 2,\n        \"hidden\": 1,\n        \"varname\": \"tut-panel-2\",\n        \"rounded\": 8\n      }\n    },\n    \"panel_4\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        362,\n        124\n      ],\n      \"size\": [\n        412,\n        89\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ],\n        \"background\": 1,\n        \"bordercolor\": [\n          0.1,\n          0.4,\n          0.85,\n          0.75\n        ],\n        \"locked_bgcolor\": 1,\n        \"border\": 2,\n        \"hidden\": 1,\n        \"varname\": \"tut-panel-3\",\n        \"rounded\": 8\n      }\n    },\n    \"panel_5\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        129,\n        238\n      ],\n      \"size\": [\n        146,\n        46\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ],\n        \"background\": 1,\n        \"bordercolor\": [\n          0.1,\n          0.4,\n          0.85,\n          0.75\n        ],\n        \"locked_bgcolor\": 1,\n        \"border\": 2,\n        \"hidden\": 1,\n        \"varname\": \"tut-panel-4\",\n        \"rounded\": 8\n      }\n    },\n    \"panel_6\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        362,\n        342\n      ],\n      \"size\": [\n        289,\n        46\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.55,\n          0.95,\n          0.15\n        ],\n        \"background\": 1,\n        \"bordercolor\": [\n          0.1,\n          0.4,\n          0.85,\n          0.75\n        ],\n        \"locked_bgcolor\": 1,\n        \"border\": 2,\n        \"hidden\": 1,\n        \"varname\": \"tut-panel-5\",\n        \"rounded\": 8\n      }\n    },\n    \"Overview_4\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        700\n      ],\n      \"text\": \"Overview\\nThis patch has 14 processing objects across 5 stages. Use the menu or prev/next to step through each stage.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubble\": 1,\n        \"hidden\": 1,\n        \"bubbleside\": 0,\n        \"varname\": \"tut-ann-0\"\n      }\n    },\n    \"jit_world_3\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        700\n      ],\n      \"text\": \"jit.world +3\\njit.world \\u2014 Provides a hidden OpenGL rendering context for Jitter. toggle \\u2014 Sends 1 (on) or 0 (off) when clicked \\u2014 starts/stops loops. jit.grab \\u2014 Captures frames from a live camera or video source. jit.fpsgui \\u2014 Shows the current processing frame rate.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubble\": 1,\n        \"hidden\": 1,\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-1\"\n      }\n    },\n    \"loadmess_2\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        700\n      ],\n      \"text\": \"loadmess + flonum\\nloadmess \\u2014 Sends a stored message when the patch loads (initializes defaults). flonum: scale image and pwindow.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubble\": 1,\n        \"hidden\": 1,\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-2\"\n      }\n    },\n    \"jit_matrixinfo_2\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        700\n      ],\n      \"text\": \"jit.matrixinfo +2\\njit.matrixinfo: analyze the image. route: report the dim. vexpr \\u2014 Evaluates a math expression on lists/vectors element-by-element.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubble\": 1,\n        \"hidden\": 1,\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-3\"\n      }\n    },\n    \"message_2\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        700\n      ],\n      \"text\": \"message +2\\nmessage: set size of pwindow & dim of matrix. message. jit.matrix \\u2014 Stores and processes a matrix of data (adapt 0 = fixed size). jit.fpsgui \\u2014 Shows the current processing frame rate.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubble\": 1,\n        \"hidden\": 1,\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-4\"\n      }\n    },\n    \"jit_pwindow_2\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        10,\n        700\n      ],\n      \"text\": \"jit.pwindow\\njit.pwindow \\u2014 Displays a Jitter matrix as a video preview window.\",\n      \"size\": [\n        60,\n        24\n      ],\n      \"attrs\": {\n        \"fontsize\": 11.0,\n        \"bubble_bgcolor\": [\n          1.0,\n          0.98,\n          0.72,\n          1.0\n        ],\n        \"textcolor\": [\n          0.0,\n          0.0,\n          0.0,\n          1.0\n        ],\n        \"bubble\": 1,\n        \"hidden\": 1,\n        \"bubbleside\": 1,\n        \"varname\": \"tut-ann-5\"\n      }\n    }\n  },\n  \"connections\": [\n    [\n      \"toggle\",\n      0,\n      \"jit_grab\",\n      0\n    ],\n    [\n      \"jit_grab\",\n      0,\n      \"jit_matrixinfo\",\n      0\n    ],\n    [\n      \"jit_grab\",\n      0,\n      \"jit_fpsgui\",\n      0\n    ],\n    [\n      \"jit_grab\",\n      0,\n      \"jit_matrix\",\n      0\n    ],\n    [\n      \"jit_matrixinfo\",\n      0,\n      \"route\",\n      0\n    ],\n    [\n      \"route\",\n      0,\n      \"vexpr\",\n      0\n    ],\n    [\n      \"loadmess\",\n      0,\n      \"flonum\",\n      0\n    ],\n    [\n      \"flonum\",\n      0,\n      \"vexpr\",\n      1\n    ],\n    [\n      \"vexpr\",\n      0,\n      \"dim\",\n      0\n    ],\n    [\n      \"vexpr\",\n      0,\n      \"size\",\n      0\n    ],\n    [\n      \"dim\",\n      0,\n      \"jit_matrix\",\n      0\n    ],\n    [\n      \"jit_matrix\",\n      0,\n      \"jit_pwindow\",\n      0\n    ],\n    [\n      \"jit_matrix\",\n      0,\n      \"jit_fpsgui_2\",\n      0\n    ],\n    [\n      \"size\",\n      0,\n      \"jit_pwindow\",\n      0\n    ],\n    [\n      \"umenu\",\n      0,\n      \"v8\",\n      0\n    ],\n    [\n      \"prev\",\n      0,\n      \"v8\",\n      0\n    ],\n    [\n      \"next\",\n      0,\n      \"v8\",\n      0\n    ],\n    [\n      \"loadbang\",\n      0,\n      \"v8\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
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
