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
      1020.0,
      666.0
    ],
    "gridsize": [
      15.0,
      15.0
    ],
    "boxes": [
      {
        "box": {
          "id": "obj-1",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            40.0,
            40.0,
            150.0,
            22.0
          ],
          "text": "p \"1 z-order\"",
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
              1020.0,
              640.0
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
                    66.0
                  ],
                  "text": "CLAIM 1 - Z-ORDER. patching/MAX_PATCHING.md (Max .maxpat Internals) and SPEC_REFERENCE.md (Z-order) say a box LATER in the file's box list draws IN FRONT. The comment in spec2maxpat.py convert (panel reordering) says EARLIER boxes paint in front. In this tab's file: RED panel is listed before BLUE panel, and button A before button B. Neither panel has the background attribute."
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
                    300.0,
                    180.0,
                    260.0,
                    22.0
                  ],
                  "text": "red = listed 1st, blue = listed 2nd",
                  "presentation": 1,
                  "presentation_rect": [
                    300.0,
                    180.0,
                    260.0,
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
                    620.0,
                    110.0,
                    60.0,
                    60.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    620.0,
                    110.0,
                    60.0,
                    60.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-6",
                  "maxclass": "button",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    650.0,
                    140.0,
                    60.0,
                    60.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    650.0,
                    140.0,
                    60.0,
                    60.0
                  ]
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
                    760.0,
                    150.0,
                    240.0,
                    36.0
                  ],
                  "text": "A = listed 1st (top-left), B = listed 2nd",
                  "presentation": 1,
                  "presentation_rect": [
                    760.0,
                    150.0,
                    240.0,
                    37.0
                  ],
                  "presentation_linecount": 2
                }
              },
              {
                "box": {
                  "id": "obj-8",
                  "maxclass": "newobj",
                  "numinlets": 5,
                  "numoutlets": 4,
                  "outlettype": [
                    "int",
                    "",
                    "",
                    "int"
                  ],
                  "patching_rect": [
                    560.0,
                    250.0,
                    99.0,
                    22.0
                  ],
                  "text": "counter"
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
                    "",
                    "",
                    "int"
                  ],
                  "patching_rect": [
                    760.0,
                    250.0,
                    99.0,
                    22.0
                  ],
                  "text": "counter"
                }
              },
              {
                "box": {
                  "id": "obj-10",
                  "maxclass": "number",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "bang"
                  ],
                  "patching_rect": [
                    560.0,
                    300.0,
                    70.0,
                    22.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    620.0,
                    220.0,
                    70.0,
                    22.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-11",
                  "maxclass": "number",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "bang"
                  ],
                  "patching_rect": [
                    760.0,
                    300.0,
                    70.0,
                    22.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    720.0,
                    220.0,
                    70.0,
                    22.0
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
                    640.0,
                    300.0,
                    110.0,
                    22.0
                  ],
                  "text": "clicks reaching A",
                  "presentation": 1,
                  "presentation_rect": [
                    560.0,
                    250.0,
                    160.0,
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
                    840.0,
                    300.0,
                    140.0,
                    22.0
                  ],
                  "text": "clicks reaching B",
                  "presentation": 1,
                  "presentation_rect": [
                    720.0,
                    250.0,
                    170.0,
                    22.0
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
                    40.0,
                    380.0,
                    940.0,
                    96.0
                  ],
                  "text": "WHAT TO DO: this tab opens in presentation. (1) Look where red and blue overlap. (2) Switch to the patching view (Cmd-Opt-E) and look again. (3) Lock the patch and click inside the area where buttons A and B overlap, a few times. READING IT: BLUE on top = later draws in front (MAX_PATCHING.md is right, the spec2maxpat.py comment is wrong). RED on top = earlier draws in front (the spec2maxpat.py comment is right). If the 'clicks reaching B' number goes up, the later box gets the click; if A goes up, the earlier box does. Note whether both views agree."
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
                    590.0,
                    110.0,
                    24.0,
                    22.0
                  ],
                  "text": "A",
                  "presentation": 1,
                  "presentation_rect": [
                    590.0,
                    110.0,
                    24.0,
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
                    715.0,
                    178.0,
                    24.0,
                    22.0
                  ],
                  "text": "B",
                  "presentation": 1,
                  "presentation_rect": [
                    715.0,
                    178.0,
                    24.0,
                    22.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-2",
                  "maxclass": "panel",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "patching_rect": [
                    40.0,
                    110.0,
                    160.0,
                    100.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    40.0,
                    110.0,
                    160.0,
                    100.0
                  ],
                  "bgcolor": [
                    0.9,
                    0.1,
                    0.1,
                    1.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-3",
                  "maxclass": "panel",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "patching_rect": [
                    120.0,
                    150.0,
                    160.0,
                    100.0
                  ],
                  "presentation": 1,
                  "presentation_rect": [
                    120.0,
                    150.0,
                    160.0,
                    100.0
                  ],
                  "bgcolor": [
                    0.1,
                    0.3,
                    0.95,
                    1.0
                  ]
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
                    "obj-5",
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
                    "obj-6",
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
              }
            ],
            "default_fontsize": 12.0,
            "default_fontname": "Arial",
            "openinpresentation": 1,
            "showontab": 1
          },
          "saved_object_attributes": {
            "description": "",
            "digest": "",
            "globalpatchername": "",
            "tags": ""
          }
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            200.0,
            40.0,
            150.0,
            22.0
          ],
          "text": "p \"2 messnamed buffer\"",
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
              1020.0,
              640.0
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
                  "text": "CLAIM 2 - messnamed / ';' CANNOT REACH buffer~. patching/MAX_PATCHING.md (Common Pitfalls, messnamed bullet) says messnamed() from v8/js, like a ';' message, only reaches [receive] objects, never a 'buffer~ NAME'. Here buffer~ BT_BUF starts 500 ms long."
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
                    90.0,
                    120.0,
                    22.0
                  ],
                  "text": "setsize 500"
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
                    180.0,
                    90.0,
                    260.0,
                    22.0
                  ],
                  "text": "reset to 500 ms (wired straight in)"
                }
              },
              {
                "box": {
                  "id": "obj-4",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "float",
                    "bang"
                  ],
                  "patching_rect": [
                    40.0,
                    140.0,
                    250.0,
                    22.0
                  ],
                  "text": "buffer~ BT_BUF @size 500"
                }
              },
              {
                "box": {
                  "id": "obj-5",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    40.0,
                    210.0,
                    210.0,
                    36.0
                  ],
                  "text": "; BT_BUF setsize 1000"
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
                    270.0,
                    214.0,
                    320.0,
                    22.0
                  ],
                  "text": "(a) ';' message: sets 1000 ms if it reaches"
                }
              },
              {
                "box": {
                  "id": "obj-7",
                  "maxclass": "button",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    40.0,
                    280.0,
                    24.0,
                    24.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-8",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "patching_rect": [
                    80.0,
                    280.0,
                    330.0,
                    22.0
                  ],
                  "text": "(b) v8 messnamed('BT_BUF','setsize',2000)"
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
                    430.0,
                    280.0,
                    170.0,
                    22.0
                  ],
                  "text": "loadmess embed 1"
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
                    40.0,
                    330.0,
                    270.0,
                    22.0
                  ],
                  "text": "v8 bt_messnamed.js @embed 1",
                  "filename": "bt_messnamed.js",
                  "textfile": {
                    "filename": "bt_messnamed.js",
                    "flags": 0,
                    "autowatch": 1,
                    "embed": 1,
                    "text": "// Test for max-behavior-tests tab 2: can messnamed() reach a buffer~ by its name?\ninlets = 1;\noutlets = 1;\nsetinletassist(0, \"bang: send setsize 2000 to BT_BUF with messnamed()\");\nsetoutletassist(0, \"bang after the message was sent\");\n\nfunction bang() {\n\tmessnamed(\"BT_BUF\", \"setsize\", 2000);\n\toutlet(0, \"bang\");\n}\n"
                  }
                }
              },
              {
                "box": {
                  "id": "obj-11",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "patching_rect": [
                    40.0,
                    380.0,
                    190.0,
                    22.0
                  ],
                  "text": "print BT_MESSNAMED"
                }
              },
              {
                "box": {
                  "id": "obj-12",
                  "maxclass": "button",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    660.0,
                    90.0,
                    24.0,
                    24.0
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
                    700.0,
                    90.0,
                    120.0,
                    22.0
                  ],
                  "text": "read the size"
                }
              },
              {
                "box": {
                  "id": "obj-14",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 10,
                  "outlettype": [
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                    ""
                  ],
                  "patching_rect": [
                    660.0,
                    140.0,
                    180.0,
                    22.0
                  ],
                  "text": "info~ BT_BUF"
                }
              },
              {
                "box": {
                  "id": "obj-15",
                  "maxclass": "flonum",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "float",
                    "bang"
                  ],
                  "patching_rect": [
                    770.0,
                    200.0,
                    80.0,
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
                    860.0,
                    200.0,
                    120.0,
                    22.0
                  ],
                  "text": "total time, ms"
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
                    40.0,
                    440.0,
                    940.0,
                    80.0
                  ],
                  "text": "WHAT TO DO: click 'read the size' (should show 500.). Click (a), then 'read the size'. Click 'reset', then the (b) button, then 'read the size'. READING IT: after (a), 1000. = a ';' message DOES reach buffer~ (claim false for ';'); still 500. = claim true. After (b), 2000. = messnamed DOES reach buffer~ (claim false); still 500. = claim true. The Max Console shows 'BT_MESSNAMED: bang' when the script ran, and any error it posted."
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
              },
              {
                "patchline": {
                  "destination": [
                    "obj-10",
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
                    "obj-15",
                    0
                  ],
                  "source": [
                    "obj-14",
                    6
                  ]
                }
              }
            ],
            "default_fontsize": 12.0,
            "default_fontname": "Arial",
            "showontab": 1
          },
          "saved_object_attributes": {
            "description": "",
            "digest": "",
            "globalpatchername": "",
            "tags": ""
          }
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            360.0,
            40.0,
            150.0,
            22.0
          ],
          "text": "p \"3 select floats\"",
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
              1020.0,
              640.0
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
                  "text": "CLAIM 3 - select AND FLOATS. patching/MAX_PATCHING.md (Common Pitfalls) says select needs @fuzzy to match floats from UI. select's refpage says floats are only compared when @matchfloat is 1 (default 0; 'when matchfloat is set to 0, floats are ignored') and fuzzy (default 0.) is the tolerance used in that mode."
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
                    30.0,
                    90.0,
                    40.0,
                    22.0
                  ],
                  "text": "0.5"
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
                    90.0,
                    90.0,
                    70.0,
                    22.0
                  ],
                  "text": "0.4995"
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
                    180.0,
                    90.0,
                    40.0,
                    22.0
                  ],
                  "text": "0.6"
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
                    240.0,
                    90.0,
                    440.0,
                    22.0
                  ],
                  "text": "click one: the value goes through the number box to all four"
                }
              },
              {
                "box": {
                  "id": "obj-6",
                  "maxclass": "flonum",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "float",
                    "bang"
                  ],
                  "patching_rect": [
                    30.0,
                    140.0,
                    80.0,
                    22.0
                  ]
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
                    320.0,
                    950.0,
                    96.0
                  ],
                  "text": "Under each select: LEFT button flashes = match, RIGHT button flashes = no match (neither = the float was ignored). WHAT TO DO: click 0.5, then 0.4995, then 0.6; you can also drag the number box. READING IT: if plain 'sel 0.5' flashes LEFT on 0.5, select matches floats without any attribute and both repo statements are too strong. If only the @matchfloat 1 boxes match 0.5, the refpage is right and the rule should say @matchfloat, not @fuzzy. If '@fuzzy 0.001' without matchfloat still matches nothing, @fuzzy alone does nothing. 0.4995 should match only where fuzzy 0.001 is active and floats are compared."
                }
              },
              {
                "box": {
                  "id": "obj-8",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "bang",
                    ""
                  ],
                  "patching_rect": [
                    30.0,
                    210.0,
                    90.0,
                    22.0
                  ],
                  "text": "sel 0.5"
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
                    30.0,
                    260.0,
                    24.0,
                    24.0
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
                    96.0,
                    260.0,
                    24.0,
                    24.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-11",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "bang",
                    ""
                  ],
                  "patching_rect": [
                    150.0,
                    210.0,
                    220.0,
                    22.0
                  ],
                  "text": "sel 0.5 @fuzzy 0.001"
                }
              },
              {
                "box": {
                  "id": "obj-12",
                  "maxclass": "button",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    150.0,
                    260.0,
                    24.0,
                    24.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-13",
                  "maxclass": "button",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    346.0,
                    260.0,
                    24.0,
                    24.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-14",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "bang",
                    ""
                  ],
                  "patching_rect": [
                    400.0,
                    210.0,
                    230.0,
                    22.0
                  ],
                  "text": "sel 0.5 @matchfloat 1"
                }
              },
              {
                "box": {
                  "id": "obj-15",
                  "maxclass": "button",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    400.0,
                    260.0,
                    24.0,
                    24.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-16",
                  "maxclass": "button",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    606.0,
                    260.0,
                    24.0,
                    24.0
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
                    "bang",
                    ""
                  ],
                  "patching_rect": [
                    650.0,
                    210.0,
                    350.0,
                    22.0
                  ],
                  "text": "sel 0.5 @matchfloat 1 @fuzzy 0.001"
                }
              },
              {
                "box": {
                  "id": "obj-18",
                  "maxclass": "button",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    650.0,
                    260.0,
                    24.0,
                    24.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-19",
                  "maxclass": "button",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    976.0,
                    260.0,
                    24.0,
                    24.0
                  ]
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
                    "obj-8",
                    1
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
                    "obj-6",
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
                    "obj-6",
                    0
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
                    "obj-14",
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
                    "obj-6",
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
                    "obj-19",
                    0
                  ],
                  "source": [
                    "obj-17",
                    1
                  ]
                }
              }
            ],
            "default_fontsize": 12.0,
            "default_fontname": "Arial",
            "showontab": 1
          },
          "saved_object_attributes": {
            "description": "",
            "digest": "",
            "globalpatchername": "",
            "tags": ""
          }
        }
      },
      {
        "box": {
          "id": "obj-4",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            520.0,
            40.0,
            150.0,
            22.0
          ],
          "text": "p \"4 two matrices\"",
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
              1020.0,
              640.0
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
                  "text": "CLAIM 4 - TWO jit_matrix SOURCES INTO ONE INLET. patching/MAX_PATCHING.md (Common Pitfalls) calls two jit_matrix sources fanned into one inlet 'a structural conflict' where one matrix may clobber the other."
                }
              },
              {
                "box": {
                  "id": "obj-2",
                  "maxclass": "toggle",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "int"
                  ],
                  "patching_rect": [
                    40.0,
                    90.0,
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
                    70.0,
                    90.0,
                    240.0,
                    22.0
                  ],
                  "text": "alternate A and B every 200 ms"
                }
              },
              {
                "box": {
                  "id": "obj-4",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    40.0,
                    130.0,
                    100.0,
                    22.0
                  ],
                  "text": "metro 200"
                }
              },
              {
                "box": {
                  "id": "obj-5",
                  "maxclass": "newobj",
                  "numinlets": 5,
                  "numoutlets": 4,
                  "outlettype": [
                    "int",
                    "",
                    "",
                    "int"
                  ],
                  "patching_rect": [
                    40.0,
                    170.0,
                    120.0,
                    22.0
                  ],
                  "text": "counter 0 1"
                }
              },
              {
                "box": {
                  "id": "obj-6",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 3,
                  "outlettype": [
                    "bang",
                    "bang",
                    ""
                  ],
                  "patching_rect": [
                    40.0,
                    210.0,
                    90.0,
                    22.0
                  ],
                  "text": "sel 0 1"
                }
              },
              {
                "box": {
                  "id": "obj-7",
                  "maxclass": "button",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    40.0,
                    260.0,
                    24.0,
                    24.0
                  ]
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
                    220.0,
                    260.0,
                    24.0,
                    24.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-9",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "patching_rect": [
                    70.0,
                    260.0,
                    30.0,
                    22.0
                  ],
                  "text": "A"
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
                    250.0,
                    260.0,
                    30.0,
                    22.0
                  ],
                  "text": "B"
                }
              },
              {
                "box": {
                  "id": "obj-11",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "jit_matrix",
                    ""
                  ],
                  "patching_rect": [
                    40.0,
                    300.0,
                    170.0,
                    22.0
                  ],
                  "text": "jit.noise 1 char 4 3"
                }
              },
              {
                "box": {
                  "id": "obj-12",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "jit_matrix",
                    ""
                  ],
                  "patching_rect": [
                    220.0,
                    300.0,
                    190.0,
                    22.0
                  ],
                  "text": "jit.noise 4 char 80 60"
                }
              },
              {
                "box": {
                  "id": "obj-13",
                  "maxclass": "jit.pwindow",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "jit_matrix",
                    ""
                  ],
                  "patching_rect": [
                    40.0,
                    360.0,
                    320.0,
                    240.0
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
                    400.0,
                    360.0,
                    580.0,
                    140.0
                  ],
                  "text": "A = grey, 4 x 3 cells (big blocks). B = colour, 80 x 60 cells (fine grain). Both cords land on the same inlet of the jit.pwindow. WHAT TO DO: click A, click B, then turn on the toggle. READING IT: if the window shows each matrix cleanly as it arrives (big grey blocks, then fine colour, alternating), with no mixing and no errors in the Max Console, the fan-in simply works and the claim is false as stated. If frames come out mixed, wrong size or with errors, the claim holds. Turn the toggle off when done."
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
                    "obj-6",
                    1
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
                    "obj-8",
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
                    "obj-13",
                    0
                  ],
                  "source": [
                    "obj-12",
                    0
                  ]
                }
              }
            ],
            "default_fontsize": 12.0,
            "default_fontname": "Arial",
            "showontab": 1
          },
          "saved_object_attributes": {
            "description": "",
            "digest": "",
            "globalpatchername": "",
            "tags": ""
          }
        }
      },
      {
        "box": {
          "id": "obj-5",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            680.0,
            40.0,
            150.0,
            22.0
          ],
          "text": "p \"5 saved values\"",
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
              1020.0,
              640.0
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
                    66.0
                  ],
                  "text": "CLAIM 5 - CONTROLS WITHOUT LOAD-TIME INIT. patching/MAX_PATCHING.md (Max Patching Principles: Every control must initialize to a known state on patch load) says a control with no loadmess is 'a source of undefined state'. These five have no init and only Max's default settings. The live.dial is a parameter, as every live.dial is (all 37 in C74's help files save parameter_enable 1); the others are not."
                }
              },
              {
                "box": {
                  "id": "obj-2",
                  "maxclass": "number",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "bang"
                  ],
                  "patching_rect": [
                    40.0,
                    110.0,
                    70.0,
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
                    130.0,
                    110.0,
                    200.0,
                    22.0
                  ],
                  "text": "number (default 0)"
                }
              },
              {
                "box": {
                  "id": "obj-4",
                  "maxclass": "flonum",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "float",
                    "bang"
                  ],
                  "patching_rect": [
                    40.0,
                    160.0,
                    70.0,
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
                    130.0,
                    160.0,
                    200.0,
                    22.0
                  ],
                  "text": "flonum (default 0.)"
                }
              },
              {
                "box": {
                  "id": "obj-6",
                  "maxclass": "live.dial",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "float"
                  ],
                  "patching_rect": [
                    40.0,
                    200.0,
                    44.0,
                    47.0
                  ]
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
                    130.0,
                    220.0,
                    200.0,
                    22.0
                  ],
                  "text": "live.dial (default 0.)"
                }
              },
              {
                "box": {
                  "id": "obj-8",
                  "maxclass": "umenu",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "int",
                    "",
                    ""
                  ],
                  "patching_rect": [
                    40.0,
                    280.0,
                    100.0,
                    22.0
                  ],
                  "items": [
                    "one",
                    ",",
                    "two",
                    ",",
                    "three"
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-9",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "patching_rect": [
                    160.0,
                    280.0,
                    240.0,
                    22.0
                  ],
                  "text": "umenu (default: item 0, 'one')"
                }
              },
              {
                "box": {
                  "id": "obj-10",
                  "maxclass": "toggle",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "int"
                  ],
                  "patching_rect": [
                    40.0,
                    330.0,
                    24.0,
                    24.0
                  ]
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
                    130.0,
                    330.0,
                    200.0,
                    22.0
                  ],
                  "text": "toggle (default off)"
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
                    420.0,
                    110.0,
                    560.0,
                    140.0
                  ],
                  "text": "WHAT TO DO: lock the patch. Set each control to something that is not its default: number 7, flonum 3.5 (drag), live.dial about halfway, umenu 'three', toggle on. Save (Cmd-S), close the patch, reopen it, and come back to this tab. READING IT: write down which came back at your value and which came back at its default. A control that reliably comes back the same way each time has a known state, so 'undefined' is the wrong word for it. Note: saving changes this file in the repo; that is expected."
                }
              }
            ],
            "lines": [],
            "default_fontsize": 12.0,
            "default_fontname": "Arial",
            "showontab": 1
          },
          "saved_object_attributes": {
            "description": "",
            "digest": "",
            "globalpatchername": "",
            "tags": ""
          }
        }
      },
      {
        "box": {
          "id": "obj-6",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 0,
          "outlettype": [],
          "patching_rect": [
            840.0,
            40.0,
            150.0,
            22.0
          ],
          "text": "p \"6 fresh sizes\"",
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
              1020.0,
              640.0
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
                    66.0
                  ],
                  "text": "FRESH BOX SIZES (no claim). For each spot below, make a BRAND-NEW box of the class named on its right: for inlet and outlet type the name into a new object box (N); for the others use the object palette or type the name. Put its top-left corner on the spot's '+' mark. Do NOT resize anything. Then save. Each box's saved patching_rect gives the size Max creates it at."
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
                    40.0,
                    110.0,
                    20.0,
                    22.0
                  ],
                  "text": "+"
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
                    240.0,
                    110.0,
                    240.0,
                    22.0
                  ],
                  "text": "<- spot 1: inlet"
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
                    40.0,
                    210.0,
                    20.0,
                    22.0
                  ],
                  "text": "+"
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
                    240.0,
                    210.0,
                    240.0,
                    22.0
                  ],
                  "text": "<- spot 2: outlet"
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
                    40.0,
                    310.0,
                    20.0,
                    22.0
                  ],
                  "text": "+"
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
                    240.0,
                    310.0,
                    240.0,
                    22.0
                  ],
                  "text": "<- spot 3: preset"
                }
              },
              {
                "box": {
                  "id": "obj-8",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "patching_rect": [
                    40.0,
                    410.0,
                    20.0,
                    22.0
                  ],
                  "text": "+"
                }
              },
              {
                "box": {
                  "id": "obj-9",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "patching_rect": [
                    240.0,
                    410.0,
                    240.0,
                    22.0
                  ],
                  "text": "<- spot 4: live.dial"
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
                    40.0,
                    510.0,
                    20.0,
                    22.0
                  ],
                  "text": "+"
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
                    240.0,
                    510.0,
                    240.0,
                    22.0
                  ],
                  "text": "<- spot 5: live.slider"
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
                    520.0,
                    110.0,
                    20.0,
                    22.0
                  ],
                  "text": "+"
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
                    720.0,
                    110.0,
                    240.0,
                    22.0
                  ],
                  "text": "<- spot 6: live.toggle"
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
                    520.0,
                    210.0,
                    20.0,
                    22.0
                  ],
                  "text": "+"
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
                    720.0,
                    210.0,
                    240.0,
                    22.0
                  ],
                  "text": "<- spot 7: live.numbox"
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
                    520.0,
                    310.0,
                    20.0,
                    22.0
                  ],
                  "text": "+"
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
                    720.0,
                    310.0,
                    240.0,
                    22.0
                  ],
                  "text": "<- spot 8: live.menu"
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
                    520.0,
                    410.0,
                    20.0,
                    22.0
                  ],
                  "text": "+"
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
                    720.0,
                    410.0,
                    240.0,
                    22.0
                  ],
                  "text": "<- spot 9: live.text"
                }
              },
              {
                "box": {
                  "id": "obj-20",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "outlettype": [],
                  "patching_rect": [
                    520.0,
                    510.0,
                    20.0,
                    22.0
                  ],
                  "text": "+"
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
                    720.0,
                    510.0,
                    240.0,
                    22.0
                  ],
                  "text": "<- spot 10: live.tab"
                }
              }
            ],
            "lines": [],
            "default_fontsize": 12.0,
            "default_fontname": "Arial",
            "showontab": 1
          },
          "saved_object_attributes": {
            "description": "",
            "digest": "",
            "globalpatchername": "",
            "tags": ""
          }
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
            102.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"width\": 1020,\n  \"height\": 666,\n  \"patcher_extras\": {\n    \"showontab\": 0,\n    \"showrootpatcherontab\": 0\n  },\n  \"objects\": {\n    \"tab1\": {\n      \"type\": \"newobj\",\n      \"text\": \"p \\\"1 z-order\\\"\",\n      \"pos\": [\n        40,\n        40\n      ],\n      \"size\": [\n        150,\n        22\n      ],\n      \"inlets\": 0,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"patcher\": {\n        \"objects\": {\n          \"hdr\": {\n            \"type\": \"comment\",\n            \"text\": \"CLAIM 1 - Z-ORDER. patching/MAX_PATCHING.md (Max .maxpat Internals) and SPEC_REFERENCE.md (Z-order) say a box LATER in the file's box list draws IN FRONT. The comment in spec2maxpat.py convert (panel reordering) says EARLIER boxes paint in front. In this tab's file: RED panel is listed before BLUE panel, and button A before button B. Neither panel has the background attribute.\",\n            \"pos\": [\n              20,\n              15\n            ],\n            \"size\": [\n              960,\n              66\n            ]\n          },\n          \"red\": {\n            \"type\": \"panel\",\n            \"pos\": [\n              40,\n              110\n            ],\n            \"size\": [\n              160,\n              100\n            ],\n            \"presentation\": [\n              40,\n              110,\n              160,\n              100\n            ],\n            \"attrs\": {\n              \"bgcolor\": [\n                0.9,\n                0.1,\n                0.1,\n                1.0\n              ]\n            }\n          },\n          \"blue\": {\n            \"type\": \"panel\",\n            \"pos\": [\n              120,\n              150\n            ],\n            \"size\": [\n              160,\n              100\n            ],\n            \"presentation\": [\n              120,\n              150,\n              160,\n              100\n            ],\n            \"attrs\": {\n              \"bgcolor\": [\n                0.1,\n                0.3,\n                0.95,\n                1.0\n              ]\n            }\n          },\n          \"lbl_panels\": {\n            \"type\": \"comment\",\n            \"text\": \"red = listed 1st, blue = listed 2nd\",\n            \"pos\": [\n              300,\n              180\n            ],\n            \"size\": [\n              260,\n              22\n            ],\n            \"presentation\": [\n              300,\n              180,\n              260,\n              22\n            ]\n          },\n          \"btnA\": {\n            \"type\": \"button\",\n            \"pos\": [\n              620,\n              110\n            ],\n            \"size\": [\n              60,\n              60\n            ],\n            \"presentation\": [\n              620,\n              110,\n              60,\n              60\n            ]\n          },\n          \"btnB\": {\n            \"type\": \"button\",\n            \"pos\": [\n              650,\n              140\n            ],\n            \"size\": [\n              60,\n              60\n            ],\n            \"presentation\": [\n              650,\n              140,\n              60,\n              60\n            ]\n          },\n          \"lbl_btns\": {\n            \"type\": \"comment\",\n            \"text\": \"A = listed 1st (top-left), B = listed 2nd\",\n            \"pos\": [\n              760,\n              150\n            ],\n            \"size\": [\n              240,\n              36\n            ],\n            \"presentation\": [\n              760,\n              150,\n              240,\n              37.0\n            ]\n          },\n          \"cntA\": {\n            \"type\": \"newobj\",\n            \"text\": \"counter\",\n            \"pos\": [\n              560,\n              250\n            ]\n          },\n          \"cntB\": {\n            \"type\": \"newobj\",\n            \"text\": \"counter\",\n            \"pos\": [\n              760,\n              250\n            ]\n          },\n          \"numA\": {\n            \"type\": \"number\",\n            \"pos\": [\n              560,\n              300\n            ],\n            \"size\": [\n              70,\n              22\n            ],\n            \"presentation\": [\n              620,\n              220,\n              70,\n              22\n            ]\n          },\n          \"numB\": {\n            \"type\": \"number\",\n            \"pos\": [\n              760,\n              300\n            ],\n            \"size\": [\n              70,\n              22\n            ],\n            \"presentation\": [\n              720,\n              220,\n              70,\n              22\n            ]\n          },\n          \"lbl_numA\": {\n            \"type\": \"comment\",\n            \"text\": \"clicks reaching A\",\n            \"pos\": [\n              640,\n              300\n            ],\n            \"size\": [\n              110,\n              22\n            ],\n            \"presentation\": [\n              560,\n              250,\n              160,\n              22\n            ]\n          },\n          \"lbl_numB\": {\n            \"type\": \"comment\",\n            \"text\": \"clicks reaching B\",\n            \"pos\": [\n              840,\n              300\n            ],\n            \"size\": [\n              140,\n              22\n            ],\n            \"presentation\": [\n              720,\n              250,\n              170,\n              22\n            ]\n          },\n          \"how\": {\n            \"type\": \"comment\",\n            \"text\": \"WHAT TO DO: this tab opens in presentation. (1) Look where red and blue overlap. (2) Switch to the patching view (Cmd-Opt-E) and look again. (3) Lock the patch and click inside the area where buttons A and B overlap, a few times. READING IT: BLUE on top = later draws in front (MAX_PATCHING.md is right, the spec2maxpat.py comment is wrong). RED on top = earlier draws in front (the spec2maxpat.py comment is right). If the 'clicks reaching B' number goes up, the later box gets the click; if A goes up, the earlier box does. Note whether both views agree.\",\n            \"pos\": [\n              40,\n              380\n            ],\n            \"size\": [\n              940,\n              96\n            ]\n          },\n          \"tagA\": {\n            \"type\": \"comment\",\n            \"text\": \"A\",\n            \"pos\": [\n              590,\n              110\n            ],\n            \"size\": [\n              24,\n              22\n            ],\n            \"presentation\": [\n              590,\n              110,\n              24,\n              22\n            ]\n          },\n          \"tagB\": {\n            \"type\": \"comment\",\n            \"text\": \"B\",\n            \"pos\": [\n              715,\n              178\n            ],\n            \"size\": [\n              24,\n              22\n            ],\n            \"presentation\": [\n              715,\n              178,\n              24,\n              22\n            ]\n          }\n        },\n        \"connections\": [\n          [\n            \"btnA\",\n            0,\n            \"cntA\",\n            0\n          ],\n          [\n            \"btnB\",\n            0,\n            \"cntB\",\n            0\n          ],\n          [\n            \"cntA\",\n            0,\n            \"numA\",\n            0\n          ],\n          [\n            \"cntB\",\n            0,\n            \"numB\",\n            0\n          ]\n        ],\n        \"width\": 1020,\n        \"height\": 640,\n        \"patcher_extras\": {\n          \"showontab\": 1\n        }\n      }\n    },\n    \"tab2\": {\n      \"type\": \"newobj\",\n      \"text\": \"p \\\"2 messnamed buffer\\\"\",\n      \"pos\": [\n        200,\n        40\n      ],\n      \"size\": [\n        150,\n        22\n      ],\n      \"inlets\": 0,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"patcher\": {\n        \"objects\": {\n          \"hdr\": {\n            \"type\": \"comment\",\n            \"text\": \"CLAIM 2 - messnamed / ';' CANNOT REACH buffer~. patching/MAX_PATCHING.md (Common Pitfalls, messnamed bullet) says messnamed() from v8/js, like a ';' message, only reaches [receive] objects, never a 'buffer~ NAME'. Here buffer~ BT_BUF starts 500 ms long.\",\n            \"pos\": [\n              20,\n              15\n            ],\n            \"size\": [\n              960,\n              52\n            ]\n          },\n          \"reset\": {\n            \"type\": \"message\",\n            \"text\": \"setsize 500\",\n            \"pos\": [\n              40,\n              90\n            ]\n          },\n          \"lbl_reset\": {\n            \"type\": \"comment\",\n            \"text\": \"reset to 500 ms (wired straight in)\",\n            \"pos\": [\n              180,\n              90\n            ],\n            \"size\": [\n              260,\n              22\n            ]\n          },\n          \"buf\": {\n            \"type\": \"newobj\",\n            \"text\": \"buffer~ BT_BUF @size 500\",\n            \"pos\": [\n              40,\n              140\n            ],\n            \"size\": [\n              250,\n              22\n            ]\n          },\n          \"semi\": {\n            \"type\": \"message\",\n            \"text\": \"; BT_BUF setsize 1000\",\n            \"pos\": [\n              40,\n              210\n            ],\n            \"size\": [\n              210,\n              36\n            ]\n          },\n          \"lbl_semi\": {\n            \"type\": \"comment\",\n            \"text\": \"(a) ';' message: sets 1000 ms if it reaches\",\n            \"pos\": [\n              270,\n              214\n            ],\n            \"size\": [\n              320,\n              22\n            ]\n          },\n          \"bv8\": {\n            \"type\": \"button\",\n            \"pos\": [\n              40,\n              280\n            ]\n          },\n          \"lbl_bv8\": {\n            \"type\": \"comment\",\n            \"text\": \"(b) v8 messnamed('BT_BUF','setsize',2000)\",\n            \"pos\": [\n              80,\n              280\n            ],\n            \"size\": [\n              330,\n              22\n            ]\n          },\n          \"embed\": {\n            \"type\": \"newobj\",\n            \"text\": \"loadmess embed 1\",\n            \"pos\": [\n              430,\n              280\n            ],\n            \"size\": [\n              170,\n              22\n            ]\n          },\n          \"v8\": {\n            \"type\": \"newobj\",\n            \"text\": \"v8 bt_messnamed.js @embed 1\",\n            \"pos\": [\n              40,\n              330\n            ],\n            \"size\": [\n              270,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ],\n            \"attrs\": {\n              \"textfile\": {\n                \"filename\": \"bt_messnamed.js\",\n                \"flags\": 0,\n                \"autowatch\": 1,\n                \"embed\": 1,\n                \"text\": \"// Test for max-behavior-tests tab 2: can messnamed() reach a buffer~ by its name?\\ninlets = 1;\\noutlets = 1;\\nsetinletassist(0, \\\"bang: send setsize 2000 to BT_BUF with messnamed()\\\");\\nsetoutletassist(0, \\\"bang after the message was sent\\\");\\n\\nfunction bang() {\\n\\tmessnamed(\\\"BT_BUF\\\", \\\"setsize\\\", 2000);\\n\\toutlet(0, \\\"bang\\\");\\n}\\n\"\n              }\n            }\n          },\n          \"pr\": {\n            \"type\": \"newobj\",\n            \"text\": \"print BT_MESSNAMED\",\n            \"pos\": [\n              40,\n              380\n            ],\n            \"size\": [\n              190,\n              22\n            ]\n          },\n          \"bread\": {\n            \"type\": \"button\",\n            \"pos\": [\n              660,\n              90\n            ]\n          },\n          \"lbl_bread\": {\n            \"type\": \"comment\",\n            \"text\": \"read the size\",\n            \"pos\": [\n              700,\n              90\n            ],\n            \"size\": [\n              120,\n              22\n            ]\n          },\n          \"info\": {\n            \"type\": \"newobj\",\n            \"text\": \"info~ BT_BUF\",\n            \"pos\": [\n              660,\n              140\n            ],\n            \"size\": [\n              180,\n              22\n            ]\n          },\n          \"ms\": {\n            \"type\": \"flonum\",\n            \"pos\": [\n              770,\n              200\n            ],\n            \"size\": [\n              80,\n              22\n            ]\n          },\n          \"lbl_ms\": {\n            \"type\": \"comment\",\n            \"text\": \"total time, ms\",\n            \"pos\": [\n              860,\n              200\n            ],\n            \"size\": [\n              120,\n              22\n            ]\n          },\n          \"how\": {\n            \"type\": \"comment\",\n            \"text\": \"WHAT TO DO: click 'read the size' (should show 500.). Click (a), then 'read the size'. Click 'reset', then the (b) button, then 'read the size'. READING IT: after (a), 1000. = a ';' message DOES reach buffer~ (claim false for ';'); still 500. = claim true. After (b), 2000. = messnamed DOES reach buffer~ (claim false); still 500. = claim true. The Max Console shows 'BT_MESSNAMED: bang' when the script ran, and any error it posted.\",\n            \"pos\": [\n              40,\n              440\n            ],\n            \"size\": [\n              940,\n              80\n            ]\n          }\n        },\n        \"connections\": [\n          [\n            \"reset\",\n            0,\n            \"buf\",\n            0\n          ],\n          [\n            \"bv8\",\n            0,\n            \"v8\",\n            0\n          ],\n          [\n            \"embed\",\n            0,\n            \"v8\",\n            0\n          ],\n          [\n            \"v8\",\n            0,\n            \"pr\",\n            0\n          ],\n          [\n            \"bread\",\n            0,\n            \"info\",\n            0\n          ],\n          [\n            \"info\",\n            6,\n            \"ms\",\n            0\n          ]\n        ],\n        \"width\": 1020,\n        \"height\": 640,\n        \"patcher_extras\": {\n          \"showontab\": 1\n        }\n      }\n    },\n    \"tab3\": {\n      \"type\": \"newobj\",\n      \"text\": \"p \\\"3 select floats\\\"\",\n      \"pos\": [\n        360,\n        40\n      ],\n      \"size\": [\n        150,\n        22\n      ],\n      \"inlets\": 0,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"patcher\": {\n        \"objects\": {\n          \"hdr\": {\n            \"type\": \"comment\",\n            \"text\": \"CLAIM 3 - select AND FLOATS. patching/MAX_PATCHING.md (Common Pitfalls) says select needs @fuzzy to match floats from UI. select's refpage says floats are only compared when @matchfloat is 1 (default 0; 'when matchfloat is set to 0, floats are ignored') and fuzzy (default 0.) is the tolerance used in that mode.\",\n            \"pos\": [\n              20,\n              15\n            ],\n            \"size\": [\n              960,\n              52\n            ]\n          },\n          \"m1\": {\n            \"type\": \"message\",\n            \"text\": \"0.5\",\n            \"pos\": [\n              30,\n              90\n            ]\n          },\n          \"m2\": {\n            \"type\": \"message\",\n            \"text\": \"0.4995\",\n            \"pos\": [\n              90,\n              90\n            ]\n          },\n          \"m3\": {\n            \"type\": \"message\",\n            \"text\": \"0.6\",\n            \"pos\": [\n              180,\n              90\n            ]\n          },\n          \"lbl_m\": {\n            \"type\": \"comment\",\n            \"text\": \"click one: the value goes through the number box to all four\",\n            \"pos\": [\n              240,\n              90\n            ],\n            \"size\": [\n              440,\n              22\n            ]\n          },\n          \"fl\": {\n            \"type\": \"flonum\",\n            \"pos\": [\n              30,\n              140\n            ],\n            \"size\": [\n              80,\n              22\n            ]\n          },\n          \"how\": {\n            \"type\": \"comment\",\n            \"text\": \"Under each select: LEFT button flashes = match, RIGHT button flashes = no match (neither = the float was ignored). WHAT TO DO: click 0.5, then 0.4995, then 0.6; you can also drag the number box. READING IT: if plain 'sel 0.5' flashes LEFT on 0.5, select matches floats without any attribute and both repo statements are too strong. If only the @matchfloat 1 boxes match 0.5, the refpage is right and the rule should say @matchfloat, not @fuzzy. If '@fuzzy 0.001' without matchfloat still matches nothing, @fuzzy alone does nothing. 0.4995 should match only where fuzzy 0.001 is active and floats are compared.\",\n            \"pos\": [\n              30,\n              320\n            ],\n            \"size\": [\n              950,\n              96\n            ]\n          },\n          \"s0\": {\n            \"type\": \"newobj\",\n            \"text\": \"sel 0.5\",\n            \"pos\": [\n              30,\n              210\n            ],\n            \"size\": [\n              90,\n              22\n            ]\n          },\n          \"y0\": {\n            \"type\": \"button\",\n            \"pos\": [\n              30,\n              260\n            ]\n          },\n          \"n0\": {\n            \"type\": \"button\",\n            \"pos\": [\n              96,\n              260\n            ]\n          },\n          \"s1\": {\n            \"type\": \"newobj\",\n            \"text\": \"sel 0.5 @fuzzy 0.001\",\n            \"pos\": [\n              150,\n              210\n            ],\n            \"size\": [\n              220,\n              22\n            ]\n          },\n          \"y1\": {\n            \"type\": \"button\",\n            \"pos\": [\n              150,\n              260\n            ]\n          },\n          \"n1\": {\n            \"type\": \"button\",\n            \"pos\": [\n              346,\n              260\n            ]\n          },\n          \"s2\": {\n            \"type\": \"newobj\",\n            \"text\": \"sel 0.5 @matchfloat 1\",\n            \"pos\": [\n              400,\n              210\n            ],\n            \"size\": [\n              230,\n              22\n            ]\n          },\n          \"y2\": {\n            \"type\": \"button\",\n            \"pos\": [\n              400,\n              260\n            ]\n          },\n          \"n2\": {\n            \"type\": \"button\",\n            \"pos\": [\n              606,\n              260\n            ]\n          },\n          \"s3\": {\n            \"type\": \"newobj\",\n            \"text\": \"sel 0.5 @matchfloat 1 @fuzzy 0.001\",\n            \"pos\": [\n              650,\n              210\n            ],\n            \"size\": [\n              350,\n              22\n            ]\n          },\n          \"y3\": {\n            \"type\": \"button\",\n            \"pos\": [\n              650,\n              260\n            ]\n          },\n          \"n3\": {\n            \"type\": \"button\",\n            \"pos\": [\n              976,\n              260\n            ]\n          }\n        },\n        \"connections\": [\n          [\n            \"m1\",\n            0,\n            \"fl\",\n            0\n          ],\n          [\n            \"m2\",\n            0,\n            \"fl\",\n            0\n          ],\n          [\n            \"m3\",\n            0,\n            \"fl\",\n            0\n          ],\n          [\n            \"fl\",\n            0,\n            \"s0\",\n            0\n          ],\n          [\n            \"s0\",\n            0,\n            \"y0\",\n            0\n          ],\n          [\n            \"s0\",\n            1,\n            \"n0\",\n            0\n          ],\n          [\n            \"fl\",\n            0,\n            \"s1\",\n            0\n          ],\n          [\n            \"s1\",\n            0,\n            \"y1\",\n            0\n          ],\n          [\n            \"s1\",\n            1,\n            \"n1\",\n            0\n          ],\n          [\n            \"fl\",\n            0,\n            \"s2\",\n            0\n          ],\n          [\n            \"s2\",\n            0,\n            \"y2\",\n            0\n          ],\n          [\n            \"s2\",\n            1,\n            \"n2\",\n            0\n          ],\n          [\n            \"fl\",\n            0,\n            \"s3\",\n            0\n          ],\n          [\n            \"s3\",\n            0,\n            \"y3\",\n            0\n          ],\n          [\n            \"s3\",\n            1,\n            \"n3\",\n            0\n          ]\n        ],\n        \"width\": 1020,\n        \"height\": 640,\n        \"patcher_extras\": {\n          \"showontab\": 1\n        }\n      }\n    },\n    \"tab4\": {\n      \"type\": \"newobj\",\n      \"text\": \"p \\\"4 two matrices\\\"\",\n      \"pos\": [\n        520,\n        40\n      ],\n      \"size\": [\n        150,\n        22\n      ],\n      \"inlets\": 0,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"patcher\": {\n        \"objects\": {\n          \"hdr\": {\n            \"type\": \"comment\",\n            \"text\": \"CLAIM 4 - TWO jit_matrix SOURCES INTO ONE INLET. patching/MAX_PATCHING.md (Common Pitfalls) calls two jit_matrix sources fanned into one inlet 'a structural conflict' where one matrix may clobber the other.\",\n            \"pos\": [\n              20,\n              15\n            ],\n            \"size\": [\n              960,\n              52\n            ]\n          },\n          \"tog\": {\n            \"type\": \"toggle\",\n            \"pos\": [\n              40,\n              90\n            ]\n          },\n          \"lbl_tog\": {\n            \"type\": \"comment\",\n            \"text\": \"alternate A and B every 200 ms\",\n            \"pos\": [\n              70,\n              90\n            ],\n            \"size\": [\n              240,\n              22\n            ]\n          },\n          \"met\": {\n            \"type\": \"newobj\",\n            \"text\": \"metro 200\",\n            \"pos\": [\n              40,\n              130\n            ],\n            \"size\": [\n              100,\n              22\n            ]\n          },\n          \"cnt\": {\n            \"type\": \"newobj\",\n            \"text\": \"counter 0 1\",\n            \"pos\": [\n              40,\n              170\n            ],\n            \"size\": [\n              120,\n              22\n            ]\n          },\n          \"sel\": {\n            \"type\": \"newobj\",\n            \"text\": \"sel 0 1\",\n            \"pos\": [\n              40,\n              210\n            ],\n            \"size\": [\n              90,\n              22\n            ]\n          },\n          \"bA\": {\n            \"type\": \"button\",\n            \"pos\": [\n              40,\n              260\n            ]\n          },\n          \"bB\": {\n            \"type\": \"button\",\n            \"pos\": [\n              220,\n              260\n            ]\n          },\n          \"lbl_bA\": {\n            \"type\": \"comment\",\n            \"text\": \"A\",\n            \"pos\": [\n              70,\n              260\n            ],\n            \"size\": [\n              30,\n              22\n            ]\n          },\n          \"lbl_bB\": {\n            \"type\": \"comment\",\n            \"text\": \"B\",\n            \"pos\": [\n              250,\n              260\n            ],\n            \"size\": [\n              30,\n              22\n            ]\n          },\n          \"nA\": {\n            \"type\": \"newobj\",\n            \"text\": \"jit.noise 1 char 4 3\",\n            \"pos\": [\n              40,\n              300\n            ],\n            \"size\": [\n              170,\n              22\n            ]\n          },\n          \"nB\": {\n            \"type\": \"newobj\",\n            \"text\": \"jit.noise 4 char 80 60\",\n            \"pos\": [\n              220,\n              300\n            ],\n            \"size\": [\n              190,\n              22\n            ]\n          },\n          \"pw\": {\n            \"type\": \"jit.pwindow\",\n            \"pos\": [\n              40,\n              360\n            ],\n            \"size\": [\n              320,\n              240\n            ]\n          },\n          \"how\": {\n            \"type\": \"comment\",\n            \"text\": \"A = grey, 4 x 3 cells (big blocks). B = colour, 80 x 60 cells (fine grain). Both cords land on the same inlet of the jit.pwindow. WHAT TO DO: click A, click B, then turn on the toggle. READING IT: if the window shows each matrix cleanly as it arrives (big grey blocks, then fine colour, alternating), with no mixing and no errors in the Max Console, the fan-in simply works and the claim is false as stated. If frames come out mixed, wrong size or with errors, the claim holds. Turn the toggle off when done.\",\n            \"pos\": [\n              400,\n              360\n            ],\n            \"size\": [\n              580,\n              140\n            ]\n          }\n        },\n        \"connections\": [\n          [\n            \"tog\",\n            0,\n            \"met\",\n            0\n          ],\n          [\n            \"met\",\n            0,\n            \"cnt\",\n            0\n          ],\n          [\n            \"cnt\",\n            0,\n            \"sel\",\n            0\n          ],\n          [\n            \"sel\",\n            0,\n            \"bA\",\n            0\n          ],\n          [\n            \"sel\",\n            1,\n            \"bB\",\n            0\n          ],\n          [\n            \"bA\",\n            0,\n            \"nA\",\n            0\n          ],\n          [\n            \"bB\",\n            0,\n            \"nB\",\n            0\n          ],\n          [\n            \"nA\",\n            0,\n            \"pw\",\n            0\n          ],\n          [\n            \"nB\",\n            0,\n            \"pw\",\n            0\n          ]\n        ],\n        \"width\": 1020,\n        \"height\": 640,\n        \"patcher_extras\": {\n          \"showontab\": 1\n        }\n      }\n    },\n    \"tab5\": {\n      \"type\": \"newobj\",\n      \"text\": \"p \\\"5 saved values\\\"\",\n      \"pos\": [\n        680,\n        40\n      ],\n      \"size\": [\n        150,\n        22\n      ],\n      \"inlets\": 0,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"patcher\": {\n        \"objects\": {\n          \"hdr\": {\n            \"type\": \"comment\",\n            \"text\": \"CLAIM 5 - CONTROLS WITHOUT LOAD-TIME INIT. patching/MAX_PATCHING.md (Max Patching Principles: Every control must initialize to a known state on patch load) says a control with no loadmess is 'a source of undefined state'. These five have no init and only Max's default settings. The live.dial is a parameter, as every live.dial is (all 37 in C74's help files save parameter_enable 1); the others are not.\",\n            \"pos\": [\n              20,\n              15\n            ],\n            \"size\": [\n              960,\n              66\n            ]\n          },\n          \"num\": {\n            \"type\": \"number\",\n            \"pos\": [\n              40,\n              110\n            ],\n            \"size\": [\n              70,\n              22\n            ]\n          },\n          \"lbl_num\": {\n            \"type\": \"comment\",\n            \"text\": \"number (default 0)\",\n            \"pos\": [\n              130,\n              110\n            ],\n            \"size\": [\n              200,\n              22\n            ]\n          },\n          \"flo\": {\n            \"type\": \"flonum\",\n            \"pos\": [\n              40,\n              160\n            ],\n            \"size\": [\n              70,\n              22\n            ]\n          },\n          \"lbl_flo\": {\n            \"type\": \"comment\",\n            \"text\": \"flonum (default 0.)\",\n            \"pos\": [\n              130,\n              160\n            ],\n            \"size\": [\n              200,\n              22\n            ]\n          },\n          \"dial\": {\n            \"type\": \"live.dial\",\n            \"pos\": [\n              40,\n              200\n            ]\n          },\n          \"lbl_dial\": {\n            \"type\": \"comment\",\n            \"text\": \"live.dial (default 0.)\",\n            \"pos\": [\n              130,\n              220\n            ],\n            \"size\": [\n              200,\n              22\n            ]\n          },\n          \"menu\": {\n            \"type\": \"umenu\",\n            \"pos\": [\n              40,\n              280\n            ],\n            \"size\": [\n              100,\n              22\n            ],\n            \"attrs\": {\n              \"items\": [\n                \"one\",\n                \",\",\n                \"two\",\n                \",\",\n                \"three\"\n              ]\n            }\n          },\n          \"lbl_menu\": {\n            \"type\": \"comment\",\n            \"text\": \"umenu (default: item 0, 'one')\",\n            \"pos\": [\n              160,\n              280\n            ],\n            \"size\": [\n              240,\n              22\n            ]\n          },\n          \"tog\": {\n            \"type\": \"toggle\",\n            \"pos\": [\n              40,\n              330\n            ]\n          },\n          \"lbl_tog\": {\n            \"type\": \"comment\",\n            \"text\": \"toggle (default off)\",\n            \"pos\": [\n              130,\n              330\n            ],\n            \"size\": [\n              200,\n              22\n            ]\n          },\n          \"how\": {\n            \"type\": \"comment\",\n            \"text\": \"WHAT TO DO: lock the patch. Set each control to something that is not its default: number 7, flonum 3.5 (drag), live.dial about halfway, umenu 'three', toggle on. Save (Cmd-S), close the patch, reopen it, and come back to this tab. READING IT: write down which came back at your value and which came back at its default. A control that reliably comes back the same way each time has a known state, so 'undefined' is the wrong word for it. Note: saving changes this file in the repo; that is expected.\",\n            \"pos\": [\n              420,\n              110\n            ],\n            \"size\": [\n              560,\n              140\n            ]\n          }\n        },\n        \"connections\": [],\n        \"width\": 1020,\n        \"height\": 640,\n        \"patcher_extras\": {\n          \"showontab\": 1\n        }\n      }\n    },\n    \"tab6\": {\n      \"type\": \"newobj\",\n      \"text\": \"p \\\"6 fresh sizes\\\"\",\n      \"pos\": [\n        840,\n        40\n      ],\n      \"size\": [\n        150,\n        22\n      ],\n      \"inlets\": 0,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"patcher\": {\n        \"objects\": {\n          \"hdr\": {\n            \"type\": \"comment\",\n            \"text\": \"FRESH BOX SIZES (no claim). For each spot below, make a BRAND-NEW box of the class named on its right: for inlet and outlet type the name into a new object box (N); for the others use the object palette or type the name. Put its top-left corner on the spot's '+' mark. Do NOT resize anything. Then save. Each box's saved patching_rect gives the size Max creates it at.\",\n            \"pos\": [\n              20,\n              15\n            ],\n            \"size\": [\n              960,\n              66\n            ]\n          },\n          \"spot0\": {\n            \"type\": \"comment\",\n            \"text\": \"+\",\n            \"pos\": [\n              40,\n              110\n            ],\n            \"size\": [\n              20,\n              22\n            ]\n          },\n          \"lbl0\": {\n            \"type\": \"comment\",\n            \"text\": \"<- spot 1: inlet\",\n            \"pos\": [\n              240,\n              110\n            ],\n            \"size\": [\n              240,\n              22\n            ]\n          },\n          \"spot1\": {\n            \"type\": \"comment\",\n            \"text\": \"+\",\n            \"pos\": [\n              40,\n              210\n            ],\n            \"size\": [\n              20,\n              22\n            ]\n          },\n          \"lbl1\": {\n            \"type\": \"comment\",\n            \"text\": \"<- spot 2: outlet\",\n            \"pos\": [\n              240,\n              210\n            ],\n            \"size\": [\n              240,\n              22\n            ]\n          },\n          \"spot2\": {\n            \"type\": \"comment\",\n            \"text\": \"+\",\n            \"pos\": [\n              40,\n              310\n            ],\n            \"size\": [\n              20,\n              22\n            ]\n          },\n          \"lbl2\": {\n            \"type\": \"comment\",\n            \"text\": \"<- spot 3: preset\",\n            \"pos\": [\n              240,\n              310\n            ],\n            \"size\": [\n              240,\n              22\n            ]\n          },\n          \"spot3\": {\n            \"type\": \"comment\",\n            \"text\": \"+\",\n            \"pos\": [\n              40,\n              410\n            ],\n            \"size\": [\n              20,\n              22\n            ]\n          },\n          \"lbl3\": {\n            \"type\": \"comment\",\n            \"text\": \"<- spot 4: live.dial\",\n            \"pos\": [\n              240,\n              410\n            ],\n            \"size\": [\n              240,\n              22\n            ]\n          },\n          \"spot4\": {\n            \"type\": \"comment\",\n            \"text\": \"+\",\n            \"pos\": [\n              40,\n              510\n            ],\n            \"size\": [\n              20,\n              22\n            ]\n          },\n          \"lbl4\": {\n            \"type\": \"comment\",\n            \"text\": \"<- spot 5: live.slider\",\n            \"pos\": [\n              240,\n              510\n            ],\n            \"size\": [\n              240,\n              22\n            ]\n          },\n          \"spot5\": {\n            \"type\": \"comment\",\n            \"text\": \"+\",\n            \"pos\": [\n              520,\n              110\n            ],\n            \"size\": [\n              20,\n              22\n            ]\n          },\n          \"lbl5\": {\n            \"type\": \"comment\",\n            \"text\": \"<- spot 6: live.toggle\",\n            \"pos\": [\n              720,\n              110\n            ],\n            \"size\": [\n              240,\n              22\n            ]\n          },\n          \"spot6\": {\n            \"type\": \"comment\",\n            \"text\": \"+\",\n            \"pos\": [\n              520,\n              210\n            ],\n            \"size\": [\n              20,\n              22\n            ]\n          },\n          \"lbl6\": {\n            \"type\": \"comment\",\n            \"text\": \"<- spot 7: live.numbox\",\n            \"pos\": [\n              720,\n              210\n            ],\n            \"size\": [\n              240,\n              22\n            ]\n          },\n          \"spot7\": {\n            \"type\": \"comment\",\n            \"text\": \"+\",\n            \"pos\": [\n              520,\n              310\n            ],\n            \"size\": [\n              20,\n              22\n            ]\n          },\n          \"lbl7\": {\n            \"type\": \"comment\",\n            \"text\": \"<- spot 8: live.menu\",\n            \"pos\": [\n              720,\n              310\n            ],\n            \"size\": [\n              240,\n              22\n            ]\n          },\n          \"spot8\": {\n            \"type\": \"comment\",\n            \"text\": \"+\",\n            \"pos\": [\n              520,\n              410\n            ],\n            \"size\": [\n              20,\n              22\n            ]\n          },\n          \"lbl8\": {\n            \"type\": \"comment\",\n            \"text\": \"<- spot 9: live.text\",\n            \"pos\": [\n              720,\n              410\n            ],\n            \"size\": [\n              240,\n              22\n            ]\n          },\n          \"spot9\": {\n            \"type\": \"comment\",\n            \"text\": \"+\",\n            \"pos\": [\n              520,\n              510\n            ],\n            \"size\": [\n              20,\n              22\n            ]\n          },\n          \"lbl9\": {\n            \"type\": \"comment\",\n            \"text\": \"<- spot 10: live.tab\",\n            \"pos\": [\n              720,\n              510\n            ],\n            \"size\": [\n              240,\n              22\n            ]\n          }\n        },\n        \"connections\": [],\n        \"width\": 1020,\n        \"height\": 640,\n        \"patcher_extras\": {\n          \"showontab\": 1\n        }\n      }\n    }\n  },\n  \"connections\": []\n}\n--- END SPEC ---",
          "fontsize": 9.0,
          "hidden": 1
        }
      }
    ],
    "lines": [],
    "default_fontsize": 12.0,
    "default_fontname": "Arial",
    "showontab": 0,
    "showrootpatcherontab": 0
  }
}
