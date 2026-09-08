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
      560.0,
      380.0
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
          "text": "patchgen-loader",
          "fontsize": 16.0,
          "fontface": 1
        }
      },
      {
        "box": {
          "id": "obj-1",
          "maxclass": "panel",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            30.0,
            60.0,
            420.0,
            150.0
          ],
          "presentation": 1,
          "presentation_rect": [
            10.0,
            10.0,
            420.0,
            150.0
          ],
          "bgcolor": [
            0.16,
            0.16,
            0.18,
            1.0
          ],
          "rounded": 8
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
            45.0,
            70.0,
            300.0,
            22.0
          ],
          "text": "CLAUDE2MAX PATCH GENERATOR",
          "presentation": 1,
          "presentation_rect": [
            24.0,
            20.0,
            300.0,
            22.0
          ],
          "fontname": "Monaco",
          "fontsize": 12.0,
          "textcolor": [
            0.92,
            0.92,
            0.92,
            1.0
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
            45.0,
            96.0,
            400.0,
            36.0
          ],
          "text": "1. Save the JSON from Claude as spec.json   2. Click LOAD   3. Save the new window as a .maxpat",
          "presentation": 1,
          "presentation_rect": [
            24.0,
            48.0,
            390.0,
            36.0
          ],
          "fontname": "Monaco",
          "fontsize": 10.0,
          "textcolor": [
            0.75,
            0.75,
            0.75,
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
            45.0,
            150.0,
            140.0,
            24.0
          ],
          "text": "LOAD spec.json\u2026",
          "presentation": 1,
          "presentation_rect": [
            24.0,
            96.0,
            140.0,
            24.0
          ],
          "fontname": "Monaco",
          "fontsize": 12.0,
          "bgcolor": [
            0.98,
            0.58,
            0.1,
            1.0
          ],
          "textcolor": [
            0.05,
            0.05,
            0.05,
            1.0
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
            200.0,
            150.0,
            60.0,
            20.0
          ],
          "text": "status",
          "presentation": 1,
          "presentation_rect": [
            180.0,
            98.0,
            60.0,
            20.0
          ],
          "fontname": "Monaco",
          "fontsize": 10.0,
          "textcolor": [
            0.75,
            0.75,
            0.75,
            1.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            45.0,
            320.0,
            400.0,
            22.0
          ],
          "text": "waiting for a spec",
          "presentation": 1,
          "presentation_rect": [
            24.0,
            122.0,
            390.0,
            22.0
          ],
          "fontname": "Monaco",
          "fontsize": 10.0
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
            45.0,
            190.0,
            90.0,
            22.0
          ],
          "text": "opendialog"
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
            45.0,
            232.0,
            104.0,
            22.0
          ],
          "text": "prepend read"
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
            45.0,
            274.0,
            118.0,
            22.0
          ],
          "text": "v8 patchgen.js"
        }
      },
      {
        "box": {
          "id": "obj-10",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            250.0,
            320.0,
            118.0,
            22.0
          ],
          "text": "print patchgen"
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
            382.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"name\": \"patchgen-loader\",\n  \"width\": 560,\n  \"height\": 380,\n  \"objects\": {\n    \"panel_bg\": {\n      \"type\": \"panel\",\n      \"pos\": [\n        30,\n        60\n      ],\n      \"size\": [\n        420,\n        150\n      ],\n      \"presentation\": [\n        10,\n        10,\n        420,\n        150\n      ],\n      \"attrs\": {\n        \"bgcolor\": [\n          0.16,\n          0.16,\n          0.18,\n          1.0\n        ],\n        \"rounded\": 8\n      }\n    },\n    \"lbl_title\": {\n      \"type\": \"comment\",\n      \"text\": \"CLAUDE2MAX PATCH GENERATOR\",\n      \"pos\": [\n        45,\n        70\n      ],\n      \"size\": [\n        300,\n        22\n      ],\n      \"presentation\": [\n        24,\n        20,\n        300,\n        22\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 12.0,\n        \"textcolor\": [\n          0.92,\n          0.92,\n          0.92,\n          1.0\n        ]\n      }\n    },\n    \"lbl_step\": {\n      \"type\": \"comment\",\n      \"text\": \"1. Save the JSON from Claude as spec.json   2. Click LOAD   3. Save the new window as a .maxpat\",\n      \"pos\": [\n        45,\n        96\n      ],\n      \"size\": [\n        400,\n        36\n      ],\n      \"presentation\": [\n        24,\n        48,\n        390,\n        36\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 10.0,\n        \"textcolor\": [\n          0.75,\n          0.75,\n          0.75,\n          1.0\n        ]\n      }\n    },\n    \"btn_load\": {\n      \"type\": \"message\",\n      \"text\": \"LOAD spec.json\\u2026\",\n      \"pos\": [\n        45,\n        150\n      ],\n      \"size\": [\n        140,\n        24\n      ],\n      \"presentation\": [\n        24,\n        96,\n        140,\n        24\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 12.0,\n        \"bgcolor\": [\n          0.98,\n          0.58,\n          0.1,\n          1.0\n        ],\n        \"textcolor\": [\n          0.05,\n          0.05,\n          0.05,\n          1.0\n        ]\n      }\n    },\n    \"lbl_status\": {\n      \"type\": \"comment\",\n      \"text\": \"status\",\n      \"pos\": [\n        200,\n        150\n      ],\n      \"size\": [\n        60,\n        20\n      ],\n      \"presentation\": [\n        180,\n        98,\n        60,\n        20\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 10.0,\n        \"textcolor\": [\n          0.75,\n          0.75,\n          0.75,\n          1.0\n        ]\n      }\n    },\n    \"status\": {\n      \"type\": \"message\",\n      \"text\": \"waiting for a spec\",\n      \"pos\": [\n        45,\n        320\n      ],\n      \"size\": [\n        400,\n        22\n      ],\n      \"presentation\": [\n        24,\n        122,\n        390,\n        22\n      ],\n      \"attrs\": {\n        \"fontname\": \"Monaco\",\n        \"fontsize\": 10.0\n      }\n    },\n    \"dialog\": {\n      \"type\": \"newobj\",\n      \"text\": \"opendialog\",\n      \"pos\": [\n        45,\n        190\n      ]\n    },\n    \"to_read\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend read\",\n      \"pos\": [\n        45,\n        232\n      ]\n    },\n    \"gen\": {\n      \"type\": \"newobj\",\n      \"text\": \"v8 patchgen.js\",\n      \"pos\": [\n        45,\n        274\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"monitor\": {\n      \"type\": \"newobj\",\n      \"text\": \"print patchgen\",\n      \"pos\": [\n        250,\n        320\n      ]\n    }\n  },\n  \"connections\": [\n    [\n      \"btn_load\",\n      0,\n      \"dialog\",\n      0\n    ],\n    [\n      \"dialog\",\n      0,\n      \"to_read\",\n      0\n    ],\n    [\n      \"to_read\",\n      0,\n      \"gen\",\n      0\n    ],\n    [\n      \"gen\",\n      0,\n      \"status\",\n      1\n    ],\n    [\n      \"gen\",\n      0,\n      \"monitor\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
          "fontsize": 9.0,
          "hidden": 1
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "obj-7",
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
            "obj-6",
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
            "obj-10",
            0
          ],
          "source": [
            "obj-9",
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
