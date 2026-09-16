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
      520.0
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
          "text": "MMPose \u2192 OSC Bridge Monitor",
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
            60.0,
            70.0,
            125.0,
            22.0
          ],
          "text": "udpreceive 7400"
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 6,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            ""
          ],
          "patching_rect": [
            60.0,
            120.0,
            430.0,
            22.0
          ],
          "text": "route /pose/count /pose/body /pose/kp /pose/contact /pose/dims"
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            560.0,
            70.0,
            76.0,
            22.0
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "newobj",
          "numinlets": 5,
          "numoutlets": 6,
          "outlettype": [
            "",
            "",
            "int",
            "int",
            "int",
            ""
          ],
          "patching_rect": [
            60.0,
            215.0,
            146.0,
            22.0
          ],
          "text": "v8 pose_monitor.js"
        }
      },
      {
        "box": {
          "id": "obj-5",
          "maxclass": "jit.cellblock",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            60.0,
            320.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            34.0,
            212.0,
            332.0,
            208.0
          ],
          "selmode": 0
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "jit.cellblock",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            420.0,
            320.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            414.0,
            48.0,
            312.0,
            372.0
          ],
          "selmode": 0
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            60.0,
            560.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            34.0,
            92.0,
            60.0,
            22.0
          ],
          "ignoreclick": 1,
          "triangle": 0,
          "minimum": 0
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
            180.0,
            560.0,
            50.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            34.0,
            122.0,
            60.0,
            22.0
          ],
          "ignoreclick": 1,
          "triangle": 0,
          "minimum": 0
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            300.0,
            560.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            270.0,
            88.0,
            40.0,
            40.0
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
            560.0,
            120.0,
            320.0,
            22.0
          ],
          "text": "MMPOSE \u2192 OSC MONITOR",
          "presentation": 1,
          "presentation_rect": [
            34.0,
            26.0,
            320.0,
            22.0
          ],
          "fontface": 1,
          "fontsize": 14
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            560.0,
            150.0,
            330.0,
            20.0
          ],
          "text": "listening: UDP 7400  (= bridge --osc-port)",
          "presentation": 1,
          "presentation_rect": [
            34.0,
            52.0,
            330.0,
            18.0
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
            560.0,
            180.0,
            90.0,
            20.0
          ],
          "text": "bodies",
          "presentation": 1,
          "presentation_rect": [
            104.0,
            95.0,
            90.0,
            18.0
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
            560.0,
            210.0,
            90.0,
            20.0
          ],
          "text": "contacts",
          "presentation": 1,
          "presentation_rect": [
            104.0,
            125.0,
            90.0,
            18.0
          ]
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
            560.0,
            240.0,
            100.0,
            20.0
          ],
          "text": "CONTACT",
          "presentation": 1,
          "presentation_rect": [
            250.0,
            132.0,
            100.0,
            18.0
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
            560.0,
            270.0,
            330.0,
            20.0
          ],
          "text": "BODIES \u2014 id \u00b7 cx \u00b7 cy \u00b7 w \u00b7 h",
          "presentation": 1,
          "presentation_rect": [
            34.0,
            190.0,
            330.0,
            18.0
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
            560.0,
            300.0,
            320.0,
            20.0
          ],
          "text": "CONTACTS \u2014 A \u00b7 B \u00b7 cDist \u00b7 minKP \u00b7 touch",
          "presentation": 1,
          "presentation_rect": [
            414.0,
            26.0,
            320.0,
            18.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            60.0,
            660.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            18.0,
            360.0,
            150.0
          ],
          "bgcolor": [
            0.15,
            0.16,
            0.18,
            1.0
          ],
          "bordercolor": [
            0.36,
            0.38,
            0.42,
            1.0
          ],
          "border": 1,
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            200.0,
            660.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            182.0,
            360.0,
            250.0
          ],
          "bgcolor": [
            0.15,
            0.16,
            0.18,
            1.0
          ],
          "bordercolor": [
            0.36,
            0.38,
            0.42,
            1.0
          ],
          "border": 1,
          "rounded": 8,
          "background": 1
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            340.0,
            660.0,
            40.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            400.0,
            18.0,
            340.0,
            414.0
          ],
          "bgcolor": [
            0.15,
            0.16,
            0.18,
            1.0
          ],
          "bordercolor": [
            0.36,
            0.38,
            0.42,
            1.0
          ],
          "border": 1,
          "rounded": 8,
          "background": 1
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
            722.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"name\": \"MMPose \\u2192 OSC Bridge Monitor\",\n  \"width\": 760,\n  \"height\": 520,\n  \"objects\": {\n    \"u\": {\n      \"type\": \"newobj\",\n      \"text\": \"udpreceive 7400\",\n      \"pos\": [\n        60,\n        70\n      ],\n      \"unverified\": true\n    },\n    \"r\": {\n      \"type\": \"newobj\",\n      \"text\": \"route /pose/count /pose/body /pose/kp /pose/contact /pose/dims\",\n      \"pos\": [\n        60,\n        120\n      ],\n      \"size\": [\n        430,\n        22\n      ],\n      \"unverified\": true\n    },\n    \"lb\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadbang\",\n      \"pos\": [\n        560,\n        70\n      ],\n      \"unverified\": true\n    },\n    \"mon\": {\n      \"type\": \"newobj\",\n      \"text\": \"v8 pose_monitor.js\",\n      \"pos\": [\n        60,\n        215\n      ],\n      \"unverified\": true,\n      \"inlets\": 5,\n      \"outlets\": 6,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"int\",\n        \"int\",\n        \"int\",\n        \"\"\n      ]\n    },\n    \"bodies_cb\": {\n      \"type\": \"jit.cellblock\",\n      \"pos\": [\n        60,\n        320\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"attrs\": {\n        \"selmode\": 0\n      },\n      \"presentation\": [\n        34,\n        212,\n        332,\n        208\n      ]\n    },\n    \"contacts_cb\": {\n      \"type\": \"jit.cellblock\",\n      \"pos\": [\n        420,\n        320\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"attrs\": {\n        \"selmode\": 0\n      },\n      \"presentation\": [\n        414,\n        48,\n        312,\n        372\n      ]\n    },\n    \"count_num\": {\n      \"type\": \"number\",\n      \"pos\": [\n        60,\n        560\n      ],\n      \"attrs\": {\n        \"ignoreclick\": 1,\n        \"triangle\": 0,\n        \"minimum\": 0\n      },\n      \"presentation\": [\n        34,\n        92,\n        60,\n        22\n      ]\n    },\n    \"contact_num\": {\n      \"type\": \"number\",\n      \"pos\": [\n        180,\n        560\n      ],\n      \"attrs\": {\n        \"ignoreclick\": 1,\n        \"triangle\": 0,\n        \"minimum\": 0\n      },\n      \"presentation\": [\n        34,\n        122,\n        60,\n        22\n      ]\n    },\n    \"touch_ind\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        300,\n        560\n      ],\n      \"presentation\": [\n        270,\n        88,\n        40,\n        40\n      ]\n    },\n    \"lbl_title\": {\n      \"type\": \"comment\",\n      \"text\": \"MMPOSE \\u2192 OSC MONITOR\",\n      \"pos\": [\n        560,\n        120\n      ],\n      \"size\": [\n        320,\n        22\n      ],\n      \"attrs\": {\n        \"fontface\": 1,\n        \"fontsize\": 14\n      },\n      \"presentation\": [\n        34,\n        26,\n        320,\n        22\n      ]\n    },\n    \"lbl_port\": {\n      \"type\": \"comment\",\n      \"text\": \"listening: UDP 7400  (= bridge --osc-port)\",\n      \"pos\": [\n        560,\n        150\n      ],\n      \"size\": [\n        330,\n        20\n      ],\n      \"presentation\": [\n        34,\n        52,\n        330,\n        18\n      ]\n    },\n    \"lbl_count\": {\n      \"type\": \"comment\",\n      \"text\": \"bodies\",\n      \"pos\": [\n        560,\n        180\n      ],\n      \"size\": [\n        90,\n        20\n      ],\n      \"presentation\": [\n        104,\n        95,\n        90,\n        18\n      ]\n    },\n    \"lbl_contact\": {\n      \"type\": \"comment\",\n      \"text\": \"contacts\",\n      \"pos\": [\n        560,\n        210\n      ],\n      \"size\": [\n        90,\n        20\n      ],\n      \"presentation\": [\n        104,\n        125,\n        90,\n        18\n      ]\n    },\n    \"lbl_touch\": {\n      \"type\": \"comment\",\n      \"text\": \"CONTACT\",\n      \"pos\": [\n        560,\n        240\n      ],\n      \"size\": [\n        100,\n        20\n      ],\n      \"presentation\": [\n        250,\n        132,\n        100,\n        18\n      ]\n    },\n    \"lbl_bodies\": {\n      \"type\": \"comment\",\n      \"text\": \"BODIES \\u2014 id \\u00b7 cx \\u00b7 cy \\u00b7 w \\u00b7 h\",\n      \"pos\": [\n        560,\n        270\n      ],\n      \"size\": [\n        330,\n        20\n      ],\n      \"presentation\": [\n        34,\n        190,\n        330,\n        18\n      ]\n    },\n    \"lbl_contacts\": {\n      \"type\": \"comment\",\n      \"text\": \"CONTACTS \\u2014 A \\u00b7 B \\u00b7 cDist \\u00b7 minKP \\u00b7 touch\",\n      \"pos\": [\n        560,\n        300\n      ],\n      \"size\": [\n        320,\n        20\n      ],\n      \"presentation\": [\n        414,\n        26,\n        320,\n        18\n      ]\n    },\n    \"panel_status\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        60,\n        660\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.16,\n          0.18,\n          1.0\n        ],\n        \"bordercolor\": [\n          0.36,\n          0.38,\n          0.42,\n          1.0\n        ],\n        \"border\": 1,\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"presentation\": [\n        20,\n        18,\n        360,\n        150\n      ]\n    },\n    \"panel_bodies\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        200,\n        660\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.16,\n          0.18,\n          1.0\n        ],\n        \"bordercolor\": [\n          0.36,\n          0.38,\n          0.42,\n          1.0\n        ],\n        \"border\": 1,\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"presentation\": [\n        20,\n        182,\n        360,\n        250\n      ]\n    },\n    \"panel_contacts\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        340,\n        660\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.15,\n          0.16,\n          0.18,\n          1.0\n        ],\n        \"bordercolor\": [\n          0.36,\n          0.38,\n          0.42,\n          1.0\n        ],\n        \"border\": 1,\n        \"rounded\": 8,\n        \"background\": 1\n      },\n      \"presentation\": [\n        400,\n        18,\n        340,\n        414\n      ]\n    }\n  },\n  \"connections\": [\n    [\n      \"u\",\n      0,\n      \"r\",\n      0\n    ],\n    [\n      \"r\",\n      0,\n      \"mon\",\n      0\n    ],\n    [\n      \"r\",\n      1,\n      \"mon\",\n      1\n    ],\n    [\n      \"r\",\n      2,\n      \"mon\",\n      2\n    ],\n    [\n      \"r\",\n      3,\n      \"mon\",\n      3\n    ],\n    [\n      \"r\",\n      4,\n      \"mon\",\n      4\n    ],\n    [\n      \"lb\",\n      0,\n      \"mon\",\n      0,\n      {\n        \"hidden\": 1\n      }\n    ],\n    [\n      \"mon\",\n      0,\n      \"bodies_cb\",\n      0,\n      {\n        \"hidden\": 1\n      }\n    ],\n    [\n      \"mon\",\n      1,\n      \"contacts_cb\",\n      0,\n      {\n        \"hidden\": 1\n      }\n    ],\n    [\n      \"mon\",\n      2,\n      \"count_num\",\n      0,\n      {\n        \"hidden\": 1\n      }\n    ],\n    [\n      \"mon\",\n      3,\n      \"contact_num\",\n      0,\n      {\n        \"hidden\": 1\n      }\n    ],\n    [\n      \"mon\",\n      4,\n      \"touch_ind\",\n      0,\n      {\n        \"hidden\": 1\n      }\n    ]\n  ]\n}\n--- END SPEC ---",
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
            "obj-4",
            1
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
            "obj-4",
            2
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
            "obj-4",
            3
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
            "obj-4",
            4
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
            "obj-4",
            0
          ],
          "source": [
            "obj-3",
            0
          ],
          "hidden": 1
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
          ],
          "hidden": 1
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
            1
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-7",
            0
          ],
          "source": [
            "obj-4",
            2
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-8",
            0
          ],
          "source": [
            "obj-4",
            3
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-9",
            0
          ],
          "source": [
            "obj-4",
            4
          ],
          "hidden": 1
        }
      }
    ],
    "default_fontsize": 12.0,
    "default_fontname": "Arial",
    "openinpresentation": 1
  }
}
