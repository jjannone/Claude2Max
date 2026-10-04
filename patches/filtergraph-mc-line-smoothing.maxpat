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
      820.0,
      740.0
    ],
    "gridsize": [
      15.0,
      15.0
    ],
    "boxes": [
      {
        "box": {
          "id": "obj-4",
          "maxclass": "filtergraph~",
          "numinlets": 8,
          "numoutlets": 7,
          "outlettype": [
            "list",
            "float",
            "float",
            "float",
            "float",
            "list",
            "int"
          ],
          "patching_rect": [
            110.0,
            95.0,
            360.0,
            150.0
          ],
          "presentation": 1,
          "presentation_rect": [
            15.0,
            40.0,
            440.0,
            180.0
          ],
          "prototypename": "M4L.black",
          "fontname": "Arial",
          "fontsize": 8.0,
          "bgcolor": [
            0.094118,
            0.113725,
            0.137255,
            1.0
          ],
          "curvecolor": [
            0.317647,
            0.654902,
            0.976471,
            1.0
          ],
          "hcurvecolor": [
            1.0,
            0.603922,
            0.0,
            1.0
          ],
          "markercolor": [
            0.301961,
            0.337255,
            0.403922,
            1.0
          ],
          "textcolor": [
            0.666667,
            0.698039,
            0.717647,
            1.0
          ],
          "range": [
            0.04166699945926666,
            24.0
          ],
          "numdisplay": 0,
          "autoout": 1,
          "setfilter": [
            0,
            1,
            1,
            1,
            0,
            2147.703857421875,
            1.0,
            0.7071067690849304,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0,
            0.0
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
            490.0,
            95.0,
            300.0,
            50.0
          ],
          "text": "drag the handle: the left outlet sends a list of 5 coefficients (a0 a1 a2 b1 b2)"
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            110.0,
            290.0,
            60.0,
            22.0
          ],
          "text": "t l b"
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
            185.0,
            255.0,
            300.0,
            35.0
          ],
          "text": "b fires first and resends the ramp time, then l sends the 5 targets"
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
            500.0,
            290.0,
            120.0,
            22.0
          ],
          "text": "loadmess 20"
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            500.0,
            330.0,
            70.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            15.0,
            235.0,
            70.0,
            22.0
          ]
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
            585.0,
            330.0,
            160.0,
            20.0
          ],
          "text": "ramp time (ms)",
          "presentation": 1,
          "presentation_rect": [
            95.0,
            236.0,
            160.0,
            21.0
          ]
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
            110.0,
            330.0,
            200.0,
            22.0
          ],
          "text": "prepend applyvalues"
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
            320.0,
            332.0,
            150.0,
            35.0
          ],
          "text": "one value to each channel"
        }
      },
      {
        "box": {
          "id": "obj-13",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            110.0,
            385.0,
            180.0,
            22.0
          ],
          "text": "mc.line~ @chans 5"
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            320.0,
            390.0,
            330.0,
            20.0
          ],
          "text": "5 line~ ramps in one box, one per coefficient"
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
            440.0,
            60.0,
            22.0
          ],
          "text": "noise~"
        }
      },
      {
        "box": {
          "id": "obj-16",
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
            110.0,
            440.0,
            130.0,
            22.0
          ],
          "text": "mc.unpack~ 5"
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
            255.0,
            440.0,
            210.0,
            20.0
          ],
          "text": "split into 5 signals"
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "newobj",
          "numinlets": 6,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            30.0,
            500.0,
            220.0,
            22.0
          ],
          "text": "biquad~"
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            265.0,
            500.0,
            330.0,
            35.0
          ],
          "text": "sound in the left inlet; a0 a1 a2 b1 b2 as signals in the other five"
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
            130.0,
            555.0,
            130.0,
            22.0
          ],
          "text": "loadmess -18"
        }
      },
      {
        "box": {
          "id": "obj-21",
          "maxclass": "live.gain~",
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "signal",
            "",
            "float",
            "list"
          ],
          "patching_rect": [
            30.0,
            600.0,
            220.0,
            45.0
          ],
          "presentation": 1,
          "presentation_rect": [
            15.0,
            272.0,
            300.0,
            45.0
          ],
          "orientation": 1,
          "channels": 1
        }
      },
      {
        "box": {
          "id": "obj-22",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            265.0,
            612.0,
            250.0,
            20.0
          ],
          "text": "level (starts at -18 dB)",
          "presentation": 1,
          "presentation_rect": [
            325.0,
            285.0,
            250.0,
            21.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-23",
          "maxclass": "ezdac~",
          "numinlets": 2,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            670.0,
            45.0,
            45.0
          ],
          "presentation": 1,
          "presentation_rect": [
            15.0,
            330.0,
            45.0,
            45.0
          ]
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
            90.0,
            682.0,
            210.0,
            20.0
          ],
          "text": "click to start audio",
          "presentation": 1,
          "presentation_rect": [
            70.0,
            342.0,
            210.0,
            21.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-25",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            490.0,
            20.0,
            300.0,
            35.0
          ],
          "text": "drag the filter handle: the coefficients glide instead of jumping",
          "presentation": 1,
          "presentation_rect": [
            15.0,
            10.0,
            500.0,
            21.0
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
            755.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"width\": 820,\n  \"height\": 740,\n  \"openinpresentation\": 1,\n  \"objects\": {\n    \"fg\": {\n      \"type\": \"filtergraph~\",\n      \"pos\": [\n        110,\n        95\n      ],\n      \"size\": [\n        360,\n        150\n      ],\n      \"presentation\": [\n        15,\n        40,\n        440,\n        180\n      ],\n      \"attrs\": {\n        \"fontsize\": 8.0,\n        \"textcolor\": [\n          0.666667,\n          0.698039,\n          0.717647,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.094118,\n          0.113725,\n          0.137255,\n          1.0\n        ]\n      },\n      \"inlets\": 8,\n      \"outlets\": 7,\n      \"outlettype\": [\n        \"list\",\n        \"float\",\n        \"float\",\n        \"float\",\n        \"float\",\n        \"list\",\n        \"int\"\n      ],\n      \"box_extras\": {\n        \"prototypename\": \"M4L.black\",\n        \"curvecolor\": [\n          0.317647,\n          0.654902,\n          0.976471,\n          1.0\n        ],\n        \"hcurvecolor\": [\n          1.0,\n          0.603922,\n          0.0,\n          1.0\n        ],\n        \"markercolor\": [\n          0.301961,\n          0.337255,\n          0.403922,\n          1.0\n        ],\n        \"range\": [\n          0.04166699945926666,\n          24.0\n        ],\n        \"numdisplay\": 0,\n        \"autoout\": 1,\n        \"setfilter\": [\n          0,\n          1,\n          1,\n          1,\n          0,\n          2147.703857421875,\n          1.0,\n          0.7071067690849304,\n          0.0,\n          0.0,\n          0.0,\n          0.0,\n          0.0,\n          0.0\n        ]\n      }\n    },\n    \"fg_cmt\": {\n      \"type\": \"comment\",\n      \"text\": \"drag the handle: the left outlet sends a list of 5 coefficients (a0 a1 a2 b1 b2)\",\n      \"pos\": [\n        490,\n        95\n      ],\n      \"size\": [\n        300,\n        50\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"trig\": {\n      \"type\": \"newobj\",\n      \"text\": \"t l b\",\n      \"pos\": [\n        110,\n        290\n      ],\n      \"size\": [\n        60,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"trig_cmt\": {\n      \"type\": \"comment\",\n      \"text\": \"b fires first and resends the ramp time, then l sends the 5 targets\",\n      \"pos\": [\n        185,\n        255\n      ],\n      \"size\": [\n        300,\n        35\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"ramp_init\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 20\",\n      \"pos\": [\n        500,\n        290\n      ],\n      \"size\": [\n        120,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"ramp\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        500,\n        330\n      ],\n      \"size\": [\n        70,\n        22\n      ],\n      \"presentation\": [\n        15,\n        235,\n        70,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"float\",\n        \"bang\"\n      ]\n    },\n    \"ramp_cmt\": {\n      \"type\": \"comment\",\n      \"text\": \"ramp time (ms)\",\n      \"pos\": [\n        585,\n        330\n      ],\n      \"size\": [\n        160,\n        20\n      ],\n      \"presentation\": [\n        95,\n        236,\n        160,\n        21\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"prep\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend applyvalues\",\n      \"pos\": [\n        110,\n        330\n      ],\n      \"size\": [\n        200,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"prep_cmt\": {\n      \"type\": \"comment\",\n      \"text\": \"one value to each channel\",\n      \"pos\": [\n        320,\n        332\n      ],\n      \"size\": [\n        150,\n        35\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"mcline\": {\n      \"type\": \"newobj\",\n      \"text\": \"mc.line~ @chans 5\",\n      \"pos\": [\n        110,\n        385\n      ],\n      \"size\": [\n        180,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\"\n      ]\n    },\n    \"mcline_cmt\": {\n      \"type\": \"comment\",\n      \"text\": \"5 line~ ramps in one box, one per coefficient\",\n      \"pos\": [\n        320,\n        390\n      ],\n      \"size\": [\n        330,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"noise\": {\n      \"type\": \"newobj\",\n      \"text\": \"noise~\",\n      \"pos\": [\n        30,\n        440\n      ],\n      \"size\": [\n        60,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"unpack\": {\n      \"type\": \"newobj\",\n      \"text\": \"mc.unpack~ 5\",\n      \"pos\": [\n        110,\n        440\n      ],\n      \"size\": [\n        130,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 5,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\"\n      ]\n    },\n    \"unpack_cmt\": {\n      \"type\": \"comment\",\n      \"text\": \"split into 5 signals\",\n      \"pos\": [\n        255,\n        440\n      ],\n      \"size\": [\n        210,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"bq\": {\n      \"type\": \"newobj\",\n      \"text\": \"biquad~\",\n      \"pos\": [\n        30,\n        500\n      ],\n      \"size\": [\n        220,\n        22\n      ],\n      \"inlets\": 6,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"signal\"\n      ]\n    },\n    \"bq_cmt\": {\n      \"type\": \"comment\",\n      \"text\": \"sound in the left inlet; a0 a1 a2 b1 b2 as signals in the other five\",\n      \"pos\": [\n        265,\n        500\n      ],\n      \"size\": [\n        330,\n        35\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"gain_init\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess -18\",\n      \"pos\": [\n        130,\n        555\n      ],\n      \"size\": [\n        130,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"gain\": {\n      \"type\": \"live.gain~\",\n      \"pos\": [\n        30,\n        600\n      ],\n      \"size\": [\n        220,\n        45\n      ],\n      \"inlets\": 1,\n      \"outlets\": 4,\n      \"outlettype\": [\n        \"signal\",\n        \"\",\n        \"float\",\n        \"list\"\n      ],\n      \"attrs\": {\n        \"orientation\": 1,\n        \"channels\": 1\n      },\n      \"presentation\": [\n        15,\n        272,\n        300,\n        45\n      ],\n      \"box_extras\": {\n        \"orientation\": 1,\n        \"channels\": 1\n      }\n    },\n    \"gain_cmt\": {\n      \"type\": \"comment\",\n      \"text\": \"level (starts at -18 dB)\",\n      \"pos\": [\n        265,\n        612\n      ],\n      \"size\": [\n        250,\n        20\n      ],\n      \"presentation\": [\n        325,\n        285,\n        250,\n        21\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"dac\": {\n      \"type\": \"ezdac~\",\n      \"pos\": [\n        30,\n        670\n      ],\n      \"presentation\": [\n        15,\n        330,\n        45,\n        45\n      ],\n      \"inlets\": 2,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"dac_cmt\": {\n      \"type\": \"comment\",\n      \"text\": \"click to start audio\",\n      \"pos\": [\n        90,\n        682\n      ],\n      \"size\": [\n        210,\n        20\n      ],\n      \"presentation\": [\n        70,\n        342,\n        210,\n        21\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"p_title\": {\n      \"type\": \"comment\",\n      \"text\": \"drag the filter handle: the coefficients glide instead of jumping\",\n      \"pos\": [\n        490,\n        20\n      ],\n      \"size\": [\n        300,\n        35\n      ],\n      \"presentation\": [\n        15,\n        10,\n        500,\n        21\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    }\n  },\n  \"connections\": [\n    [\n      \"fg\",\n      0,\n      \"trig\",\n      0\n    ],\n    [\n      \"trig\",\n      1,\n      \"ramp\",\n      0\n    ],\n    [\n      \"ramp_init\",\n      0,\n      \"ramp\",\n      0\n    ],\n    [\n      \"trig\",\n      0,\n      \"prep\",\n      0\n    ],\n    [\n      \"ramp\",\n      0,\n      \"mcline\",\n      1\n    ],\n    [\n      \"prep\",\n      0,\n      \"mcline\",\n      0\n    ],\n    [\n      \"mcline\",\n      0,\n      \"unpack\",\n      0\n    ],\n    [\n      \"noise\",\n      0,\n      \"bq\",\n      0\n    ],\n    [\n      \"unpack\",\n      0,\n      \"bq\",\n      1\n    ],\n    [\n      \"unpack\",\n      1,\n      \"bq\",\n      2\n    ],\n    [\n      \"unpack\",\n      2,\n      \"bq\",\n      3\n    ],\n    [\n      \"unpack\",\n      3,\n      \"bq\",\n      4\n    ],\n    [\n      \"unpack\",\n      4,\n      \"bq\",\n      5\n    ],\n    [\n      \"bq\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"gain_init\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"gain\",\n      0,\n      \"dac\",\n      0\n    ],\n    [\n      \"gain\",\n      0,\n      \"dac\",\n      1\n    ]\n  ]\n}\n--- END SPEC ---",
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
            "obj-9",
            0
          ],
          "source": [
            "obj-6",
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
            "obj-8",
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
            "obj-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-13",
            1
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
            "obj-13",
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
            "obj-15",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-18",
            1
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
            2
          ],
          "source": [
            "obj-16",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-18",
            3
          ],
          "source": [
            "obj-16",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-18",
            4
          ],
          "source": [
            "obj-16",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-18",
            5
          ],
          "source": [
            "obj-16",
            4
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
            "obj-18",
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
            "obj-23",
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
            1
          ],
          "source": [
            "obj-21",
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
