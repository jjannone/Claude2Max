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
      800.0,
      600.0
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
          "text": "4-step-sequencer",
          "fontsize": 16.0,
          "fontface": 1
        }
      },
      {
        "box": {
          "id": "obj-1",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            15.0,
            20.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            15.0,
            10.0,
            40.0,
            40.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            60.0,
            34.0,
            55.0,
            22.0
          ],
          "text": "START",
          "presentation": 1,
          "presentation_rect": [
            17.0,
            52.0,
            38.0,
            14.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            140.0,
            20.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            130.0,
            10.0,
            100.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            240.0,
            20.0,
            90.0,
            22.0
          ],
          "text": "TEMPO (ms)",
          "presentation": 1,
          "presentation_rect": [
            130.0,
            34.0,
            100.0,
            14.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-5",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            15.0,
            80.0,
            83.0,
            22.0
          ],
          "text": "metro 500"
        }
      },
      {
        "box": {
          "id": "obj-6",
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
            15.0,
            140.0,
            97.0,
            22.0
          ],
          "text": "counter 0 3"
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 5,
          "outlettype": [
            "bang",
            "bang",
            "bang",
            "bang",
            ""
          ],
          "patching_rect": [
            15.0,
            200.0,
            118.0,
            22.0
          ],
          "text": "select 0 1 2 3"
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            15.0,
            270.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            15.0,
            68.0,
            60.0,
            30.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            95.0,
            270.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            85.0,
            68.0,
            60.0,
            30.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            175.0,
            270.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            155.0,
            68.0,
            60.0,
            30.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            255.0,
            270.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            225.0,
            68.0,
            60.0,
            30.0
          ]
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
            15.0,
            330.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            15.0,
            118.0,
            60.0,
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
            95.0,
            330.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            85.0,
            118.0,
            60.0,
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
            175.0,
            330.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            155.0,
            118.0,
            60.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-15",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            255.0,
            330.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            225.0,
            118.0,
            60.0,
            22.0
          ]
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
            15.0,
            354.0,
            62.0,
            22.0
          ],
          "text": "STEP 1",
          "presentation": 1,
          "presentation_rect": [
            15.0,
            142.0,
            60.0,
            14.0
          ]
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
            95.0,
            354.0,
            62.0,
            22.0
          ],
          "text": "STEP 2",
          "presentation": 1,
          "presentation_rect": [
            85.0,
            142.0,
            60.0,
            14.0
          ]
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
            175.0,
            354.0,
            62.0,
            22.0
          ],
          "text": "STEP 3",
          "presentation": 1,
          "presentation_rect": [
            155.0,
            142.0,
            60.0,
            14.0
          ]
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
            255.0,
            354.0,
            62.0,
            22.0
          ],
          "text": "STEP 4",
          "presentation": 1,
          "presentation_rect": [
            225.0,
            142.0,
            60.0,
            14.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "float"
          ],
          "patching_rect": [
            15.0,
            420.0,
            132.0,
            22.0
          ],
          "text": "makenote 100 250"
        }
      },
      {
        "box": {
          "id": "obj-21",
          "maxclass": "newobj",
          "numinlets": 3,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            15.0,
            480.0,
            69.0,
            22.0
          ],
          "text": "noteout"
        }
      },
      {
        "box": {
          "id": "obj-22",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            0.0,
            600.0,
            104.0,
            22.0
          ],
          "text": "--- CLAUDE2MAX SPEC ---\n{\"name\":\"4-step-sequencer\"}\n--- END SPEC ---"
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
            662.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"name\": \"4-step-sequencer\",\n  \"openinpresentation\": 1,\n  \"objects\": {\n    \"obj-run\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        15,\n        20\n      ],\n      \"presentation\": 1,\n      \"presentation_rect\": [\n        15,\n        10,\n        40,\n        40\n      ]\n    },\n    \"lbl-run\": {\n      \"type\": \"comment\",\n      \"text\": \"START\",\n      \"pos\": [\n        60,\n        34\n      ],\n      \"presentation\": 1,\n      \"presentation_rect\": [\n        17,\n        52,\n        38,\n        14\n      ]\n    },\n    \"obj-tempo-n\": {\n      \"type\": \"number\",\n      \"pos\": [\n        140,\n        20\n      ],\n      \"presentation\": 1,\n      \"presentation_rect\": [\n        130,\n        10,\n        100,\n        22\n      ]\n    },\n    \"lbl-tempo\": {\n      \"type\": \"comment\",\n      \"text\": \"TEMPO (ms)\",\n      \"pos\": [\n        240,\n        20\n      ],\n      \"presentation\": 1,\n      \"presentation_rect\": [\n        130,\n        34,\n        100,\n        14\n      ]\n    },\n    \"obj-metro\": {\n      \"type\": \"newobj\",\n      \"text\": \"metro 500\",\n      \"pos\": [\n        15,\n        80\n      ]\n    },\n    \"obj-counter\": {\n      \"type\": \"newobj\",\n      \"text\": \"counter 0 3\",\n      \"pos\": [\n        15,\n        140\n      ]\n    },\n    \"obj-sel\": {\n      \"type\": \"newobj\",\n      \"text\": \"select 0 1 2 3\",\n      \"pos\": [\n        15,\n        200\n      ]\n    },\n    \"obj-btn1\": {\n      \"type\": \"button\",\n      \"pos\": [\n        15,\n        270\n      ],\n      \"presentation\": 1,\n      \"presentation_rect\": [\n        15,\n        68,\n        60,\n        30\n      ]\n    },\n    \"obj-btn2\": {\n      \"type\": \"button\",\n      \"pos\": [\n        95,\n        270\n      ],\n      \"presentation\": 1,\n      \"presentation_rect\": [\n        85,\n        68,\n        60,\n        30\n      ]\n    },\n    \"obj-btn3\": {\n      \"type\": \"button\",\n      \"pos\": [\n        175,\n        270\n      ],\n      \"presentation\": 1,\n      \"presentation_rect\": [\n        155,\n        68,\n        60,\n        30\n      ]\n    },\n    \"obj-btn4\": {\n      \"type\": \"button\",\n      \"pos\": [\n        255,\n        270\n      ],\n      \"presentation\": 1,\n      \"presentation_rect\": [\n        225,\n        68,\n        60,\n        30\n      ]\n    },\n    \"obj-p1\": {\n      \"type\": \"number\",\n      \"pos\": [\n        15,\n        330\n      ],\n      \"presentation\": 1,\n      \"presentation_rect\": [\n        15,\n        118,\n        60,\n        22\n      ]\n    },\n    \"obj-p2\": {\n      \"type\": \"number\",\n      \"pos\": [\n        95,\n        330\n      ],\n      \"presentation\": 1,\n      \"presentation_rect\": [\n        85,\n        118,\n        60,\n        22\n      ]\n    },\n    \"obj-p3\": {\n      \"type\": \"number\",\n      \"pos\": [\n        175,\n        330\n      ],\n      \"presentation\": 1,\n      \"presentation_rect\": [\n        155,\n        118,\n        60,\n        22\n      ]\n    },\n    \"obj-p4\": {\n      \"type\": \"number\",\n      \"pos\": [\n        255,\n        330\n      ],\n      \"presentation\": 1,\n      \"presentation_rect\": [\n        225,\n        118,\n        60,\n        22\n      ]\n    },\n    \"lbl-p1\": {\n      \"type\": \"comment\",\n      \"text\": \"STEP 1\",\n      \"pos\": [\n        15,\n        354\n      ],\n      \"presentation\": 1,\n      \"presentation_rect\": [\n        15,\n        142,\n        60,\n        14\n      ]\n    },\n    \"lbl-p2\": {\n      \"type\": \"comment\",\n      \"text\": \"STEP 2\",\n      \"pos\": [\n        95,\n        354\n      ],\n      \"presentation\": 1,\n      \"presentation_rect\": [\n        85,\n        142,\n        60,\n        14\n      ]\n    },\n    \"lbl-p3\": {\n      \"type\": \"comment\",\n      \"text\": \"STEP 3\",\n      \"pos\": [\n        175,\n        354\n      ],\n      \"presentation\": 1,\n      \"presentation_rect\": [\n        155,\n        142,\n        60,\n        14\n      ]\n    },\n    \"lbl-p4\": {\n      \"type\": \"comment\",\n      \"text\": \"STEP 4\",\n      \"pos\": [\n        255,\n        354\n      ],\n      \"presentation\": 1,\n      \"presentation_rect\": [\n        225,\n        142,\n        60,\n        14\n      ]\n    },\n    \"obj-makenote\": {\n      \"type\": \"newobj\",\n      \"text\": \"makenote 100 250\",\n      \"pos\": [\n        15,\n        420\n      ]\n    },\n    \"obj-noteout\": {\n      \"type\": \"newobj\",\n      \"text\": \"noteout\",\n      \"pos\": [\n        15,\n        480\n      ]\n    },\n    \"obj-spec-embed\": {\n      \"type\": \"newobj\",\n      \"text\": \"text.codebox\",\n      \"hidden\": 1,\n      \"pos\": [\n        0,\n        600\n      ],\n      \"attrs\": {\n        \"text\": \"--- CLAUDE2MAX SPEC ---\\n{\\\"name\\\":\\\"4-step-sequencer\\\"}\\n--- END SPEC ---\"\n      }\n    }\n  },\n  \"connections\": [\n    [\n      \"obj-run\",\n      0,\n      \"obj-metro\",\n      0\n    ],\n    [\n      \"obj-tempo-n\",\n      0,\n      \"obj-metro\",\n      1\n    ],\n    [\n      \"obj-metro\",\n      0,\n      \"obj-counter\",\n      0\n    ],\n    [\n      \"obj-counter\",\n      0,\n      \"obj-sel\",\n      0\n    ],\n    [\n      \"obj-sel\",\n      0,\n      \"obj-btn1\",\n      0\n    ],\n    [\n      \"obj-sel\",\n      1,\n      \"obj-btn2\",\n      0\n    ],\n    [\n      \"obj-sel\",\n      2,\n      \"obj-btn3\",\n      0\n    ],\n    [\n      \"obj-sel\",\n      3,\n      \"obj-btn4\",\n      0\n    ],\n    [\n      \"obj-sel\",\n      0,\n      \"obj-p1\",\n      0\n    ],\n    [\n      \"obj-sel\",\n      1,\n      \"obj-p2\",\n      0\n    ],\n    [\n      \"obj-sel\",\n      2,\n      \"obj-p3\",\n      0\n    ],\n    [\n      \"obj-sel\",\n      3,\n      \"obj-p4\",\n      0\n    ],\n    [\n      \"obj-p1\",\n      0,\n      \"obj-makenote\",\n      0\n    ],\n    [\n      \"obj-p2\",\n      0,\n      \"obj-makenote\",\n      0\n    ],\n    [\n      \"obj-p3\",\n      0,\n      \"obj-makenote\",\n      0\n    ],\n    [\n      \"obj-p4\",\n      0,\n      \"obj-makenote\",\n      0\n    ],\n    [\n      \"obj-makenote\",\n      0,\n      \"obj-noteout\",\n      0\n    ],\n    [\n      \"obj-makenote\",\n      1,\n      \"obj-noteout\",\n      1\n    ]\n  ]\n}\n--- END SPEC ---",
          "fontsize": 9.0,
          "hidden": 1
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "obj-5",
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
            "obj-5",
            1
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
            "obj-7",
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
            "obj-7",
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
            "obj-7",
            3
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
            "obj-7",
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
            "obj-7",
            1
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
            "obj-7",
            2
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
            "obj-7",
            3
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
            "obj-12",
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
            "obj-13",
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
            "obj-15",
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
            1
          ],
          "source": [
            "obj-20",
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
