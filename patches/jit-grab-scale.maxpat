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
      720.0
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
          "fontface": 1
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
          "text": "jit.world @fsaa 1 @enable 1 @visible 0"
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
            "matrix / texture",
            "matrix / texture"
          ],
          "patching_rect": [
            321.0,
            89.0,
            100.0,
            26.0
          ],
          "text": "jit.grab"
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
          "mode": 3
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
          "text": "jit.matrixinfo"
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
          "text": "analyze the image"
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
          "text": "route dim"
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
          "text": "report the dim"
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
          "text": "vexpr $f1 / $f2 @scalarmode 1"
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
          "text": "loadmess 5"
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
          ]
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
          "text": "scale image and pwindow"
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
          "text": "dim $1 $2"
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
          "text": "size $1 $2"
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
          "text": "set size of pwindow & dim of matrix"
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
          "text": "jit.matrix @adapt 0"
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
          "mode": 3
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
            707.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"name\": \"jit-grab-scale\",\n  \"width\": 950,\n  \"height\": 720,\n  \"objects\": {\n    \"jit_world\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        38,\n        37\n      ],\n      \"text\": \"jit.world @fsaa 1 @enable 1 @visible 0\",\n      \"size\": [\n        198,\n        43\n      ]\n    },\n    \"toggle\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        321,\n        46\n      ]\n    },\n    \"jit_grab\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        321,\n        89\n      ],\n      \"text\": \"jit.grab\",\n      \"size\": [\n        100,\n        26\n      ]\n    },\n    \"jit_fpsgui\": {\n      \"type\": \"jit.fpsgui\",\n      \"pos\": [\n        108,\n        165\n      ],\n      \"size\": [\n        118,\n        40\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 14.0,\n        \"mode\": 3\n      }\n    },\n    \"jit_matrixinfo\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        374,\n        136\n      ],\n      \"text\": \"jit.matrixinfo\",\n      \"size\": [\n        126,\n        26\n      ]\n    },\n    \"analyze\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        514,\n        136\n      ],\n      \"text\": \"analyze the image\"\n    },\n    \"route\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        374,\n        172\n      ],\n      \"text\": \"route dim\",\n      \"size\": [\n        126,\n        26\n      ]\n    },\n    \"report\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        514,\n        173\n      ],\n      \"text\": \"report the dim\"\n    },\n    \"vexpr\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        374,\n        211\n      ],\n      \"text\": \"vexpr $f1 / $f2 @scalarmode 1\",\n      \"size\": [\n        269,\n        26\n      ]\n    },\n    \"loadmess\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        699,\n        140\n      ],\n      \"text\": \"loadmess 5\"\n    },\n    \"flonum\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        661,\n        211\n      ],\n      \"size\": [\n        75,\n        26\n      ]\n    },\n    \"scale\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        746,\n        212\n      ],\n      \"text\": \"scale image and pwindow\",\n      \"size\": [\n        151,\n        41\n      ]\n    },\n    \"dim\": {\n      \"type\": \"message\",\n      \"pos\": [\n        265,\n        250\n      ],\n      \"text\": \"dim $1 $2\",\n      \"size\": [\n        93,\n        26\n      ]\n    },\n    \"size\": {\n      \"type\": \"message\",\n      \"pos\": [\n        374,\n        250\n      ],\n      \"text\": \"size $1 $2\",\n      \"size\": [\n        93,\n        26\n      ]\n    },\n    \"set\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        475,\n        251\n      ],\n      \"text\": \"set size of pwindow & dim of matrix\",\n      \"size\": [\n        195,\n        41\n      ]\n    },\n    \"jit_matrix\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        141,\n        301\n      ],\n      \"text\": \"jit.matrix @adapt 0\",\n      \"size\": [\n        168,\n        26\n      ]\n    },\n    \"jit_fpsgui_2\": {\n      \"type\": \"jit.fpsgui\",\n      \"pos\": [\n        141,\n        354\n      ],\n      \"size\": [\n        80,\n        40\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 14.0,\n        \"mode\": 3\n      }\n    },\n    \"jit_pwindow\": {\n      \"type\": \"jit.pwindow\",\n      \"pos\": [\n        374,\n        354\n      ],\n      \"size\": [\n        313,\n        313\n      ]\n    }\n  },\n  \"connections\": [\n    [\n      \"toggle\",\n      0,\n      \"jit_grab\",\n      0\n    ],\n    [\n      \"jit_grab\",\n      0,\n      \"jit_matrixinfo\",\n      0\n    ],\n    [\n      \"jit_grab\",\n      0,\n      \"jit_fpsgui\",\n      0\n    ],\n    [\n      \"jit_grab\",\n      0,\n      \"jit_matrix\",\n      0\n    ],\n    [\n      \"jit_matrixinfo\",\n      0,\n      \"route\",\n      0\n    ],\n    [\n      \"route\",\n      0,\n      \"vexpr\",\n      0\n    ],\n    [\n      \"loadmess\",\n      0,\n      \"flonum\",\n      0\n    ],\n    [\n      \"flonum\",\n      0,\n      \"vexpr\",\n      1\n    ],\n    [\n      \"vexpr\",\n      0,\n      \"dim\",\n      0\n    ],\n    [\n      \"vexpr\",\n      0,\n      \"size\",\n      0\n    ],\n    [\n      \"dim\",\n      0,\n      \"jit_matrix\",\n      0\n    ],\n    [\n      \"jit_matrix\",\n      0,\n      \"jit_pwindow\",\n      0\n    ],\n    [\n      \"jit_matrix\",\n      0,\n      \"jit_fpsgui_2\",\n      0\n    ],\n    [\n      \"size\",\n      0,\n      \"jit_pwindow\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
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
      }
    ],
    "default_fontsize": 12.0,
    "default_fontname": "Arial"
  }
}
