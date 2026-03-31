{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 9,
      "minor": 1,
      "revision": 3,
      "architecture": "x64",
      "modernui": 1
    },
    "rect": [
      100.0,
      100.0,
      1250.0,
      900.0
    ],
    "bglocked": 0,
    "openinpresentation": 0,
    "default_fontsize": 12.0,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "gridonopen": 1,
    "gridsize": [
      15.0,
      15.0
    ],
    "gridsnaponopen": 1,
    "objectsnaponopen": 1,
    "statusbarvisible": 2,
    "toolbarvisible": 1,
    "lefttoolbarpinned": 0,
    "toptoolbarpinned": 0,
    "righttoolbarpinned": 0,
    "bottomtoolbarpinned": 0,
    "toolbars_unpinned_last_save": 0,
    "tallnewobj": 0,
    "boxanimatetime": 200,
    "enablehscroll": 1,
    "enablevscroll": 1,
    "devicewidth": 0.0,
    "description": "",
    "digest": "",
    "tags": "",
    "style": "",
    "subpatcher_template": "",
    "assistshowspatchername": 0,
    "classnamespace": "box",
    "boxes": [
      {
        "box": {
          "maxclass": "newobj",
          "text": "loadmess 1",
          "patching_rect": [
            826.0,
            20.0,
            70.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-20",
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "comment",
          "text": "fix window size",
          "patching_rect": [
            1064.0,
            60.5,
            108.0,
            20.0
          ],
          "presentation_rect": [
            46.0,
            398.0,
            92.0,
            20.0
          ],
          "id": "obj-48",
          "numinlets": 1,
          "presentation": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "message",
          "text": "presentation $1",
          "patching_rect": [
            826.0,
            93.5,
            91.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-35",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "toggle",
          "patching_rect": [
            826.0,
            58.5,
            24.0,
            24.0
          ],
          "presentation_rect": [
            16.0,
            425.0,
            24.0,
            24.0
          ],
          "outlettype": [
            "int"
          ],
          "id": "obj-30",
          "parameter_enable": 0,
          "numinlets": 1,
          "presentation": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "r TTT",
          "patching_rect": [
            533.0,
            49.0,
            38.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-12",
          "numinlets": 0,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "umenu",
          "patching_rect": [
            429.0,
            13.0,
            222.0,
            22.0
          ],
          "presentation_rect": [
            13.0,
            175.0,
            222.0,
            22.0
          ],
          "outlettype": [
            "int",
            "",
            ""
          ],
          "items": [
            "keep",
            "same",
            "target",
            "time",
            "each",
            "day",
            ",",
            "new",
            "random",
            "target",
            "time",
            "each",
            "day"
          ],
          "id": "obj-52",
          "parameter_enable": 0,
          "numinlets": 1,
          "presentation": 1,
          "numoutlets": 3
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "gate",
          "patching_rect": [
            429.0,
            93.0,
            41.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-51",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "message",
          "text": "random new target time",
          "patching_rect": [
            275.5,
            93.0,
            135.0,
            22.0
          ],
          "presentation_rect": [
            13.0,
            68.0,
            135.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-50",
          "numinlets": 2,
          "presentation": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "message",
          "text": "select new target time",
          "patching_rect": [
            860.0,
            241.0,
            125.0,
            22.0
          ],
          "presentation_rect": [
            13.0,
            92.0,
            135.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-49",
          "numinlets": 2,
          "presentation": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "unpack i i i",
          "patching_rect": [
            577.0,
            82.0,
            65.0,
            22.0
          ],
          "outlettype": [
            "int",
            "int",
            "int"
          ],
          "id": "obj-47",
          "numinlets": 1,
          "numoutlets": 3
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "r NEWTARGET",
          "patching_rect": [
            577.0,
            49.0,
            92.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-45",
          "numinlets": 0,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "s NEWTARGET",
          "patching_rect": [
            831.0,
            372.0,
            94.0,
            22.0
          ],
          "id": "obj-43",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "fromsymbol @separator :",
          "patching_rect": [
            831.0,
            336.0,
            143.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-40",
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "route symbol",
          "patching_rect": [
            831.0,
            307.0,
            77.0,
            22.0
          ],
          "outlettype": [
            "",
            ""
          ],
          "id": "obj-37",
          "numinlets": 2,
          "numoutlets": 2
        }
      },
      {
        "box": {
          "maxclass": "button",
          "patching_rect": [
            830.0,
            240.0,
            24.0,
            24.0
          ],
          "outlettype": [
            "bang"
          ],
          "id": "obj-32",
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "dialog \"enter target time in HH:MM:SS\"",
          "patching_rect": [
            831.0,
            272.0,
            216.0,
            22.0
          ],
          "outlettype": [
            "",
            "bang",
            "bang"
          ],
          "id": "obj-28",
          "numinlets": 2,
          "numoutlets": 3
        }
      },
      {
        "box": {
          "maxclass": "comment",
          "text": "presentation mode",
          "patching_rect": [
            856.0,
            60.5,
            108.0,
            20.0
          ],
          "presentation_rect": [
            45.0,
            425.0,
            108.0,
            20.0
          ],
          "id": "obj-26",
          "numinlets": 1,
          "presentation": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "button",
          "patching_rect": [
            1034.0,
            58.5,
            24.0,
            24.0
          ],
          "presentation_rect": [
            17.0,
            396.0,
            24.0,
            24.0
          ],
          "outlettype": [
            "bang"
          ],
          "id": "obj-21",
          "parameter_enable": 0,
          "numinlets": 1,
          "presentation": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "message",
          "text": "window size 100 100 780 480, window exec",
          "patching_rect": [
            971.0,
            93.5,
            234.0,
            21.0
          ],
          "outlettype": [
            ""
          ],
          "fontname": "Arial",
          "id": "obj-19",
          "numinlets": 2,
          "numoutlets": 1,
          "fontsize": 11.595187
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "thispatcher",
          "patching_rect": [
            826.0,
            151.5,
            67.0,
            22.0
          ],
          "outlettype": [
            "",
            ""
          ],
          "id": "obj-13",
          "numinlets": 1,
          "numoutlets": 2,
          "save": [
            "#N",
            "thispatcher",
            ";",
            "#Q",
            "end",
            ";"
          ]
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "loadbang",
          "patching_rect": [
            971.0,
            59.5,
            58.0,
            22.0
          ],
          "outlettype": [
            "bang"
          ],
          "id": "obj-6",
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "comment",
          "text": "test for target hit",
          "patching_rect": [
            523.0,
            501.0,
            95.0,
            20.0
          ],
          "id": "obj-118",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "p TEST_TARGET_TIME",
          "patching_rect": [
            233.0,
            49.0,
            160.0,
            22.0
          ],
          "color": [
            0.317647,
            0.654902,
            0.976471,
            1.0
          ],
          "id": "obj-117",
          "numinlets": 0,
          "numoutlets": 0,
          "fontsize": 12.0,
          "patcher": {
            "fileversion": 1,
            "appversion": {
              "major": 9,
              "minor": 1,
              "revision": 3,
              "architecture": "x64",
              "modernui": 1
            },
            "classnamespace": "box",
            "rect": [
              59.0,
              115.0,
              1000.0,
              738.0
            ],
            "boxes": [
              {
                "box": {
                  "maxclass": "newobj",
                  "text": "r ACTIVE",
                  "patching_rect": [
                    50.0,
                    328.0,
                    59.0,
                    22.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "id": "obj-109",
                  "numinlets": 0,
                  "numoutlets": 1
                }
              },
              {
                "box": {
                  "maxclass": "message",
                  "text": "0",
                  "patching_rect": [
                    50.0,
                    364.0,
                    50.0,
                    22.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "id": "obj-108",
                  "numinlets": 2,
                  "numoutlets": 1
                }
              },
              {
                "box": {
                  "maxclass": "comment",
                  "text": "ensure target time is later than present time",
                  "linecount": 2,
                  "patching_rect": [
                    52.5,
                    100.0,
                    150.0,
                    33.0
                  ],
                  "id": "obj-83",
                  "numinlets": 1,
                  "numoutlets": 0
                }
              },
              {
                "box": {
                  "maxclass": "newobj",
                  "text": "s TTT",
                  "patching_rect": [
                    50.0,
                    425.0,
                    40.0,
                    22.0
                  ],
                  "id": "obj-52",
                  "numinlets": 1,
                  "numoutlets": 0
                }
              },
              {
                "box": {
                  "maxclass": "newobj",
                  "text": "sel 1",
                  "patching_rect": [
                    50.0,
                    396.0,
                    34.0,
                    22.0
                  ],
                  "outlettype": [
                    "bang",
                    ""
                  ],
                  "id": "obj-49",
                  "numinlets": 2,
                  "numoutlets": 2
                }
              },
              {
                "box": {
                  "maxclass": "newobj",
                  "text": ">",
                  "patching_rect": [
                    52.5,
                    282.0,
                    62.0,
                    22.0
                  ],
                  "outlettype": [
                    "int"
                  ],
                  "id": "obj-48",
                  "numinlets": 2,
                  "numoutlets": 1
                }
              },
              {
                "box": {
                  "maxclass": "newobj",
                  "text": "r TARGET",
                  "patching_rect": [
                    205.5,
                    148.0,
                    63.0,
                    22.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "id": "obj-47",
                  "numinlets": 0,
                  "numoutlets": 1
                }
              },
              {
                "box": {
                  "maxclass": "newobj",
                  "text": "r NOW",
                  "patching_rect": [
                    52.5,
                    148.0,
                    45.0,
                    22.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "id": "obj-45",
                  "numinlets": 0,
                  "numoutlets": 1
                }
              },
              {
                "box": {
                  "maxclass": "number",
                  "patching_rect": [
                    205.5,
                    237.0,
                    73.0,
                    22.0
                  ],
                  "outlettype": [
                    "",
                    "bang"
                  ],
                  "id": "obj-42",
                  "parameter_enable": 0,
                  "numinlets": 1,
                  "numoutlets": 2
                }
              },
              {
                "box": {
                  "maxclass": "newobj",
                  "text": "sprintf %.2d%.2d%.2d",
                  "patching_rect": [
                    205.5,
                    201.0,
                    127.0,
                    22.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "id": "obj-43",
                  "numinlets": 3,
                  "numoutlets": 1
                }
              },
              {
                "box": {
                  "maxclass": "number",
                  "patching_rect": [
                    52.5,
                    237.0,
                    73.0,
                    22.0
                  ],
                  "outlettype": [
                    "",
                    "bang"
                  ],
                  "id": "obj-41",
                  "parameter_enable": 0,
                  "numinlets": 1,
                  "numoutlets": 2
                }
              },
              {
                "box": {
                  "maxclass": "newobj",
                  "text": "sprintf %.2d%.2d%.2d",
                  "patching_rect": [
                    52.5,
                    201.0,
                    127.0,
                    22.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "id": "obj-39",
                  "numinlets": 3,
                  "numoutlets": 1
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "source": [
                    "obj-49",
                    0
                  ],
                  "destination": [
                    "obj-52",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-48",
                    0
                  ],
                  "destination": [
                    "obj-108",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-47",
                    0
                  ],
                  "destination": [
                    "obj-43",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-45",
                    0
                  ],
                  "destination": [
                    "obj-39",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-43",
                    0
                  ],
                  "destination": [
                    "obj-42",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-42",
                    0
                  ],
                  "destination": [
                    "obj-48",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-41",
                    0
                  ],
                  "destination": [
                    "obj-48",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-39",
                    0
                  ],
                  "destination": [
                    "obj-41",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-109",
                    0
                  ],
                  "destination": [
                    "obj-108",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-108",
                    0
                  ],
                  "destination": [
                    "obj-49",
                    0
                  ]
                }
              }
            ]
          }
        }
      },
      {
        "box": {
          "maxclass": "comment",
          "text": "blink target time when active",
          "patching_rect": [
            830.0,
            456.0,
            160.0,
            20.0
          ],
          "id": "obj-116",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "comment",
          "text": "setup",
          "patching_rect": [
            78.5,
            36.5,
            92.0,
            20.0
          ],
          "id": "obj-115",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "delay 250",
          "patching_rect": [
            934.0,
            482.0,
            61.0,
            22.0
          ],
          "outlettype": [
            "bang"
          ],
          "id": "obj-114",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "r ACTIVE",
          "patching_rect": [
            830.0,
            482.0,
            59.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-113",
          "numinlets": 0,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "message",
          "text": "textcolor 1 0 0 1",
          "patching_rect": [
            830.0,
            511.0,
            94.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-112",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "message",
          "text": "textcolor 0 0 0 1",
          "patching_rect": [
            934.0,
            513.0,
            94.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-111",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "s ACTIVE",
          "patching_rect": [
            308.0,
            500.0,
            61.0,
            22.0
          ],
          "id": "obj-106",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "comment",
          "text": "one sound a day",
          "patching_rect": [
            597.0,
            766.0,
            363.0,
            60.0
          ],
          "presentation_rect": [
            13.0,
            4.0,
            363.0,
            60.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "id": "obj-105",
          "numinlets": 1,
          "presentation": 1,
          "numoutlets": 0,
          "fontsize": 48.0
        }
      },
      {
        "box": {
          "maxclass": "comment",
          "text": "active",
          "patching_rect": [
            338.0,
            463.0,
            40.0,
            20.0
          ],
          "id": "obj-103",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "message",
          "text": "1",
          "patching_rect": [
            632.0,
            308.0,
            29.5,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-99",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "s GATE",
          "patching_rect": [
            632.0,
            340.0,
            50.0,
            22.0
          ],
          "id": "obj-97",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "comment",
          "text": "current time",
          "patching_rect": [
            109.0,
            500.0,
            72.0,
            20.0
          ],
          "presentation_rect": [
            201.0,
            119.0,
            150.0,
            20.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "id": "obj-96",
          "numinlets": 1,
          "presentation": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "comment",
          "text": "target time",
          "patching_rect": [
            560.0,
            439.0,
            83.0,
            20.0
          ],
          "presentation_rect": [
            13.0,
            119.0,
            150.0,
            20.0
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "id": "obj-93",
          "numinlets": 1,
          "presentation": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "message",
          "text": "load sound file",
          "patching_rect": [
            544.0,
            580.0,
            86.0,
            22.0
          ],
          "presentation_rect": [
            581.0,
            262.0,
            86.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-91",
          "numinlets": 2,
          "presentation": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "comment",
          "text": "turn off after target hit",
          "linecount": 2,
          "patching_rect": [
            279.5,
            346.0,
            81.0,
            33.0
          ],
          "id": "obj-87",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "comment",
          "text": "get current time",
          "patching_rect": [
            162.0,
            213.0,
            92.0,
            20.0
          ],
          "id": "obj-85",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "comment",
          "text": "check for new day",
          "patching_rect": [
            92.0,
            675.0,
            150.0,
            20.0
          ],
          "id": "obj-82",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "number",
          "patching_rect": [
            29.0,
            638.0,
            85.0,
            22.0
          ],
          "outlettype": [
            "",
            "bang"
          ],
          "id": "obj-80",
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 2
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "r DAC",
          "patching_rect": [
            424.0,
            741.0,
            41.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-76",
          "numinlets": 0,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "s NEWDAY",
          "patching_rect": [
            90.0,
            773.0,
            70.0,
            22.0
          ],
          "id": "obj-75",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "r GATE",
          "patching_rect": [
            308.0,
            384.0,
            48.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-74",
          "numinlets": 0,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "s GATE",
          "patching_rect": [
            416.0,
            682.0,
            50.0,
            22.0
          ],
          "id": "obj-73",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "s GATE",
          "patching_rect": [
            162.0,
            123.0,
            50.0,
            22.0
          ],
          "id": "obj-72",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "s GATE",
          "patching_rect": [
            29.0,
            773.0,
            50.0,
            22.0
          ],
          "id": "obj-71",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "message",
          "text": "1",
          "patching_rect": [
            29.0,
            710.0,
            29.5,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-70",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "sprintf %i%i%i",
          "patching_rect": [
            29.0,
            606.0,
            85.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-66",
          "numinlets": 3,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "change",
          "patching_rect": [
            29.0,
            674.0,
            48.0,
            22.0
          ],
          "outlettype": [
            "",
            "int",
            "int"
          ],
          "id": "obj-65",
          "numinlets": 1,
          "numoutlets": 3
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "sprintf %i/%i/%i",
          "patching_rect": [
            65.0,
            325.0,
            91.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-63",
          "numinlets": 3,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "message",
          "text": "3/30/2026",
          "patching_rect": [
            64.0,
            421.0,
            178.0,
            49.0
          ],
          "presentation_rect": [
            377.0,
            128.0,
            208.0,
            49.0
          ],
          "outlettype": [
            ""
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "id": "obj-61",
          "numinlets": 2,
          "presentation": 1,
          "numoutlets": 1,
          "fontsize": 36.0,
          "bgcolor": [
            0.172137149796092,
            0.172137100044002,
            0.172137113045018,
            0.0
          ],
          "bgcolor2": [
            0.172137149796092,
            0.172137100044002,
            0.172137113045018,
            0.0
          ],
          "gradient": 1,
          "bgfillcolor_type": "color",
          "bgfillcolor_color1": [
            0.172137149796092,
            0.172137100044002,
            0.172137113045018,
            0.0
          ],
          "bgfillcolor_color2": [
            0.172137149796092,
            0.172137100044002,
            0.172137113045018,
            1.0
          ],
          "bgfillcolor_color": [
            0.172137149796092,
            0.172137100044002,
            0.172137113045018,
            0.0
          ],
          "bgfillcolor_angle": 270.0,
          "bgfillcolor_autogradient": 0.0,
          "bgfillcolor_proportion": 0.5
        }
      },
      {
        "box": {
          "maxclass": "message",
          "text": "0",
          "patching_rect": [
            416.0,
            645.0,
            29.5,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-59",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "button",
          "patching_rect": [
            308.0,
            461.0,
            24.0,
            24.0
          ],
          "outlettype": [
            "bang"
          ],
          "id": "obj-57",
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "gate",
          "patching_rect": [
            308.0,
            421.0,
            70.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-54",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "r NEWDAY",
          "patching_rect": [
            451.0,
            49.0,
            68.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-53",
          "numinlets": 0,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "s TARGET",
          "patching_rect": [
            405.0,
            325.0,
            65.0,
            22.0
          ],
          "id": "obj-46",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "s NOW",
          "patching_rect": [
            101.0,
            290.0,
            47.0,
            22.0
          ],
          "id": "obj-44",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "message",
          "text": "append",
          "patching_rect": [
            544.0,
            614.0,
            49.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-38",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "s DAC",
          "patching_rect": [
            25.0,
            123.0,
            43.0,
            22.0
          ],
          "id": "obj-36",
          "numinlets": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "ezdac~",
          "patching_rect": [
            477.0,
            789.0,
            45.0,
            45.0
          ],
          "presentation_rect": [
            17.0,
            324.0,
            45.0,
            45.0
          ],
          "id": "obj-33",
          "numinlets": 2,
          "presentation": 1,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "maxclass": "message",
          "text": "1",
          "patching_rect": [
            477.0,
            611.0,
            29.5,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-31",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "playlist~",
          "patching_rect": [
            477.0,
            651.0,
            380.0,
            83.0
          ],
          "presentation_rect": [
            70.0,
            286.0,
            597.0,
            83.0
          ],
          "quality": "basic",
          "outlettype": [
            "signal",
            "signal",
            "signal",
            "",
            "dictionary"
          ],
          "clipheight": 82.0,
          "mode": "basic",
          "bgcolor": [
            0.125,
            0.125,
            0.125,
            0.0
          ],
          "showname": 0,
          "elementcolor": [
            0.221327066888467,
            0.221327006361825,
            0.221327022178404,
            0.0
          ],
          "id": "obj-29",
          "parameter_enable": 0,
          "numinlets": 1,
          "presentation": 1,
          "numoutlets": 5,
          "saved_attribute_attributes": {
            "candicane2": {
              "expression": ""
            },
            "candicane3": {
              "expression": ""
            },
            "candicane4": {
              "expression": ""
            },
            "candicane5": {
              "expression": ""
            },
            "candicane6": {
              "expression": ""
            },
            "candicane7": {
              "expression": ""
            },
            "candicane8": {
              "expression": ""
            }
          },
          "data": {
            "clips": [
              {
                "absolutepath": "Macintosh HD:/Users/johnjannone/Library/CloudStorage/Dropbox-Ballibay/john jannone/_Dropbox Drive/Sample Libraries/Platinumloops Jazz Loops/brass_and_reeds_v1/wav/supersmooth74harmsa_d.wav",
                "filename": "supersmooth74harmsa_d.wav",
                "filekind": "audiofile",
                "id": "u942028171",
                "loop": 0,
                "content_state": {}
              }
            ]
          }
        }
      },
      {
        "box": {
          "maxclass": "button",
          "patching_rect": [
            477.0,
            553.0,
            41.0,
            41.0
          ],
          "outlettype": [
            "bang"
          ],
          "id": "obj-27",
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "message",
          "text": "13:11:14",
          "patching_rect": [
            496.0,
            397.0,
            165.5,
            49.0
          ],
          "presentation_rect": [
            9.0,
            128.0,
            173.0,
            49.0
          ],
          "outlettype": [
            ""
          ],
          "textcolor": [
            1.0,
            0.0,
            0.0,
            1.0
          ],
          "id": "obj-25",
          "numinlets": 2,
          "presentation": 1,
          "numoutlets": 1,
          "fontsize": 36.0,
          "gradient": 1,
          "bgcolor": [
            0,
            0,
            0,
            0
          ],
          "bgcolor2": [
            0.172137149796092,
            0.172137100044002,
            0.172137113045018,
            0.01
          ],
          "bgfillcolor_type": "gradient",
          "bgfillcolor_color1": [
            0,
            0,
            0,
            0
          ],
          "bgfillcolor_color2": [
            0.172137149796092,
            0.172137100044002,
            0.172137113045018,
            0.01
          ],
          "bgfillcolor_color": [
            0.172137149796092,
            0.172137100044002,
            0.172137113045018,
            0.01
          ],
          "bgfillcolor_angle": 270.0,
          "bgfillcolor_autogradient": 0.0,
          "bgfillcolor_proportion": 0.5
        }
      },
      {
        "box": {
          "maxclass": "number",
          "patching_rect": [
            583.0,
            229.0,
            50.0,
            22.0
          ],
          "maximum": 59,
          "outlettype": [
            "",
            "bang"
          ],
          "id": "obj-24",
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 2,
          "minimum": 0
        }
      },
      {
        "box": {
          "maxclass": "number",
          "patching_rect": [
            503.0,
            229.0,
            50.0,
            22.0
          ],
          "maximum": 59,
          "outlettype": [
            "",
            "bang"
          ],
          "id": "obj-23",
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 2,
          "minimum": 0
        }
      },
      {
        "box": {
          "maxclass": "number",
          "patching_rect": [
            429.0,
            229.0,
            50.0,
            22.0
          ],
          "maximum": 23,
          "outlettype": [
            "",
            "bang"
          ],
          "id": "obj-22",
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 2,
          "minimum": 0
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "prepend set",
          "patching_rect": [
            477.0,
            464.0,
            72.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-18",
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "match",
          "patching_rect": [
            477.0,
            500.0,
            41.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-17",
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "sprintf %.2d:%.2d:%.2d",
          "patching_rect": [
            477.0,
            325.0,
            133.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-16",
          "numinlets": 3,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "sprintf %.2d:%.2d:%.2d",
          "patching_rect": [
            155.0,
            290.0,
            133.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-15",
          "numinlets": 3,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "button",
          "patching_rect": [
            429.0,
            147.0,
            24.0,
            24.0
          ],
          "outlettype": [
            "bang"
          ],
          "id": "obj-14",
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "pack i i i",
          "patching_rect": [
            429.0,
            262.0,
            173.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-11",
          "numinlets": 3,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "random 60",
          "patching_rect": [
            583.0,
            190.0,
            66.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-10",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "random 60",
          "patching_rect": [
            503.0,
            190.0,
            66.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-9",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "random 24",
          "patching_rect": [
            429.0,
            190.0,
            66.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-8",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "message",
          "text": "11:21:26",
          "patching_rect": [
            64.0,
            463.0,
            185.0,
            49.0
          ],
          "presentation_rect": [
            193.0,
            128.0,
            180.0,
            49.0
          ],
          "outlettype": [
            ""
          ],
          "textcolor": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "id": "obj-7",
          "numinlets": 2,
          "presentation": 1,
          "numoutlets": 1,
          "fontsize": 36.0,
          "bgcolor": [
            0.172137149796092,
            0.172137100044002,
            0.172137113045018,
            0.0
          ],
          "bgcolor2": [
            0.172137149796092,
            0.172137100044002,
            0.172137113045018,
            0.0
          ],
          "gradient": 1,
          "bgfillcolor_type": "color",
          "bgfillcolor_color1": [
            0.172137149796092,
            0.172137100044002,
            0.172137113045018,
            0.0
          ],
          "bgfillcolor_color2": [
            0.172137149796092,
            0.172137100044002,
            0.172137113045018,
            1.0
          ],
          "bgfillcolor_color": [
            0.172137149796092,
            0.172137100044002,
            0.172137113045018,
            0.0
          ],
          "bgfillcolor_angle": 270.0,
          "bgfillcolor_autogradient": 0.0,
          "bgfillcolor_proportion": 0.5
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "metro 1000",
          "patching_rect": [
            79.0,
            123.0,
            69.0,
            22.0
          ],
          "outlettype": [
            "bang"
          ],
          "id": "obj-5",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "message",
          "text": "date, time",
          "patching_rect": [
            79.0,
            179.0,
            61.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-4",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "loadmess 1",
          "patching_rect": [
            79.0,
            66.0,
            70.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "id": "obj-2",
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "maxclass": "newobj",
          "text": "date",
          "patching_rect": [
            79.0,
            212.0,
            63.0,
            22.0
          ],
          "outlettype": [
            "list",
            "list",
            "int"
          ],
          "id": "obj-1",
          "numinlets": 1,
          "numoutlets": 3
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "obj-99",
            0
          ],
          "destination": [
            "obj-97",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-91",
            0
          ],
          "destination": [
            "obj-38",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-9",
            0
          ],
          "destination": [
            "obj-23",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-80",
            0
          ],
          "destination": [
            "obj-65",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-8",
            0
          ],
          "destination": [
            "obj-22",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-76",
            0
          ],
          "destination": [
            "obj-33",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-74",
            0
          ],
          "destination": [
            "obj-54",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-70",
            0
          ],
          "destination": [
            "obj-75",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-70",
            0
          ],
          "destination": [
            "obj-71",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "obj-66",
            0
          ],
          "destination": [
            "obj-80",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-65",
            0
          ],
          "destination": [
            "obj-70",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-63",
            0
          ],
          "destination": [
            "obj-61",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-6",
            0
          ],
          "destination": [
            "obj-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-59",
            0
          ],
          "destination": [
            "obj-73",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-57",
            0
          ],
          "destination": [
            "obj-106",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-54",
            0
          ],
          "destination": [
            "obj-57",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "obj-54",
            0
          ],
          "destination": [
            "obj-17",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-53",
            0
          ],
          "destination": [
            "obj-51",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-52",
            0
          ],
          "destination": [
            "obj-51",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-51",
            0
          ],
          "destination": [
            "obj-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-50",
            0
          ],
          "destination": [
            "obj-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-5",
            0
          ],
          "destination": [
            "obj-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-49",
            0
          ],
          "destination": [
            "obj-32",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-47",
            2
          ],
          "destination": [
            "obj-24",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-47",
            1
          ],
          "destination": [
            "obj-23",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-47",
            0
          ],
          "destination": [
            "obj-22",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-45",
            0
          ],
          "destination": [
            "obj-47",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-40",
            0
          ],
          "destination": [
            "obj-43",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-4",
            0
          ],
          "destination": [
            "obj-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-38",
            0
          ],
          "destination": [
            "obj-29",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-37",
            0
          ],
          "destination": [
            "obj-40",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-35",
            0
          ],
          "destination": [
            "obj-13",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-32",
            0
          ],
          "destination": [
            "obj-28",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-31",
            0
          ],
          "destination": [
            "obj-29",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-30",
            0
          ],
          "destination": [
            "obj-35",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-29",
            0
          ],
          "destination": [
            "obj-33",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-29",
            1
          ],
          "destination": [
            "obj-33",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-28",
            0
          ],
          "destination": [
            "obj-37",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-27",
            0
          ],
          "destination": [
            "obj-59",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "obj-27",
            0
          ],
          "destination": [
            "obj-31",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-24",
            0
          ],
          "destination": [
            "obj-11",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-23",
            0
          ],
          "destination": [
            "obj-11",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-22",
            0
          ],
          "destination": [
            "obj-11",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-21",
            0
          ],
          "destination": [
            "obj-19",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-20",
            0
          ],
          "destination": [
            "obj-30",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-2",
            0
          ],
          "destination": [
            "obj-72",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-2",
            0
          ],
          "destination": [
            "obj-5",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "obj-2",
            0
          ],
          "destination": [
            "obj-36",
            0
          ],
          "order": 2
        }
      },
      {
        "patchline": {
          "source": [
            "obj-19",
            0
          ],
          "destination": [
            "obj-13",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-18",
            0
          ],
          "destination": [
            "obj-17",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-17",
            0
          ],
          "destination": [
            "obj-27",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-16",
            0
          ],
          "destination": [
            "obj-25",
            1
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-16",
            0
          ],
          "destination": [
            "obj-18",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "obj-15",
            0
          ],
          "destination": [
            "obj-7",
            1
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "obj-15",
            0
          ],
          "destination": [
            "obj-54",
            1
          ],
          "midpoints": [
            164.5,
            334.12890625,
            368.5,
            334.12890625
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-14",
            0
          ],
          "destination": [
            "obj-9",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "obj-14",
            0
          ],
          "destination": [
            "obj-8",
            0
          ],
          "order": 2
        }
      },
      {
        "patchline": {
          "source": [
            "obj-14",
            0
          ],
          "destination": [
            "obj-10",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-12",
            0
          ],
          "destination": [
            "obj-14",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-114",
            0
          ],
          "destination": [
            "obj-111",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-113",
            0
          ],
          "destination": [
            "obj-114",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-113",
            0
          ],
          "destination": [
            "obj-112",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "obj-112",
            0
          ],
          "destination": [
            "obj-25",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-111",
            0
          ],
          "destination": [
            "obj-25",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-11",
            0
          ],
          "destination": [
            "obj-99",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-11",
            0
          ],
          "destination": [
            "obj-46",
            0
          ],
          "order": 2
        }
      },
      {
        "patchline": {
          "source": [
            "obj-11",
            0
          ],
          "destination": [
            "obj-16",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "obj-10",
            0
          ],
          "destination": [
            "obj-24",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-1",
            0
          ],
          "destination": [
            "obj-66",
            0
          ],
          "midpoints": [
            88.5,
            252.87109375,
            38.5,
            252.87109375
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "obj-1",
            0
          ],
          "destination": [
            "obj-63",
            0
          ],
          "midpoints": [
            88.5,
            290.0,
            74.5,
            290.0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "obj-1",
            1
          ],
          "destination": [
            "obj-44",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "obj-1",
            1
          ],
          "destination": [
            "obj-15",
            0
          ],
          "order": 0
        }
      }
    ]
  }
}