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
      920.0
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
            55.0,
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
            77.0,
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
            92.0,
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
            125.0,
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
            150.0,
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
            180.0,
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
            210.0,
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
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            240.0,
            55.0,
            22.0
          ],
          "text": "t i i"
        }
      },
      {
        "box": {
          "id": "obj-10",
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
          "id": "obj-11",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            150.0,
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
            45.0,
            303.0,
            146.0,
            22.0
          ],
          "text": "pitch (MIDI 36-84)"
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
            320.0,
            200.0,
            100.0
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
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            428.0,
            188.0,
            22.0
          ],
          "text": "loadmess 1 1 1 1 1 1 1 1"
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
            45.0,
            448.0,
            174.0,
            22.0
          ],
          "text": "rests (0=rest, 1=note)"
        }
      },
      {
        "box": {
          "id": "obj-16",
          "maxclass": "multislider",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            30.0,
            465.0,
            200.0,
            25.0
          ],
          "size": 8,
          "setminmax": [
            0.0,
            1.0
          ],
          "setstyle": 1,
          "settype": 0,
          "candicane2": [
            0.9,
            0.5,
            0.2,
            1.0
          ],
          "slidercolor": [
            0.9,
            0.5,
            0.2,
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
          "id": "obj-17",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            250.0,
            500.0,
            50.0,
            22.0
          ]
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
            535.0,
            62.0,
            22.0
          ],
          "text": "gate 1"
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
            355.0,
            555.0,
            76.0,
            22.0
          ],
          "text": "velocity"
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            340.0,
            573.0,
            50.0,
            22.0
          ],
          "minimum": 1,
          "maximum": 127
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
            445.0,
            555.0,
            111.0,
            22.0
          ],
          "text": "duration (ms)"
        }
      },
      {
        "box": {
          "id": "obj-22",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            430.0,
            573.0,
            50.0,
            22.0
          ],
          "minimum": 10,
          "maximum": 2000
        }
      },
      {
        "box": {
          "id": "obj-23",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "float"
          ],
          "patching_rect": [
            250.0,
            610.0,
            132.0,
            22.0
          ],
          "text": "makenote 100 150"
        }
      },
      {
        "box": {
          "id": "obj-24",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            250.0,
            640.0,
            97.0,
            22.0
          ],
          "text": "pack 60 100"
        }
      },
      {
        "box": {
          "id": "obj-25",
          "maxclass": "newobj",
          "numinlets": 7,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            250.0,
            670.0,
            90.0,
            22.0
          ],
          "text": "midiformat"
        }
      },
      {
        "box": {
          "id": "obj-26",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "signal"
          ],
          "patching_rect": [
            250.0,
            700.0,
            139.0,
            22.0
          ],
          "text": "abl.device.drift~"
        }
      },
      {
        "box": {
          "id": "obj-27",
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
            250.0,
            745.0,
            200.0,
            36.0
          ],
          "parameter_enable": 1,
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "gain",
              "parameter_shortname": "gain",
              "parameter_type": 0,
              "parameter_mmax": 127.0,
              "parameter_mmin": 0.0
            }
          },
          "orientation": 1,
          "_parameter_initial": [
            0.0
          ],
          "_parameter_initial_enable": 1
        }
      },
      {
        "box": {
          "id": "obj-28",
          "maxclass": "ezdac~",
          "numinlets": 2,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            250.0,
            800.0,
            45.0,
            45.0
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
            30.0,
            855.0,
            370.0,
            22.0
          ],
          "text": "Turn on audio, set pitches and rests, click toggle"
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
            917.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"name\": \"Drift Sequencer\",\n  \"width\": 650,\n  \"height\": 920,\n  \"objects\": {\n    \"loadmess\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 200 100 150\",\n      \"pos\": [\n        250,\n        30\n      ]\n    },\n    \"unpack_init\": {\n      \"type\": \"newobj\",\n      \"text\": \"unpack 0 0 0\",\n      \"pos\": [\n        250,\n        55\n      ]\n    },\n    \"tempo_label\": {\n      \"type\": \"comment\",\n      \"text\": \"tempo (ms)\",\n      \"pos\": [\n        80,\n        77\n      ]\n    },\n    \"tempo\": {\n      \"type\": \"number\",\n      \"pos\": [\n        65,\n        92\n      ],\n      \"attrs\": {\n        \"minimum\": 50,\n        \"maximum\": 2000\n      }\n    },\n    \"onoff\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        30,\n        125\n      ]\n    },\n    \"metro\": {\n      \"type\": \"newobj\",\n      \"text\": \"metro 200\",\n      \"pos\": [\n        30,\n        150\n      ]\n    },\n    \"steps\": {\n      \"type\": \"newobj\",\n      \"text\": \"counter 0 7\",\n      \"pos\": [\n        30,\n        180\n      ]\n    },\n    \"step_plus1\": {\n      \"type\": \"newobj\",\n      \"text\": \"+ 1\",\n      \"pos\": [\n        30,\n        210\n      ]\n    },\n    \"trig\": {\n      \"type\": \"newobj\",\n      \"text\": \"t i i\",\n      \"pos\": [\n        30,\n        240\n      ]\n    },\n    \"fetch_pitch\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend fetch\",\n      \"pos\": [\n        30,\n        270\n      ]\n    },\n    \"fetch_rest\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend fetch\",\n      \"pos\": [\n        150,\n        270\n      ]\n    },\n    \"pitch_label\": {\n      \"type\": \"comment\",\n      \"text\": \"pitch (MIDI 36-84)\",\n      \"pos\": [\n        45,\n        303\n      ]\n    },\n    \"slider\": {\n      \"type\": \"multislider\",\n      \"pos\": [\n        30,\n        320\n      ],\n      \"size\": [\n        200,\n        100\n      ],\n      \"attrs\": {\n        \"size\": 8,\n        \"setminmax\": [\n          36.0,\n          84.0\n        ],\n        \"setstyle\": 1,\n        \"candicane2\": [\n          0.14,\n          0.69,\n          0.78,\n          1.0\n        ],\n        \"slidercolor\": [\n          0.14,\n          0.69,\n          0.78,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.15,\n          0.15,\n          0.15,\n          1.0\n        ],\n        \"orientation\": 1\n      }\n    },\n    \"rest_init\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess 1 1 1 1 1 1 1 1\",\n      \"pos\": [\n        30,\n        428\n      ]\n    },\n    \"rest_label\": {\n      \"type\": \"comment\",\n      \"text\": \"rests (0=rest, 1=note)\",\n      \"pos\": [\n        45,\n        448\n      ]\n    },\n    \"rest_slider\": {\n      \"type\": \"multislider\",\n      \"pos\": [\n        30,\n        465\n      ],\n      \"size\": [\n        200,\n        25\n      ],\n      \"attrs\": {\n        \"size\": 8,\n        \"setminmax\": [\n          0.0,\n          1.0\n        ],\n        \"setstyle\": 1,\n        \"settype\": 0,\n        \"candicane2\": [\n          0.9,\n          0.5,\n          0.2,\n          1.0\n        ],\n        \"slidercolor\": [\n          0.9,\n          0.5,\n          0.2,\n          1.0\n        ],\n        \"bgcolor\": [\n          0.15,\n          0.15,\n          0.15,\n          1.0\n        ],\n        \"orientation\": 1\n      }\n    },\n    \"pitch_display\": {\n      \"type\": \"number\",\n      \"pos\": [\n        250,\n        500\n      ]\n    },\n    \"note_gate\": {\n      \"type\": \"newobj\",\n      \"text\": \"gate 1\",\n      \"pos\": [\n        250,\n        535\n      ]\n    },\n    \"vel_label\": {\n      \"type\": \"comment\",\n      \"text\": \"velocity\",\n      \"pos\": [\n        355,\n        555\n      ]\n    },\n    \"velocity\": {\n      \"type\": \"number\",\n      \"pos\": [\n        340,\n        573\n      ],\n      \"attrs\": {\n        \"minimum\": 1,\n        \"maximum\": 127\n      }\n    },\n    \"dur_label\": {\n      \"type\": \"comment\",\n      \"text\": \"duration (ms)\",\n      \"pos\": [\n        445,\n        555\n      ]\n    },\n    \"duration\": {\n      \"type\": \"number\",\n      \"pos\": [\n        430,\n        573\n      ],\n      \"attrs\": {\n        \"minimum\": 10,\n        \"maximum\": 2000\n      }\n    },\n    \"makenote\": {\n      \"type\": \"newobj\",\n      \"text\": \"makenote 100 150\",\n      \"pos\": [\n        250,\n        610\n      ]\n    },\n    \"pack_note\": {\n      \"type\": \"newobj\",\n      \"text\": \"pack 60 100\",\n      \"pos\": [\n        250,\n        640\n      ]\n    },\n    \"midiformat\": {\n      \"type\": \"newobj\",\n      \"text\": \"midiformat\",\n      \"pos\": [\n        250,\n        670\n      ]\n    },\n    \"drift\": {\n      \"type\": \"newobj\",\n      \"text\": \"abl.device.drift~\",\n      \"pos\": [\n        250,\n        700\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"signal\",\n        \"signal\"\n      ]\n    },\n    \"gain\": {\n      \"type\": \"live.gain~\",\n      \"pos\": [\n        250,\n        745\n      ],\n      \"size\": [\n        200,\n        36\n      ],\n      \"attrs\": {\n        \"orientation\": 1,\n        \"_parameter_initial\": [\n          0.0\n        ],\n        \"_parameter_initial_enable\": 1\n      }\n    },\n    \"dac\": {\n      \"type\": \"ezdac~\",\n      \"pos\": [\n        250,\n        800\n      ]\n    },\n    \"info\": {\n      \"type\": \"comment\",\n      \"text\": \"Turn on audio, set pitches and rests, click toggle\",\n      \"pos\": [\n        30,\n        855\n      ]\n    }\n  },\n  \"connections\": [\n    [\n      \"loadmess\",\n      0,\n      \"unpack_init\",\n      0\n    ],\n    [\n      \"unpack_init\",\n      0,\n      \"tempo\",\n      0\n    ],\n    [\n      \"unpack_init\",\n      1,\n      \"velocity\",\n      0\n    ],\n    [\n      \"unpack_init\",\n      2,\n      \"duration\",\n      0\n    ],\n    [\n      \"onoff\",\n      0,\n      \"metro\",\n      0\n    ],\n    [\n      \"tempo\",\n      0,\n      \"metro\",\n      1\n    ],\n    [\n      \"metro\",\n      0,\n      \"steps\",\n      0\n    ],\n    [\n      \"steps\",\n      0,\n      \"step_plus1\",\n      0\n    ],\n    [\n      \"step_plus1\",\n      0,\n      \"trig\",\n      0\n    ],\n    [\n      \"trig\",\n      1,\n      \"fetch_rest\",\n      0\n    ],\n    [\n      \"trig\",\n      0,\n      \"fetch_pitch\",\n      0\n    ],\n    [\n      \"fetch_pitch\",\n      0,\n      \"slider\",\n      0\n    ],\n    [\n      \"fetch_rest\",\n      0,\n      \"rest_slider\",\n      0\n    ],\n    [\n      \"rest_init\",\n      0,\n      \"rest_slider\",\n      0\n    ],\n    [\n      \"slider\",\n      1,\n      \"pitch_display\",\n      0\n    ],\n    [\n      \"rest_slider\",\n      1,\n      \"note_gate\",\n      0\n    ],\n    [\n      \"pitch_display\",\n      0,\n      \"note_gate\",\n      1\n    ],\n    [\n      \"note_gate\",\n      0,\n      \"makenote\",\n      0\n    ],\n    [\n      \"velocity\",\n      0,\n      \"makenote\",\n      1\n    ],\n    [\n      \"duration\",\n      0,\n      \"makenote\",\n      2\n    ],\n    [\n      \"makenote\",\n      0,\n      \"pack_note\",\n      0\n    ],\n    [\n      \"makenote\",\n      1,\n      \"pack_note\",\n      1\n    ],\n    [\n      \"pack_note\",\n      0,\n      \"midiformat\",\n      0\n    ],\n    [\n      \"midiformat\",\n      0,\n      \"drift\",\n      0\n    ],\n    [\n      \"drift\",\n      0,\n      \"gain\",\n      0\n    ],\n    [\n      \"drift\",\n      1,\n      \"gain\",\n      1\n    ],\n    [\n      \"gain\",\n      0,\n      \"dac\",\n      0\n    ],\n    [\n      \"gain\",\n      1,\n      \"dac\",\n      1\n    ]\n  ]\n}\n--- END SPEC ---",
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
            "obj-20",
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
            "obj-22",
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
            1
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
            "obj-13",
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
            "obj-16",
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
            "obj-13",
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
            "obj-16",
            1
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
            "obj-18",
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
            "obj-20",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-23",
            2
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
            "obj-26",
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
            "obj-26",
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
            "obj-27",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-28",
            1
          ],
          "source": [
            "obj-27",
            1
          ]
        }
      }
    ],
    "default_fontsize": 12.0,
    "default_fontname": "Arial"
  }
}
