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
      760.0,
      660.0
    ],
    "gridsize": [
      15.0,
      15.0
    ],
    "boxes": [
      {
        "box": {
          "id": "obj-1",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            60.0,
            48.0,
            22.0
          ],
          "text": "plug",
          "presentation": 1,
          "presentation_rect": [
            22.0,
            34.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            90.0,
            60.0,
            48.0,
            22.0
          ],
          "text": "open",
          "presentation": 1,
          "presentation_rect": [
            80.0,
            34.0,
            50.0,
            22.0
          ]
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
            150.0,
            60.0,
            300.0,
            20.0
          ],
          "text": "load a plug-in  /  open its editor window",
          "presentation": 1,
          "presentation_rect": [
            140.0,
            36.0,
            440.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            130.0,
            55.0,
            22.0
          ],
          "text": "flush",
          "presentation": 1,
          "presentation_rect": [
            22.0,
            206.0,
            60.0,
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
            90.0,
            130.0,
            260.0,
            20.0
          ],
          "text": "send note-offs for every held note",
          "presentation": 1,
          "presentation_rect": [
            92.0,
            208.0,
            400.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "kslider",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            190.0,
            336.0,
            53.0
          ],
          "presentation": 1,
          "presentation_rect": [
            22.0,
            104.0,
            576.0,
            70.0
          ],
          "mode": 1
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
            30.0,
            250.0,
            420.0,
            20.0
          ],
          "text": "polyphonic: click a key once for note-on, again for note-off",
          "presentation": 1,
          "presentation_rect": [
            22.0,
            178.0,
            560.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            300.0,
            62.0,
            22.0
          ],
          "text": "join 2"
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
            470.0,
            130.0,
            76.0,
            22.0
          ],
          "text": "restrike",
          "presentation": 1,
          "presentation_rect": [
            22.0,
            238.0,
            74.0,
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
            550.0,
            130.0,
            340.0,
            20.0
          ],
          "text": "flush the keyboard, then replay the stored notes",
          "presentation": 1,
          "presentation_rect": [
            106.0,
            240.0,
            480.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ]
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
            470.0,
            300.0,
            174.0,
            22.0
          ],
          "text": "v8 kslider-restrike.js"
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
            470.0,
            340.0,
            270.0,
            20.0
          ],
          "text": "out 0 feeds back UP into the kslider: flush, then one chord message",
          "fontname": "Monaco",
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "obj-13",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            470.0,
            400.0,
            97.0,
            22.0
          ],
          "text": "prepend set"
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
            470.0,
            450.0,
            62.0,
            22.0
          ],
          "text": "(none)",
          "presentation": 1,
          "presentation_rect": [
            22.0,
            270.0,
            420.0,
            22.0
          ]
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
            680.0,
            450.0,
            110.0,
            20.0
          ],
          "text": "stored pitches",
          "presentation": 1,
          "presentation_rect": [
            450.0,
            272.0,
            140.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-16",
          "maxclass": "newobj",
          "numinlets": 7,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            30.0,
            360.0,
            90.0,
            22.0
          ],
          "text": "midiformat"
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 8,
          "outlettype": [
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal",
            "signal"
          ],
          "patching_rect": [
            30.0,
            420.0,
            48.0,
            22.0
          ],
          "text": "vst~"
        }
      },
      {
        "box": {
          "id": "obj-18",
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
            490.0,
            136.0,
            39.0
          ],
          "presentation": 1,
          "presentation_rect": [
            22.0,
            330.0,
            200.0,
            39.0
          ],
          "orientation": 1
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
            180.0,
            500.0,
            90.0,
            20.0
          ],
          "text": "volume (dB)",
          "presentation": 1,
          "presentation_rect": [
            230.0,
            340.0,
            100.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "ezdac~",
          "numinlets": 2,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            30.0,
            580.0,
            45.0,
            45.0
          ],
          "presentation": 1,
          "presentation_rect": [
            340.0,
            327.0,
            45.0,
            45.0
          ]
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
            90.0,
            592.0,
            100.0,
            20.0
          ],
          "text": "audio on/off",
          "presentation": 1,
          "presentation_rect": [
            395.0,
            340.0,
            120.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ]
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
            600.0,
            20.0,
            70.0,
            20.0
          ],
          "text": "plug-in",
          "presentation": 1,
          "presentation_rect": [
            22.0,
            14.0,
            100.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
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
            600.0,
            44.0,
            70.0,
            20.0
          ],
          "text": "keyboard",
          "presentation": 1,
          "presentation_rect": [
            22.0,
            84.0,
            100.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
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
            600.0,
            68.0,
            70.0,
            20.0
          ],
          "text": "output",
          "presentation": 1,
          "presentation_rect": [
            22.0,
            310.0,
            100.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 11,
          "textcolor": [
            1.0,
            0.55,
            0.0,
            1.0
          ],
          "bgcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-25",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            680.0,
            20.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            10.0,
            600.0,
            60.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8
        }
      },
      {
        "box": {
          "id": "obj-26",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            680.0,
            44.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            80.0,
            600.0,
            218.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8
        }
      },
      {
        "box": {
          "id": "obj-27",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            680.0,
            68.0,
            60.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            306.0,
            600.0,
            80.0
          ],
          "bgfillcolor": [
            0.13,
            0.13,
            0.15,
            1.0
          ],
          "rounded": 8
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
            665.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"width\": 760,\n  \"height\": 660,\n  \"objects\": {\n    \"msg_plug\": {\n      \"type\": \"message\",\n      \"text\": \"plug\",\n      \"pos\": [\n        30,\n        60\n      ],\n      \"presentation\": [\n        22,\n        34,\n        50,\n        22\n      ]\n    },\n    \"msg_open\": {\n      \"type\": \"message\",\n      \"text\": \"open\",\n      \"pos\": [\n        90,\n        60\n      ],\n      \"presentation\": [\n        80,\n        34,\n        50,\n        22\n      ]\n    },\n    \"lbl_plug\": {\n      \"type\": \"comment\",\n      \"text\": \"load a plug-in  /  open its editor window\",\n      \"pos\": [\n        150,\n        60\n      ],\n      \"size\": [\n        300,\n        20\n      ],\n      \"presentation\": [\n        140,\n        36,\n        440,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"msg_flush\": {\n      \"type\": \"message\",\n      \"text\": \"flush\",\n      \"pos\": [\n        30,\n        130\n      ],\n      \"presentation\": [\n        22,\n        206,\n        60,\n        22\n      ]\n    },\n    \"lbl_flush\": {\n      \"type\": \"comment\",\n      \"text\": \"send note-offs for every held note\",\n      \"pos\": [\n        90,\n        130\n      ],\n      \"size\": [\n        260,\n        20\n      ],\n      \"presentation\": [\n        92,\n        208,\n        400,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"kslider\": {\n      \"type\": \"kslider\",\n      \"pos\": [\n        30,\n        190\n      ],\n      \"size\": [\n        336,\n        53\n      ],\n      \"attrs\": {\n        \"mode\": 1\n      },\n      \"presentation\": [\n        22,\n        104,\n        576,\n        70\n      ]\n    },\n    \"lbl_keys\": {\n      \"type\": \"comment\",\n      \"text\": \"polyphonic: click a key once for note-on, again for note-off\",\n      \"pos\": [\n        30,\n        250\n      ],\n      \"size\": [\n        420,\n        20\n      ],\n      \"presentation\": [\n        22,\n        178,\n        560,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"join\": {\n      \"type\": \"newobj\",\n      \"text\": \"join 2\",\n      \"pos\": [\n        30,\n        300\n      ]\n    },\n    \"msg_restrike\": {\n      \"type\": \"message\",\n      \"text\": \"restrike\",\n      \"pos\": [\n        470,\n        130\n      ],\n      \"presentation\": [\n        22,\n        238,\n        74,\n        22\n      ]\n    },\n    \"lbl_restrike\": {\n      \"type\": \"comment\",\n      \"text\": \"flush the keyboard, then replay the stored notes\",\n      \"pos\": [\n        550,\n        130\n      ],\n      \"size\": [\n        340,\n        20\n      ],\n      \"presentation\": [\n        106,\n        240,\n        480,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"v8\": {\n      \"type\": \"newobj\",\n      \"text\": \"v8 kslider-restrike.js\",\n      \"pos\": [\n        470,\n        300\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"lbl_v8\": {\n      \"type\": \"comment\",\n      \"text\": \"out 0 feeds back UP into the kslider: flush, then one chord message\",\n      \"pos\": [\n        470,\n        340\n      ],\n      \"size\": [\n        270,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11\n      }\n    },\n    \"prepend_set\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend set\",\n      \"pos\": [\n        470,\n        400\n      ]\n    },\n    \"msg_stored\": {\n      \"type\": \"message\",\n      \"text\": \"(none)\",\n      \"pos\": [\n        470,\n        450\n      ],\n      \"presentation\": [\n        22,\n        270,\n        420,\n        22\n      ]\n    },\n    \"lbl_stored\": {\n      \"type\": \"comment\",\n      \"text\": \"stored pitches\",\n      \"pos\": [\n        680,\n        450\n      ],\n      \"size\": [\n        110,\n        20\n      ],\n      \"presentation\": [\n        450,\n        272,\n        140,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"midiformat\": {\n      \"type\": \"newobj\",\n      \"text\": \"midiformat\",\n      \"pos\": [\n        30,\n        360\n      ]\n    },\n    \"vst\": {\n      \"type\": \"newobj\",\n      \"text\": \"vst~\",\n      \"pos\": [\n        30,\n        420\n      ]\n    },\n    \"gain\": {\n      \"type\": \"live.gain~\",\n      \"pos\": [\n        30,\n        490\n      ],\n      \"size\": [\n        136,\n        39\n      ],\n      \"attrs\": {\n        \"orientation\": 1\n      },\n      \"presentation\": [\n        22,\n        330,\n        200,\n        39\n      ]\n    },\n    \"lbl_gain\": {\n      \"type\": \"comment\",\n      \"text\": \"volume (dB)\",\n      \"pos\": [\n        180,\n        500\n      ],\n      \"size\": [\n        90,\n        20\n      ],\n      \"presentation\": [\n        230,\n        340,\n        100,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"dac\": {\n      \"type\": \"ezdac~\",\n      \"pos\": [\n        30,\n        580\n      ],\n      \"presentation\": [\n        340,\n        327,\n        45,\n        45\n      ]\n    },\n    \"lbl_dac\": {\n      \"type\": \"comment\",\n      \"text\": \"audio on/off\",\n      \"pos\": [\n        90,\n        592\n      ],\n      \"size\": [\n        100,\n        20\n      ],\n      \"presentation\": [\n        395,\n        340,\n        120,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"hdr_plug\": {\n      \"type\": \"comment\",\n      \"text\": \"plug-in\",\n      \"pos\": [\n        600,\n        20\n      ],\n      \"size\": [\n        70,\n        20\n      ],\n      \"presentation\": [\n        22,\n        14,\n        100,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"hdr_keys\": {\n      \"type\": \"comment\",\n      \"text\": \"keyboard\",\n      \"pos\": [\n        600,\n        44\n      ],\n      \"size\": [\n        70,\n        20\n      ],\n      \"presentation\": [\n        22,\n        84,\n        100,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"hdr_out\": {\n      \"type\": \"comment\",\n      \"text\": \"output\",\n      \"pos\": [\n        600,\n        68\n      ],\n      \"size\": [\n        70,\n        20\n      ],\n      \"presentation\": [\n        22,\n        310,\n        100,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 11,\n        \"textcolor\": [\n          1.0,\n          0.55,\n          0.0,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ]\n      }\n    },\n    \"panel_plug\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        680,\n        20\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        10,\n        600,\n        60\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8\n      }\n    },\n    \"panel_keys\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        680,\n        44\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        80,\n        600,\n        218\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8\n      }\n    },\n    \"panel_out\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        680,\n        68\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        10,\n        306,\n        600,\n        80\n      ],\n      \"attrs\": {\n        \"bgfillcolor\": [\n          0.13,\n          0.13,\n          0.15,\n          1.0\n        ],\n        \"rounded\": 8\n      }\n    }\n  },\n  \"connections\": [\n    [\n      \"msg_plug\",\n      0,\n      \"vst\",\n      0\n    ],\n    [\n      \"msg_open\",\n      0,\n      \"vst\",\n      0\n    ],\n    [\n      \"msg_flush\",\n      0,\n      \"kslider\",\n      0\n    ],\n    [\n      \"kslider\",\n      0,\n      \"join\",\n      0\n    ],\n    [\n      \"kslider\",\n      1,\n      \"join\",\n      1\n    ],\n    [\n      \"join\",\n      0,\n      \"midiformat\",\n      0\n    ],\n    [\n      \"join\",\n      0,\n      \"v8\",\n      0\n    ],\n    [\n      \"msg_restrike\",\n      0,\n      \"v8\",\n      0\n    ],\n    [\n      \"v8\",\n      0,\n      \"kslider\",\n      0\n    ],\n    [\n      \"prepend_set\",\n      0,\n      \"msg_stored\",\n      0\n    ],\n    [\n      \"midiformat\",\n      1,\n      \"vst\",\n      0\n    ],\n    [\n      \"vst\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"vst\",\n      1,\n      \"gain\",\n      1\n    ],\n    [\n      \"gain\",\n      0,\n      \"dac\",\n      0\n    ],\n    [\n      \"gain\",\n      1,\n      \"dac\",\n      1\n    ],\n    [\n      \"v8\",\n      1,\n      \"prepend_set\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
          "fontsize": 9.0,
          "hidden": 1
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "obj-17",
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
            "obj-8",
            1
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
            "obj-16",
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
            "obj-9",
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
            "obj-11",
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
            "obj-17",
            0
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
            "obj-18",
            1
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
            1
          ],
          "source": [
            "obj-18",
            1
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
      }
    ],
    "default_fontsize": 12.0,
    "default_fontname": "Arial",
    "openinpresentation": 1
  }
}
