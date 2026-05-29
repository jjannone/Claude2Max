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
      700.0,
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
          "text": "c2m.inspect",
          "fontsize": 16.0,
          "fontface": 1
        }
      },
      {
        "box": {
          "id": "obj-1",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            20.0,
            16.0,
            620.0,
            22.0
          ],
          "text": "c2m.inspect \u2014 OSC-driven data structure dumper (drop this into any patch)"
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            400.0,
            50.0,
            30.0,
            30.0
          ],
          "comment": "in 0: ping | scan | dump <tag> <kind> <name> \u2014 direct message bypass for OSC"
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            500.0,
            310.0,
            30.0,
            30.0
          ],
          "comment": "out 0: pong/scan/dumped/error <path> \u2014 status from v8"
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            40.0,
            80.0,
            125.0,
            22.0
          ],
          "text": "udpreceive 7474"
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
            80.0,
            400.0,
            20.0
          ],
          "text": "OSC in on UDP 7474 \u2014 default mode decodes OSC \u2192 Max messages"
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "",
            "",
            "",
            ""
          ],
          "patching_rect": [
            40.0,
            130.0,
            349.0,
            22.0
          ],
          "text": "route /inspect/ping /inspect/dump /inspect/scan"
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
            400.0,
            130.0,
            300.0,
            20.0
          ],
          "text": "route by OSC address (native Max route on the decoded symbol)"
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
            40.0,
            190.0,
            104.0,
            22.0
          ],
          "text": "prepend ping",
          "hidden": 1
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
            180.0,
            190.0,
            104.0,
            22.0
          ],
          "text": "prepend dump",
          "hidden": 1
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
            320.0,
            190.0,
            104.0,
            22.0
          ],
          "text": "prepend scan",
          "hidden": 1
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
            460.0,
            190.0,
            240.0,
            20.0
          ],
          "text": "prepend the JS function name to invoke"
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            40.0,
            250.0,
            139.0,
            22.0
          ],
          "text": "v8 c2m_inspect.js"
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
            220.0,
            250.0,
            280.0,
            20.0
          ],
          "text": "ping / dump <tag> <kind> <name> / scan"
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            40.0,
            310.0,
            139.0,
            22.0
          ],
          "text": "print c2m.inspect"
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
            40.0,
            400.0,
            120.0,
            22.0
          ],
          "text": "c2m.inspect",
          "presentation": 1,
          "presentation_rect": [
            8.0,
            6.0,
            124.0,
            18.0
          ],
          "fontsize": 12.0
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
            40.0,
            440.0,
            40.0,
            18.0
          ],
          "text": "ping",
          "presentation": 1,
          "presentation_rect": [
            40.0,
            30.0,
            40.0,
            18.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            40.0,
            470.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            12.0,
            30.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-18",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            80.0,
            470.0,
            48.0,
            22.0
          ],
          "text": "ping",
          "hidden": 1
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
            534.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"name\": \"c2m.inspect\",\n  \"width\": 700,\n  \"height\": 600,\n  \"openinpresentation\": 1,\n  \"objects\": {\n    \"title_top\": {\n      \"type\": \"comment\",\n      \"text\": \"c2m.inspect \\u2014 OSC-driven data structure dumper (drop this into any patch)\",\n      \"pos\": [\n        20,\n        16\n      ],\n      \"size\": [\n        620,\n        22\n      ]\n    },\n    \"io_inlet\": {\n      \"type\": \"inlet\",\n      \"pos\": [\n        400,\n        50\n      ],\n      \"attrs\": {\n        \"comment\": \"in 0: ping | scan | dump <tag> <kind> <name> \\u2014 direct message bypass for OSC\"\n      }\n    },\n    \"io_outlet\": {\n      \"type\": \"outlet\",\n      \"pos\": [\n        500,\n        310\n      ],\n      \"attrs\": {\n        \"comment\": \"out 0: pong/scan/dumped/error <path> \\u2014 status from v8\"\n      }\n    },\n    \"udprecv\": {\n      \"type\": \"newobj\",\n      \"text\": \"udpreceive 7474\",\n      \"pos\": [\n        40,\n        80\n      ]\n    },\n    \"udprecv_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"OSC in on UDP 7474 \\u2014 default mode decodes OSC \\u2192 Max messages\",\n      \"pos\": [\n        200,\n        80\n      ],\n      \"size\": [\n        400,\n        20\n      ]\n    },\n    \"router\": {\n      \"type\": \"newobj\",\n      \"text\": \"route /inspect/ping /inspect/dump /inspect/scan\",\n      \"pos\": [\n        40,\n        130\n      ]\n    },\n    \"router_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"route by OSC address (native Max route on the decoded symbol)\",\n      \"pos\": [\n        400,\n        130\n      ],\n      \"size\": [\n        300,\n        20\n      ]\n    },\n    \"prep_ping\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend ping\",\n      \"pos\": [\n        40,\n        190\n      ],\n      \"attrs\": {\n        \"hidden\": 1\n      }\n    },\n    \"prep_dump\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend dump\",\n      \"pos\": [\n        180,\n        190\n      ],\n      \"attrs\": {\n        \"hidden\": 1\n      }\n    },\n    \"prep_scan\": {\n      \"type\": \"newobj\",\n      \"text\": \"prepend scan\",\n      \"pos\": [\n        320,\n        190\n      ],\n      \"attrs\": {\n        \"hidden\": 1\n      }\n    },\n    \"prep_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"prepend the JS function name to invoke\",\n      \"pos\": [\n        460,\n        190\n      ],\n      \"size\": [\n        240,\n        20\n      ]\n    },\n    \"v8core\": {\n      \"type\": \"newobj\",\n      \"text\": \"v8 c2m_inspect.js\",\n      \"pos\": [\n        40,\n        250\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"v8_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"ping / dump <tag> <kind> <name> / scan\",\n      \"pos\": [\n        220,\n        250\n      ],\n      \"size\": [\n        280,\n        20\n      ]\n    },\n    \"debug_print\": {\n      \"type\": \"newobj\",\n      \"text\": \"print c2m.inspect\",\n      \"pos\": [\n        40,\n        310\n      ]\n    },\n    \"ui_title\": {\n      \"type\": \"comment\",\n      \"text\": \"c2m.inspect\",\n      \"pos\": [\n        40,\n        400\n      ],\n      \"size\": [\n        120,\n        22\n      ],\n      \"presentation\": [\n        8,\n        6,\n        124,\n        18\n      ]\n    },\n    \"ping_btn_lbl\": {\n      \"type\": \"comment\",\n      \"text\": \"ping\",\n      \"pos\": [\n        40,\n        440\n      ],\n      \"size\": [\n        40,\n        18\n      ],\n      \"presentation\": [\n        40,\n        30,\n        40,\n        18\n      ]\n    },\n    \"ping_btn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        40,\n        470\n      ],\n      \"presentation\": [\n        12,\n        30,\n        24,\n        24\n      ]\n    },\n    \"ping_msg\": {\n      \"type\": \"message\",\n      \"text\": \"ping\",\n      \"pos\": [\n        80,\n        470\n      ],\n      \"attrs\": {\n        \"hidden\": 1\n      }\n    }\n  },\n  \"connections\": [\n    [\n      \"udprecv\",\n      0,\n      \"router\",\n      0\n    ],\n    [\n      \"router\",\n      0,\n      \"prep_ping\",\n      0\n    ],\n    [\n      \"router\",\n      1,\n      \"prep_dump\",\n      0\n    ],\n    [\n      \"router\",\n      2,\n      \"prep_scan\",\n      0\n    ],\n    [\n      \"prep_ping\",\n      0,\n      \"v8core\",\n      0\n    ],\n    [\n      \"prep_dump\",\n      0,\n      \"v8core\",\n      0\n    ],\n    [\n      \"prep_scan\",\n      0,\n      \"v8core\",\n      0\n    ],\n    [\n      \"v8core\",\n      0,\n      \"debug_print\",\n      0\n    ],\n    [\n      \"v8core\",\n      0,\n      \"io_outlet\",\n      0\n    ],\n    [\n      \"io_inlet\",\n      0,\n      \"v8core\",\n      0\n    ],\n    [\n      \"ping_btn\",\n      0,\n      \"ping_msg\",\n      0\n    ],\n    [\n      \"ping_msg\",\n      0,\n      \"v8core\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
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
            "obj-8",
            0
          ],
          "source": [
            "obj-6",
            0
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
            "obj-6",
            1
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-10",
            0
          ],
          "source": [
            "obj-6",
            2
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-12",
            0
          ],
          "source": [
            "obj-8",
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-12",
            0
          ],
          "source": [
            "obj-9",
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-12",
            0
          ],
          "source": [
            "obj-10",
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-14",
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
            "obj-3",
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
            "obj-12",
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
            "obj-18",
            0
          ],
          "source": [
            "obj-17",
            0
          ],
          "hidden": 1
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-12",
            0
          ],
          "source": [
            "obj-18",
            0
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
