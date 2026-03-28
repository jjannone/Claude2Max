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
      580.0,
      830.0
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
            "bang"
          ],
          "patching_rect": [
            250.0,
            30.0,
            76.0,
            22.0
          ],
          "text": "loadbang"
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
            65.0,
            55.0,
            41.0,
            22.0
          ],
          "text": "200"
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            340.0,
            55.0,
            41.0,
            22.0
          ],
          "text": "100"
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
            430.0,
            55.0,
            41.0,
            22.0
          ],
          "text": "150"
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
            65.0,
            82.0,
            90.0,
            22.0
          ],
          "text": "tempo (ms)"
        }
      },
      {
        "box": {
          "id": "obj-6",
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
          "id": "obj-7",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            30.0,
            135.0,
            24.0,
            24.0
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
            "bang"
          ],
          "patching_rect": [
            30.0,
            165.0,
            83.0,
            22.0
          ],
          "text": "metro 200"
        }
      },
      {
        "box": {
          "id": "obj-9",
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
            200.0,
            97.0,
            22.0
          ],
          "text": "counter 0 7"
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            30.0,
            235.0,
            41.0,
            22.0
          ],
          "text": "+ 1"
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
            30.0,
            270.0,
            111.0,
            22.0
          ],
          "text": "prepend fetch"
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
            30.0,
            295.0,
            125.0,
            22.0
          ],
          "text": "pitch (8 steps)"
        }
      },
      {
        "box": {
          "id": "obj-13",
          "maxclass": "multislider",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            315.0,
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
          "id": "obj-14",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            250.0,
            390.0,
            50.0,
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
            340.0,
            400.0,
            76.0,
            22.0
          ],
          "text": "velocity"
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
            340.0,
            418.0,
            50.0,
            22.0
          ],
          "minimum": 1,
          "maximum": 127
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
            430.0,
            400.0,
            111.0,
            22.0
          ],
          "text": "duration (ms)"
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            430.0,
            418.0,
            50.0,
            22.0
          ],
          "minimum": 10,
          "maximum": 2000
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "float"
          ],
          "patching_rect": [
            250.0,
            455.0,
            132.0,
            22.0
          ],
          "text": "makenote 100 150"
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            250.0,
            490.0,
            97.0,
            22.0
          ],
          "text": "pack 60 100"
        }
      },
      {
        "box": {
          "id": "obj-21",
          "maxclass": "newobj",
          "numinlets": 7,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            250.0,
            525.0,
            90.0,
            22.0
          ],
          "text": "midiformat"
        }
      },
      {
        "box": {
          "id": "obj-22",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            250.0,
            560.0,
            139.0,
            22.0
          ],
          "text": "abl.device.drift~"
        }
      },
      {
        "box": {
          "id": "obj-23",
          "maxclass": "gain~",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            ""
          ],
          "patching_rect": [
            250.0,
            595.0,
            22.0,
            140.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-24",
          "maxclass": "ezdac~",
          "numinlets": 2,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            250.0,
            745.0,
            45.0,
            45.0
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
            30.0,
            795.0,
            300.0,
            22.0
          ],
          "text": "Turn on audio, set pitches, click toggle"
        }
      },
      {
        "box": {
          "id": "obj-spec-embed",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            50.0,
            857.0,
            500.0,
            6336.0
          ],
          "text": "--- CLAUDE2MAX SPEC ---\n{\n  \"name\": \"Drift Sequencer\",\n  \"width\": 580,\n  \"height\": 830,\n  \"objects\": {\n    \"loadbang\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        250,\n        30\n      ]\n    },\n    \"init_tempo\": {\n      \"type\": \"message\",\n      \"text\": \"200\",\n      \"pos\": [\n        65,\n        55\n      ]\n    },\n    \"init_vel\": {\n      \"type\": \"message\",\n      \"text\": \"100\",\n      \"pos\": [\n        340,\n        55\n      ]\n    },\n    \"init_dur\": {\n      \"type\": \"message\",\n      \"text\": \"150\",\n      \"pos\": [\n        430,\n        55\n      ]\n    },\n    \"tempo_label\": {\n      \"type\": \"comment\",\n      \"text\": \"tempo (ms)\",\n      \"pos\": [\n        65,\n        82\n      ]\n    },\n    \"tempo\": {\n      \"type\": \"number\",\n      \"pos\": [\n        65,\n        100\n      ],\n      \"attrs\": {\n        \"minimum\": 50,\n        \"maximum\": 2000\n      }\n    },\n    \"onoff\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        30,\n        135\n      ]\n    },\n    \"metro\": {\n      \"type\": \"newobj\",\n      \"text\": \"metro 200\",\n      \"pos\": [\n        30,\n        165\n      ]\n    },\n    \"steps\": {\n      \"type\": \"newobj\",\n      \"text\": \"counter 0 7\",\n      \"pos\": [\n        30,\n        200\n      ]\n    },\n    \"step_plus1\": {\n      \"type\": \"newobj\",\n      \"text\": \"+ 1\",\n      \"pos\": [\n        30,\n        235\n      ]\n    },\n    \"fetch\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend fetch\",\n      \"pos\": [\n        30,\n        270\n      ]\n    },\n    \"pitch_label\": {\n      \"type\": \"comment\",\n      \"text\": \"pitch (8 steps)\",\n      \"pos\": [\n        30,\n        295\n      ]\n    },\n    \"slider\": {\n      \"type\": \"multislider\",\n      \"pos\": [\n        30,\n        315\n      ],\n      \"size\": [\n        200,\n        120\n      ],\n      \"attrs\": {\n        \"size\": 8,\n        \"setminmax\": [\n          36.0,\n          84.0\n        ],\n        \"setstyle\": 1,\n        \"candicane2\": [\n          0.14,\n          0.69,\n          0.78,\n          1.0\n        ],\n        \"slidercolor\": [\n          0.14,\n          0.69,\n          0.78,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.15,\n          0.15,\n          0.15,\n          1.0\n        ],\n        \"orientation\": 1\n      }\n    },\n    \"pitch_display\": {\n      \"type\": \"number\",\n      \"pos\": [\n        250,\n        390\n      ]\n    },\n    \"vel_label\": {\n      \"type\": \"comment\",\n      \"text\": \"velocity\",\n      \"pos\": [\n        340,\n        400\n      ]\n    },\n    \"velocity\": {\n      \"type\": \"number\",\n      \"pos\": [\n        340,\n        418\n      ],\n      \"attrs\": {\n        \"minimum\": 1,\n        \"maximum\": 127\n      }\n    },\n    \"dur_label\": {\n      \"type\": \"comment\",\n      \"text\": \"duration (ms)\",\n      \"pos\": [\n        430,\n        400\n      ]\n    },\n    \"duration\": {\n      \"type\": \"number\",\n      \"pos\": [\n        430,\n        418\n      ],\n      \"attrs\": {\n        \"minimum\": 10,\n        \"maximum\": 2000\n      }\n    },\n    \"makenote\": {\n      \"type\": \"newobj\",\n      \"text\": \"makenote 100 150\",\n      \"pos\": [\n        250,\n        455\n      ]\n    },\n    \"pack_note\": {\n      \"type\": \"newobj\",\n      \"text\": \"pack 60 100\",\n      \"pos\": [\n        250,\n        490\n      ]\n    },\n    \"midiformat\": {\n      \"type\": \"newobj\",\n      \"text\": \"midiformat\",\n      \"pos\": [\n        250,\n        525\n      ]\n    },\n    \"drift\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.device.drift~\",\n      \"pos\": [\n        250,\n        560\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"gain\": {\n      \"type\": \"gain~\",\n      \"pos\": [\n        250,\n        595\n      ]\n    },\n    \"dac\": {\n      \"type\": \"ezdac~\",\n      \"pos\": [\n        250,\n        745\n      ]\n    },\n    \"info\": {\n      \"type\": \"comment\",\n      \"text\": \"Turn on audio, set pitches, click toggle\",\n      \"pos\": [\n        30,\n        795\n      ]\n    }\n  },\n  \"connections\": [\n    [\n      \"loadbang\",\n      0,\n      \"init_tempo\",\n      0\n    ],\n    [\n      \"loadbang\",\n      0,\n      \"init_vel\",\n      0\n    ],\n    [\n      \"loadbang\",\n      0,\n      \"init_dur\",\n      0\n    ],\n    [\n      \"init_tempo\",\n      0,\n      \"tempo\",\n      0\n    ],\n    [\n      \"init_vel\",\n      0,\n      \"velocity\",\n      0\n    ],\n    [\n      \"init_dur\",\n      0,\n      \"duration\",\n      0\n    ],\n    [\n      \"onoff\",\n      0,\n      \"metro\",\n      0\n    ],\n    [\n      \"tempo\",\n      0,\n      \"metro\",\n      1\n    ],\n    [\n      \"metro\",\n      0,\n      \"steps\",\n      0\n    ],\n    [\n      \"steps\",\n      0,\n      \"step_plus1\",\n      0\n    ],\n    [\n      \"step_plus1\",\n      0,\n      \"fetch\",\n      0\n    ],\n    [\n      \"fetch\",\n      0,\n      \"slider\",\n      0\n    ],\n    [\n      \"slider\",\n      1,\n      \"pitch_display\",\n      0\n    ],\n    [\n      \"pitch_display\",\n      0,\n      \"makenote\",\n      0\n    ],\n    [\n      \"velocity\",\n      0,\n      \"makenote\",\n      1\n    ],\n    [\n      \"duration\",\n      0,\n      \"makenote\",\n      2\n    ],\n    [\n      \"makenote\",\n      0,\n      \"pack_note\",\n      0\n    ],\n    [\n      \"makenote\",\n      1,\n      \"pack_note\",\n      1\n    ],\n    [\n      \"pack_note\",\n      0,\n      \"midiformat\",\n      0\n    ],\n    [\n      \"midiformat\",\n      0,\n      \"drift\",\n      0\n    ],\n    [\n      \"drift\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"drift\",\n      1,\n      \"gain\",\n      0\n    ],\n    [\n      \"gain\",\n      0,\n      \"dac\",\n      0\n    ],\n    [\n      \"gain\",\n      0,\n      \"dac\",\n      1\n    ]\n  ]\n}\n--- END SPEC ---",
          "linecount": 396,
          "fontsize": 9.0,
          "textcolor": [
            0.5,
            0.5,
            0.5,
            1.0
          ],
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
            "obj-1",
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
            "obj-2",
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
            "obj-18",
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
            "obj-7",
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
            "obj-10",
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
            "obj-14",
            0
          ],
          "source": [
            "obj-13",
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
            "obj-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-19",
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
            "obj-19",
            2
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
            "obj-20",
            1
          ],
          "source": [
            "obj-19",
            1
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
            "obj-24",
            1
          ],
          "source": [
            "obj-23",
            0
          ]
        }
      }
    ],
    "default_fontsize": 12.0,
    "default_fontname": "Arial"
  }
}
