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
          "id": "obj-1",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            20.0,
            15.0,
            420.0,
            36.0
          ],
          "text": "Attribute group test. Select the box below and open the Inspector: do both_array, both_comma or both_twice appear under both butter_first and butter_second?",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            15.0,
            420.0,
            52.0
          ],
          "presentation_linecount": 3
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            20.0,
            65.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            65.0,
            24.0,
            24.0
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
            50.0,
            67.0,
            265.0,
            22.0
          ],
          "text": "post every value to the Max console",
          "presentation": 1,
          "presentation_rect": [
            50.0,
            67.0,
            260.0,
            21.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "v8ui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            20.0,
            100.0,
            330,
            105
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            100.0,
            330,
            105
          ],
          "filename": "attr_prefix_test.js"
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
            360,
            102.0,
            209.0,
            22.0
          ],
          "text": "red = Max refused that name",
          "presentation": 1,
          "presentation_rect": [
            360,
            102.0,
            200.0,
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
            245.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"openinpresentation\": 1,\n  \"objects\": {\n    \"title\": {\n      \"type\": \"comment\",\n      \"text\": \"Attribute group test. Select the box below and open the Inspector: do both_array, both_comma or both_twice appear under both butter_first and butter_second?\",\n      \"pos\": [\n        20,\n        15\n      ],\n      \"size\": [\n        420,\n        36\n      ],\n      \"presentation\": [\n        20,\n        15,\n        420,\n        52\n      ],\n      \"attrs\": {\n        \"presentation_linecount\": 3\n      },\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"btn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        20,\n        65\n      ],\n      \"presentation\": [\n        20,\n        65,\n        24,\n        24\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"btnlbl\": {\n      \"type\": \"comment\",\n      \"text\": \"post every value to the Max console\",\n      \"pos\": [\n        50,\n        67\n      ],\n      \"presentation\": [\n        50,\n        67,\n        260,\n        21\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        265,\n        22\n      ]\n    },\n    \"test\": {\n      \"type\": \"v8ui\",\n      \"pos\": [\n        20,\n        100\n      ],\n      \"size\": [\n        330,\n        105\n      ],\n      \"attrs\": {\n        \"filename\": \"attr_prefix_test.js\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"presentation\": [\n        20,\n        100,\n        330,\n        105\n      ]\n    },\n    \"lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"red = Max refused that name\",\n      \"pos\": [\n        360,\n        102\n      ],\n      \"presentation\": [\n        360,\n        102,\n        200,\n        21\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"size\": [\n        209,\n        22\n      ]\n    }\n  },\n  \"connections\": [\n    [\n      \"btn\",\n      0,\n      \"test\",\n      0\n    ]\n  ],\n  \"width\": 800,\n  \"height\": 600\n}\n--- END SPEC ---",
          "fontsize": 9.0,
          "hidden": 1
        }
      }
    ],
    "lines": [
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
      }
    ],
    "default_fontsize": 12.0,
    "default_fontname": "Arial",
    "openinpresentation": 1
  }
}
