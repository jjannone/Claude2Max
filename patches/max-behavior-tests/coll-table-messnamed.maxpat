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
      1000.0,
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
            960.0,
            52.0
          ],
          "text": "CLAIM: messnamed() from v8, and a ';' message, cannot reach a bare 'coll NAME' or 'table NAME'. Tab 2 of max-behavior-tests showed both DO reach 'buffer~ NAME'. This checks coll and table, which c2m.inspect reaches only through a [receive] relay because of this claim.",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            15.0,
            960.0,
            52.0
          ],
          "presentation_linecount": 3
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
            40.0,
            330.0,
            60.0,
            22.0
          ],
          "text": "clear",
          "presentation": 1,
          "presentation_rect": [
            40.0,
            330.0,
            60.0,
            22.0
          ]
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
            40.0,
            90.0,
            220.0,
            36.0
          ],
          "text": "; BT_COLL store a semi",
          "presentation": 1,
          "presentation_rect": [
            40.0,
            90.0,
            220.0,
            37.0
          ],
          "presentation_linecount": 2
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
            270.0,
            94.0,
            170.0,
            22.0
          ],
          "text": "(a) ';' message",
          "presentation": 1,
          "presentation_rect": [
            270.0,
            94.0,
            170.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-5",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            340.0,
            190.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            340.0,
            190.0,
            24.0,
            24.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            370.0,
            190.0,
            190.0,
            22.0
          ],
          "text": "(b) v8 messnamed",
          "presentation": 1,
          "presentation_rect": [
            370.0,
            190.0,
            190.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-7",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            110.0,
            330.0,
            70.0,
            22.0
          ],
          "text": "length",
          "presentation": 1,
          "presentation_rect": [
            110.0,
            330.0,
            70.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-8",
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
            380.0,
            120.0,
            22.0
          ],
          "text": "coll BT_COLL"
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "patching_rect": [
            40.0,
            430.0,
            50.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            40.0,
            430.0,
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
            120.0,
            430.0,
            180.0,
            22.0
          ],
          "text": "entries in BT_COLL",
          "presentation": 1,
          "presentation_rect": [
            120.0,
            430.0,
            180.0,
            37.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-11",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            520.0,
            330.0,
            80.0,
            22.0
          ],
          "text": "const 0",
          "presentation": 1,
          "presentation_rect": [
            520.0,
            330.0,
            80.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-12",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            520.0,
            90.0,
            200.0,
            36.0
          ],
          "text": "; BT_TABLE set 0 11",
          "presentation": 1,
          "presentation_rect": [
            520.0,
            90.0,
            200.0,
            36.0
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
            730.0,
            94.0,
            250.0,
            22.0
          ],
          "text": "(a) ';' message: index 0 = 11",
          "presentation": 1,
          "presentation_rect": [
            730.0,
            94.0,
            250.0,
            37.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "button",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            570.0,
            190.0,
            24.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            570.0,
            190.0,
            24.0,
            24.0
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
            600.0,
            190.0,
            260.0,
            22.0
          ],
          "text": "(b) v8 messnamed: index 0 = 22",
          "presentation": 1,
          "presentation_rect": [
            600.0,
            190.0,
            260.0,
            37.0
          ],
          "presentation_linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-16",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            600.0,
            330.0,
            40.0,
            22.0
          ],
          "text": "0",
          "presentation": 1,
          "presentation_rect": [
            600.0,
            330.0,
            40.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-17",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "int",
            "bang"
          ],
          "patching_rect": [
            520.0,
            380.0,
            130.0,
            22.0
          ],
          "text": "table BT_TABLE"
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
            520.0,
            430.0,
            50.0,
            24.0
          ],
          "presentation": 1,
          "presentation_rect": [
            520.0,
            430.0,
            70.0,
            22.0
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
            600.0,
            430.0,
            180.0,
            22.0
          ],
          "text": "value at index 0",
          "presentation": 1,
          "presentation_rect": [
            600.0,
            430.0,
            180.0,
            22.0
          ]
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
            300.0,
            150.0,
            150.0,
            22.0
          ],
          "text": "loadmess embed 1"
        }
      },
      {
        "box": {
          "id": "obj-21",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            300.0,
            240.0,
            290.0,
            22.0
          ],
          "text": "v8 bt_messnamed_named.js @embed 1",
          "filename": "bt_messnamed_named.js",
          "textfile": {
            "filename": "bt_messnamed_named.js",
            "flags": 0,
            "autowatch": 1,
            "embed": 1,
            "text": "// Test for coll-table-messnamed: can messnamed() reach a coll or table by its name?\ninlets = 2;\noutlets = 1;\nsetinletassist(0, \"bang: send store b js to BT_COLL with messnamed()\");\nsetinletassist(1, \"bang: send set 0 22 to BT_TABLE with messnamed()\");\nsetoutletassist(0, \"coll or table, after the message was sent\");\n\nfunction bang() {\n\tif (inlet === 0) {\n\t\tmessnamed(\"BT_COLL\", \"store\", \"b\", \"js\");\n\t\toutlet(0, \"coll\");\n\t} else {\n\t\tmessnamed(\"BT_TABLE\", \"set\", 0, 22);\n\t\toutlet(0, \"table\");\n\t}\n}\n"
          }
        }
      },
      {
        "box": {
          "id": "obj-22",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            300.0,
            280.0,
            150.0,
            22.0
          ],
          "text": "print BT_NAMED"
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
            40.0,
            490.0,
            940.0,
            80.0
          ],
          "text": "WHAT TO DO, coll: click 'clear', then (a), then 'length'. Then 'clear', (b), 'length'. Table: click 'const 0', then (a), then '0'. Then 'const 0', (b), '0'. READING IT: entries 1 after (a) = a ';' message reaches coll; 0 = it does not. Same for (b) and messnamed. For the table, 11 after (a) or 22 after (b) = reached; 0 = not. The Max Console shows 'BT_NAMED: coll' or 'BT_NAMED: table' when the script ran, and any error.",
          "presentation": 1,
          "presentation_rect": [
            40.0,
            490.0,
            940.0,
            81.0
          ],
          "presentation_linecount": 5
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
            180.0,
            330.0,
            240.0,
            22.0
          ],
          "text": "clear empties, length counts",
          "presentation": 1,
          "presentation_rect": [
            180.0,
            330.0,
            240.0,
            37.0
          ],
          "presentation_linecount": 2
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
            640.0,
            330.0,
            290.0,
            22.0
          ],
          "text": "const 0 resets, 0 reads index 0",
          "presentation": 1,
          "presentation_rect": [
            640.0,
            330.0,
            290.0,
            37.0
          ],
          "presentation_linecount": 2
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
            610.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"width\": 1000,\n  \"height\": 600,\n  \"openinpresentation\": 1,\n  \"objects\": {\n    \"hdr\": {\n      \"type\": \"comment\",\n      \"text\": \"CLAIM: messnamed() from v8, and a ';' message, cannot reach a bare 'coll NAME' or 'table NAME'. Tab 2 of max-behavior-tests showed both DO reach 'buffer~ NAME'. This checks coll and table, which c2m.inspect reaches only through a [receive] relay because of this claim.\",\n      \"pos\": [\n        20,\n        15\n      ],\n      \"size\": [\n        960,\n        52\n      ],\n      \"presentation\": [\n        20,\n        15,\n        960,\n        52\n      ]\n    },\n    \"c_reset\": {\n      \"type\": \"message\",\n      \"text\": \"clear\",\n      \"pos\": [\n        40,\n        330\n      ],\n      \"presentation\": [\n        40,\n        330\n      ]\n    },\n    \"c_semi\": {\n      \"type\": \"message\",\n      \"text\": \"; BT_COLL store a semi\",\n      \"pos\": [\n        40,\n        90\n      ],\n      \"size\": [\n        220,\n        36\n      ],\n      \"presentation\": [\n        40,\n        90,\n        220,\n        37.0\n      ]\n    },\n    \"c_lsemi\": {\n      \"type\": \"comment\",\n      \"text\": \"(a) ';' message\",\n      \"pos\": [\n        270,\n        94\n      ],\n      \"size\": [\n        170,\n        22\n      ],\n      \"presentation\": [\n        270,\n        94,\n        170,\n        22\n      ]\n    },\n    \"c_btn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        340,\n        190\n      ],\n      \"presentation\": [\n        340,\n        190,\n        24,\n        24\n      ]\n    },\n    \"c_lbtn\": {\n      \"type\": \"comment\",\n      \"text\": \"(b) v8 messnamed\",\n      \"pos\": [\n        370,\n        190\n      ],\n      \"size\": [\n        190,\n        22\n      ],\n      \"presentation\": [\n        370,\n        190,\n        190,\n        22\n      ]\n    },\n    \"c_len\": {\n      \"type\": \"message\",\n      \"text\": \"length\",\n      \"pos\": [\n        110,\n        330\n      ],\n      \"presentation\": [\n        110,\n        330\n      ]\n    },\n    \"coll\": {\n      \"type\": \"newobj\",\n      \"text\": \"coll BT_COLL\",\n      \"pos\": [\n        40,\n        380\n      ],\n      \"size\": [\n        120,\n        22\n      ]\n    },\n    \"c_num\": {\n      \"type\": \"number\",\n      \"pos\": [\n        40,\n        430\n      ],\n      \"presentation\": [\n        40,\n        430,\n        70,\n        22\n      ]\n    },\n    \"c_lnum\": {\n      \"type\": \"comment\",\n      \"text\": \"entries in BT_COLL\",\n      \"pos\": [\n        120,\n        430\n      ],\n      \"size\": [\n        180,\n        22\n      ],\n      \"presentation\": [\n        120,\n        430,\n        180,\n        37.0\n      ]\n    },\n    \"t_reset\": {\n      \"type\": \"message\",\n      \"text\": \"const 0\",\n      \"pos\": [\n        520,\n        330\n      ],\n      \"presentation\": [\n        520,\n        330\n      ]\n    },\n    \"t_semi\": {\n      \"type\": \"message\",\n      \"text\": \"; BT_TABLE set 0 11\",\n      \"pos\": [\n        520,\n        90\n      ],\n      \"size\": [\n        200,\n        36\n      ],\n      \"presentation\": [\n        520,\n        90,\n        200,\n        36\n      ]\n    },\n    \"t_lsemi\": {\n      \"type\": \"comment\",\n      \"text\": \"(a) ';' message: index 0 = 11\",\n      \"pos\": [\n        730,\n        94\n      ],\n      \"size\": [\n        250,\n        22\n      ],\n      \"presentation\": [\n        730,\n        94,\n        250,\n        37.0\n      ]\n    },\n    \"t_btn\": {\n      \"type\": \"button\",\n      \"pos\": [\n        570,\n        190\n      ],\n      \"presentation\": [\n        570,\n        190,\n        24,\n        24\n      ]\n    },\n    \"t_lbtn\": {\n      \"type\": \"comment\",\n      \"text\": \"(b) v8 messnamed: index 0 = 22\",\n      \"pos\": [\n        600,\n        190\n      ],\n      \"size\": [\n        260,\n        22\n      ],\n      \"presentation\": [\n        600,\n        190,\n        260,\n        37.0\n      ]\n    },\n    \"t_read\": {\n      \"type\": \"message\",\n      \"text\": \"0\",\n      \"pos\": [\n        600,\n        330\n      ],\n      \"presentation\": [\n        600,\n        330\n      ]\n    },\n    \"table\": {\n      \"type\": \"newobj\",\n      \"text\": \"table BT_TABLE\",\n      \"pos\": [\n        520,\n        380\n      ],\n      \"size\": [\n        130,\n        22\n      ]\n    },\n    \"t_num\": {\n      \"type\": \"number\",\n      \"pos\": [\n        520,\n        430\n      ],\n      \"presentation\": [\n        520,\n        430,\n        70,\n        22\n      ]\n    },\n    \"t_lnum\": {\n      \"type\": \"comment\",\n      \"text\": \"value at index 0\",\n      \"pos\": [\n        600,\n        430\n      ],\n      \"size\": [\n        180,\n        22\n      ],\n      \"presentation\": [\n        600,\n        430,\n        180,\n        22\n      ]\n    },\n    \"embed\": {\n      \"type\": \"newobj\",\n      \"text\": \"loadmess embed 1\",\n      \"pos\": [\n        300,\n        150\n      ],\n      \"size\": [\n        150,\n        22\n      ]\n    },\n    \"v8\": {\n      \"type\": \"newobj\",\n      \"text\": \"v8 bt_messnamed_named.js @embed 1\",\n      \"pos\": [\n        300,\n        240\n      ],\n      \"size\": [\n        290,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"attrs\": {\n        \"textfile\": {\n          \"filename\": \"bt_messnamed_named.js\",\n          \"flags\": 0,\n          \"autowatch\": 1,\n          \"embed\": 1,\n          \"text\": \"// Test for coll-table-messnamed: can messnamed() reach a coll or table by its name?\\ninlets = 2;\\noutlets = 1;\\nsetinletassist(0, \\\"bang: send store b js to BT_COLL with messnamed()\\\");\\nsetinletassist(1, \\\"bang: send set 0 22 to BT_TABLE with messnamed()\\\");\\nsetoutletassist(0, \\\"coll or table, after the message was sent\\\");\\n\\nfunction bang() {\\n\\tif (inlet === 0) {\\n\\t\\tmessnamed(\\\"BT_COLL\\\", \\\"store\\\", \\\"b\\\", \\\"js\\\");\\n\\t\\toutlet(0, \\\"coll\\\");\\n\\t} else {\\n\\t\\tmessnamed(\\\"BT_TABLE\\\", \\\"set\\\", 0, 22);\\n\\t\\toutlet(0, \\\"table\\\");\\n\\t}\\n}\\n\"\n        }\n      }\n    },\n    \"pr\": {\n      \"type\": \"newobj\",\n      \"text\": \"print BT_NAMED\",\n      \"pos\": [\n        300,\n        280\n      ],\n      \"size\": [\n        150,\n        22\n      ]\n    },\n    \"how\": {\n      \"type\": \"comment\",\n      \"text\": \"WHAT TO DO, coll: click 'clear', then (a), then 'length'. Then 'clear', (b), 'length'. Table: click 'const 0', then (a), then '0'. Then 'const 0', (b), '0'. READING IT: entries 1 after (a) = a ';' message reaches coll; 0 = it does not. Same for (b) and messnamed. For the table, 11 after (a) or 22 after (b) = reached; 0 = not. The Max Console shows 'BT_NAMED: coll' or 'BT_NAMED: table' when the script ran, and any error.\",\n      \"pos\": [\n        40,\n        490\n      ],\n      \"size\": [\n        940,\n        80\n      ],\n      \"presentation\": [\n        40,\n        490,\n        940,\n        81.0\n      ]\n    },\n    \"c_lrow\": {\n      \"type\": \"comment\",\n      \"text\": \"clear empties, length counts\",\n      \"pos\": [\n        180,\n        330\n      ],\n      \"size\": [\n        240,\n        22\n      ],\n      \"presentation\": [\n        180,\n        330,\n        240,\n        37.0\n      ]\n    },\n    \"t_lrow\": {\n      \"type\": \"comment\",\n      \"text\": \"const 0 resets, 0 reads index 0\",\n      \"pos\": [\n        640,\n        330\n      ],\n      \"size\": [\n        290,\n        22\n      ],\n      \"presentation\": [\n        640,\n        330,\n        290,\n        37.0\n      ]\n    }\n  },\n  \"connections\": [\n    [\n      \"c_reset\",\n      0,\n      \"coll\",\n      0\n    ],\n    [\n      \"c_len\",\n      0,\n      \"coll\",\n      0\n    ],\n    [\n      \"coll\",\n      0,\n      \"c_num\",\n      0\n    ],\n    [\n      \"t_reset\",\n      0,\n      \"table\",\n      0\n    ],\n    [\n      \"t_read\",\n      0,\n      \"table\",\n      0\n    ],\n    [\n      \"table\",\n      0,\n      \"t_num\",\n      0\n    ],\n    [\n      \"c_btn\",\n      0,\n      \"v8\",\n      0\n    ],\n    [\n      \"t_btn\",\n      0,\n      \"v8\",\n      1\n    ],\n    [\n      \"embed\",\n      0,\n      \"v8\",\n      0\n    ],\n    [\n      \"v8\",\n      0,\n      \"pr\",\n      0\n    ]\n  ]\n}\n--- END SPEC ---",
          "fontsize": 9.0,
          "hidden": 1
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "obj-8",
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
            "obj-17",
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
            "obj-17",
            0
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
            "obj-21",
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
            "obj-21",
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
      }
    ],
    "default_fontsize": 12.0,
    "default_fontname": "Arial",
    "openinpresentation": 1
  }
}
