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
      650.0,
      870.0
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
          "text": "Drift Sequencer",
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
            160.0,
            22.0
          ],
          "text": "loadmess 200 100 150"
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            250.0,
            60.0,
            104.0,
            22.0
          ],
          "text": "unpack 0 0 0"
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
            80.0,
            82.0,
            90.0,
            22.0
          ],
          "text": "tempo (ms)"
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            65.0,
            100.0,
            50.0,
            22.0
          ],
          "minimum": 50,
          "maximum": 2000
        }
      },
      {
        "box": {
          "id": "obj-5",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            30.0,
            140.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            30.0,
            170.0,
            83.0,
            22.0
          ],
          "text": "metro 200"
        }
      },
      {
        "box": {
          "id": "obj-7",
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
            30.0,
            205.0,
            97.0,
            22.0
          ],
          "text": "counter 0 7"
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            30.0,
            240.0,
            41.0,
            22.0
          ],
          "text": "+ 1"
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
            30.0,
            275.0,
            111.0,
            22.0
          ],
          "text": "prepend fetch"
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
            45.0,
            310.0,
            209.0,
            22.0
          ],
          "text": "pitch (8 steps, MIDI 36-84)"
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "multislider",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            330.0,
            120.0,
            80.0
          ],
          "size": 8,
          "setminmax": [
            36.0,
            84.0
          ],
          "setstyle": 1,
          "candicane2": [
            0.14,
            0.69,
            0.78,
            1.0
          ],
          "slidercolor": [
            0.14,
            0.69,
            0.78,
            1.0
          ],
          "bgcolor": [
            0.15,
            0.15,
            0.15,
            1.0
          ],
          "orientation": 1
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
            250.0,
            475.0,
            50.0,
            22.0
          ]
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
            355.0,
            492.0,
            76.0,
            22.0
          ],
          "text": "velocity"
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
            340.0,
            510.0,
            50.0,
            22.0
          ],
          "minimum": 1,
          "maximum": 127
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
            445.0,
            492.0,
            111.0,
            22.0
          ],
          "text": "duration (ms)"
        }
      },
      {
        "box": {
          "id": "obj-16",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            430.0,
            510.0,
            50.0,
            22.0
          ],
          "minimum": 10,
          "maximum": 2000
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "float"
          ],
          "patching_rect": [
            250.0,
            550.0,
            132.0,
            22.0
          ],
          "text": "makenote 100 150"
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            250.0,
            585.0,
            97.0,
            22.0
          ],
          "text": "pack 60 100"
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "newobj",
          "numinlets": 7,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            250.0,
            620.0,
            90.0,
            22.0
          ],
          "text": "midiformat"
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            250.0,
            655.0,
            139.0,
            22.0
          ],
          "text": "abl.device.drift~"
        }
      },
      {
        "box": {
          "id": "obj-21",
          "maxclass": "gain~",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            ""
          ],
          "patching_rect": [
            250.0,
            695.0,
            22.0,
            140.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-22",
          "maxclass": "ezdac~",
          "numinlets": 2,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            250.0,
            790.0,
            45.0,
            45.0
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
            30.0,
            840.0,
            300.0,
            22.0
          ],
          "text": "Turn on audio, set pitches, click toggle"
        }
      },
      {
        "box": {
          "id": "obj-spec-embed",
          "maxclass": "codebox",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            50.0,
            902.0,
            500.0,
            300.0
          ],
          "text": "--- CLAUDE2MAX SPEC ---\n{\n  \"name\": \"Drift Sequencer\",\n  \"width\": 650,\n  \"height\": 870,\n  \"objects\": {\n    \"loadmess\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 200 100 150\",\n      \"pos\": [\n        250,\n        30\n      ]\n    },\n    \"unpack_init\": {\n      \"type\": \"newobj\",\n      \"text\": \"unpack 0 0 0\",\n      \"pos\": [\n        250,\n        60\n      ]\n    },\n    \"tempo_label\": {\n      \"type\": \"comment\",\n      \"text\": \"tempo (ms)\",\n      \"pos\": [\n        80,\n        82\n      ]\n    },\n    \"tempo\": {\n      \"type\": \"number\",\n      \"pos\": [\n        65,\n        100\n      ],\n      \"attrs\": {\n        \"minimum\": 50,\n        \"maximum\": 2000\n      }\n    },\n    \"onoff\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        30,\n        140\n      ]\n    },\n    \"metro\": {\n      \"type\": \"newobj\",\n      \"text\": \"metro 200\",\n      \"pos\": [\n        30,\n        170\n      ]\n    },\n    \"steps\": {\n      \"type\": \"newobj\",\n      \"text\": \"counter 0 7\",\n      \"pos\": [\n        30,\n        205\n      ]\n    },\n    \"step_plus1\": {\n      \"type\": \"newobj\",\n      \"text\": \"+ 1\",\n      \"pos\": [\n        30,\n        240\n      ]\n    },\n    \"fetch\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend fetch\",\n      \"pos\": [\n        30,\n        275\n      ]\n    },\n    \"pitch_label\": {\n      \"type\": \"comment\",\n      \"text\": \"pitch (8 steps, MIDI 36-84)\",\n      \"pos\": [\n        45,\n        310\n      ]\n    },\n    \"slider\": {\n      \"type\": \"multislider\",\n      \"pos\": [\n        30,\n        330\n      ],\n      \"size\": [\n        200,\n        120\n      ],\n      \"attrs\": {\n        \"size\": 8,\n        \"setminmax\": [\n          36.0,\n          84.0\n        ],\n        \"setstyle\": 1,\n        \"candicane2\": [\n          0.14,\n          0.69,\n          0.78,\n          1.0\n        ],\n        \"slidercolor\": [\n          0.14,\n          0.69,\n          0.78,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.15,\n          0.15,\n          0.15,\n          1.0\n        ],\n        \"orientation\": 1\n      }\n    },\n    \"pitch_display\": {\n      \"type\": \"number\",\n      \"pos\": [\n        250,\n        475\n      ]\n    },\n    \"vel_label\": {\n      \"type\": \"comment\",\n      \"text\": \"velocity\",\n      \"pos\": [\n        355,\n        492\n      ]\n    },\n    \"velocity\": {\n      \"type\": \"number\",\n      \"pos\": [\n        340,\n        510\n      ],\n      \"attrs\": {\n        \"minimum\": 1,\n        \"maximum\": 127\n      }\n    },\n    \"dur_label\": {\n      \"type\": \"comment\",\n      \"text\": \"duration (ms)\",\n      \"pos\": [\n        445,\n        492\n      ]\n    },\n    \"duration\": {\n      \"type\": \"number\",\n      \"pos\": [\n        430,\n        510\n      ],\n      \"attrs\": {\n        \"minimum\": 10,\n        \"maximum\": 2000\n      }\n    },\n    \"makenote\": {\n      \"type\": \"newobj\",\n      \"text\": \"makenote 100 150\",\n      \"pos\": [\n        250,\n        550\n      ]\n    },\n    \"pack_note\": {\n      \"type\": \"newobj\",\n      \"text\": \"pack 60 100\",\n      \"pos\": [\n        250,\n        585\n      ]\n    },\n    \"midiformat\": {\n      \"type\": \"newobj\",\n      \"text\": \"midiformat\",\n      \"pos\": [\n        250,\n        620\n      ]\n    },\n    \"drift\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.device.drift~\",\n      \"pos\": [\n        250,\n        655\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"gain\": {\n      \"type\": \"gain~\",\n      \"pos\": [\n        250,\n        695\n      ]\n    },\n    \"dac\": {\n      \"type\": \"ezdac~\",\n      \"pos\": [\n        250,\n        790\n      ]\n    },\n    \"info\": {\n      \"type\": \"comment\",\n      \"text\": \"Turn on audio, set pitches, click toggle\",\n      \"pos\": [\n        30,\n        840\n      ]\n    }\n  },\n  \"connections\": [\n    [\n      \"loadmess\",\n      0,\n      \"unpack_init\",\n      0\n    ],\n    [\n      \"unpack_init\",\n      0,\n      \"tempo\",\n      0\n    ],\n    [\n      \"unpack_init\",\n      1,\n      \"velocity\",\n      0\n    ],\n    [\n      \"unpack_init\",\n      2,\n      \"duration\",\n      0\n    ],\n    [\n      \"onoff\",\n      0,\n      \"metro\",\n      0\n    ],\n    [\n      \"tempo\",\n      0,\n      \"metro\",\n      1\n    ],\n    [\n      \"metro\",\n      0,\n      \"steps\",\n      0\n    ],\n    [\n      \"steps\",\n      0,\n      \"step_plus1\",\n      0\n    ],\n    [\n      \"step_plus1\",\n      0,\n      \"fetch\",\n      0\n    ],\n    [\n      \"fetch\",\n      0,\n      \"slider\",\n      0\n    ],\n    [\n      \"slider\",\n      1,\n      \"pitch_display\",\n      0\n    ],\n    [\n      \"pitch_display\",\n      0,\n      \"makenote\",\n      0\n    ],\n    [\n      \"velocity\",\n      0,\n      \"makenote\",\n      1\n    ],\n    [\n      \"duration\",\n      0,\n      \"makenote\",\n      2\n    ],\n    [\n      \"makenote\",\n      0,\n      \"pack_note\",\n      0\n    ],\n    [\n      \"makenote\",\n      1,\n      \"pack_note\",\n      1\n    ],\n    [\n      \"pack_note\",\n      0,\n      \"midiformat\",\n      0\n    ],\n    [\n      \"midiformat\",\n      0,\n      \"drift\",\n      0\n    ],\n    [\n      \"drift\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"drift\",\n      1,\n      \"gain\",\n      0\n    ],\n    [\n      \"gain\",\n      0,\n      \"dac\",\n      0\n    ],\n    [\n      \"gain\",\n      0,\n      \"dac\",\n      1\n    ]\n  ]\n}\n--- END SPEC ---",
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
            "obj-4",
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
            "obj-14",
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
            "obj-16",
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
            "obj-6",
            1
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
            "obj-7",
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
            "obj-12",
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
            "obj-17",
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
            2
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
            "obj-21",
            0
          ],
          "source": [
            "obj-20",
            1
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
            "obj-22",
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
    "default_fontname": "Arial"
  }
}
