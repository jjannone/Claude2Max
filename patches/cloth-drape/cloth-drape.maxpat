{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 9,
      "minor": 2,
      "revision": 0,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      34.0,
      100.0,
      1200.0,
      866.0
    ],
    "boxes": [
      {
        "box": {
          "id": "obj-16",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            103.0,
            432.0,
            29.5,
            22.0
          ],
          "text": "* 2"
        }
      },
      {
        "box": {
          "id": "obj-15",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "patching_rect": [
            103.0,
            500.0,
            29.5,
            22.0
          ],
          "text": "% 2"
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
            103.0,
            528.0,
            107.0,
            22.0
          ],
          "text": "prepend param eo"
        }
      },
      {
        "box": {
          "id": "obj-12",
          "linecount": 2,
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            103.0,
            292.0,
            114.0,
            33.0
          ],
          "text": "Number of iterations per frame"
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
            103.0,
            327.0,
            77.0,
            22.0
          ],
          "text": "loadmess 20"
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
          "parameter_enable": 0,
          "patching_rect": [
            103.0,
            365.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-3",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            136.0,
            777.0,
            201.0,
            22.0
          ],
          "text": "jit.gl.videoplane @transform_reset 2"
        }
      },
      {
        "box": {
          "id": "obj-2",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "jit_matrix",
            "bang",
            ""
          ],
          "patching_rect": [
            41.0,
            91.0,
            197.0,
            22.0
          ],
          "text": "jit.world @size 540 800 @floating 1"
        }
      },
      {
        "box": {
          "attr": "enable",
          "id": "obj-7",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "parameter_enable": 0,
          "patching_rect": [
            41.0,
            55.0,
            86.0,
            22.0
          ],
          "text_width": 58.0
        }
      },
      {
        "box": {
          "id": "obj-20",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            41.0,
            29.0,
            60.0,
            20.0
          ],
          "text": "1) Enable"
        }
      },
      {
        "box": {
          "id": "obj-19",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            154.0,
            175.0,
            54.0,
            20.0
          ],
          "text": "Reset ->"
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
          "parameter_enable": 0,
          "patching_rect": [
            211.0,
            173.0,
            24.0,
            24.0
          ]
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
            527.0,
            204.0,
            70.0,
            22.0
          ],
          "text": "loadmess 6"
        }
      },
      {
        "box": {
          "id": "obj-66",
          "maxclass": "newobj",
          "numinlets": 4,
          "numoutlets": 1,
          "outlettype": [
            "jit_gl_texture"
          ],
          "patcher": {
            "fileversion": 1,
            "appversion": {
              "major": 9,
              "minor": 2,
              "revision": 0,
              "architecture": "x64",
              "modernui": 1
            },
            "classnamespace": "box",
            "rect": [
              80.0,
              101.0,
              1367.0,
              898.0
            ],
            "boxes": [
              {
                "box": {
                  "comment": "jit_gl_texture: the rendered scene",
                  "id": "obj-1",
                  "index": 1,
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    367.0,
                    782.0,
                    30.0,
                    30.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-5",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "jit_gl_texture",
                    "",
                    ""
                  ],
                  "patching_rect": [
                    249.0,
                    339.0,
                    60.0,
                    22.0
                  ],
                  "text": "jit.gl.node"
                }
              },
              {
                "box": {
                  "id": "obj-32",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    24.0,
                    456.0,
                    68.0,
                    22.0
                  ],
                  "text": "anim_reset"
                }
              },
              {
                "box": {
                  "id": "obj-3",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    52.0,
                    498.0,
                    145.0,
                    22.0
                  ],
                  "text": "jit.anim.drive @ui_listen 1"
                }
              },
              {
                "box": {
                  "id": "obj-4",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "jit_gl_texture",
                    ""
                  ],
                  "patching_rect": [
                    24.0,
                    532.0,
                    285.0,
                    22.0
                  ],
                  "text": "jit.gl.camera @locklook 1 @tripod 1 @position 0 0 5"
                }
              },
              {
                "box": {
                  "id": "obj-2",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "jit_matrix",
                    ""
                  ],
                  "patching_rect": [
                    403.0,
                    349.0,
                    209.0,
                    22.0
                  ],
                  "text": "jit.submatrix @dim 160 160 @offset 0"
                }
              },
              {
                "box": {
                  "id": "obj-78",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "jit_matrix",
                    ""
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "appversion": {
                      "major": 9,
                      "minor": 2,
                      "revision": 0,
                      "architecture": "x64",
                      "modernui": 1
                    },
                    "classnamespace": "jit.gen",
                    "rect": [
                      1147.0,
                      386.0,
                      600.0,
                      450.0
                    ],
                    "boxes": [
                      {
                        "box": {
                          "id": "obj-17",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            76.0,
                            269.0,
                            33.0,
                            22.0
                          ],
                          "text": "* 0.5"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-16",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            76.0,
                            200.0,
                            41.0,
                            22.0
                          ],
                          "text": "max 0"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-15",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            76.0,
                            161.0,
                            33.0,
                            22.0
                          ],
                          "text": "- 0.3"
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
                            177.0,
                            197.0,
                            39.0,
                            22.0
                          ],
                          "text": "swiz r"
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
                            177.0,
                            226.0,
                            36.0,
                            22.0
                          ],
                          "text": "> 0.3"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-2",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            76.0,
                            354.0,
                            36.0,
                            22.0
                          ],
                          "text": "+ 0.6"
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
                            329.0,
                            271.0,
                            36.0,
                            22.0
                          ],
                          "text": "+ 0.5"
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
                            329.0,
                            233.0,
                            33.0,
                            22.0
                          ],
                          "text": "* 0.5"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-7",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            329.0,
                            200.0,
                            65.0,
                            22.0
                          ],
                          "text": "clamp -1 1"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-6",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            329.0,
                            161.0,
                            37.0,
                            22.0
                          ],
                          "text": "* -2 3"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-5",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            329.0,
                            129.0,
                            42.0,
                            22.0
                          ],
                          "text": "snorm"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-1",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            14.0,
                            28.0,
                            22.0
                          ],
                          "text": "in 1"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-3",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            176.0,
                            149.0,
                            47.0,
                            22.0
                          ],
                          "text": "sample"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-4",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            176.0,
                            418.0,
                            35.0,
                            22.0
                          ],
                          "text": "out 1"
                        }
                      }
                    ],
                    "lines": [
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
                            "obj-10",
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
                            "obj-16",
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
                            "obj-2",
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
                            "obj-12",
                            0
                          ],
                          "order": 0,
                          "source": [
                            "obj-3",
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
                          "order": 1,
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
                            "obj-8",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "destination": [
                            "obj-3",
                            1
                          ],
                          "source": [
                            "obj-9",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    703.0,
                    172.0,
                    41.0,
                    22.0
                  ],
                  "text": "jit.gen"
                }
              },
              {
                "box": {
                  "id": "obj-60",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    703.0,
                    24.0,
                    58.0,
                    22.0
                  ],
                  "text": "loadbang"
                }
              },
              {
                "box": {
                  "autofit": 1,
                  "data": [
                    27288,
                    "png",
                    "IBkSG0fBZn....PCIgDQRA..APO..D.8HX....vxV+sh....DLmPIQEBHf.B7g.YHB..f.PRDEDU3wI6ceGdTTs9G.+6ta5cBjdnFZI.oQWADEgqP.jlMPP.Qf.hbsRyq0edUubscEIIDPQDP.on.A7ZAPPJJsDHz6sPBsPHj5lr6u+Xu6JnPxL6NyN6N62OOO7nPNy47FH69tmYNm2ild26daDDQDQjSMsJc.PDQDQ1NlPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.2T5.PsPiFCXxS94QG6XmfGd3A..dtm6YwEtvEU3HqlcwKdAL4I+7nO8o2ve+C...ETPAXBSXBJbjUyNxQNDF4HGEdhmXnHpnhB..kVZoXUqZkXkqbUJbzUypacCFSZRSBsoMwa4O6W9kMgYNyYBO8zKELxpcSdxOG5V2tOK+98u+8gO8S+Tb0qdMELppcm9zmDaYKaE93iO..37m+7XgK7qvBVvWhXisUJbzUy5XG6.dkWYJ..n3huAV25VG93O9iQjQFkBGY0rHiLb7rO6j..PSZRLXG6XG3i+3O..5T1.SESCKrL1tt0sthINwmE95qu+ku1O+y+LF4HGARHgjTfHq1kYlYhHhHh+xe9gNzgvi7HCFMpQMQAhpZ2+2+2+GRLwDuiesANvA.85qxNGQByQNxgvwN1Itqe89129ZGiFw4dtmNioO8YbG+ZKXAeIV1x9F6bDIL94mOXNyISDP.A9W9Z+1usCL4IOY..Tu5Eh8NzpQm+7mCKe4q.MsoM8N90lwLlN..t5UKzdGZ0n8surw7m+BvC7.Ove4qUbwEiO9i+HLm4jA.fC66K5rh2xchHhHU.NCcaP94mG..10t1SM1tBKrPL3AOP3iO9YOBqZU1YuG7Vu0aC.fQO5m9t1NCFLfm64lDN8oOi8JzpU0u9QC.fzRK8ZrcKdwKBKdwes8HjDjBJHe..rks7qvKut62V8byMWL0oNU6UXIXyd1yFMnAMnFaSKaYK..PSaZyrGgjfLwINAz6d2GA0VGo6NRRIkHdq25sgFMZp019QezGhe9m2fcHpDhpwBW3WifBJnZrU+7O+S..3i9nO1dDTtL3yP2FT+5WeA0Nu7xK7fOXOw1111k4HRX7yO+tsmC5ciFMZPe5SevrmcZ1gnRX5Uu9aBpcOzC0aGpD58rm8D.nFSlC.z5V2ZTPAlV2EgE1e8QgXuoWek..0Zxb.f669L8yTW3B4IqwjPjc1l9P1cu62uBGIVmTRIEAkLG.nac69bXRn+.OvCVq+LN.P6aeGrCQiqGlP2FDbv0UPsyM2zgF1vF5vjPWmN2P8pW8p01oQiFz3F2X6PDIbgFZnBpcAFXf3nG8v..n4MukxYHIHgGd3BtsMqYllg6MtwMkqvQvhJpHEbaiIlX.fiQB85Tm5..XYAp5rIzPCSvs07csxQPngFJzps1eRtADP.1gnw0CSnaCzoSnqVSMB5SsZunQCDzK5..7xKuk4nQbzoS3K6CGoXWqVguxd81aSqDaGgD5VSb6HPLwsiHg95S.3PsyHzpUqfuyBjziKJNhHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREvMkN.blYznQA0NsZ0hF23lfXhoIxbDILcric.d5omBpsAFXfNLwsmd5ABMzvDTa0nQCdzG8QA.vku7kkyvRPZcqasfaa26d2A.vt10tjonQ3ZW6ZufaaaZiouGO9wOlbENBVm5TGAfoeNPnhM1VhJqrR4JjDk.BH.A2Vu7xKGlWi1rl0LnUKmmnRQSu6cuEVVIxhhKtHz111N7POTuA.Pu5Uup0qo7xKGEUTQxcnIH5zoC0qd0SPs0fACNDIDAL8ly0oN0A..t6t60Z6uxUtB..pt5pk03RH72e+A.fO93Ss1Vy+bR4kWtrFSBgWd4E.L8A6pMkVZo..n3hKVViIgPmNc..B9myA.tzktjf+P5xsPBIDQkXrfBJPFiFgKf.B.d4kWB9CR8bO2jvd1ytQPAErLGYtFXBcAH6r2CRIkT..Pe6a+Q8qezHrvB2xaVHjjKDQDc6xKuKfBJn.blybF7se6p..vUtx0T3nx4Eu2HDQDQp.bF5BvTm5TPLwzT..DZngZ414QDQjsq5pqF4me9..3XG6XX9y+y4L0sBLg9cg2d6IlwL9GnMsoMLANQDYmsicrc7Zu1qAO7PXKfWh2x8+hniNRDczQhYMqOCIlXhLYNQDo.5Tm5Ll8rmM72eeg+96qRGNNE3LzuEwEWKwLlw+..BaU8RDQj7x7sh+e7OdUbwKluBGMN13Lz+eBO7Pw+3e75Hv.CjIyIhHGDgGd3H7vCGuwa7lvau8RoCGGZLgNQDQjJ.Sn++75u9aZo3ePDQjiknhJJ7FuwahhJ55Jcn3vhIzAvYNyoP8qe8U5vfHhnZPqZUqvLlwLT5vvgEqk6.XZSa5V00YtLQt+8uOb1ydVbsqcMbiabCTUUUIkgGQD4TyM2bC96e.nN0IHT+52.DSLw..wUy5MqW85ugYMqOSpCQUAW9D5MpQMDCYHOhnutadyahMrgM..f4N2LwYNyoQgEVHhO9Dk5PjHhb5kSN6EAETPngMrAnYMqE..3Mey2RzI00pUKzoSKptZCxQX5Tykcaq0rlYpxu8Nuy+TPGXFlsyc96XJSYJvGe39hjHhrUkTRw3+6+6cv8ducQvWy0t10vS+ziB..50q7G9RNJ3yPmHhHREvk8VtOrg8j.3ONdHqM+9u+a..X7iebHxHiV1hKhHxUhu95Od1mchHiLlC..5PG5XsdMADP.Xjibz..HyLyTViOmItjIz0pEHxHi3+8+W62jhyblyfW3EdA..lLmHhjXQEU8wK7BOO..V3BWDZTiZbM1d2byMzl1zZ..bwKlGhHhHk8XzYfK4sb+du2t.+8O.3u+BawX7lu4affBpNHnfpiLGYDQjqofBJXDTPAi29seaK6fnZt8ldO4t28tK+AmSBWtD56aeYiN24NC+7yO3me9Inqw7samHhH40u+6+F15V+0ZscADP.Hf.B.8nG8vNDUNGj7U49PG5Sf9129h.BPcTOzqpppv.Fv.T5vfHhbYDSLMAexm7eT5vPRbsqcMr5U+cHiLRG0stgHqikK2LzIhHhTijzD5QEUDXnCcXplYmC.bhSbBkNDHhHWJG3.GPoCAISvAGLF4HGEV1xVtrOVRVB8abihvLm4GHUcmCi8su8ozg.QD4RofBJPoCAIW8qe8wQO5Qj0wPxRn+ce2psp5xqitibjCqzg.QD4RogMrQJcHHKV9xk2YoKYIzUiIyA.JqrxT5PfHhHUfPBITYs+4hhiHhHREPxRne3CqNu0zBo.GPDQDUaN5QOpr1+RVB84Mu4JUcEQDQjpSFYjlr1+RVB8idzigssssJUcGQDQjpxMtwMk09WReF5SbhSPJ6NGB7VtSDQjs569tuU1GCI8zVKpnpO5W+5KdvG7AQbwEG..7wGekxgvl07l2bDRHxa42iHhH6ipqtZje9WDm9zmQoCkayMtwM..v91WN36+90Ce80eYeL4pbmHhHREPxOOzMZD3G+weB+3O9SRcWKId3Gt+XDi3ofmd5oRGJhV1YuGDZngA.fjRJIDarwB2c2c..TYkUB.Skp1cu6cgKdwKhDSLYEKVIhTdYm8dPjQFIZaaaGZRSZB..7vCO..fd85wAO3AQ1YuW..TPAWBIkjy26YTd4kiku7k6vlyA.1kYmCHCIzcz4r7LwKoDSKdhG5gdHLjg7HHlXhwp5myctyA.SO+lku7kC+7y97CVDQ1O6cu6FsnEsDO1i8Xn+8+gA.PDQDgU0WG+3GCKYIKA+3O9C..ve+c7OaNbVdec4lKWBcMZznzgPM57m+r3gdndiQNxQA.fV1xVZS8W8qe8A.vy9rSBCbfCDYjQFXsqcsHxHixliUhHGCSXBSDOyyLVDZn1dkHqoMsY3Ue0+gkiM54O+4i0strPSZRSs49ljWtbIzcz8Fuwah9zmTrbawjRQEUz30dsWGsu8c.ewW74..nxJ0K4iCQj7au6cO..39u+6GScpSC5zoSR6+V251..f+u+u2AIkTxXQKZgPqVocLjJN5STydgIzqE1yePoEsn4X.CXfx5X3latg9zm9fl0rlA.fd1ydfDRHIYcLIhjVG5PG.idziF..iZTiVxSleq7xKuvvF1vPqacqvLlwqJaiCY63pbmHhHREfyP2AP6ZWaA.v3F23sKimNc5PKZQK.foOc+7m+Wf3iOQ6xXSDYaNxQNDF6XGGdpmZj..HrvBytLtwGeBn4M2zc16nG8X1kwjDGlPWgEWbwhm4YFK..BO7vsaiq4Gkvy7LiEEUTQ3Dm3j1swlHx5r28ta7zO8XvHG4nraIxMSiFMXhSbh..3e8u9W3BWHO653S0NdK2UP0st0AidzOMhHhHPDQDghrvNhJpnv3F23f2d6kcerIhDmd269fwLlmQRVM6ViF0nFiF0nF++lDhAEIFn6NWtD5he6JJO6uwhJpPLpQMZzrl0LnUqVnUqx7OEZ0pEsnEsDiabiGW4JWBW4JWRQhChn6tRJ4lnjRtIlvDl.pe8quhspt0oSGzoSGRHgDvXFyXwYNyoTj33Oi6CcSbAuk6FE0+3KW+bx7l2Wfl27lK5qybre3CeXrt0kEN9wONppppr7Lw6YO6EhO93AfvWg95zoCO3C9fV5im7IGpSQwjfHWEqYMqE..94meh55L+9EYmc13m9oeD.lNStuxUtB5RW5B5W+5GZVyL89Ph4CI3t6tiALfAfHhHBL8oOM3s29Hp3RZwj4l4xMCchHhH0HWvYnq7EgfCbf8K5YmavfA78e+5wrl0mB..sZu8+o6hWLe..roM8Kn7xKCO6y9r39tuti5Tm5H3wvbUkaPCZvNz0EYhbkbnCc.QOyb.SmBYqXEKGyd1eF7yu.9Ke8MtwMgMtwMAc5L89gol5DPW5RWE0XkbxIit28tie629cQGeRGVTYLyEbF5J++3Ge7IHp1WYkUhbyMWL6YmFzp0s+Rx7+Lu7xaL24NOLko7xPud8PudwUM3djG4QDU6IhjOwEWrhp8UVYknxJqD6bm+NVvB9p6Xx7aU0UaDUWsQLqY8YXZSaph58Kb2c2wC9fOnnhOR93xkP2QnBA1912dA21pppJr28tWL0oNEQON4kW9H6r2KxN68hpqtZAecrNuSjiiAMngH31VUUUgsu8sgsu8sg+9eexhdrN0oNMxM28Kp2uHwDU9JMoReWWcT3xcK2UxUCYd4cA..zktzEAeMm+7mCYlYFVcMT9e+umI..9fO3CQzQWeqpOHhTFG5PGD+s+1bDTaMZzHN4IOAd228eB.f5UOqaqs84e9mioLkoH32uvau8FG8nGA..Mu4svpFSaEWk6l3xMCchHhH0HWtD5h8VyHk2JmvBKTDVXgZ4TLplTZokhRKsT7S+zOg7y252a3kTRYnjRJCqYMqQT2FsSeZV43HRo0pV0JDYjQJn1Vc0UiErfE.2byC3laV+o03pV0Jwl27lQ4kWNJu7xEz0Tu5UOTu5UOqdLsU7VtahKWBckTCaXiPCaXiDzO3egKbAbgKbArzktDIYrmybx.EVXgBt8B4CcPDIu5bm6rfa6oN0ovhVzBs4wLwDSFe629snfBJ.ETPAB5ZpW8pKpW8pqMO1jsgIzsSNvAxEcsqcCcsqcqVa6MtwMv7m+Wf4O+u.d5o2Rx3GUT0GSaZSUvsu+8u+Rx3RDY85W+D9qCG+3GKZUqjlOHdokVFV0pVIV0pVIJszRp012t10dzt1I7E6qTiOCcSXBc6DsZ0Bu81a3s20dBZ850iKbgyiKbgyKowvAO3ADbaiJJtR2IRoIl8D9oO8okzw9Tm5T3Tm5TnxJqrVaq4a4991W1RZLHT7VtahK3pbWzWgjLtZz.nUqv9gtpqtZTTQEIIi6s5bm6bBts0qdgH4iOQj3HlDUwFaqjzwtfBLUrpzqupZsslKfUt4lxjRgyP2DNCchHhHU.WtD5h+NyHM2JGCFLfJpnRTQE09suRqVMvKu7Fd4kz77yMyc2E9JeUn2MAhH4SEUHrUYN.Pt4tOIcrcyM2gat4tftKAZznQQus27VtahK2sbWoXvfATVYkJn1pSmaVVI7EW7MkrXHpnD11eQpGWhHqyMuovecnP2daBUHgX5wtIjaidIkXZgyIlsFKI8XBc6D850iqd0qJn15kWdg3hKN.XpTLJU5XG6jfaad4kmjMtDQVGgtsw..Ze66.NwIjt5GQqZkomIuWd4Us11qbkq..f1zFwcNUPRKWta4tRIojZqk8VdswKu7BsqcsCsqcsCYm8djrXne8qeBtsG+3GSxFWhHqyINwIDbaSIkTjrwce6KajTRIgjRJIAkP+bm6bhZQ2RxCWtD5J4hg7rm8r3rm8rnhJpnFamFMZPjQFEhLxnvC8P8VRF6JqrBzoNI7hTw91mz973HhDuCb.guUSum64dQIkTrjLt8qe82x6AIDm+7mGm+7R61rUL3pb2DWtD5DQDQpQtfIzE2mjSJ+je4l69Qt4terhUrhZssQEUTHpnhBevG7gn289gvgO7Aspwr6c+9P2698gUspuEd3gvWk6W6ZBuLwRDION24NO18t2kfZqe94GVyZxBctycBctyBe8x7mMfA7v38du2GQDQDHhHhPPWSt4lKxM2bs5wjjFbQwYG0zl1b..r8suMLzgNTAcMAFXfXfCbPnnhJBaaaaWTiWt4tOLu4MO..3qu9JtfkHxgvpV0pPaaa6DTa80WewnF0nAfoRH8ANf3lHvINwwP+5W+g+96ufulhJ55nksLVQMNj7vEbF5Ju8t28Jp1GYjQhQMpQiqcMgsJ4A.t10tJlxTlJBMzPQngJtyE4CcnCIp1SDIe1vF9YA2VMZzXYl0SZRSBETvEE70VRIEiW4UlBBKrvDU7sqcIr6f.I+3LzU.AETcPYkUlfpq6lEQDQfYMqYgst0sB.f8rmciCdvChKcoKCiFMhHhHb..zhVzRz111VzwN1QDarwYUEbgksrkJ5qgHRdblybFQ0dyulOpnhFe7G+evu8a6.6YO6FG8nl14JETP9nMsIAbsqcEzpV0ZjbxIC.f64dtGDSLMUTi0MtwMvO9i+nntFR93xkPWIOOzuU6ZW6BcsqcUTWSxI2Vz7l2B..L3AOXbyady+WkmyH7zSSasDe80WDXfABe7wGnUq3tALl+j1+vO7CnN0IXQcsDQxijRpsVtqYwFqvu01ZznActycFwGe7nnhJxRweohJp.50qG96u+ve+8GADP..v5drb6XG6.+7O+SHrvD1yZWtvJEmI7VtSDQDoB3xMCck5zV6OacqKKDWbwg5V25Jpqy7wonXNVEEhxJqLrvEt...N6bhbvrnE8U..3Mdi2RTmnYZ0p0xLwkZ4k2EvZW6pU7YmCv8gtYRdB8G3Ate7nO5ihfC1wLofGd3ondAgb8yIKdwKBIlXhXvCdHJ1QN3sZIK4qQVYkE..ZQK3JVkHGIqd0qA.ldraCZPCVgiFfxKubrt0sNbxSdZkNTfu95Kl3DeVL1wNVkNTtitxUtJVxR9Z7oe5+AIjPRx5Xoo28t2RVJqhKtH7K+xVjptygvzl1Tw92u7r+JyO+7vrl0mYoFqqDOGHCFLfMu4Mi+w+XFHv.qiccraXCa.dxmb310wjHoR4kWN9fO3CrqiY0UqGuy67tHojRRQd+ByG9JaZSaDSZROKZRSD2hnSLV6ZWqr02Jgicrigm+4edYcLjrD5csqcESYJSQJ5JGJxYBcypScBD..ScpS2xAhfbSud8..XLiYz3pW09UDYbyMc3C9fODMoIMgKjExomQiFwwN1wvK7B+cXOWRRMsowfINwmE..MoIMA5zoS1GSiFMhTRoO..PqV4e7TaIzA.d4W9kvgNzgks9Wx9IvAMnAJUckCE6QRmBKrHTXgEgoO8ogxKW3m+wVqRJoDroMsIroMsI6Vxbu81K3s2dg24c9mnwMtwLYNoJnQiFzzl1T7tu66AO7vM3gG1mGe1wO9IvLm46iYNy2G6bm+trOdEWbwXSaZiPqVc1kj4pUCYHCQV6etJ2IhHhTAjrONYngJtpKD8WUc0FvW9kyG8rm8BMoIMQVFiyblyf0rlUaojvFUTQKKiye1LlwL.fo8QqX2e7D4HSqVsHt3ZElwL9G..38du+IJqrZ9DUTJjWd4C.foMsogktzkI5JBYswfAC..3vG9vXcqKK7Ye1rPqZUajzwvUSiZTij09WxRneoKU.BLv.kptyk0ZVyZwN24ui91WSmc4IjPhnAMnA17yH6Dm3DH2b2OV6ZWCt3EKvtkHG.HnfB.wGeB..LYNoJoSmNjXhIB.fW4UlJdy27Msaisu95Gd228ehd26di1zl1fHhHRap+zqWON0oNE18t2M..9tuaU3l2rTlLWBH2G5URVB80st0gIO4lKUcmCCkX+Mle9WBu5qZZFsIkTRnCcni39u+6Gst0h6ET50qGok1rAfoJ5z91WNnQMRdl4+cSPAEHdgW3EYhbR0y7G5N4jSF95qOnjRJ0tM1G6XGG+5uNcjPBIhN1wNB.ft28til0Lw8dxkUVY3+7e9OX26dWH6rMclSz7l2RIOdcUsl0rZYs+krU49oO8ovZWaVx9sTvdydrJ2qM6aeYi3hKNL3AODzfFz...T25VO3u+9YYwkUc0lt8X27lEiqbkqfyblyhCe3Cgu4aVF.LU9Hs272eewTlxzP7wGOSnStT18t2Ed228ehxKuR69XefCX58qhO93w.Fv.PzQWeT25VWK0Fj5Tm5f.BH.bricTTXgEhKcoKA.SONtibjifScpSa2i46D03pbO1XaAhIllIa8OeWVhHhHU.IsvxDRH0EewW7kRU24PvQXF5lcnCcPDP.lJgid6s2vc28.l28Wlez.UVYknrxJC23FEi3hy9rm1+y71aSGTLu9q+FHt3hiyNmb4Tc0Ui8u+8iW+0es+2u2fhDGG4HGB96u+vKu7Fd4koWW5kWdBO8zKTXgWCkWd4nzRM8nAtwMJVzOVO4jZaF5m6bmEol5Dj0wPR2zjW9xWEyadyEcricBwDSL..h5HBkpYwFabJcHTqzoSKd2288.foBdASlSthzoSGhO93wLm4+F..O2yMI3lata2ii6VYbVu9pfe9E.7yu.ryQjqCymtcG6XGC6XGaGKcoKA95qzWS8uURdUPXUq5awpV02J0cqj4Aevdfm4YFqUcTAR0rEtvEhfBJHq5Zu5UMUui+ge3Gj3nhHow.Fv.vfG7PrbbiVazpUKZdyMsnz99u++hqd0qh9129f5V2PjyvzkSwEWLRO8zvu7KaVoCkZjbmLGvE7zVSiFwMiQVQyDF85qvpRlWXgWC..Yl4bvu9qaUpCKhjLqXEqDkVZoX3CeD..BNwtY0st0EYk05wHFwHjiviHWuD5jzSmNsHyLst0NQlYlI..SlSNEV+5+dKOFogMrgg.BPb0difCNXnWekvc28PNBOxEGe.mDQDQp.bF5jUy7pY+8du2GgGdDh95KrvBwl2r5531kT+xJq0A.S6rjILgIJ5q+S9j+ClxTdY..Tc01+BWEodwD5jUwe+8Cu5qZp1UaMGEpW8pWEyYNYHGgFQ1EqacqGCaXOonK40Mu4MGu4a91..3se62DUTgd4H7HWP7VtShVfAF.lxTlJhM1XQrwFqnSleoKcI7Ye1rvV251joHjH6i4Mu4hBKTb0masZ0h3iOdDe7wioMsY.e7gasWRZvD5jn8hu3KYobtJ18Yd94mOl0r9T76+9NkoniH6mMrgMh4LmLvUu5UE00Y90NIkTR3Udko.+7iaiVx1wD5jnDP.9gDSLQQmH+hW7h3hW7hXVy5Sw7l2bkoniH6uYO6OCYjQ53pW8phNwtNc5PxImLdoW5kkonibkvD5DQDQp.LgNUq71auf2d6El4LmIVzh9ZQO677xKOzgNzNzgNzNjc14nHm7aDIWZSaR.aaaaGsu8sEsu8sEuy67+IpqWqVsncsqc38du2CZ0pAZ0xhYEYc3pbmpQZ0pA+6+so5QcCZPCE8BfK+7yGyd1eFRHgjjiviHGFwEWqA.PFYjARM0TQvAWWQd8wgO7C+P..jZpiGd5IWrbj3vYnS2UUTQ4Xdy6yQCZPCspj4W9xWFok1rQ1YmiLEgD43I93S.yctyEW+5WWTWmVsZQLwzTDSLMEe4W9U35W+ZxTDRpULgNcGUd4kg0rl0hPBIDnQiFQkL+5WuPb8qWHlybx.6d26QFiRhbLs4MuE7ke47QwEWLJt3hE70Y90ZQFYjX8q++hBKTbKxNx0Fuk6zczxV12X47SVLJrvBQFYjN..1912gTGVD4z3G+weBt4lo2hc3CeDh9vbwe+8GqbkeKFwHdR3t6dJGgHoxvYnSDQDoBvYnS+Ed5o6H3fCVzW20u904wfJQ2h0u9uG.ld93O4SNb3u+h6LwNzPCEYjwbvy9rSRNBORkgIzIK7yOe..rTmoEqLxHcrks7qRYHQjpPVYsNXznQL7gOBQkTWiFMngMrQvKuLcbqVd4UJWgHoBvD5DBJn.wK9huDRLwDA.rpslVFYjN14N2kbDdDoJrt0sdrt0sdrfE7khZKsoQiFrrksb..r28tWLyY9uvMuYIxUXRNwbASnyiqvaUfA5Od4W9kQ7wmfnSjetycN..jd5ogbxYexQ3I4zpUKdrG6w..PPAEzs80h8jMmK...H.jDQAQUKszThPhbwjQFYfwLlw..fPBITAcMlKlSIkTR3kdoWFu268O4r0o+Btn3HhHhTAb4lgtQihaF5hs8Nal3DeVjPBIJ5q6rm8rXVy5SA.vAO3gj5vR1LxQNR3om24s.TpolJ.3L0I4UFYjNpt5pA.vXG63PngJrYoCXZl5ImbxXBSXhXpScp..HzPCSVhSx4iKWBc510111NQeMm6bmCyZVeJV7hWD..RLwjk5vR1b2Rleqdlm4YPlYlocHZHWQst0wiO+ymmkeu0jTuyc9dP26d2Afy0GnljW7Vt6h5zm9T3zm9TBJA2e1rl0mhEsnEhDSLYmpj4O4S9jBpct4laVlsNQxg3hq0Ht3ZMl27lGxLy4fKe4KKpq2au8FcpScBcpScBG+3GUlhRxYiKWBcwtvuTq7xKOgWdI9j4W7hWDG3.Gzo7DSSr6A3TSMU3iO9.e7wGYJhHWcspUsFae66vR0UTLhLxnPjQFE71adHtPl3xkPGPbIzUqe..MZzBMZD2+7ekqbELm4jgLEQNldpm5ovS8TOkn+v.DIF6XG+FJpHwcXt3t6tC2c2cQ+5XR8h+j.QDQjJ.SnS0phJpHTTQEg4LmLbYKdLB84uSj0ZAKXA3l27l3l27lBp8Zz7G+hH.lPmDfBJn.TPAEfEsnEpzghUyc2c2l6iTSMUq5DniHgXIKYI3RW5R3RW5RJcnPNoXBcxkPDQDgjzOiZTixRU6hHhbjv8gN4RPpRnC.LtwMNjSN4..fssssIY8KQDYK3TMHWBR8sJOgDR.IjPBRZeRDQ1BlPmHhHREfIzIWBgGd3xR+N9wOdYoeIhHwhOCcxkPvAGrrzuZznAO8S+zXdyad0diIEyvF1vP.ADvs8mkWd4gu669NEJhHR5wD5DYi7vCOvPG5PwhW7hU5Pg9SpoZxejQFIRM0Tgd85A.vbm6bsWgEQxBIOgdYkUB5cu6CBHf.k5tVRzwN1Q3gGdnzggC.08wBq8VfAFH5W+5GVyZViRGJt7D6Aqi4ZTPpolJl6bmqkD7N5LexNqxOgmqUd4kmnG83AQfAFjRGJ2QEV30v5VWVve+k+bhRZB8INwIfd269HkcohSsednS+Uomd5V0yFO5ni1Rs+m+bixn28t21z0OlwLFjVZoIQQCYO3t6dfjSNYjbxNtm7iSYJSE50qGCbfCTVGGtn3HhHhTAjrD5AGbcTcyNGP8dZqY5TmSs98lswnQiV8hba7ie7X7ie7bOpq.F1vFFZTiZjM2OMnAMv1CF6.VK2ct3t6tihJpPYcLjrD5icriSp5JhTbUVYk3F23FV80eO2y83zjXPMnScpS+kUwt0pm8rmRR+Pze13G+Dj09WxdF5st0sVp5JhbHrnEsHDRHg..fgLjgH5qOkTRAe0W8UB9zyhDuwN1wB..c5zIY8oGd3AznQiC+5fvAO7n6f10t1hu9q+ZYq+krYnWQEUHUckCEG8WTa8LBtR2qcW9xWFW9xWFFLXvpt9gO7gKwQDA.3u+9iTSMUnSmNIMYtYwDSLRdeJWTsuEkJjNcx6NEmKJNhHhHU.IKg9d26djpthrK3hhSLxHiLr5qUr6KZplMzgNT7jO4SJqiQSaZSk09WJvEEmymcsqcJq8ujkPOyLyDkTRIRU2QjCmzRKMbjibDq5ZMu52IaSpolJBLP4u.cTu5UOYeLHWOYl4bj09WBeF5UhEsnEJUcGQNj1vF1.xO+7E80oQiFnQiFLxQNRoOnT4ZUqZERM0Tsq2oCmkpEG47n7xKGd6sux5XHoOg9Uu50fkrjuF0oNACsZcLe77iXDi.8rm8RvmO1p28gNYsV0pVEBJHSkYxm3IdBQcsd6s2H0TSkUiLAPiFMXbiabRxqASKszD0GH3RW5R17XJ2Xoe0jxJqLr90uNYc0iaKpt5pvUu5Uc9J8q..93ienhJpTp6VIyIO4oP0UWsRGFjStqe8qC..CFLXUe30t28tiMsoMIwQk5hT8HJrlhDz4N24jjwVNY9y43pOmipppJbhSbBTVYkqzgxck8HYN.Wk6DQDQpBLgNQ1.qc0uGarwJwQh5gT97xyJqrPkUVIBN3fE004LLCch9y34gNQ1Hq8zYybRK97zM4we7GG0oN0wl6GiFMhzSO8a6OqacqahpOTqEJKRciyPmHajQiFw7m+7s5qO0TSUvKRS0nPBIDjZpoJIIy2zl1zeIYN.PDQDgM22D4niIzIRBTVYkYSypaTiZTNr6LD4l0Tm7uSxImbvgNzgr49Iu7xSBhFhr+bMeGDhjAe9m+41z0Otw45bhEVu5UOI8Ykmd5oissssII805V25jj9gH6MlPmHhHREfKJNhjPlWfaOvC7.nEsnEh95cEJ5L8nG8.Mu4M2l6me3G9AbhSbhZschcAwwpDG4rhIzIRFrgMrAr0stUL5QOZQesp4U+tTbK1KszRwW9keofaeqZUqr4wjHmA7VtSjLohJp.kWt0W8pTKmRaMrgMDMrgMTR99wfAChJYt0z+D4rhIzIRF8EewWXSWepolpnKJJNJhLxHQpolJ5Se5C5Se5ijzm1xwXqPr0stUYs+IRNwa4NQxLwdvf7m8XO1ica+9u9q+ZK0RdGIwGe7..3du26UR62CcnCY0089G9geXQ09byMWqZbHxQ.mgNQDQjJ.mgNQ1AyYNyA..icri0l6qa8Ha0fACH6ryF..+1u8a1beWab2c2QrwFqkEZl4iQV4x7l27PkUZ8mdiQFYjBtsG3.GvpGGhbDvD5DYGX9H6cQKZQXXCaXRV+pUqVjbxIC.X4+9mUVYkgyblyfKe4Kiqbkq..fqbkqfpppJnSmN3qu9B+7yO..DbvAiF1vFhPBID3s2dKYwoXXth6YqEpGwZyady10wiHoFSnSjczMtwMv28cemne1t1Bu81azxV1RzxV1R61XZKjhD4coKcQBhDhbtvD5DYmkWd4gMtwMh6+9uekNTbnrl0rFb9yedIouZSaZifaaIkThjLlDoz3hhiHhHREfyPmHEvgO7gwgO7gAf5o.xXsJt3hwBW3Bkr9aDiXDhp8KXAKPxFahTRbF5Dovl27lmRGBJh7yOeje94KoIyA.70Wekz9iHmEbF5DovprxJsT21ejG4QP8pW8T3HRds+8ue7q+5upzgA.fMsk3HxQCSnSjCju4a9FDUTQA.f92+9qvQiz5RW5RXEqXEx5XzidzCQ09Uu5UKSQBQ1eLgNQNXtvEt..9iSasN0oNgjRJIkLjDsBKrPrpUsJK6ob6Ewdrrd4KeYYJRHx9iOCchHhHU.NCchbvsicrCricria6OKpnhBojRJPmNcJTT8G1111FxImbT5vPzJpnhT5PfHIESnSjSnKbgKXo9veqzpUKZQKZAhM1XQXgElMMFlKYr.lpy4W5RWxl5O4Ve6aeEU6W7hWrLEIDoLXBchTQLXv.NzgNDNzgNTM1NsZ0Bu7xKTZokZmhL4W8qe8U5PfHEEeF5D4BxfACppj4hkq726j5ESnSD4xYiabiJcHPjjiIzIhHhTAXBchHmd0oN0QTs+rm8rxTjPjxgKJNRUQqVsPiFMPiFM21elVsZgACFTvHijSB8nnUpNdVIxQDSnSNEznQC5YO6IRN4jA.PW6ZWkr9tpppBW+5W2x9R9du26EG8nGkUQLmHBcK5cvCdPYNRHR4vD5jCEMZzfQNxQhgLjgX2FS2byMTu5UOKGJJSe5SWz8w92+9wzl1zfQiFk5vijPm3DmPoCAhjMLgN4P3Ue0WEctycVoCCqVaZSavZW6Zus+rhJpHjZpoxJRFQjcAWTbDQDQp.R9LzG8nGEhIllBO8zCotqkDgFZnvau8Vvsm2BU4yTlxTP25V2T5vP1DXfAZo7hZ9miFzfFDOCtIRB4qu9hQMpQi90u9ozgxcT4kWAN5QOBV7hWDppJ4cg4JoIzaZSiA8u+OLbyMdm7c7orePkIMoIopSl+mYdU2uvEtP7pu5qhidzipvQj5fO93iRGBJFyy0vUeNGZ0p81VCLNhZUqZEZaaaKl7j+6x53HYYduvENGVvB9RUWx7ac6OotnLee4u+9ikrjknHisi.e80W7QezGA.fu5q9J..W5+9vVkPBIH31pV2xZp12hREwc2cGwDSSwAO3APbw0JYabjrruO2y82QvAWWop6bXnduk612uu5Uu5E..l7jmrccbcjM7gObK+2SbhSfm64dNENhb9De7wK315LdDuJDp12hRE5odpmB6bm6R15etn3HhHhTAjrYnmRJoHUcEoxDe7wyYlWKhIlXPVYkExN6rwLlwLT5vwogVsBeNIrbuRJs90u9KqyPWxRn6kWdIUcEohnQiF7tu66pzggSiDSLQjUVYA.WmOjbaZSaf6t6N7xKuf6t6tkcghmd5I7vCOfWd4kk2ewKu7Bd6s2VZaCaXCAfohCjNc5r7eMmnWmNc3ZW6Z3jm7jvc2cG50qWY9ljH.T25JuOVZIKg9YO6YQqacqkptiTIV1xVlr024latX+6e+Vp9WW5RWBm9zmFUWc02V6RM0TgFMZPPAEDBLv.QPAED..BJnffe94mrEe1pUu5Ui92+9qzggMyWe8E..sqcsC8pW8BIlXh10wO3fCFAGbv3a+1u819yO6YOKV0pVE9we7GAfy25kw7hgiKJNmGG5PxaoGVxRnurksTlPmtMKe4KWT64+6jKdwKhIMoIgxJqLapeLZzHJrvBQgEV3csMokVZBpu71auQDQDA.LcnfLnAMHaJ1tazoSGxJqrb5lodXgEF97O+yU5vnV0fFz.L4IO463iCp3hKFuy67N.vTY8kHofb+5BIKg9d1ydw.FP+wRW52.O8zSopaImXVax7W4UdEbfCb.ad7EyyWULJqrxvIO4IA.vIO4Iw7l27.foY7md5oC.SaOOohidR8fBJHrnEsHkNLjT96u+38du2619yJnfBvnG8nUnH5uh6CcmC50WIxKu7vV1xVPokZaSLo1vU4NQDQjJfjVEXppJC38du2C0u9QC2c2corqkLImbxnEsnkptBfiiDaoDLJkyDM5niVx5Kg35W+53we7G2xuOt3hCyblyTR56UtxUJa2Zeawa8VuEZaaaqRGF1EgEVXHqrxB+vO7C..3S9jOQgiHB.Pud83PG5PHmbxVoCkaS4kWN..xO+7wINwIvV1xlQrwJeEUF.YnVtuyctSL+4+4PmNGyDlScpSCMtwMQvIzYkhS7F+3GuUccR8sUtAMnARZ+IVG7fGDojRJXxSdxVJrNVKGoGikGd3gkZTustFIbFY9eK6Uu5Ed3G9gQUUUkBGQt1pnhJvu9q+J9vO7CT5P41TYkU..f3i2zh.UtSlCHSGepspUsQN5VIQIkThS2pY0Ufb7LhaUqj+W.IDexm7IVlM23F23r5Uttiv1YybLPl7ce22A.fCbfCfW4UdE65XyU4tIFMZDkTxMQKaYrJcnn33yPmjThcKIMm4LGLm4LGYIVzpUqfWXb0zpeWJkQFYfTRIEr0stUqtOThC0lV1xVxj40fV0pVgrxJK92Qjhxw79hSNsdy27MEU6MOCGk1UtxUrqi2+7e9OQvAGL.9iCoEgZJSYJXW6ZWnzRKUNBsayi8XOF..FwHFgrOVpEYkUV3Idhm.23F2PoCExECmgNQDQjJ.SnSRJwr6AbjVKCJwBa5ZW6Z3ZW6Z3QdjGQzW627MeC96+c48rUtG8nGXDiXDb14Vgu9q+ZDYjQpzgA4hg2xcRxH1hohiTwH4PG5PJ1XWZokh+9e+uiO9i+XQcc8rm8D8rm8zRoKUrWes4EdgWPR6ua0N24Nw+8+9eA.v1291E80OlwLFQs0XSO8zQ7wGOF3.GH..ZaaaqrU3gLKyLyD8su8E.NVe3UR8hIzIISaZi31cCqcsqUlhDwqfBJPQG+icrig8su8Ipy2ay5YO6ok+6l27lw6+9uuMEKMnAM.e1m8Y1Tebq17l2L..V5RWJN8oOsjzmhsNWXznQjSN4bGOSzGv.F...dlm4YjjX6Vs5UuZ.Xa0lAhDJlPmjLcsqcUTsu3hKVlhDmSSaZSylWkzcqacSQVE7+Yomd5XMqYMJcX.fZuVra9Pa4VO7VzpUqkOTisTOCLeW.5RW5B90e8Ws59gHgfIzIISW5RWT5PvpoQiFdaQsQlO3IVwJVgBGI2tctycJ5qwfACH0TS0xuOrvBComd5vCO7vphgoMso4PWO9I0Atn3HhHhTAXBcRxHlEYj8XOTKFMrgMToCA..K0IbmM8u+8GqXEqvga14.lJMn1pBJn.LvANP7K+xuX08QfAFnMGGDUSXBcRQrksrEkNDtM228ceJcH..myC7iTRIETc0Ua2FOkLw3+5e8uPe6aesr50ECy0+dhjKLgNoHrGKPHCFL.CFLHn15iO9HyQi5jR7bg6Tm5jceLuUFMZDFMZzp9d2YdclPN9XBcRQbxSdRYeL17l2rksLkyjyd1yhyd1ypzgQMZvCdvXvCdvJxX2jlzDEYbuSV5RWpnZ+zl1zjoHgHlPmTHW+5WW1GiCcnCIpBFiXNLWjS+5u9qNzawoQNxQhxKubKm2yNxN9wOtr1+KXAKf6NBxggx+tWDQDQjMiIzoZkFMl9kivrWkSgEVXHrvBSoCCb0qdUb0qdUkNLtqt7kurRGBB10t10j8w3NU84rFBc8dPzci59cnIRD5e+6O5e+6uRGF3zm9zRVIRUp8rO6ypzgfnrm8rGYeLlwLlgrOFDIDrRwQpdFMZDZznoVamixcfPud8JcHbWcpScJEc7CJnfDU6cDe91rpDRxEGi2AiHYjiRMEWnppppTjiyUmAO7C+vJcHbGkWd4I311gNzAYLRHWYLgNQDQjJ.SnSpdW3BWPTsWrGCrRspqtZ6ZkWSnLe9kqjbTK.PhY6Q1xV1RYLRHWYLgN4RPLq1YktZdYqIzqrxJkkil1zSOcIuOkKG9vGFG9vG1tMdhotAnz+7EodwEEGoH72e+sqmG5KcoK81NNLcjESLwH31d3CeX7hu3KJ5wve+8GCYHCACYHCQvWSkUVonGGohmd5onZ+F23FkoH4Na26d2BtsgGd3xXjPtxXBcRQDZngZWSnKVJ4JQtwMtwBtsV6pNu3hKFewW7EhJgtR5u829aJcHTiDycTwQY2TPpO7mrHEQHgDhRGB0nN1wNpXicLwDifmktRuMxrWhJpnPTQEkfZqi7GTjH4DSnSDQDoBvD5jhXPCZP18wTLmfYIkTRxXjTyZe6aOZe6aufZqXd1stJVxRVhRGBDoHXBcRQzpV0J69XlUVYY2GS4V94muRGBxtm3IdBQ0dVTdHWULgNIY99u+6EU6czWbPcsqcUoCABhqbuVVYkIiQBQN1breGUxoxW7EegnZuRbnVHlyg8V25VKiQxc13F23r6ioirm9oeZQ094O+4KOARsPLa0PmgyQdx4DSnSRladyaJp12oN0IYJRt6V+5WuceLECwbZuIlObhynniNZ3gGdnzggfHlp+1QNxQjwHgbkwD5DQDQp.LgNIoN+4OuRGB0HwNq13hKNDWbwISQis4YdlmQoCAYU+5W+DU6ES8TWpcO2y8H31t0stUYLRHWYxRkhqfBtH7xKujit1lEVXg5vuXrbTIjBm1hVzhvTlxTDbeFe7wC.f8su8Ysgkr59tu6C..G7fGT1GKwtZtKszRkoHQY83O9iaUW2l1zlj1.QDDysb+tWi44Yjt0PqVsHrvBGEUTgJcnbGUVYkgvCOR6xXI4Iz6RWtWjXhI4vdpH03F2XQ8b4Tpx+oij+3uBp8+tXyadyhJg969tuK..RIkTrhHy9wc2cG50qW15+fCNX7jO4SJa8uyB+82eTm5TGkNLDMwLAlSbhSTCeU99MhkWd4E5d2uOznF0HkNTtiJojah8rm8fu+6WOBLP48mskzD596ue34e9WPzGjBjRvw5MNTxZmtPLxQNRjYlYJa8+BVvBDU6Uh8Tu83ei3GpQ3L+OENvurwtPmNcnAMngnAMngJcnbW08te+nacqa38e++krNNR18d9Dm3X30e82P0kLWiFMJcHHSz7+9k.ZoFS+RnV8pWMV8pWsnhl0t10Jp1asBHf.rpqyM2juywnu669NQ+yYyd1yVRFawjfVtel8icriUV6e4hzV2+E9qKImGd6s2nqcsaXe6KaYcb3CSlHhHREPxRnO5Q+zhZggPJMiPn21ciFE2s0KiLx.YjQFhNhrlqQrrk89tTedp28t2cz8t2cQO6eo7HO8+7e9OBtsO7C+vR139mEVXgAc5zYS8gRTHf..dsW60Tjwkb9LvAJumgERVB8AOXmiyUYwxQ945ZuI1+t3BW3Bhp8QGcz3EdgWPTWiXIlJ50chXqbY2Md3gG3ke4WFu7K+xh9Zkxxa5O7C+fj0WVq1111JIGVOJQo50c2cWTsu1WXkB+CZSNej6CkJIKgti94aMY6D6y4cricrh9CAzidzCG5CQEonxkoQiFrpUsJQec8qe8Sz6MaoV25V2jr9J3fCFAGbvnCcnCRVeZushUrBQ0dwrCPpMlWaKp1k4iJTSZhsMghZijkP+ZW6pRUWQNnrl6Vg0tX2ZZSaJZZSapUcsxsvCOba55etm64rpqyfACvfAC1zXaqjxOPQJojhC+1Ur1H1GSvQO5Qkrw17iBi2DQmGEVn7tW44hhiHhHREPxRn2id7.3xW9xRU2QpDomd5V008IexmfO4S9DrxUtRIKVjpEs4.G3.gVsZspJNXVYkE5Uu5knutW4UdEQeMBUN4jifaabwEGBN3fs4wrm8rmvO+7C94me1becqRN4jkz9qlH1GAUUUUEWSNt3l9zmtr1+RVB8V1x3vTm5TPUUUkT0kjCGq6g0YK2VUO8zSjUVYII6S86+9ueatOLabiabB9nNsMsoMHqrxxpWa.Se5SGG3.GvptVg1+hwW8UekMMdcu6cW1dbJR6dBulI1elb3Ce3xTjPN5prxJwwN1wj8wQRqVFETvkvJVwxQ8qeCP.A3uoAPFKHGViPCMTDTP0g0ycqfsr3a9nO5i..vy+7OuUN1ZtsDhqbkqDyadyy5CHIRxImL1yd1yc8qaqKvuyblyHpYPauX96Kw9g0t268dQrwFqbDR1MV6GF4F23FRbjP.lVaIW6ZWCW4JNV2g3JqzzNZ3F2nHb5SeFr3EuHnUqss0LqMRd11u5qVHt3EyCQEkohQuiVkia3C+oPu5UuDbsWV8Vo3ru9oe5m.f0mP+OaPCZPXPCZPBNwtstc0ta5XG63skP27Ou7Vu0aII292ILgIXy8gPr28tW..jTRIIpqyWe8EkTRIBt8lOLdjSd5omnhJpP15+O4S9DQeMUWc0Brk78aDqJpnBr4M+K3q+5EqzgxsorxLc3IctycdT+52PYOYNfLcZqEQDQByKF2xJS9dgk03Tm5Th3EWpYB+MNL+YZjhObSJojhjtszLmX+VUZokhMrgMX4VCeyadSq54VKTcnCc.8nG8.coKcQR629129Jo8WM4Ue0WE.h+NJrrksrZcV5l+PBVaQ8YAKXAXDiXDBt8ibjiT1JRQhsl6aV+6e+EPqD2qu9iWWJ93QMopppBm3DmvgKWCfoD30u91uZLOuuyDQDQp.NVOfaxkPJojBF1vFFF5PGprz+93iOnu8su1sY3J0iy.Fv..fxTkB6ae6qnWrWYkUVnu8su2w30VKWt+7O+ynjRJwREsSH2oEsZ0Z4QpUd4kaSi+sJiLx.0st0UTWCWU6j8DSnSJhEsnEgEsnE4PWU3TB2sDi1KFMZDFMZTzOdk0t10hqe8qC.fgMrgA.aOYdFYjgkBoSMeFh+WMxQNR.X8aaxakVsZwZVyZrpq0d9XSHh2xcRQoFpVXRkoLko3PLiNqsdSGTPAgfBJHjYlYZSaKsSe5SiSe5SaSUEOMZzXyq4Cy8g0lLWpV.nDITLgN4PvUOo9i+3ONxM2bU5v..l1yrye9y2pu9HiLR7ge3GZ0W+5W+5w5W+5uiesJqrRqteECe7wGr10tVap9GHkk4UhDBlPmbXjRJoHqUDMGMe0W8U3q9puBojRJn3hKVoCmay27MeiMc85zoyx5Xn90u9n90u9050bwKdQjVZoUis4K9huPTwQaZSaDba0nQClzjlDxJqrr4u+4sZmTBLgNQDQjJ.WTbjCkCbfCfTRIEKO+y0rl0n5JtOFLXPwOFTEBoplAjPBIba+2JqrR7K+xubaE+kKe4Kiu8a+1ZsuD6yUuKcoKX+6e+2wul6t6N9nO5iPiabiEUeVal5TmpCwZgfb8vD5jCIyugn4acYjQFIxLyLUxPxlXNoxTm5TU3HQbLu1FjxcifGd3A5YO64e4O+QezGEacqa0xyOWud8vfACnpppxxYDQ0UWMLZzH7vCOrrh7ALkn+NkD0SO8DOwS7D3u829aHjPBQx9d3NwbgL5t8AHHRtwD5jSg7xKuaagyMyYNSDWbwofQjvMhQLBb0qdUkNLrICcnCEKdwxao0zWe8E8pW8RVqpexokrjknzg.4hiIzImRu7K+xV9+8vCO..v8ce2GFyXFijejbJF4me9..H6ry1xrJc1SlC.TTQEg90u9Y0agK0rW3EdAbjibDkNLHhIzImel2JS+3O9i3G+weD.2dQMwSO8Dd5omvGe7wxu..71augO93CzoSmk+LqQ94mOxImbfd85uiecu7xKIshkoTLXv.dxm7IwBW3BU5PwgQ+5W+ro8KOQRItJ2IhHhTA3LzIUuJpnBTQEUbWOOp26d2K1wN1gf5qHiLR7vO7CKpweTiZT059q1Ywi7HOBV6ZWKzp0zbA5Se5iBGQ1eEUTQ..x1YQ.QVKlPmTcZUqZkfaqACFvu+6+tfaed4kGJojRfu95qnhIyOB.m4D625iwv7sYdsqcsnwMtwh5uycl0+92ed7KSNr3sbmTcZdyatfa6wN1wD8y.0ZOSrA.F8nGsUesJo1111dW+Zm5TmBqacqCkVZonzRK0NFU1Oomd5HkLQzRsC...B.IQTPTURgIyIGZbF5jpS3gGtfaqPuU6+YlmosXOQw7zSOQpolpSyL06d26N..hM1Xqw1YvfArgMrAK+9HiLRjbxIKmglry7I11ku7kU1.gHAhyPmHhHREfyPmboYq2h3O+y+bq51n6LLK8G3Ad.zhVzBq5ZyKu7vxV1xtspl18e+2OdoW5kjpvSxM+4Oer7kubV1VImVLgNQ1fJpnBrksrEz0t1UQesNxKTtt28ta0IyA.99u+6woN0ots+rMtwMhMtwMZ426u+9C.fgMrggt10thfBJHqd7DJywTlYlIxImbj8wiH6IlPmHaTt4lqUkP2LGsYq2st0sZ8YlWSzqW+eIY9ch4iL1zSOcjd5oa0iG.vS8TOE7wGefVsZgVsZsbf9nQil63YnNSlSpQ7YnSjDXtyct1z0mZpoZYucqzr0sfls92EViUspUA.X4vbQud8Pud82wj4DoVwYnSjDPud8XEqXEXvCdvVceLtwMNr7kubEYUUeO2y8.f+3HNUrJpnhj8CukZxcqnAc2z111Vr6cuaYJZHRY3XLk.hHhHxlvYnSpJgFZnBtslOMzjJW5RWB+xu7K.vzI+l0XHCYH37m+7..1sS1rt10thV25Va0WeAET.V4JWoDFQxuNzgNvYnSpNbF5jpRyZVyDbaO1wNljO9G7fGDG7fGDokVZV8GXH5niFQGczhtn0XMFzfFjMkL+Tm5TNLIyUCGSsDYKXBcRUIhHhPvs07YWtbIyLyzl6C4LodPAEDBKrvro936+9uWhhFa2AO3AU5PfHEEuk6jpRHgDhfaqbLC8+rzRKMaNobpolJxImbv1111jnnx19fBm6bmCqcsqUxhEohst8AIxYGSnStrrWGzFRQR8DRHAK6M74Mu4YU8gVsZw3F23ro3HyLyTxW6ADQRCdK2IhHhTAXBchrCxHiLPFYjgM0Gd3gGvCO7.CcnCE5zoSTWqO93iMO677xKOU0ry8zSOU5PfHIESnSjcfACFfACFjjmCdfAFHF6XGKF0nFkkRb5che94G7yO+v8bO2Cdpm5or4w869tuyl6CGIhY8VPjy.9LzIxNJmbxA4jSNRxpW2Ku7Bie7iWBhpZmiTslWpznF0HK64ehTCb4lgtGd3dMNqF5timpjRmzRKMTXgEhBKrPkNTpQokVZpxj4..MrgMToCg+Dw8BLiF+ie4pyCO7PoCAGBR9Lzqt5pPrwFKBLv.k5tVRjPBI.2bS3eaqdOajE92Wl+q.iFMHSwhqokrjk..f.BH.LrgMLENZtcUUUURx9n2QV.ADfRGB2Ap02uQ93gGdfjSNYb8qeckNTtit90uNN3AO.NvAN.RLwjk0wxkaF5DQDQpQR5LzOyYNE91uc0HlXhQJ6VxAAeTExiabiafzRKM3t6tiwLlwnzgCxHiLfACNm2MlxKub3kWdozgAYG4omdht10tgt10tozgxc0QNxQvJVwxw1111k0wQRmg9zm9LXxbhrR50qG+2+6+UQigktzk5zlLGvzeGRjilVzhVfW7EeIYebjrYnGRH0CO5i9XRU2QjKoSdxSZY+paq6abgRoOKykRkWd4ve+8WoCCh9K7zSOQUUUIbyM4aA7IYyPezidzhtXWPJIM+ueQNZLum0m6bmqrOVm6bmS0jLGv0ZF5Zz7G+hbNL7gOBYs+4hhiHhHREPxtk61xYpLoDD+1iQ0tC9bPoWudjVZoAO8zSzqd0KDczQKY881111PN4jij0eNJbklg9ercRU13fDt10t1iu9qWhr0+RVB8ctycgd0qdIUcmCC06J6V3eeY9uBzpUs92EN1pnhJvZVyZr76GzfFjUcNlqWud6xswWI4bWe1E2iAy7qKUsuEkJjb+gnkrD5evGLSUYBchbzrxUtx63etWd4EpW8pG70WewYNyYP4kWtcNxTd94meJcHPzc0G7A+aDRHgJa8uj8Lzc2cOwW9keoT0cDQhT4kWNN+4OONxQNhKYxb..e80WkNDH5NpxJqTVSlCHwEVlu4a9F7fO3CBe7wGK25KGsaYs6t6NK8q.vZJ8qNy6OYx0fXd+lJpnBYLRrFFg3dcow+2+UlBGmHUUUUNbqeByueYEUTAJszRwxV1Rk8wjqxchHhHU.I+vYYHCYPnicrinwMtI..vau8QpGBaRG6XGQbwEGb2c2ET6cztCCDQRihKtXkNDtC362HV50WI1+9yE6ZW6RoCkayMuooe953G+3XG6X6HxHktcoxcijmPut0MDb7ieRb7ieRotqkDkUVYnoMsoBNgt5k0rJ2UW2PGMZznhejJTs4pW8pJcH7mHtj4lmrgq9bNJu7JvO+y+D9keYyJcnbWYORlCva4NoxHlmKZcqackwHgbzckqbEkNDHRRwD5jpxYO6YEbaaPCZfLFIjityctyozg.QRJlPmTUNyYNifaKOY.csUXgEpzg.QRJlPmHhHREfIzIUEw7bQqW8pmLFIDQj8ESnSpJ71n55RssKLHRr3q.HhTERHgDT5PfHEESnS0pvBKbDVXgigO7QnzgBQ2UcpScRoCAaR+5W+Pcqac41ojrZRdgkgTeBHf...vXFyy.850isu8cnvQjzwe+82AshgQtZF6XGGBLv.Eb644gN8mwYnSDQDoB3BlPWbebV0ZoA0nQCvnQwc5oEbvAiwLlmQlhHkQhIlnRGBjB3zm9zJcHbaRLwDD8ttnpppBUUUUh90wj5kKWBc0ZBZwp7xK2pNyrCKrvPaZSqQ1YuGYHpjFabiaTvss0st0ve+8WFiFxQz+8+9eU5P...6cu6Ast0sBol5DD80dwKlGt3EyCkUl3ecLoNwmgtKpF0HSmFd6XGaGcpScVTW669tuGl3DeVLqY8o..H2bOfjGe1hCe3Ci6+9ueA2d9bzc8X9rpVoz5VGG..RO8zPzQWeQcsFLX.+7O+y3cdm+O..zzl1LIO9HmStbIzE6wgpZ+3ScVy5Sg2d6MhO9DD02qQGczXRS54..vrm8mgbxYexUHZUJt3hEzLuO5QOJxKu7rCQD4HXaaaaJcHfDRHdKyHO5nE2ovkACFvd1ydPZoMaDVXQHGgG4Dyk6VtSDQDoF4BlPWcOiaw55W+FXlyblH6ryFFMZTTqwfnhJJDUTQgIMomCsu8sSFiRwaYKaYBpcaXCaPliDxQRN4jCxImbTzXXRS54PzQGsnlctACFfACFvd26dw+9eOSTYk5kwHjbV4BlPm9yt90KB+6+8+B4latH2byUzKbvvCObLgILQYJ5rNUVYk3zm9z03pY92+8emKRRUjzRKsZ7qu90ud6Tjb204N2IDd3gK5qa+6e+X+6e+3e8udebyaVhLDYjZfK2yPmtyJpnhw67NuM..dy27sQKZQKD00GRHgft10tfsrkeUNBOqxs9F3ImbxHgDR.m8rmE+7O+yJXTQxozRKMDd3gi1111B.f5Tm5fsrksHpiUW4RW6ZWvXG63D80YznQ71u8aB.fxKuRoNrHUDlPmr3l2rT..L8oOUrhUrJQe8iabiGt6t6XCaP3aaL6k8rm8f8rGG2sZGIcxO+7QVYkkRGF2lt0sthwN1wgfBJHQccFMZDm4LmlIxIAgIzo+hJpPOt10tFBN3fE00ETPAgQO5m1xswdiabSxPzQjyitzk6E..OyyLVQmLG.3RW5RXbiarvc28TpCMREhOCchHhHU.NCc5NZDiXDnhJJGKdweskRRoP1m5AETP3EewWB..ibjiByd1eF9se62k0XkHGMcric.SXBSTzmbZlu6VW7hWDO5iNDDTPAyYmSBFmgNcW4omdgm9oGMN6YOCN6YOinWQ30st0EiabiGsssIKSQHQNdxN68fwMtwK5j4FLX.m3DGGm3DGGO0SMbDTPh6QdQDmgNUiLXvHdoWxzLteq25sQKaYKEUEkKzPCEol5DPG5fo8od7wyCCERcZe6Ka.X5NSEZngJ5q+fG7fX5SeZ..vSO8VRiMx0.mgNUqJqrxQYkUNdi230v91m3KwqgGd3XDiXDXDiXDHmb1qLDgDorxIm8Z4mwm3DeVQe8FLX.u9q+ZvfAivfAVaDHqCmgNIXkTRY38e+2EKbgKFZ0JtOK3Dm3j9e+eZvW7EeNRJo1J8AHQJf8t2ciQMpQaIQdDQHtZrt45ydEUvslFYa3LzIhHhTA3LzIQ4F23lH6++169O9Z799+O9ijHhHDR7qjHIBAM9QITrPUTq61mg8oFcePaYyVUrpce2mO6yp1ttQo5OoaqZqNRYcjhR0YyOV6nU8q0VjDI9UIBRjHD4GjHIjbNmu+wYQ6mdibtNw04GNmm2+G2bKuttd+xQNWutd+958062YlIImbxNUuzquWKO9i+DDXfAR5oqgdW7M7HOxz3wdrY0nVRWsXwx0We1E4Vk5gt3zVzhVHYkUVWeCivYDUTQwi+3OACZPCzEkch39LnAMPd7G+Ib5h4eyMaEs9rKlEUPWbZW5RWlW9keIN5QOJG8nG0oec1Ze6aOyZVON28cODWTFJh6wrl0i6zyncqVsRVYkEYkUV7hu3Bnppp1Ekch+FMj6RiREUTIyd1yF.BJn.4se62lniNFCe7soMsgm9oeFdsWaQ.3Ut9uKxMxHG48B.+ze5OiHhHBm93G0n99DbvM0rSKQTAc4VmEKVYpS8mvG8Q+Sm9X+Y+rGAvduV1wN9LyN0DwTMhQL7q+6rMl0l8RKsTULWbYzPtKhHh3CvuqG51r4bShKm84C6uJ3fCgxKubmtWK0G+i7HSiV1xVxV1xVbEomH2xF8nGMSXBSrQ0yb.JojRXLiYzz111NSNyDwNSufdFYb.ZdyatSuvi3tL9wONmZoK0Yh0e23G+3XkqbUDSL1eV5NymcQDQDLiYLSlwLloqJ8Dwsq9NDb1ydVd3G9gTwbWf.BH.ZYKaIm3DekmNUtgrXwBIkTOcKsU.iZTixT6B5Tlxj46+8GEspUsxLOsdLO8S+Tjc1GxSmF21HnfBjEsnWC.5RW5hW6M1IhqlUqVImbxA.9E+hmflzjf8vYzsW1zl1jmNELEkVZor4MuIV9xWNgEVKbosko1C83hKVl3DmjYdJkukCeX62bQqacqnksLbBLP68Bt92G7pppZJqrRoG8nWdj7yhEq7TO0SB.yctyid1ydph5heGKVrP1YmMyYN+N.7nEyO1wNBst0QPyadyA3abMCaTQEWlxK+R.Pu5Uu8X4nurHiLRlxT9wL7gOBdrG6wbosktRqHhHhO.SqG5kTRw7W9KuqYc5jukhK9BLzgNTF8nGE.jXhIR7wGOAETP.Pc0Y45wc7iebN9wON4me9djUfpZpw9lLwBVv7Y1y9ooO8oOpW5hekLxHCdwW7EvhEmaR3ZlJqrR3tu66lwN1wR26d2ocsy9yuuIMw90LrXwB4kWdbxSdR.Hmbxg7yOept5Z7X4rur3iOdNwINNcqac2k0FlVA8oO8YPjQ1Fy5zI+aAFHjRJClAMnuC268duWu.9MWOY3CeD.PwE+02j0W7EeNUUk68KpUTwU3Ue0Wge0u5WQ+6u1c0D+CVrXgW4UdI29tmVlYlN2y8bO7c9No..8qe8mgO7g2fGSO5wWOYspqt5n3hu.uy67Nr28tWBLPGcsFwY8POzCw9129cYmeSaRwsxUtxF0plj2tm4YdZxJqrcasW26d23+5+ZBz+92e.HjPBwzN2VrXgCbfCvG7Aqm268RC.5ae6moc9aHKXAOO.bm2o5st36wpUqjYlYB.u3K9Bt0d4dzidXV+52.8su80T+tU0UaeIoc+6e+7duWZje9m0zN2Fguxjh6a5Tm5T7DOwS33.ajLsdnmWd44SVP2c9dne5SeJRM0kQTQ4b6mxFUPAEDCbfCjDRHA5W+rWHeUqJMWRa8ssfEr..34dtmijRpG50AT7YX0pUNxQNBKXAyG.t5Uq0sztUUk8Gm1BW3hH4jS1z+NUngFJ.bO2y8PBIj.+y+4GyF1vGZpsg+lydVW6MEYZ2N2ZW6ZLqSkemRJoXJojh4Mdi2zkULudADP.z912dF23FOiabi+5WTvUqppplpppZdlm4Y3zm9TZA6Q7IXylMxM2b4oe5mhqd0ZcaEyCJn.YdyadLu4MOFyX9At7aPNt3hiG7AeHN8oykSe5bcoskurUspU5RO+ZrOEQDQ7AXZEzyJqr4PGRK.KNqBK7r7Zu1efW609CLzgNT2V6FRHgPHgDBO0S8TTVYk31Z2ZqsNl1zdDNxQNhaqMEwUIyLyfe1O6mh6b.mpqtZY1y9oHkTFLojxfooM08rYuDZngxBW3hXgKbQbriou+1XTPAE5RO+l5BKyLlwzYO6Yul4ozm1gOb175u9av.Fv..flzD2+Rq+8ceeOJojR34dt4RW6pq60o3aJzPCiYO6YSDQzZl9zmNfmcg2PDmw0t1UAfrxJK9nO5iI7vceqJlEUTgLu4MeRIkT7HStzQLhQ..yYNyk0t122s292NK6ryxk2FlZEjHhHRl6bmCibjeW5QORB.BKrvLyl3VVvA2TBNXuihG+O+O+JF4HGoGMeBLv.Y7i+A3jm7j74e9W3Va6xJqbd4W9UbqsoH2N5PGx9aZyS9jylQO5w3wxil0L6STtwLlwPN4jCG3.o6wxk5UWc0Q94mO4l6I8zoxMTEUTI+q+0dYUqZUzu90eWZaY5cIb+6+.r+8e.y9zZZ9deu6ioMsG0v2ngqZtlzwNFCicri0q3FdBIjP3QdjowgO7gAr+KfhHdOF8nGMf88JCuAQFYaXBSXhbjibXpt5q5QykpqtZV+5WGe1msSOZd3Ht5h4fe31mpyy0TQ+9u+6m3iuSN8wUWc0A.kWd4TVYkRM0bUrYyFgFZy.fV25Hn0st0Ncu9iN5nYRS5AAfm8YeF5Tm5rSmahHtF+3e7OA.ZYKC2oO1qcsqQ4kWNkWd4.PM0TC0VasDd3gSjQF402NXc7hV0+W8nG8fwN1eHyYN+NO1dGg7+klk6hHhH9.TOz8.Jt3KvXFyOvoNlRJoD9u+u+kr8suM.ne86luTplYloyHFw8xC7.+HF23FmgaiwN1wB.srksjW60dMmJ+DQbMN+4OGojRJFN95WiGt3EuH+7e9LolZZ3gDOqrruB28e7e78Y7i+AXTiZTFpcBLv.4ge3ICD.qYMZcHwaf5gtC3JV.TpeUZynJnfyxJVwxozRKi90u6pAKlCPxI2eJu7KwblyukRKsDJsTm60RaHCYvNU7hHtNCaXM75w92jMa13bm6bbtycNV7hecGVLGf9zmjoO8IYN24Jhe6u82vEtvELb6EP.Av8bO2igiWbsTAc2nie7iwwO9wXHC4tM7wTVYkw5W+54sdq2zoau3iOARKszHszRipppJCeb0OSVEQ77lvDlngisxJqjktz+DKco+IRO8Lb51JpnhgMu4MSkUZ7IFabwEGYlY5jYld9Y7t+NMj6NfYtjJ1gNDE.LnAMHGFqEK12NTSO8zY4K+cnm8r2Mp17Mdi2..tq6Z.L3AOXC+umCdvLbaabKhH2Xm+7mijSNYCEqUqV4S+zOk+7edE.Pu6ceZTsYpotT5Uu5ICbf1uNkitlQfAF302ZVEOKUP2Mpicri.Pm6rimA40OrWaXCqm3hy4mM70q98d2krj2hANvAZ3Y+dW5RhM51TDwbjRJC1v63h0UWc7G+i+9Fcg75EQDsgMsoMQhI1U.nMswwaK1Zqy16fFxcQDQDe.pftaThIlHIlXhN7NtsYyF4medje94wF23FMk1trxJmu5q9JCGuQGlOQDWm65tZ3I.62zN1wNHzPMmEpp+5e8Cu9jqyHZe6aOsu8s2TZaowyOrftmYe3N6rOHIjPmIgDb7vsWUUUwd1ydXO6YOjbxl2pKze6uY7aN3NtijLs1UDowoG8nGFN12+8MuWcr3iOAN7gODG9vGhqcsq4v3iKt3Ht3hyzZeowwOrftmQSZRSHxHijHiLRGFaM0TCG5PGxz28510tL9RiXm6bBlZaKh37bld894e9maps8AO3A4fG7fTSMU6vXiN5nI5niVyzcOL+tIEmMaVc1ivs21VsZgKcoxMs1sdYmc1FN1tzktX5suHhywpUie8pDRvb+NaN4jC.b0q53dnW+D9soM0XSfOw0vuqfty+ZnYNCQuUqVM76BdPA0jq+Zfje9EXJsO70eoyHbl2CUQDWCm46gEUTgDUTwXZsc8iNfQ1Vmq+ZaVsZwzZew4ogbWDQDwGfeWOz8Tpqt53RW5RFJ1l1zlRm6r8gOyL6gdu68cZ3XKt3hMs1UDowojRJ0vw1yd1KJszxLs1tqc096gdHgzTGFaYkYucqe2fT7LTAc2j9129QgEVnghMzPC856ct6bm6xzxgQO5wX3XyM2bMs1UDow4zm9TFN1QMpQQZo8dlVaW+qLmQVJnKn.6c7vLeqbDmmFxc2n7yOexO+7c3cwFTPAc82Y8.CzbdF9EUTgLzgNTCG+QNxQLk1UDow6XG6XFN1gO7gS94eFSocCMzlQ7wGOwGe7DXfNtLwYO6Y4rm8rlRaKMdpftaTgEVHEVXgFZwZHlXhgXhIFdvG7A4vG9V+0W6W7K9+4Tq2xewW7E2xsoHxslu7K+RCGaG5PT7XO1ieK2lG+3GiINwIRTQEMQEUzF5XJpnyQQEYrEgFw0QEzEQDQ7A32UP2Y2eyMy8C8RJ4hTRIWzPuO3MqYMil0rlw8duijIMoI0naydzijnG8HIF8nGigF5r5U+NCmHhmyoNUtbpSYr4yRPAED+ve3XI93ii3iuwups8vO7jY3CeDDRHgX3MFlhKtXMQZ8B32UP2SJt35DwEWm3e8u1qgOl1291yTm5OkNzgF25j7zm9LX5SeFFZEpSDw6xcdm8kMu4Ma33aW6ZOyZVyhYMqYQKZQiacceJSYJz111VCGes0VKctyIRm6r1gF8zTAcOf28c+yFN1.CLPti63NH0TeGl4LmIAETfDTPM7+s0rl0TdrG6mSZokFcqacit0st4T8NeoK8OY3XEQbsVzhVjgiMv.Cjd0qdSu5Uu48duUyjm7CS0U2vKnUgEVyIrvZN+xe4uj0t10RW5RhN0Bv0e7O9GLbrhqke5qsl4ML5MF8oOIyQO5QcpMdg.BH.9A+fe.iYL1e0ytxUtB6e+6i8rm8fUqVYXCaX.PxI2OBO7vaDqHde8dv9pW8pIrvZgSe7hHlud0qdyku7kAfvCObCebAFXfLwINIl3DmDW7hEyAO3AAf8t28xwN1wXVyZVz+9eWzrl0LfFypnIjd5GfssssQSZRvN8wJlO+tB51+kVi+KtMleI2H9nO5ePhIlHMsoNdQa3FkOsnEsfQLh6kQLh60Txm5pqNVwJVN.jSNmf9129YJmWQjacu26kF.7nO5zInfBxvGW8Wuncsq8be222Cfq+m2pprxJYKaYKpXtWDMj6hHhH9.765gtyOq0cMCO+5V25nO8ouLrgMLCs4G3JYwhE1yd1Cabi12uzUuyEw6xZWq8857ANvAR+6+c4xF4Pip1ZqkcriOk0u90Srwp8AcuE9c8POf.b1+I6Z9hSDQDIqXEKmSbhSfUqVcpsIQyjUqVImbNAKYIuIQFYaHxHaiGIODQt4BKrVRXg0RVxRVB4medl5qSqyvhEKXwhExJqrH0TWlJl6kwuqftmdBw8MUVYkyJVwxonhJhhJpHOxWRKnfB3se6kPkUZrs1UQDOmst0sPpol50m.qtam4LmlyblSyRW5eh5pyyzID4lyuaH281bjibTV1xVF.LyYNC21B5R827vxV1R4C9fOf9zmjcKsqHRiW+52cwpW8poEsnE7S9ISE.5PG5faossYyFu0a8V.PAEXrMZJw8REzc.2Qul229120+yoO8oynG8ncYOW85pqN1zl96W+cgu1Zsnh4hbaj63NRhctycwhW7qC.ibjijku7+rSM62cFUWc0r90udRKsUoYztWN+vgbWDQDw2ieWOz8TSlDiZty82w92+9XJS4GC.cqacyzN24latjZpKkst0sRG6nlLKhb6r5eaTJojxXQKZgL0o9So8suwsDQeijUVYA.qXEKmst0sRW6p4csHw0vuqftm908vQhIlXI8zyfO6y9L.XPCZPLtwMNFv.FnSuHz.vm7IeB.7ge3FHiLxfV25HTwbQ7wr3E+5r0stUF1vtG9O+OGK.LfALfF045i+3OlMtwOjLxHC.HxHaqJleaB+tB52tnksz9R73QO5wXSa5QHkTRg4Lm4RrwFK.M3yXu1Zqkyblyv9129XtycN.P25V2o0sNBWehKh31Ueu0OvAxfMrgM..ojxfYdya9DczM7dZ90t10.fSdxb3y+7OmErfmmjRpmDYjFeCZQ7N32UP2aeH2uQRLwtRwEeQF5PGBspUsB.hJpnIlXhgN1wX.f7xKe.3bmqPJpnhnhJpfjSt+zst0cOVdKh390oN0Y.3bmqHFzfF.spUshN1wNRG6n8NCDUTQQqacqIiLRmBJn.JrvyA.UWcUzu9cWjTR8zik6xsl.F0nFkoVgq4MuYL4IOEZSa7Nu6tDRnSDUTQa3YD5S+zOEYm8gbwYkHhHeSaZSaxPwYwhEJrvBIu7xyEmQMNW3Bmm28ceWpqNKt71RyxcQDQDe.l5PtexSdBN5Q+Jy7TJhHhbSETPAQbwEGwEm26j8cbia7rwM9WYYKKUWZ6Xp8PekqLMy7z4UvKeRwKhHxsAF6X+gt71vzJn+7O+7azulDd2TEcQDQt0MyYNCW542zJnmPBIXVmJuJAFnJnKhHxstdzid3RO+ZRwIhHh3CvzJne9yedy5T4UIzPatmNEDQDwGPokVlK87aZEz+6+ci8NCd6l5WHWDQDw8HyLS2SmBtDe3GtAW542zJnmZpKkSdxSZVmNuFcriczSmBhHhekvCObOcJ3Rr5UuZW542zJn20t1cd1m82XVmNuF8su80SmBhHhekNzgN3oSASWN4bB5Uu5sKsML0EVlJpnRVxRdKFxPt6quse17le68yftScJAOcFICdsA..JrRRDEDUJHhH9URJIW6rA2cnhJp..9pu5qXW6Zmr5UuZZe6cs2nhlk6hHhH9.L8MmEucYjwAXEq3Oy286de.XnMokd26dQBIzYWcpIhH98N0oxkEu32fQNxQ1fwUas0B.aYKagksrk4NRMud9cEzA3xWt7quL01oN0IGF+oO8o3gdnGB.hLx13RyMQDweTokdQ.6Kg3IlXhNL9byMW.XBS3GQTQEiKM2tcge29gN.gGdq4Dm33.PrwFqC6kdBIzY98+9+..LiYLchMVu2MA.QD41METP971u8RAvPEyqqt53vG191ZsJl+07K6gN.snEgA.KYIuMQDQDF931yd1MO6y9aHrvZoqJ0DQD+FUUUkrfE7BL3AODCeLW7hWjoN0e7+9uooBV87a+jnxJuBUV4U3K+xuzoNt69tGJKdwuIcriwP94eFxO+y3hxPQDw2Vrw1Qdy2bINUwb.10t1I1Ke42VB6FReZHhHh3CvucH2q20tVMr10tNmZX2A3xW9xrsssM.H0TWF4kWdboKUN8su8yUjlhHxs0N3AyjHiLBhO93nac6N.fm64dNZYKc9UEtgMrgR3g2ZyNEusmeeAc.F1vtGdxmb1N8wYyl8O5xLyLHu7xmxKubpnhKSc0UmYmhhHxssZRSZBsrkgSjQFIwGebzktzE.ZTEysZ0J2+8e+lcJ5SPEzAN7gODm5Tm1SmFhHh3.+i+wV4Mdi2zSmFdkzyPGnW8p2jSN43oSCQDQZ.G4HGgErfE3oSCuVpG5eCIlXWXNyYt.PjQFomMYDQDgBKrP.3286dVJpnK3gyFuapG5hHhH9.TOz+VZW6ZK.L+4+7Darw5gyFQDw+UN4bB9M+F6aK2W4JU4gyFuepG5eKEW7Eo3huHyblOJ6e+6WyXcQDwMylMaryctSl9zeTtxUpREyMHUP+lJHlzjl.KZQKjZpoFrYy10eM0DQDwbU+0Xqppp33G+37POzjn4MuEd5z51J9kaNKFURI0S10t1McnCcfTRYv.12LWZQKzujIhHlkKcoKQd4kG.ric7orxUtRRN496gypa+ndnKhHh3CPSJNC5RWpb.3AdfGfALfARrw1QhJpnAfl0rl4ISMQD41R4l6II+7ym8rm8vG7AqG.hN5N5gypaeoB5MBG6XGggMrgyXG6OD.F6XGaCFuMa1nlZpgKe4K6NROGJnfBh1111ZnXsZ0JEWbwt3LxXBHf.t9ZtevAGrCiu971pUqtz7xHBOb6KwkgFZnNL1xK29MOd0qdUWZNYD0mu0m+Mjqbkq..UVYktzbxHZRSr+zDaSaZigOlKbgK30LOYZW6ZGAFnwG.0ye9y6ByFiqUspUNUGblxTlL6XGep1CLLI5Yn2HjTR8jKbgh48e+0B33B5VsZkryNaRKsU4NROGpssss7LOi8WEjfBJnFL1KdwKxK7BdGqLSgDRH7DOwS..wEW7MXrVsZkEu3WGv9ymySahSbh.vPFxc6vXqumJYkUVtzbxHFxPrusVNwINIGF6d1yd.fMu4M4RyIiHlXhA.90+5mzvEFe0W8U3ZW6Ztxzxvl+7edCcST.TUUU407czoN0oRe5Sec30UpWYkoMzJyjJn6FX0pENwINNm7j45oSE.3S9jsyrm8SA33B5kTRIdM4M.W7hk.33B51rYi0rlUC.cu6I4xyKG4nG8X.Fqf91291AfKe4Jbo4jQXyl8Q2vHEzO3AyD.uhee4K9hOG.9e+e+0F9Xp++i7FTUUUY3B5UVYkdEelCvoN0on289NMbAcwboIEmHhHhO.UPWDQDwGfJnKhHh3CPEzEQDQ7AnB5hHhH9.TAcQDQDe.pftHhHhO.UPWDQDwGfJnKhHh3CPEzEQDQ7AnB5hHhH9.TAcQDQDe.pftHhHhO.UPWDQDwGfJnKhHh3CPEzEQDQ7AnB5hHhH9.TAcQDQDe.pftHhHhO.UPWDQDwGfJnKhHh3CPEzEQDQ7AnB5hHhH9.TAcQDQDe.pftHhHhO.UPWDQDwGfJnKhHh3CPEzEQDQ7AnB5hHhH9.TAcQDQDe.pftHhHhO.UPWDQDwGfJnKhHh3CPEzEQDQ7AnB5hHhH9.TAcQDQDe.pftHhHhOfl3oSfamUasWyPwYyFbsqYrXcGrYyF0Vas.PSaZSavXu5Uup6HkLLi9YN3ck6W6ZFOWt5UqwElINGm4yPuqOu8d99Vigyj+dS+a0aJW7GoB52BJszRMTbVrXgyd1y5hyFiqt5piyctyA.csqc8lFmMa13Lm4LtqzxPJnfBLTbkVZobm2YecwYiwkWd4Y3XO4IyE.hM13bUoigc5SeZCGat4lqqKQbRW3BW.vdAlPCMTOb137JnfBH93i2PwVXgE5hyFiqvBKDKVrPvAGbCFW4kWtaJi7ungb+Vv4O+E37m+BNLtpqtZ15V2paHiLlJqrR9jOY67Iex1av3rYyFe3GtA2TVYLaYKagsrks3v39fO3CbCYiwsss8OYaa6eREUTQCF2912WRrwFmWQwb.BN3PH3fCwPEq28t2M6d261MjUNVxI2eRN49yG+werCis1Zq85iXk2h+1eaiXylMCE6G+wejKNaLtst0sRM033QXZ26dWr6cuK2PF4eQEzuEzoNk.cpSIvku7kuowXylM9K+k2kHirMtwLqgkbx8m0rl0vZVyZZv39zO8S3hWrD2TVYL6bm6jctyc1fwje94yBW3q3lxHioCcHZ5PGhl24cRsAiadyattmDxI8BuvBbXLcu62Acu62gaHaLt4O+miJqrxFLl0u90w5W+5bSYjwjc1GhidzizfwbfCreNvA1OadyaxMkUNVHgzL13Fa3aF4BW3BjVZqhzRaUtwLy+fJnKhHh3CPEzMAKYIuEUWc02ve1F23eksssFdns8DZdyCil27v37m+72ved5omNSe5OpaNqbrt0stS25V2I6ry5lFyzl1iPRI0S2XVYbu4a9F2zeVM0TC1r4c9UxhJ577xu7KcS+4u0a8ltwrw3hJpXXlybFbkqbka3O+y9rcvhVzBYQKZgt4LywlxTl7McNLjSN4vK8RuDuzK8Rzl1zN2ah4.O6y9L2zG8xku7kXwK90ohJtBUTwM9+SjFu.F0nFkwdPMRCJf.fG3Ad.hKt3InfreQ4TSMUJu7K4gyrFVQEUHSdxSgd1ydQSap8IxxktzkXYKqgGZXOsie7iwDlvDIkTFLsnEgAXufX5omN6cu+KOb10vZW6ZKidzil10N6WHtt5rPN4bh+8ilosd3rqg8i9Q+H5Tm95IqUAET.qacuOVr3ceYjyd173Ue0EQvAaed.WZokx1291YSaZSbm2Ye7vY2MWlYlNSaZSiQLh6E.pt5ZHiLRm0rl0P7w2IOb10vhIlnYTiZz.PKZQKHmbxg0st0RyadK7vYluKUPWDQDwGf2436IhHhHNEUPWDQDwGfJnKhHh3CPEzEQDQ7AnB5hHhH9.TAcQDQDe.pftHhHhO.UPWDQDwGv+evZNeRRLTBaa.....jTQNQjqBAlf"
                  ],
                  "embed": 1,
                  "forceaspect": 1,
                  "id": "obj-48",
                  "maxclass": "fpic",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "jit_matrix"
                  ],
                  "patching_rect": [
                    703.0,
                    57.0,
                    100.0,
                    100.0
                  ],
                  "pic": "icon.png"
                }
              },
              {
                "box": {
                  "filename": "ssao.jxp",
                  "id": "obj-46",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "jit_gl_texture",
                    "",
                    ""
                  ],
                  "patching_rect": [
                    335.0,
                    710.0,
                    273.0,
                    22.0
                  ],
                  "text": "jit.gl.pass @fxname ssao @quality hi @radius 0.4",
                  "textfile": {
                    "filename": "ssao.jxp",
                    "flags": 0,
                    "embed": 0,
                    "autowatch": 1
                  }
                }
              },
              {
                "box": {
                  "filename": "ssao.jxp",
                  "id": "obj-45",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "jit_gl_texture",
                    "",
                    ""
                  ],
                  "patching_rect": [
                    311.0,
                    674.0,
                    273.0,
                    22.0
                  ],
                  "text": "jit.gl.pass @fxname ssao @quality hi @radius 0.2",
                  "textfile": {
                    "filename": "ssao.jxp",
                    "flags": 0,
                    "embed": 0,
                    "autowatch": 1
                  }
                }
              },
              {
                "box": {
                  "filename": "gamma.jxp",
                  "id": "obj-38",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "jit_gl_texture",
                    "",
                    ""
                  ],
                  "patching_rect": [
                    367.0,
                    750.0,
                    220.0,
                    22.0
                  ],
                  "text": "jit.gl.pass @fxname gamma @quality hi",
                  "textfile": {
                    "filename": "gamma.jxp",
                    "flags": 0,
                    "embed": 0,
                    "autowatch": 1
                  }
                }
              },
              {
                "box": {
                  "filename": "ssao.jxp",
                  "id": "obj-35",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "outlettype": [
                    "jit_gl_texture",
                    "",
                    ""
                  ],
                  "patching_rect": [
                    279.0,
                    637.0,
                    273.0,
                    22.0
                  ],
                  "text": "jit.gl.pass @fxname ssao @quality hi @radius 0.1",
                  "textfile": {
                    "filename": "ssao.jxp",
                    "flags": 0,
                    "embed": 0,
                    "autowatch": 1
                  }
                }
              },
              {
                "box": {
                  "id": "obj-31",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    348.0,
                    582.0,
                    719.0,
                    22.0
                  ],
                  "text": "jit.gl.light @type directional @direction 1 -0.3 -0.3 @shadows 1 @shadowquality hi @shadowrange 5. @shadowblur 0. @diffuse 3 3 3"
                }
              },
              {
                "box": {
                  "id": "obj-26",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    936.0,
                    353.0,
                    58.0,
                    22.0
                  ],
                  "text": "loadbang"
                }
              },
              {
                "box": {
                  "id": "obj-52",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    936.0,
                    387.0,
                    226.0,
                    22.0
                  ],
                  "text": "exprfill 0 norm[0], exprfill 1 norm[1], bang"
                }
              },
              {
                "box": {
                  "id": "obj-50",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "jit_matrix",
                    ""
                  ],
                  "patching_rect": [
                    936.0,
                    425.0,
                    149.0,
                    22.0
                  ],
                  "text": "jit.matrix 2 float32 160 160"
                }
              },
              {
                "box": {
                  "id": "obj-37",
                  "maxclass": "newobj",
                  "numinlets": 9,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    877.0,
                    512.0,
                    449.0,
                    22.0
                  ],
                  "text": "jit.gl.mesh @auto_normals 1 @draw_mode tri_grid @cull_face 1"
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
                    877.0,
                    467.0,
                    128.0,
                    22.0
                  ],
                  "text": "jit.dimmap @invert 1 0"
                }
              },
              {
                "box": {
                  "id": "obj-7",
                  "linecount": 6,
                  "maxclass": "newobj",
                  "numinlets": 8,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    703.0,
                    215.0,
                    185.0,
                    89.0
                  ],
                  "text": "jit.gl.pbr @mat_diffuse 0.6 0.6 0.6 @mat_emission 0.1 0.1 0.1 @gamma_correction 0 @shadow_eps 0.001 @shadow_hard 1 @shadow_soft 0."
                }
              },
              {
                "box": {
                  "id": "obj-6",
                  "maxclass": "newobj",
                  "numinlets": 9,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    403.0,
                    512.0,
                    449.0,
                    22.0
                  ],
                  "text": "jit.gl.mesh @auto_normals 1 @draw_mode tri_grid @cull_face 1"
                }
              },
              {
                "box": {
                  "id": "obj-33",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "jit_matrix",
                    ""
                  ],
                  "patching_rect": [
                    403.0,
                    380.0,
                    175.0,
                    22.0
                  ],
                  "text": "jit.unpack 1 @jump 3 @offset 1"
                }
              },
              {
                "box": {
                  "comment": "jit_matrix: cloth point positions",
                  "id": "obj-65",
                  "index": 1,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    "jit_matrix"
                  ],
                  "patching_rect": [
                    403.0,
                    309.0,
                    30.0,
                    30.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-c1",
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    700.0,
                    625.0,
                    30.0,
                    30.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "comment": "sphere x y z radius, or floorY y (from r COLLIDER)",
                  "index": 4
                }
              },
              {
                "box": {
                  "id": "obj-c2",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    735.0,
                    623.0,
                    300.0,
                    33.0
                  ],
                  "text": "sphere x y z radius, or floorY y. The shapes are drawn where the shader collides with them.",
                  "linecount": 2
                }
              },
              {
                "box": {
                  "id": "obj-c3",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 3,
                  "patching_rect": [
                    700.0,
                    662.0,
                    274.0,
                    22.0
                  ],
                  "outlettype": [
                    "",
                    "",
                    ""
                  ],
                  "text": "route sphere floorY"
                }
              },
              {
                "box": {
                  "id": "obj-c4",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    700.0,
                    694.0,
                    125.0,
                    35.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "text": "position $1 $2 $3, scale $4 $4 $4",
                  "linecount": 2
                }
              },
              {
                "box": {
                  "id": "obj-c5",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    830.0,
                    694.0,
                    105.0,
                    22.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "text": "position 0. $1 0."
                }
              },
              {
                "box": {
                  "id": "obj-c6",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "patching_rect": [
                    700.0,
                    750.0,
                    125.0,
                    35.0
                  ],
                  "outlettype": [
                    "",
                    ""
                  ],
                  "text": "jit.gl.gridshape @shape sphere @dim 40 40",
                  "linecount": 2
                }
              },
              {
                "box": {
                  "id": "obj-c7",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "patching_rect": [
                    830.0,
                    750.0,
                    215.0,
                    49.0
                  ],
                  "outlettype": [
                    "",
                    ""
                  ],
                  "text": "jit.gl.gridshape @shape plane @rotatexyz -90. 0. 0. @scale 2.5 2.5 1. @cull_face 1",
                  "linecount": 3
                }
              },
              {
                "box": {
                  "id": "obj-c8",
                  "maxclass": "newobj",
                  "numinlets": 8,
                  "numoutlets": 2,
                  "patching_rect": [
                    1060.0,
                    640.0,
                    185.0,
                    89.0
                  ],
                  "outlettype": [
                    "",
                    ""
                  ],
                  "text": "jit.gl.pbr @mat_diffuse 0.75 0.3 0.2 @mat_emission 0.1 0.1 0.1 @gamma_correction 0 @shadow_eps 0.001 @shadow_hard 1 @shadow_soft 0.",
                  "linecount": 6
                }
              },
              {
                "box": {
                  "id": "obj-v1",
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    600.0,
                    24.0,
                    30.0,
                    30.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "comment": "camera view: front, top, bottom, left or right",
                  "index": 2
                }
              },
              {
                "box": {
                  "id": "obj-v2",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    320.0,
                    29.0,
                    275.0,
                    20.0
                  ],
                  "text": "camera view: front, top, bottom, left or right"
                }
              },
              {
                "box": {
                  "id": "obj-v3",
                  "maxclass": "newobj",
                  "numinlets": 6,
                  "numoutlets": 6,
                  "patching_rect": [
                    24.0,
                    70.0,
                    639.0,
                    22.0
                  ],
                  "outlettype": [
                    "",
                    "",
                    "",
                    "",
                    "",
                    ""
                  ],
                  "text": "route front top bottom left right"
                }
              },
              {
                "box": {
                  "id": "obj-v10",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    24.0,
                    110.0,
                    120.0,
                    49.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "text": "tripod 1, locklook 1, position 0. 0. 5., lookat 0. 0. 0.",
                  "linecount": 3
                }
              },
              {
                "box": {
                  "id": "obj-v11",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    149.0,
                    110.0,
                    120.0,
                    49.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "text": "locklook 0, tripod 0, position 0. 5. 0., rotatexyz -90. 0. 0.",
                  "linecount": 3
                }
              },
              {
                "box": {
                  "id": "obj-v12",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    274.0,
                    110.0,
                    120.0,
                    49.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "text": "locklook 0, tripod 0, position 0. -5. 0., rotatexyz 90. 0. 0.",
                  "linecount": 3
                }
              },
              {
                "box": {
                  "id": "obj-v13",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    399.0,
                    110.0,
                    120.0,
                    49.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "text": "tripod 1, locklook 1, position -5. 0. 0., lookat 0. 0. 0.",
                  "linecount": 3
                }
              },
              {
                "box": {
                  "id": "obj-v14",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    524.0,
                    110.0,
                    120.0,
                    49.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "text": "tripod 1, locklook 1, position 5. 0. 0., lookat 0. 0. 0.",
                  "linecount": 3
                }
              },
              {
                "box": {
                  "id": "obj-v4",
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    650.0,
                    170.0,
                    30.0,
                    30.0
                  ],
                  "outlettype": [
                    "jit_gl_texture"
                  ],
                  "comment": "jit_gl_texture: video for the cloth (from jit.playlist)",
                  "index": 3
                }
              },
              {
                "box": {
                  "id": "obj-v5",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    520.0,
                    180.0,
                    128.0,
                    33.0
                  ],
                  "text": "video for the cloth (from jit.playlist)",
                  "linecount": 2
                }
              },
              {
                "box": {
                  "id": "obj-g1",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "patching_rect": [
                    450.0,
                    262.0,
                    90.0,
                    22.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "text": "r CLOTH_GRID"
                }
              },
              {
                "box": {
                  "id": "obj-g2",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    450.0,
                    300.0,
                    65.0,
                    22.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "text": "dim $1 $1"
                }
              },
              {
                "box": {
                  "id": "obj-g3",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "patching_rect": [
                    1100.0,
                    300.0,
                    90.0,
                    22.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "text": "r CLOTH_GRID"
                }
              },
              {
                "box": {
                  "id": "obj-g4",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "patching_rect": [
                    1100.0,
                    335.0,
                    40.0,
                    22.0
                  ],
                  "outlettype": [
                    "bang",
                    "int"
                  ],
                  "text": "t b i"
                }
              },
              {
                "box": {
                  "id": "obj-g5",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    1175.0,
                    387.0,
                    65.0,
                    22.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "text": "dim $1 $1"
                }
              },
              {
                "box": {
                  "id": "obj-g6",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    1194.0,
                    301.0,
                    150.0,
                    33.0
                  ],
                  "text": "resize the texture coordinates, then fill them again",
                  "linecount": 2
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "destination": [
                    "obj-37",
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
                    "obj-33",
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
                    "obj-52",
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
                    "obj-4",
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
                    "obj-3",
                    0
                  ],
                  "order": 0,
                  "source": [
                    "obj-32",
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
                  "order": 1,
                  "source": [
                    "obj-32",
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
                  "order": 0,
                  "source": [
                    "obj-33",
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
                  "order": 1,
                  "source": [
                    "obj-33",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-45",
                    0
                  ],
                  "source": [
                    "obj-35",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-1",
                    0
                  ],
                  "source": [
                    "obj-38",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-46",
                    0
                  ],
                  "source": [
                    "obj-45",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-38",
                    0
                  ],
                  "source": [
                    "obj-46",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-78",
                    0
                  ],
                  "source": [
                    "obj-48",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-31",
                    0
                  ],
                  "order": 3,
                  "source": [
                    "obj-5",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-37",
                    0
                  ],
                  "order": 0,
                  "source": [
                    "obj-5",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-4",
                    0
                  ],
                  "order": 4,
                  "source": [
                    "obj-5",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-6",
                    0
                  ],
                  "order": 1,
                  "source": [
                    "obj-5",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-37",
                    1
                  ],
                  "order": 0,
                  "source": [
                    "obj-50",
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
                  "order": 1,
                  "source": [
                    "obj-50",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-50",
                    0
                  ],
                  "source": [
                    "obj-52",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-48",
                    0
                  ],
                  "source": [
                    "obj-60",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-2",
                    0
                  ],
                  "source": [
                    "obj-65",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-37",
                    0
                  ],
                  "order": 0,
                  "source": [
                    "obj-7",
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
                  "order": 1,
                  "source": [
                    "obj-7",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-7",
                    6
                  ],
                  "order": 0,
                  "source": [
                    "obj-78",
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
                  "order": 1,
                  "source": [
                    "obj-78",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-c1",
                    0
                  ],
                  "destination": [
                    "obj-c3",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-c3",
                    0
                  ],
                  "destination": [
                    "obj-c4",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-c3",
                    1
                  ],
                  "destination": [
                    "obj-c5",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-c4",
                    0
                  ],
                  "destination": [
                    "obj-c6",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-c5",
                    0
                  ],
                  "destination": [
                    "obj-c7",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-5",
                    1
                  ],
                  "destination": [
                    "obj-c6",
                    0
                  ],
                  "midpoints": [
                    330.0,
                    380.0,
                    330.0,
                    615.0,
                    625.0,
                    615.0,
                    625.0,
                    740.0,
                    709.5,
                    740.0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-5",
                    1
                  ],
                  "destination": [
                    "obj-c7",
                    0
                  ],
                  "midpoints": [
                    330.0,
                    380.0,
                    330.0,
                    615.0,
                    625.0,
                    615.0,
                    625.0,
                    740.0,
                    839.5,
                    740.0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-c8",
                    0
                  ],
                  "destination": [
                    "obj-c6",
                    0
                  ],
                  "midpoints": [
                    1069.5,
                    744.0,
                    709.5,
                    744.0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-c8",
                    0
                  ],
                  "destination": [
                    "obj-c7",
                    0
                  ],
                  "midpoints": [
                    1069.5,
                    744.0,
                    839.5,
                    744.0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-v1",
                    0
                  ],
                  "destination": [
                    "obj-v3",
                    0
                  ],
                  "midpoints": [
                    609.5,
                    62.0,
                    33.5,
                    62.0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-v3",
                    0
                  ],
                  "destination": [
                    "obj-v10",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-v10",
                    0
                  ],
                  "destination": [
                    "obj-4",
                    0
                  ],
                  "midpoints": [
                    33.5,
                    172.0,
                    14.0,
                    172.0,
                    14.0,
                    520.0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-v3",
                    1
                  ],
                  "destination": [
                    "obj-v11",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-v11",
                    0
                  ],
                  "destination": [
                    "obj-4",
                    0
                  ],
                  "midpoints": [
                    158.5,
                    172.0,
                    14.0,
                    172.0,
                    14.0,
                    520.0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-v3",
                    2
                  ],
                  "destination": [
                    "obj-v12",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-v12",
                    0
                  ],
                  "destination": [
                    "obj-4",
                    0
                  ],
                  "midpoints": [
                    283.5,
                    172.0,
                    14.0,
                    172.0,
                    14.0,
                    520.0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-v3",
                    3
                  ],
                  "destination": [
                    "obj-v13",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-v13",
                    0
                  ],
                  "destination": [
                    "obj-4",
                    0
                  ],
                  "midpoints": [
                    408.5,
                    172.0,
                    14.0,
                    172.0,
                    14.0,
                    520.0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-v3",
                    4
                  ],
                  "destination": [
                    "obj-v14",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-v14",
                    0
                  ],
                  "destination": [
                    "obj-4",
                    0
                  ],
                  "midpoints": [
                    533.5,
                    172.0,
                    14.0,
                    172.0,
                    14.0,
                    520.0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-v4",
                    0
                  ],
                  "destination": [
                    "obj-7",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-v4",
                    0
                  ],
                  "destination": [
                    "obj-7",
                    6
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-g1",
                    0
                  ],
                  "destination": [
                    "obj-g2",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-g2",
                    0
                  ],
                  "destination": [
                    "obj-2",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-g3",
                    0
                  ],
                  "destination": [
                    "obj-g4",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-g4",
                    1
                  ],
                  "destination": [
                    "obj-g5",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-g5",
                    0
                  ],
                  "destination": [
                    "obj-50",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-g4",
                    0
                  ],
                  "destination": [
                    "obj-52",
                    0
                  ]
                }
              }
            ],
            "toolbaradditions": [
              "Vsynth",
              "User-Package",
              "Vizzie"
            ]
          },
          "patching_rect": [
            136.0,
            740.0,
            571.0,
            22.0
          ],
          "text": "p rendering"
        }
      },
      {
        "box": {
          "id": "obj-64",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            579.0,
            243.0,
            83.0,
            20.0
          ],
          "text": "Wind strength"
        }
      },
      {
        "box": {
          "format": 6,
          "id": "obj-61",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            527.0,
            242.0,
            50.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-47",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "jit_gl_texture"
          ],
          "patcher": {
            "fileversion": 1,
            "appversion": {
              "major": 9,
              "minor": 2,
              "revision": 0,
              "architecture": "x64",
              "modernui": 1
            },
            "classnamespace": "box",
            "rect": [
              59.0,
              119.0,
              645.0,
              588.0
            ],
            "boxes": [
              {
                "box": {
                  "comment": "",
                  "id": "obj-1",
                  "index": 1,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    398.0,
                    365.0,
                    30.0,
                    30.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-17",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "jit_gl_texture",
                    ""
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "appversion": {
                      "major": 9,
                      "minor": 2,
                      "revision": 0,
                      "architecture": "x64",
                      "modernui": 1
                    },
                    "classnamespace": "jit.gen",
                    "rect": [
                      311.0,
                      260.0,
                      600.0,
                      450.0
                    ],
                    "boxes": [
                      {
                        "box": {
                          "id": "obj-2",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            226.0,
                            121.0,
                            134.0,
                            22.0
                          ],
                          "text": "param wind_strength 0."
                        }
                      },
                      {
                        "box": {
                          "id": "obj-6",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            77.0,
                            63.0,
                            73.0,
                            22.0
                          ],
                          "text": "- 0.5 0.5 0.5"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-5",
                          "maxclass": "newobj",
                          "numinlets": 2,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            41.0,
                            154.0,
                            29.5,
                            22.0
                          ],
                          "text": "*"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-1",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            14.0,
                            28.0,
                            22.0
                          ],
                          "text": "in 1"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-4",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            176.0,
                            418.0,
                            35.0,
                            22.0
                          ],
                          "text": "out 1"
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
                            "obj-2",
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
                            "obj-5",
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
                            "obj-6",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    81.0,
                    460.0,
                    49.0,
                    22.0
                  ],
                  "text": "jit.gl.pix"
                }
              },
              {
                "box": {
                  "id": "obj-109",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    285.0,
                    118.0,
                    47.0,
                    22.0
                  ],
                  "text": "jit.bang"
                }
              },
              {
                "box": {
                  "id": "obj-110",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    350.0,
                    118.0,
                    87.0,
                    22.0
                  ],
                  "text": "loadmess 0.01"
                }
              },
              {
                "box": {
                  "format": 6,
                  "id": "obj-111",
                  "maxclass": "flonum",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    "bang"
                  ],
                  "parameter_enable": 0,
                  "patching_rect": [
                    350.0,
                    163.0,
                    50.0,
                    22.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-112",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "float",
                    "float"
                  ],
                  "patching_rect": [
                    285.0,
                    236.0,
                    29.5,
                    22.0
                  ],
                  "text": "t f f"
                }
              },
              {
                "box": {
                  "id": "obj-113",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "float"
                  ],
                  "patching_rect": [
                    285.0,
                    201.0,
                    29.5,
                    22.0
                  ],
                  "text": "+ 0."
                }
              },
              {
                "box": {
                  "id": "obj-114",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "float"
                  ],
                  "patching_rect": [
                    285.0,
                    163.0,
                    29.5,
                    22.0
                  ],
                  "text": "f 0."
                }
              },
              {
                "box": {
                  "id": "obj-59",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 2,
                  "outlettype": [
                    "jit_gl_texture",
                    ""
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "appversion": {
                      "major": 9,
                      "minor": 2,
                      "revision": 0,
                      "architecture": "x64",
                      "modernui": 1
                    },
                    "classnamespace": "jit.gen",
                    "rect": [
                      84.0,
                      144.0,
                      600.0,
                      450.0
                    ],
                    "boxes": [
                      {
                        "box": {
                          "id": "obj-9",
                          "maxclass": "newobj",
                          "numinlets": 4,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            282.0,
                            208.0,
                            81.0,
                            22.0
                          ],
                          "text": "vec 0. 0. 0. 1."
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
                            369.0,
                            67.0,
                            39.0,
                            22.0
                          ],
                          "text": "swiz r"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-7",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            209.5,
                            67.0,
                            39.0,
                            22.0
                          ],
                          "text": "swiz r"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-6",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            67.0,
                            39.0,
                            22.0
                          ],
                          "text": "swiz r"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-5",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            365.0,
                            14.0,
                            28.0,
                            22.0
                          ],
                          "text": "in 3"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-1",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            14.0,
                            28.0,
                            22.0
                          ],
                          "text": "in 1"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-2",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            215.0,
                            14.0,
                            28.0,
                            22.0
                          ],
                          "text": "in 2"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-4",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            176.0,
                            418.0,
                            35.0,
                            22.0
                          ],
                          "text": "out 1"
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
                            "obj-1",
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
                            "obj-9",
                            1
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
                            2
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
                            "obj-4",
                            0
                          ],
                          "source": [
                            "obj-9",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    81.0,
                    410.0,
                    146.0,
                    22.0
                  ],
                  "text": "jit.gl.pix"
                }
              },
              {
                "box": {
                  "id": "obj-63",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "float"
                  ],
                  "patching_rect": [
                    237.0,
                    299.0,
                    36.0,
                    22.0
                  ],
                  "text": "+ 20."
                }
              },
              {
                "box": {
                  "id": "obj-64",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    237.0,
                    332.0,
                    48.0,
                    22.0
                  ],
                  "text": "time $1"
                }
              },
              {
                "box": {
                  "id": "obj-65",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    171.0,
                    332.0,
                    48.0,
                    22.0
                  ],
                  "text": "time $1"
                }
              },
              {
                "box": {
                  "id": "obj-66",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    110.0,
                    332.0,
                    48.0,
                    22.0
                  ],
                  "text": "time $1"
                }
              },
              {
                "box": {
                  "id": "obj-67",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "float"
                  ],
                  "patching_rect": [
                    171.0,
                    299.0,
                    36.0,
                    22.0
                  ],
                  "text": "+ 10."
                }
              },
              {
                "box": {
                  "id": "obj-68",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "jit_gl_texture",
                    ""
                  ],
                  "patching_rect": [
                    208.0,
                    369.0,
                    50.0,
                    22.0
                  ],
                  "text": "jit.gl.bfg"
                }
              },
              {
                "box": {
                  "id": "obj-69",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "jit_gl_texture",
                    ""
                  ],
                  "patching_rect": [
                    144.0,
                    369.0,
                    50.0,
                    22.0
                  ],
                  "text": "jit.gl.bfg"
                }
              },
              {
                "box": {
                  "id": "obj-92",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    81.0,
                    44.0,
                    47.0,
                    22.0
                  ],
                  "text": "jit.bang"
                }
              },
              {
                "box": {
                  "attr": "basis",
                  "id": "obj-93",
                  "maxclass": "attrui",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "parameter_enable": 0,
                  "patching_rect": [
                    302.0,
                    299.0,
                    165.0,
                    22.0
                  ],
                  "style": "default",
                  "text_width": 55.333343505859375
                }
              },
              {
                "box": {
                  "id": "obj-94",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "jit_gl_texture",
                    ""
                  ],
                  "patching_rect": [
                    81.0,
                    81.0,
                    285.0,
                    22.0
                  ],
                  "text": "jit.gl.texture @type float32 @adapt 0 @dim 160 160"
                }
              },
              {
                "box": {
                  "id": "obj-95",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "jit_gl_texture",
                    ""
                  ],
                  "patching_rect": [
                    81.0,
                    369.0,
                    50.0,
                    22.0
                  ],
                  "text": "jit.gl.bfg"
                }
              },
              {
                "box": {
                  "attr": "zoom",
                  "id": "obj-96",
                  "maxclass": "attrui",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "parameter_enable": 0,
                  "patching_rect": [
                    302.0,
                    323.0,
                    117.0,
                    22.0
                  ],
                  "text_width": 56.0
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-42",
                  "index": 1,
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    81.0,
                    503.0,
                    30.0,
                    30.0
                  ]
                }
              },
              {
                "box": {
                  "attr": "wind_strength",
                  "id": "obj-2",
                  "maxclass": "attrui",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "parameter_enable": 0,
                  "patching_rect": [
                    398.0,
                    410.0,
                    150.0,
                    22.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-g1",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "patching_rect": [
                    200.0,
                    8.0,
                    90.0,
                    22.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "text": "r CLOTH_GRID"
                }
              },
              {
                "box": {
                  "id": "obj-g2",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    200.0,
                    44.0,
                    65.0,
                    22.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "text": "dim $1 $1"
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
                    "obj-114",
                    0
                  ],
                  "source": [
                    "obj-109",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-111",
                    0
                  ],
                  "source": [
                    "obj-110",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-113",
                    1
                  ],
                  "source": [
                    "obj-111",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-114",
                    1
                  ],
                  "midpoints": [
                    305.0,
                    268.0,
                    334.625,
                    268.0,
                    334.625,
                    152.02734375,
                    305.0,
                    152.02734375
                  ],
                  "source": [
                    "obj-112",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-63",
                    0
                  ],
                  "order": 0,
                  "source": [
                    "obj-112",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-66",
                    0
                  ],
                  "order": 2,
                  "source": [
                    "obj-112",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-67",
                    0
                  ],
                  "order": 1,
                  "source": [
                    "obj-112",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-112",
                    0
                  ],
                  "source": [
                    "obj-113",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-113",
                    0
                  ],
                  "source": [
                    "obj-114",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-42",
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
                    "obj-17",
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
                    "obj-17",
                    0
                  ],
                  "source": [
                    "obj-59",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-64",
                    0
                  ],
                  "source": [
                    "obj-63",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-68",
                    0
                  ],
                  "source": [
                    "obj-64",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-69",
                    0
                  ],
                  "source": [
                    "obj-65",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-95",
                    0
                  ],
                  "source": [
                    "obj-66",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-65",
                    0
                  ],
                  "source": [
                    "obj-67",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-59",
                    2
                  ],
                  "source": [
                    "obj-68",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-59",
                    1
                  ],
                  "source": [
                    "obj-69",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-94",
                    0
                  ],
                  "source": [
                    "obj-92",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-68",
                    0
                  ],
                  "order": 0,
                  "source": [
                    "obj-93",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-69",
                    0
                  ],
                  "order": 1,
                  "source": [
                    "obj-93",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-95",
                    0
                  ],
                  "order": 2,
                  "source": [
                    "obj-93",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-68",
                    0
                  ],
                  "order": 0,
                  "source": [
                    "obj-94",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-69",
                    0
                  ],
                  "order": 1,
                  "source": [
                    "obj-94",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-95",
                    0
                  ],
                  "order": 2,
                  "source": [
                    "obj-94",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-59",
                    0
                  ],
                  "source": [
                    "obj-95",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-68",
                    0
                  ],
                  "order": 0,
                  "source": [
                    "obj-96",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-69",
                    0
                  ],
                  "order": 1,
                  "source": [
                    "obj-96",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-95",
                    0
                  ],
                  "order": 2,
                  "source": [
                    "obj-96",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-g1",
                    0
                  ],
                  "destination": [
                    "obj-g2",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-g2",
                    0
                  ],
                  "destination": [
                    "obj-94",
                    0
                  ]
                }
              }
            ],
            "toolbaradditions": [
              "Vsynth",
              "User-Package",
              "Vizzie"
            ]
          },
          "patching_rect": [
            527.0,
            278.0,
            43.0,
            22.0
          ],
          "text": "p wind"
        }
      },
      {
        "box": {
          "id": "obj-34",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patcher": {
            "fileversion": 1,
            "appversion": {
              "major": 9,
              "minor": 2,
              "revision": 0,
              "architecture": "x64",
              "modernui": 1
            },
            "classnamespace": "box",
            "rect": [
              59.0,
              119.0,
              659.0,
              535.0
            ],
            "boxes": [
              {
                "box": {
                  "id": "obj-2",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    50.0,
                    352.0,
                    90.0,
                    22.0
                  ],
                  "text": "prepend param"
                }
              },
              {
                "box": {
                  "id": "obj-27",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    207.0,
                    291.0,
                    141.0,
                    22.0
                  ],
                  "text": "prepend restLengthHoriz"
                }
              },
              {
                "box": {
                  "id": "obj-25",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    375.0,
                    291.0,
                    134.0,
                    22.0
                  ],
                  "text": "prepend restLengthVert"
                }
              },
              {
                "box": {
                  "id": "obj-16",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    50.0,
                    291.0,
                    137.0,
                    22.0
                  ],
                  "text": "prepend restLengthDiag"
                }
              },
              {
                "box": {
                  "id": "obj-23",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    50.0,
                    245.0,
                    153.0,
                    22.0
                  ],
                  "text": "expr sqrt($f1*$f1 + $f2*$f2)"
                }
              },
              {
                "box": {
                  "id": "obj-22",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "float"
                  ],
                  "patching_rect": [
                    184.0,
                    209.0,
                    29.5,
                    22.0
                  ],
                  "text": "!/ 2."
                }
              },
              {
                "box": {
                  "id": "obj-21",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "outlettype": [
                    "float"
                  ],
                  "patching_rect": [
                    50.0,
                    202.0,
                    29.5,
                    22.0
                  ],
                  "text": "!/ 2."
                }
              },
              {
                "box": {
                  "id": "obj-20",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "float",
                    "float"
                  ],
                  "patching_rect": [
                    50.0,
                    169.0,
                    153.0,
                    22.0
                  ],
                  "text": "unpack f f"
                }
              },
              {
                "box": {
                  "id": "obj-19",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "",
                    ""
                  ],
                  "patching_rect": [
                    51.0,
                    133.0,
                    59.0,
                    22.0
                  ],
                  "text": "route dim"
                }
              },
              {
                "box": {
                  "id": "obj-18",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "outlettype": [
                    ""
                  ],
                  "patching_rect": [
                    51.0,
                    100.0,
                    73.0,
                    22.0
                  ],
                  "text": "jit.matrixinfo"
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-28",
                  "index": 1,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    "jit_matrix"
                  ],
                  "patching_rect": [
                    51.0,
                    40.0,
                    30.0,
                    30.0
                  ]
                }
              },
              {
                "box": {
                  "comment": "",
                  "id": "obj-29",
                  "index": 1,
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    50.0,
                    394.0,
                    30.0,
                    30.0
                  ]
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
                    "obj-16",
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
                    "obj-29",
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
                    "obj-20",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-23",
                    0
                  ],
                  "order": 1,
                  "source": [
                    "obj-21",
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
                  "order": 0,
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
                    1
                  ],
                  "order": 1,
                  "source": [
                    "obj-22",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-25",
                    0
                  ],
                  "order": 0,
                  "source": [
                    "obj-22",
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
                    "obj-23",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-2",
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
                    "obj-2",
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
                    "obj-18",
                    0
                  ],
                  "source": [
                    "obj-28",
                    0
                  ]
                }
              }
            ],
            "toolbaradditions": [
              "Vsynth",
              "User-Package",
              "Vizzie"
            ]
          },
          "patching_rect": [
            211.0,
            402.0,
            139.0,
            22.0
          ],
          "text": "p set_cloth_sim_params"
        }
      },
      {
        "box": {
          "id": "obj-73",
          "linecount": 2,
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            527.0,
            316.0,
            209.0,
            35.0
          ],
          "text": "jit.gpu.image @format rgba32_float @name windImg @dim 160 160"
        }
      },
      {
        "box": {
          "id": "obj-58",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 3,
          "outlettype": [
            "bang",
            "bang",
            "int"
          ],
          "patching_rect": [
            71.0,
            471.0,
            51.0,
            22.0
          ],
          "text": "uzi 10 0"
        }
      },
      {
        "box": {
          "id": "obj-55",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            "bang"
          ],
          "patching_rect": [
            40.0,
            429.0,
            50.0,
            22.0
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "obj-24",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            40.0,
            250.0,
            71.0,
            22.0
          ],
          "text": "jit.gpu.bang"
        }
      },
      {
        "box": {
          "id": "obj-9",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "patching_rect": [
            40.0,
            740.0,
            79.0,
            22.0
          ],
          "text": "jit.gpu.submit"
        }
      },
      {
        "box": {
          "id": "obj-49",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "jit_matrix"
          ],
          "patcher": {
            "fileversion": 1,
            "appversion": {
              "major": 9,
              "minor": 2,
              "revision": 0,
              "architecture": "x64",
              "modernui": 1
            },
            "classnamespace": "box",
            "rect": [
              59.0,
              119.0,
              760.0,
              457.0
            ],
            "boxes": [
              {
                "box": {
                  "id": "obj-2",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 3,
                  "outlettype": [
                    "bang",
                    "bang",
                    "int"
                  ],
                  "patching_rect": [
                    50.5,
                    67.0,
                    40.0,
                    22.0
                  ],
                  "text": "uzi 2"
                }
              },
              {
                "box": {
                  "id": "obj-6",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "jit_matrix",
                    ""
                  ],
                  "patcher": {
                    "fileversion": 1,
                    "appversion": {
                      "major": 9,
                      "minor": 2,
                      "revision": 0,
                      "architecture": "x64",
                      "modernui": 1
                    },
                    "classnamespace": "jit.gen",
                    "rect": [
                      178.0,
                      311.0,
                      600.0,
                      450.0
                    ],
                    "boxes": [
                      {
                        "box": {
                          "id": "obj-1",
                          "maxclass": "newobj",
                          "numinlets": 0,
                          "numoutlets": 1,
                          "outlettype": [
                            ""
                          ],
                          "patching_rect": [
                            50.0,
                            14.0,
                            28.0,
                            22.0
                          ],
                          "text": "in 1"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-4",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            50.0,
                            200.0,
                            35.0,
                            22.0
                          ],
                          "text": "out 1"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-c4",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "patching_rect": [
                            50.0,
                            80.0,
                            55.0,
                            22.0
                          ],
                          "outlettype": [
                            ""
                          ],
                          "text": "swiz xzy"
                        }
                      },
                      {
                        "box": {
                          "id": "obj-c5",
                          "maxclass": "newobj",
                          "numinlets": 1,
                          "numoutlets": 1,
                          "patching_rect": [
                            50.0,
                            140.0,
                            75.0,
                            22.0
                          ],
                          "outlettype": [
                            ""
                          ],
                          "text": "+ 0. 1.2 0."
                        }
                      },
                      {
                        "box": {
                          "id": "obj-c6",
                          "maxclass": "comment",
                          "numinlets": 1,
                          "numoutlets": 0,
                          "patching_rect": [
                            128.0,
                            141.0,
                            330.0,
                            20.0
                          ],
                          "text": "lay the sheet level (y and z swapped) and lift it to y = 1.2"
                        }
                      }
                    ],
                    "lines": [
                      {
                        "patchline": {
                          "source": [
                            "obj-1",
                            0
                          ],
                          "destination": [
                            "obj-c4",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "obj-c4",
                            0
                          ],
                          "destination": [
                            "obj-c5",
                            0
                          ]
                        }
                      },
                      {
                        "patchline": {
                          "source": [
                            "obj-c5",
                            0
                          ],
                          "destination": [
                            "obj-4",
                            0
                          ]
                        }
                      }
                    ]
                  },
                  "patching_rect": [
                    50.5,
                    236.0,
                    41.0,
                    22.0
                  ],
                  "text": "jit.gen"
                }
              },
              {
                "box": {
                  "id": "obj-28",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "outlettype": [
                    "jit_matrix",
                    ""
                  ],
                  "patching_rect": [
                    49.5,
                    289.0,
                    257.0,
                    22.0
                  ],
                  "text": "jit.matrix 4 float32 160 160 @planemap 3 0 1 2"
                }
              },
              {
                "box": {
                  "id": "obj-15",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "outlettype": [
                    "jit_matrix",
                    ""
                  ],
                  "patching_rect": [
                    49.5,
                    260.0,
                    117.0,
                    22.0
                  ],
                  "text": "jit.pack 2 @jump 3 1"
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
                    50.5,
                    100.0,
                    512.0,
                    22.0
                  ],
                  "text": "jit.gl.gridshape @shape plane @dim 160 160 @matrixoutput 2 @automatic 0 @rotatexyz 0 0 0"
                }
              },
              {
                "box": {
                  "comment": "bang: build the starting cloth",
                  "id": "obj-47",
                  "index": 1,
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "outlettype": [
                    "bang"
                  ],
                  "patching_rect": [
                    50.0,
                    24.0,
                    30.0,
                    30.0
                  ]
                }
              },
              {
                "box": {
                  "comment": "jit_matrix: starting positions, x y z per point",
                  "id": "obj-48",
                  "index": 1,
                  "maxclass": "outlet",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    49.5,
                    341.0,
                    30.0,
                    30.0
                  ]
                }
              },
              {
                "box": {
                  "id": "obj-g1",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "patching_rect": [
                    600.0,
                    24.0,
                    90.0,
                    22.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "text": "r CLOTH_GRID"
                }
              },
              {
                "box": {
                  "id": "obj-g2",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    600.0,
                    60.0,
                    65.0,
                    22.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "text": "dim $1 $1"
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
                    "obj-12",
                    0
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
                    "obj-15",
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
                  "order": 1,
                  "source": [
                    "obj-2",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-48",
                    0
                  ],
                  "source": [
                    "obj-28",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "destination": [
                    "obj-2",
                    0
                  ],
                  "source": [
                    "obj-47",
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
                    "obj-6",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-g1",
                    0
                  ],
                  "destination": [
                    "obj-g2",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-g2",
                    0
                  ],
                  "destination": [
                    "obj-12",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "obj-g2",
                    0
                  ],
                  "destination": [
                    "obj-28",
                    0
                  ],
                  "midpoints": [
                    609.5,
                    90.0,
                    590.0,
                    90.0,
                    590.0,
                    285.5,
                    59.0,
                    285.5
                  ]
                }
              }
            ],
            "toolbaradditions": [
              "Vsynth",
              "User-Package",
              "Vizzie"
            ]
          },
          "patching_rect": [
            211.0,
            204.0,
            108.0,
            22.0
          ],
          "text": "p create gridshape"
        }
      },
      {
        "box": {
          "attr": "gravity",
          "id": "obj-30",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "parameter_enable": 0,
          "patching_rect": [
            234.0,
            463.0,
            176.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "filename": "clothsim_collide.comp",
          "id": "obj-5",
          "linecount": 4,
          "maxclass": "newobj",
          "numinlets": 5,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            71.0,
            620.0,
            374.0,
            62.0
          ],
          "text": "jit.gpu.compute @shader clothsim_collide.comp @workgroups 10 10 1 @gravity -9.8 @mass 0.1 @springK 10000 @deltaT 0.00004 @damping 0.18 @deltaT 0.0005 @eo 0 @friction 0.02 @release 0 @posImg posImg @velImg velImg @windImg windImg",
          "textfile": {
            "filename": "clothsim_collide.comp",
            "flags": 0,
            "embed": 0,
            "autowatch": 1
          }
        }
      },
      {
        "box": {
          "attr": "damping",
          "id": "obj-44",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "parameter_enable": 0,
          "patching_rect": [
            234.0,
            565.0,
            176.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "attr": "mass",
          "id": "obj-36",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "parameter_enable": 0,
          "patching_rect": [
            234.0,
            488.0,
            176.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "attr": "springK",
          "id": "obj-40",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "parameter_enable": 0,
          "patching_rect": [
            234.0,
            514.0,
            176.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "attr": "deltaT",
          "id": "obj-43",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "parameter_enable": 0,
          "patching_rect": [
            234.0,
            538.0,
            176.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "obj-71",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            313.0,
            250.0,
            80.0,
            22.0
          ],
          "text": "setall 0, bang"
        }
      },
      {
        "box": {
          "id": "obj-70",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            313.0,
            282.0,
            149.0,
            22.0
          ],
          "text": "jit.matrix 4 float32 160 160"
        }
      },
      {
        "box": {
          "id": "obj-57",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 3,
          "outlettype": [
            "",
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            40.0,
            700.0,
            211.0,
            22.0
          ],
          "text": "jit.gpu.tomatrix @source posImg"
        }
      },
      {
        "box": {
          "id": "obj-14",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            211.0,
            142.0,
            58.0,
            22.0
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "obj-13",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "jit_matrix",
            ""
          ],
          "patching_rect": [
            238.0,
            316.0,
            56.0,
            22.0
          ],
          "text": "jit.concat"
        }
      },
      {
        "box": {
          "id": "obj-10",
          "linecount": 2,
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            313.0,
            316.0,
            199.0,
            35.0
          ],
          "text": "jit.gpu.image @format rgba32_float @name velImg @dim 160 160"
        }
      },
      {
        "box": {
          "id": "obj-8",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "patching_rect": [
            238.0,
            365.0,
            366.0,
            22.0
          ],
          "text": "jit.gpu.image @format rgba32_float @name posImg @dim 320 160"
        }
      },
      {
        "box": {
          "id": "obj-c0",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            470.0,
            29.0,
            330.0,
            60.0
          ],
          "text": "Cloth with collisions: Compute's comp.cloth.simulation plus a sphere and a floor. The cloth starts level, pinned at its four corners above the sphere. The shader, clothsim_collide.comp, sits next to this patch.",
          "linecount": 4
        }
      },
      {
        "box": {
          "id": "obj-c10",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            760.0,
            110.0,
            420.0,
            33.0
          ],
          "text": "Collision: sphere x, y, z and radius, the floor height, and the pins. s COLLIDER carries the sphere and floor to the shapes drawn in p rendering.",
          "linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-c11",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            760.0,
            150.0,
            150.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "text": "loadmess 0. 0. 0. 0.5 -1."
        }
      },
      {
        "box": {
          "id": "obj-c12",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 6,
          "patching_rect": [
            760.0,
            195.0,
            294.0,
            22.0
          ],
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            ""
          ],
          "text": "unjoin 5"
        }
      },
      {
        "box": {
          "id": "obj-c20",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "patching_rect": [
            760.0,
            245.0,
            50.0,
            22.0
          ],
          "outlettype": [
            "",
            "bang"
          ],
          "format": 6,
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "obj-c30",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            811.0,
            246.0,
            18.0,
            20.0
          ],
          "text": "x"
        }
      },
      {
        "box": {
          "id": "obj-c21",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "patching_rect": [
            830.0,
            245.0,
            50.0,
            22.0
          ],
          "outlettype": [
            "",
            "bang"
          ],
          "format": 6,
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "obj-c31",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            881.0,
            246.0,
            18.0,
            20.0
          ],
          "text": "y"
        }
      },
      {
        "box": {
          "id": "obj-c22",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "patching_rect": [
            900.0,
            245.0,
            50.0,
            22.0
          ],
          "outlettype": [
            "",
            "bang"
          ],
          "format": 6,
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "obj-c32",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            951.0,
            246.0,
            18.0,
            20.0
          ],
          "text": "z"
        }
      },
      {
        "box": {
          "id": "obj-c23",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "patching_rect": [
            970.0,
            245.0,
            50.0,
            22.0
          ],
          "outlettype": [
            "",
            "bang"
          ],
          "format": 6,
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "obj-c33",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            1021.0,
            246.0,
            18.0,
            20.0
          ],
          "text": "r"
        }
      },
      {
        "box": {
          "id": "obj-c24",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "patching_rect": [
            1040.0,
            245.0,
            50.0,
            22.0
          ],
          "outlettype": [
            "",
            "bang"
          ],
          "format": 6,
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "obj-c34",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            1091.0,
            246.0,
            40.0,
            20.0
          ],
          "text": "floor"
        }
      },
      {
        "box": {
          "id": "obj-c13",
          "maxclass": "newobj",
          "numinlets": 4,
          "numoutlets": 1,
          "patching_rect": [
            760.0,
            295.0,
            224.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "text": "join 4 @triggers -1"
        }
      },
      {
        "box": {
          "id": "obj-c14",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            760.0,
            345.0,
            95.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "text": "prepend sphere"
        }
      },
      {
        "box": {
          "id": "obj-c15",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            1040.0,
            345.0,
            95.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "text": "prepend floorY"
        }
      },
      {
        "box": {
          "id": "obj-c16",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            1040.0,
            440.0,
            24.0,
            24.0
          ],
          "outlettype": [
            "int"
          ],
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "obj-c17",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            1068.0,
            442.0,
            125.0,
            33.0
          ],
          "text": "release the four corner pins",
          "linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-c18",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            1040.0,
            490.0,
            100.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "text": "prepend release"
        }
      },
      {
        "box": {
          "id": "obj-c19",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            880.0,
            400.0,
            85.0,
            22.0
          ],
          "text": "s COLLIDER"
        }
      },
      {
        "box": {
          "id": "obj-c40",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            880.0,
            540.0,
            90.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "text": "prepend param"
        }
      },
      {
        "box": {
          "id": "obj-c41",
          "maxclass": "attrui",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            980.0,
            540.0,
            176.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "attr": "friction",
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "obj-c50",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            693.0,
            708.0,
            85.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "text": "r COLLIDER"
        }
      },
      {
        "box": {
          "id": "obj-c60",
          "maxclass": "umenu",
          "numinlets": 1,
          "numoutlets": 3,
          "patching_rect": [
            279.0,
            708.0,
            100.0,
            22.0
          ],
          "outlettype": [
            "int",
            "",
            ""
          ],
          "items": [
            "front",
            ",",
            "top",
            ",",
            "bottom",
            ",",
            "left",
            ",",
            "right"
          ],
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "obj-c61",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            382.0,
            709.0,
            80.0,
            20.0
          ],
          "text": "camera view"
        }
      },
      {
        "box": {
          "id": "obj-c62",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            553.0,
            393.0,
            200.0,
            33.0
          ],
          "text": "Video on the cloth: drop a clip here and click it to play",
          "linecount": 2
        }
      },
      {
        "box": {
          "id": "obj-c63",
          "maxclass": "jit.playlist",
          "numinlets": 1,
          "numoutlets": 3,
          "patching_rect": [
            553.0,
            430.0,
            200.0,
            62.0
          ],
          "outlettype": [
            "jit_gl_texture",
            "",
            "dictionary"
          ],
          "output_texture": 1,
          "loop": 1,
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "obj-g1",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            330.0,
            100.0,
            100.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "text": "loadmess set 160"
        }
      },
      {
        "box": {
          "id": "obj-g2",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "patching_rect": [
            330.0,
            130.0,
            50.0,
            22.0
          ],
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "minimum": 16,
          "maximum": 512
        }
      },
      {
        "box": {
          "id": "obj-g3",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            384.0,
            131.0,
            190.0,
            20.0
          ],
          "text": "grid size: points along each side"
        }
      },
      {
        "box": {
          "id": "obj-g4",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "patching_rect": [
            330.0,
            160.0,
            40.0,
            22.0
          ],
          "outlettype": [
            "bang",
            "int"
          ],
          "text": "t b i"
        }
      },
      {
        "box": {
          "id": "obj-g5",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            351.0,
            195.0,
            90.0,
            22.0
          ],
          "text": "p GRID_SENDS",
          "patcher": {
            "fileversion": 1,
            "appversion": {
              "major": 9,
              "minor": 2,
              "revision": 0,
              "architecture": "x64",
              "modernui": 1
            },
            "classnamespace": "box",
            "rect": [
              100.0,
              120.0,
              560.0,
              330.0
            ],
            "boxes": [
              {
                "box": {
                  "id": "obj-1",
                  "maxclass": "inlet",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    50.0,
                    30.0,
                    30.0,
                    30.0
                  ],
                  "outlettype": [
                    "int"
                  ],
                  "comment": "int: points along each side of the cloth",
                  "index": 1
                }
              },
              {
                "box": {
                  "id": "obj-2",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    84.0,
                    35.0,
                    330.0,
                    20.0
                  ],
                  "text": "points along each side. Sent on to every box that has a size."
                }
              },
              {
                "box": {
                  "id": "obj-3",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    50.0,
                    200.0,
                    100.0,
                    22.0
                  ],
                  "text": "s CLOTH_GRID"
                }
              },
              {
                "box": {
                  "id": "obj-4",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    50.0,
                    225.0,
                    100.0,
                    20.0
                  ],
                  "text": "the size"
                }
              },
              {
                "box": {
                  "id": "obj-5",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "patching_rect": [
                    180.0,
                    90.0,
                    70.0,
                    22.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "text": "expr $i1*2"
                }
              },
              {
                "box": {
                  "id": "obj-6",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    200.0,
                    140.0,
                    60.0,
                    22.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "text": "join"
                }
              },
              {
                "box": {
                  "id": "obj-7",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    200.0,
                    200.0,
                    130.0,
                    22.0
                  ],
                  "text": "s CLOTH_GRID_POS"
                }
              },
              {
                "box": {
                  "id": "obj-8",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    200.0,
                    225.0,
                    150.0,
                    33.0
                  ],
                  "text": "twice the size, then the size: the position image",
                  "linecount": 2
                }
              },
              {
                "box": {
                  "id": "obj-9",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "patching_rect": [
                    380.0,
                    90.0,
                    105.0,
                    22.0
                  ],
                  "outlettype": [
                    ""
                  ],
                  "text": "expr ($i1+15)/16"
                }
              },
              {
                "box": {
                  "id": "obj-10",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    380.0,
                    200.0,
                    150.0,
                    22.0
                  ],
                  "text": "s CLOTH_GRID_GROUPS"
                }
              },
              {
                "box": {
                  "id": "obj-11",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    380.0,
                    225.0,
                    150.0,
                    33.0
                  ],
                  "text": "16-point tiles per side, for the shader",
                  "linecount": 2
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "source": [
                    "obj-1",
                    0
                  ],
                  "destination": [
                    "obj-3",
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
                    "obj-5",
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
                    "obj-6",
                    1
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
                    "obj-9",
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
                    "obj-6",
                    0
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
                    "obj-7",
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
                    "obj-10",
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
          "id": "obj-g10",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            450.0,
            165.0,
            90.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "text": "r CLOTH_GRID"
        }
      },
      {
        "box": {
          "id": "obj-g11",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            450.0,
            200.0,
            65.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "text": "dim $1 $1"
        }
      },
      {
        "box": {
          "id": "obj-g12",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            585.0,
            100.0,
            120.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "text": "r CLOTH_GRID_POS"
        }
      },
      {
        "box": {
          "id": "obj-g13",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            585.0,
            160.0,
            80.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "text": "prepend dim"
        }
      },
      {
        "box": {
          "id": "obj-g14",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            670.0,
            243.0,
            85.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "text": "r CLOTH_GRID"
        }
      },
      {
        "box": {
          "id": "obj-g15",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            670.0,
            278.0,
            65.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "text": "dim $1 $1"
        }
      },
      {
        "box": {
          "id": "obj-g16",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            600.0,
            515.0,
            140.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "text": "r CLOTH_GRID_GROUPS"
        }
      },
      {
        "box": {
          "id": "obj-g17",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            600.0,
            560.0,
            130.0,
            22.0
          ],
          "outlettype": [
            ""
          ],
          "text": "workgroups $1 $1 1"
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
            839.0,
            500.0,
            300.0
          ],
          "code": "--- CLAUDE2MAX SPEC ---\n{\n  \"width\": 1200,\n  \"height\": 866,\n  \"objects\": {\n    \"obj\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        103,\n        432\n      ],\n      \"text\": \"* 2\",\n      \"size\": [\n        29,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"obj_2\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        103,\n        500\n      ],\n      \"text\": \"% 2\",\n      \"size\": [\n        29,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ]\n    },\n    \"prepend\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        103,\n        528\n      ],\n      \"text\": \"prepend param eo\",\n      \"size\": [\n        107,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"Number\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        103,\n        292\n      ],\n      \"text\": \"Number of iterations per frame\",\n      \"size\": [\n        114,\n        33\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"loadmess\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        103,\n        327\n      ],\n      \"text\": \"loadmess 20\",\n      \"size\": [\n        77,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"number\": {\n      \"type\": \"number\",\n      \"pos\": [\n        103,\n        365\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"parameter_enable\": 0\n      },\n      \"size\": [\n        50,\n        22\n      ]\n    },\n    \"jit_gl_videoplane\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        136,\n        777\n      ],\n      \"text\": \"jit.gl.videoplane @transform_reset 2\",\n      \"size\": [\n        201,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"jit_world\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        41,\n        91\n      ],\n      \"text\": \"jit.world @size 540 800 @floating 1\",\n      \"size\": [\n        197,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"bang\",\n        \"\"\n      ]\n    },\n    \"attrui\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        41,\n        55\n      ],\n      \"size\": [\n        86,\n        22\n      ],\n      \"attrs\": {\n        \"text_width\": 58.0,\n        \"attr\": \"enable\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"parameter_enable\": 0\n      }\n    },\n    \"1\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        41,\n        29\n      ],\n      \"text\": \"1) Enable\",\n      \"size\": [\n        60,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"Reset\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        154,\n        175\n      ],\n      \"text\": \"Reset ->\",\n      \"size\": [\n        54,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"button\": {\n      \"type\": \"button\",\n      \"pos\": [\n        211,\n        173\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"parameter_enable\": 0\n      }\n    },\n    \"loadmess_2\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        527,\n        204\n      ],\n      \"text\": \"loadmess 6\",\n      \"size\": [\n        70,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"p\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        136,\n        740\n      ],\n      \"text\": \"p rendering\",\n      \"size\": [\n        571,\n        22\n      ],\n      \"inlets\": 4,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"jit_gl_texture\"\n      ],\n      \"patcher\": {\n        \"width\": 1367,\n        \"height\": 898,\n        \"objects\": {\n          \"outlet\": {\n            \"type\": \"outlet\",\n            \"pos\": [\n              367,\n              782\n            ],\n            \"inlets\": 1,\n            \"outlets\": 0,\n            \"outlettype\": [],\n            \"box_extras\": {\n              \"comment\": \"jit_gl_texture: the rendered scene\",\n              \"index\": 1\n            }\n          },\n          \"jit_gl_node\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              249,\n              339\n            ],\n            \"text\": \"jit.gl.node\",\n            \"size\": [\n              60,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 3,\n            \"outlettype\": [\n              \"jit_gl_texture\",\n              \"\",\n              \"\"\n            ]\n          },\n          \"anim_reset\": {\n            \"type\": \"message\",\n            \"pos\": [\n              24,\n              456\n            ],\n            \"text\": \"anim_reset\",\n            \"size\": [\n              68,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"jit_anim_drive\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              52,\n              498\n            ],\n            \"text\": \"jit.anim.drive @ui_listen 1\",\n            \"size\": [\n              145,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"\",\n              \"\"\n            ]\n          },\n          \"jit_gl_camera\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              24,\n              532\n            ],\n            \"text\": \"jit.gl.camera @locklook 1 @tripod 1 @position 0 0 5\",\n            \"size\": [\n              285,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"jit_gl_texture\",\n              \"\"\n            ]\n          },\n          \"jit_submatrix\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              403,\n              349\n            ],\n            \"text\": \"jit.submatrix @dim 160 160 @offset 0\",\n            \"size\": [\n              209,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"jit_matrix\",\n              \"\"\n            ]\n          },\n          \"jit_gen\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              703,\n              172\n            ],\n            \"text\": \"jit.gen\",\n            \"size\": [\n              41,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"jit_matrix\",\n              \"\"\n            ],\n            \"patcher\": {\n              \"width\": 600,\n              \"height\": 450,\n              \"objects\": {\n                \"obj\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    76,\n                    269\n                  ],\n                  \"text\": \"* 0.5\",\n                  \"size\": [\n                    33,\n                    22\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"max\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    76,\n                    200\n                  ],\n                  \"text\": \"max 0\",\n                  \"size\": [\n                    41,\n                    22\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"obj_2\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    76,\n                    161\n                  ],\n                  \"text\": \"- 0.3\",\n                  \"size\": [\n                    33,\n                    22\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"swiz\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    177,\n                    197\n                  ],\n                  \"text\": \"swiz r\",\n                  \"size\": [\n                    39,\n                    22\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"obj_3\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    177,\n                    226\n                  ],\n                  \"text\": \"> 0.3\",\n                  \"size\": [\n                    36,\n                    22\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"obj_4\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    76,\n                    354\n                  ],\n                  \"text\": \"+ 0.6\",\n                  \"size\": [\n                    36,\n                    22\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"obj_5\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    329,\n                    271\n                  ],\n                  \"text\": \"+ 0.5\",\n                  \"size\": [\n                    36,\n                    22\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"obj_6\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    329,\n                    233\n                  ],\n                  \"text\": \"* 0.5\",\n                  \"size\": [\n                    33,\n                    22\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"clamp\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    329,\n                    200\n                  ],\n                  \"text\": \"clamp -1 1\",\n                  \"size\": [\n                    65,\n                    22\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"obj_7\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    329,\n                    161\n                  ],\n                  \"text\": \"* -2 3\",\n                  \"size\": [\n                    37,\n                    22\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"snorm\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    329,\n                    129\n                  ],\n                  \"text\": \"snorm\",\n                  \"size\": [\n                    42,\n                    22\n                  ],\n                  \"inlets\": 0,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"in\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    50,\n                    14\n                  ],\n                  \"text\": \"in 1\",\n                  \"size\": [\n                    28,\n                    22\n                  ],\n                  \"inlets\": 0,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"sample\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    176,\n                    149\n                  ],\n                  \"text\": \"sample\",\n                  \"size\": [\n                    47,\n                    22\n                  ],\n                  \"inlets\": 2,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"out\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    176,\n                    418\n                  ],\n                  \"text\": \"out 1\",\n                  \"size\": [\n                    35,\n                    22\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 0,\n                  \"outlettype\": []\n                }\n              },\n              \"connections\": [\n                [\n                  \"in\",\n                  0,\n                  \"sample\",\n                  0\n                ],\n                [\n                  \"swiz\",\n                  0,\n                  \"obj_3\",\n                  0\n                ],\n                [\n                  \"obj_2\",\n                  0,\n                  \"max\",\n                  0\n                ],\n                [\n                  \"max\",\n                  0,\n                  \"obj\",\n                  0\n                ],\n                [\n                  \"obj\",\n                  0,\n                  \"obj_4\",\n                  0\n                ],\n                [\n                  \"obj_4\",\n                  0,\n                  \"out\",\n                  0\n                ],\n                [\n                  \"sample\",\n                  0,\n                  \"swiz\",\n                  0\n                ],\n                [\n                  \"sample\",\n                  0,\n                  \"obj_2\",\n                  0\n                ],\n                [\n                  \"snorm\",\n                  0,\n                  \"obj_7\",\n                  0\n                ],\n                [\n                  \"obj_7\",\n                  0,\n                  \"clamp\",\n                  0\n                ],\n                [\n                  \"clamp\",\n                  0,\n                  \"obj_6\",\n                  0\n                ],\n                [\n                  \"obj_6\",\n                  0,\n                  \"obj_5\",\n                  0\n                ],\n                [\n                  \"obj_5\",\n                  0,\n                  \"sample\",\n                  1\n                ]\n              ],\n              \"patcher_extras\": {\n                \"rect\": [\n                  1147.0,\n                  386.0,\n                  600.0,\n                  450.0\n                ]\n              }\n            }\n          },\n          \"loadbang\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              703,\n              24\n            ],\n            \"text\": \"loadbang\",\n            \"size\": [\n              58,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"bang\"\n            ]\n          },\n          \"fpic\": {\n            \"type\": \"fpic\",\n            \"pos\": [\n              703,\n              57\n            ],\n            \"size\": [\n              100,\n              100\n            ],\n            \"attrs\": {\n              \"embed\": 1,\n              \"data\": [\n                27288,\n                \"png\",\n                \"IBkSG0fBZn....PCIgDQRA..APO..D.8HX....vxV+sh....DLmPIQEBHf.B7g.YHB..f.PRDEDU3wI6ceGdTTs9G.+6ta5cBjdnFZI.oQWADEgqP.jlMPP.Qf.hbsRyq0edUubscEIIDPQDP.on.A7ZAPPJJsDHz6sPBsPHj5lr6u+Xu6JnPxL6NyN6N62OOO7nPNy47FH69tmYNm2ild26daDDQDQjSMsJc.PDQDQ1NlPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.2T5.PsPiFCXxS94QG6XmfGd3A..dtm6YwEtvEU3HqlcwKdAL4I+7nO8o2ve+C...ETPAXBSXBJbjUyNxQNDF4HGEdhmXnHpnhB..kVZoXUqZkXkqbUJbzUypacCFSZRSBsoMwa4O6W9kMgYNyYBO8zKELxpcSdxOG5V2tOK+98u+8gO8S+Tb0qdMELppcm9zmDaYKaE93iO..37m+7XgK7qvBVvWhXisUJbzUy5XG6.dkWYJ..n3huAV25VG93O9iQjQFkBGY0rHiLb7rO6j..PSZRLXG6XG3i+3O..5T1.SESCKrL1tt0sthINwmE95qu+ku1O+y+LF4HGARHgjTfHq1kYlYhHhHh+xe9gNzgvi7HCFMpQMQAhpZ2+2+2+GRLwDuiesANvA.85qxNGQByQNxgvwN1Itqe89129ZGiFw4dtmNioO8YbG+ZKXAeIV1x9F6bDIL94mOXNyISDP.A9W9Z+1usCL4IOY..Tu5Eh8NzpQm+7mCKe4q.MsoM8N90lwLlN..t5UKzdGZ0n8surw7m+BvC7.Ove4qUbwEiO9i+HLm4jA.fC66K5rh2xchHhHU.NCcaP94mG..10t1SM1tBKrPL3AOP3iO9YOBqZU1YuG7Vu0aC.fQO5m9t1NCFLfm64lDN8oOi8JzpU0u9QC.fzRK8ZrcKdwKBKdwes8HjDjBJHe..rks7qvKut62V8byMWL0oNU6UXIXyd1yFMnAMnFaSKaYK..PSaZyrGgjfLwINAz6d2GA0VGo6NRRIkHdq25sgFMZp019QezGhe9m2fcHpDhpwBW3WifBJnZrU+7O+S..3i9nO1dDTtL3yP2FT+5WeA0Nu7xK7fOXOw1111k4HRX7yO+tsmC5ciFMZPe5SevrmcZ1gnRX5Uu9aBpcOzC0aGpD58rm8D.nFSlC.z5V2ZTPAlV2EgE1e8QgXuoWek..0Zxb.f669L8yTW3B4IqwjPjc1l9P1cu62uBGIVmTRIEAkLG.nac69bXRn+.OvCVq+LN.P6aeGrCQiqGlP2FDbv0UPsyM2zgF1vF5vjPWmN2P8pW8p01oQiFz3F2X6PDIbgFZnBpcAFXf3nG8v..n4MukxYHIHgGd3BtsMqYllg6MtwMkqvQvhJpHEbaiIlX.fiQB85Tm5..XYAp5rIzPCSvs07csxQPngFJzps1eRtADP.1gnw0CSnaCzoSnqVSMB5SsZunQCDzK5..7xKuk4nQbzoS3K6CGoXWqVguxd81aSqDaGgD5VSb6HPLwsiHg95S.3PsyHzpUqfuyBjziKJNhHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREfIzIhHhTAXBchHhHU.lPmHhHREvMkN.blYznQA0NsZ0hF23lfXhoIxbDILcric.d5omBpsAFXfNLwsmd5ABMzvDTa0nQCdzG8QA.vku7kkyvRPZcqasfaa26d2A.vt10tjonQ3ZW6ZufaaaZiouGO9wOlbENBVm5TGAfoeNPnhM1VhJqrR4JjDk.BH.A2Vu7xKGlWi1rl0LnUKmmnRQSu6cuEVVIxhhKtHz111N7POTuA.Pu5Uup0qo7xKGEUTQxcnIH5zoC0qd0SPs0fACNDIDAL8ly0oN0A..t6t60Z6uxUtB..pt5pk03RH72e+A.fO93Ss1Vy+bR4kWtrFSBgWd4E.L8A6pMkVZo..n3hKVViIgPmNc..B9myA.tzktjf+P5xsPBIDQkXrfBJPFiFgKf.B.d4kWB9CR8bO2jvd1ytQPAErLGYtFXBcAH6r2CRIkT..Pe6a+Q8qezHrvB2xaVHjjKDQDc6xKuKfBJn.blybF7se6p..vUtx0T3nx4Eu2HDQDQp.bF5BvTm5TPLwzT..DZngZ414QDQjsq5pqF4me9..3XG6XX9y+y4L0sBLg9cg2d6IlwL9GnMsoMLANQDYmsicrc7Zu1qAO7PXKfWh2x8+hniNRDczQhYMqOCIlXhLYNQDo.5Tm5Ll8rmM72eeg+96qRGNNE3LzuEwEWKwLlw+..BaU8RDQj7x7sh+e7OdUbwKluBGMN13Lz+eBO7Pw+3e75Hv.CjIyIhHGDgGd3H7vCGuwa7lvau8RoCGGZLgNQDQjJ.Sn++75u9aZo3ePDQjiknhJJ7FuwahhJ55Jcn3vhIzAvYNyoP8qe8U5vfHhnZPqZUqvLlwLT5vvgEqk6.XZSa5V00YtLQt+8uOb1ydVbsqcMbiabCTUUUIkgGQD4TyM2bC96e.nN0IHT+52.DSLw..wUy5MqW85ugYMqOSpCQUAW9D5MpQMDCYHOhnutadyahMrgM..f4N2LwYNyoQgEVHhO9Dk5PjHhb5kSN6EAETPngMrAnYMqE..3Mey2RzI00pUKzoSKptZCxQX5Tykcaq0rlYpxu8Nuy+TPGXFlsyc96XJSYJvGe39hjHhrUkTRw3+6+6cv8ducQvWy0t10vS+ziB..50q7G9RNJ3yPmHhHREvk8VtOrg8j.3ONdHqM+9u+a..X7iebHxHiV1hKhHxUhu95Od1mchHiLlC..5PG5XsdMADP.Xjibz..HyLyTViOmItjIz0pEHxHi3+8+W62jhyblyfW3EdA..lLmHhjXQEU8wK7BOO..V3BWDZTiZbM1d2byMzl1zZ..bwKlGhHhHk8XzYfK4sb+du2t.+8O.3u+BawX7lu4affBpNHnfpiLGYDQjqofBJXDTPAi29seaK6fnZt8ldO4t28tK+AmSBWtD56aeYiN24NC+7yO3me9Inqw7samHhH40u+6+F15V+0ZscADP.Hf.B.8nG8vNDUNGj7U49PG5Sf9129h.BPcTOzqpppv.Fv.T5vfHhbYDSLMAexm7eT5vPRbsqcMr5U+cHiLRG0stgHqikK2LzIhHhTijzD5QEUDXnCcXplYmC.bhSbBkNDHhHWJG3.GPoCAISvAGLF4HGEV1xVtrOVRVB8abihvLm4GHUcmCi8su8ozg.QD4RofBJPoCAIW8qe8wQO5Qj0wPxRn+ce2psp5xqitibjCqzg.QD4RogMrQJcHHKV9xk2YoKYIzUiIyA.JqrxT5PfHhHUfPBITYs+4hhiHhHREPxRne3CqNu0zBo.GPDQDUaN5QOpr1+RVB84Mu4JUcEQDQjpSFYjlr1+RVB8idzigssssJUcGQDQjpxMtwMk09WReF5SbhSPJ6NGB7VtSDQjs569tuU1GCI8zVKpnpO5W+5KdvG7AQbwEG..7wGekxgvl07l2bDRHxa42iHhH6ipqtZje9WDm9zmQoCkayMtwM..v91WN36+90Ce80eYeL4pbmHhHREPxOOzMZD3G+weB+3O9SRcWKId3Gt+XDi3ofmd5oRGJhV1YuGDZngA.fjRJIDarwB2c2c..TYkUB.Skp1cu6cgKdwKhDSLYEKVIhTdYm8dPjQFIZaaaGZRSZB..7vCO..fd85wAO3AQ1YuW..TPAWBIkjy26YTd4kiku7k6vlyA.1kYmCHCIzcz4r7LwKoDSKdhG5gdHLjg7HHlXhwp5myctyA.SO+lku7kC+7y97CVDQ1O6cu6FsnEsDO1i8Xn+8+gA.PDQDgU0WG+3GCKYIKA+3O9C..ve+c7OaNbVdec4lKWBcMZznzgPM57m+r3gdndiQNxQA.fV1xVZS8W8qe8A.vy9rSBCbfCDYjQFXsqcsHxHixliUhHGCSXBSDOyyLVDZn1dkHqoMsY3Ue0+gkiM54O+4i0strPSZRSs49ljWtbIzcz8Fuwah9zmTrbawjRQEUz30dsWGsu8c.ewW74..nxJ0K4iCQj7au6cO..39u+6GScpSC5zoSR6+V251..f+u+u2AIkTxXQKZgPqVocLjJN5STydgIzqE1yePoEsn4X.CXfx5X3latg9zm9fl0rlA.fd1ydfDRHIYcLIhjVG5PG.idziF..iZTiVxSleq7xKuvvF1vPqacqvLlwqJaiCY63pbmHhHREfyP2AP6ZWaA.v3F23sKimNc5PKZQK.foOc+7m+Wf3iOQ6xXSDYaNxQNDF6XGGdpmZj..HrvBytLtwGeBn4M2zc16nG8X1kwjDGlPWgEWbwhm4YFK..BO7vsaiq4Gkvy7LiEEUTQ3Dm3j1swlHx5r28ta7zO8XvHG4nraIxMSiFMXhSbh..3e8u9W3BWHO653S0NdK2UP0st0AidzOMhHhHPDQDghrvNhJpnv3F23f2d6kcerIhDmd269fwLlmQRVM6ViF0nFiF0nF++lDhAEIFn6NWtD5he6JJO6uwhJpPLpQMZzrl0LnUqVnUqx7OEZ0pEsnEsDiabiGW4JWBW4JWRQhChn6tRJ4lnjRtIlvDl.pe8quhspt0oSGzoSGRHgDvXFyXwYNyoTj33Oi6CcSbAuk6FE0+3KW+bx7l2Wfl27lK5qybre3CeXrt0kEN9wONppppr7Lw6YO6EhO93AfvWg95zoCO3C9fV5im7IGpSQwjfHWEqYMqE..94meh55L+9EYmc13m9oeD.lNStuxUtB5RW5B5W+5GZVyL89Ph4CI3t6tiALfAfHhHBL8oOM3s29Hp3RZwj4l4xMCchHhH0HWvYnq7EgfCbf8K5YmavfA78e+5wrl0mB..sZu8+o6hWLe..roM8Kn7xKCO6y9r39tuti5Tm5H3wvbUkaPCZvNz0EYhbkbnCc.QOyb.SmBYqXEKGyd1eF7yu.9Ke8MtwMgMtwMAc5L89gol5DPW5RWE0XkbxIit28tie629cQGeRGVTYLyEbF5J++3Ge7IHp1WYkUhbyMWL6YmFzp0s+Rx7+Lu7xaL24NOLko7xPud8PudwUM3djG4QDU6IhjOwEWrhp8UVYknxJqD6bm+NVvB9p6Xx7aU0UaDUWsQLqY8YXZSaph58Kb2c2wC9fOnnhOR93xkP2QnBA1912dA21pppJr28tWL0oNEQON4kW9H6r2KxN68hpqtZAecrNuSjiiAMngH31VUUUgsu8sgsu8sg+9eexhdrN0oNMxM28Kp2uHwDU9JMoReWWcT3xcK2UxUCYd4cA..zktzEAeMm+7mCYlYFVcMT9e+umI..9fO3CQzQWeqpOHhTFG5PGD+s+1bDTaMZzHN4IOAd228eB.f5UOqaqs84e9mioLkoH32uvau8FG8nGA..Mu4svpFSaEWk6l3xMCchHhH0HWtD5h8VyHk2JmvBKTDVXgZ4TLplTZokhRKsT7S+zOg7y252a3kTRYnjRJCqYMqQT2FsSeZV43HRo0pV0JDYjQJn1Vc0UiErfE.2byC3laV+o03pV0Jwl27lQ4kWNJu7xEz0Tu5UOTu5UOqdLsU7VtahKWBckTCaXiPCaXiDzO3egKbAbgKbArzktDIYrmybx.EVXgBt8B4CcPDIu5bm6rfa6oN0ovhVzBs4wLwDSFe629snfBJ.ETPAB5ZpW8pKpW8pqMO1jsgIzsSNvAxEcsqcCcsqcqVa6MtwMv7m+Wf4O+u.d5o2Rx3GUT0GSaZSUvsu+8u+Rx3RDY85W+D9qCG+3GKZUqjlOHdokVFV0pVIV0pVIJszRp012t10dzt1I7E6qTiOCcSXBc6DsZ0Bu81a3s20dBZ850iKbgyiKbgyKowvAO3ADbaiJJtR2IRoIl8D9oO8okzw9Tm5T3Tm5TnxJqrVaq4a4991W1RZLHT7VtahK3pbWzWgjLtZz.nUqv9gtpqtZTTQEIIi6s5bm6bBts0qdgH4iOQj3HlDUwFaqjzwtfBLUrpzqupZsslKfUt4lxjRgyP2DNCchHhHU.WtD5h+NyHM2JGCFLfJpnRTQE09suRqVMvKu7Fd4kz77yMyc2E9JeUn2MAhH4SEUHrUYN.Pt4tOIcrcyM2gat4tftKAZznQQus27VtahK2sbWoXvfATVYkJn1pSmaVVI7EW7MkrXHpnD11eQpGWhHqyMuovecnP2daBUHgX5wtIjaidIkXZgyIlsFKI8XBc6D850iqd0qJn15kWdg3hKN.XpTLJU5XG6jfaad4kmjMtDQVGgtsw..Ze66.NwIjt5GQqZkomIuWd4Us11qbkq..f1zFwcNUPRKWta4tRIojZqk8VdswKu7BsqcsCsqcsCYm8djrXne8qeBtsG+3GSxFWhHqyINwIDbaSIkTjrwce6KajTRIgjRJIAkP+bm6bhZQ2RxCWtD5J4hg7rm8r3rm8rnhJpnFamFMZPjQFEhLxnvC8P8VRF6JqrBzoNI7hTw91mz973HhDuCb.guUSum64dQIkTrjLt8qe82x6AIDm+7mGm+7R61rUL3pb2DWtD5DQDQpQtfIzE2mjSJ+je4l69Qt4terhUrhZssQEUTHpnhBevG7gn289gvgO7Aspwr6c+9P2698gUspuEd3gvWk6W6ZBuLwRDION24NO18t2kfZqe94GVyZxBctycBctyBe8x7mMfA7v38du2GQDQDHhHhPPWSt4lKxM2bs5wjjFbQwYG0zl1b..r8suMLzgNTAcMAFXfXfCbPnnhJBaaaaWTiWt4tOLu4MO..3qu9JtfkHxgvpV0pPaaa6DTa80WewnF0nAfoRH8ANf3lHvINwwP+5W+g+96ufulhJ55nksLVQMNj7vEbF5Ju8t28Jp1GYjQhQMpQiqcMgsJ4A.t10tJlxTlJBMzPQngJtyE4CcnCIp1SDIe1vF9YA2VMZzXYl0SZRSBETvEE70VRIEiW4UlBBKrvDU7sqcIr6f.I+3LzU.AETcPYkUlfpq6lEQDQfYMqYgst0sB.f8rmciCdvChKcoKCiFMhHhHb..zhVzRz111VzwN1QDarwYUEbgksrkJ5qgHRdblybFQ0dyulOpnhFe7G+evu8a6.6YO6FG8nl14JETP9nMsIAbsqcEzpV0ZjbxIC.f64dtGDSLMUTi0MtwMvO9i+nntFR93xkPWIOOzuU6ZW6BcsqcUTWSxI2Vz7l2B..L3AOXbyady+WkmyH7zSSasDe80WDXfABe7wGnUq3tALl+j1+vO7CnN0IXQcsDQxijRpsVtqYwFqvu01ZznActycFwGe7nnhJxRweohJp.50qG96u+ve+8GADP..v5drb6XG6.+7O+SHrvD1yZWtvJEmI7VtSDQDoB3xMCck5zV6OacqKKDWbwg5V25Jpqy7wonXNVEEhxJqLrvEt...N6bhbvrnE8U..3Mdi2RTmnYZ0p0xLwkZ4k2EvZW6pU7YmCv8gtYRdB8G3Ate7nO5ihfC1wLofGd3ondAgb8yIKdwKBIlXhXvCdHJ1QN3sZIK4qQVYkE..ZQK3JVkHGIqd0qA.ldraCZPCVgiFfxKubrt0sNbxSdZkNTfu95Kl3DeVL1wNVkNTtitxUtJVxR9Z7oe5+AIjPRx5Xoo28t2RVJqhKtH7K+xVjptygvzl1Tw92u7r+JyO+7vrl0mYoFqqDOGHCFLfMu4Mi+w+XFHv.qiccraXCa.dxmb310wjHoR4kWN9fO3CrqiY0UqGuy67tHojRRQd+ByG9JaZSaDSZROKZRSD2hnSLV6ZWqr02Jgicrigm+4edYcLjrD5csqcESYJSQJ5JGJxYBcypScBD..ScpS2xAhfbSud8..XLiYz3pW09UDYbyMc3C9fODMoIMgKjExomQiFwwN1wvK7B+cXOWRRMsowfINwmE..MoIMA5zoS1GSiFMhTRoO..PqV4e7TaIzA.d4W9kvgNzgks9Wx9IvAMnAJUckCE6QRmBKrHTXgEgoO8ogxKW3m+wVqRJoDroMsIroMsI6Vxbu81K3s2dg24c9mnwMtwLYNoJnQiFzzl1T7tu66AO7vM3gG1mGe1wO9IvLm46iYNy2G6bm+trOdEWbwXSaZiPqVc1kj4pUCYHCQV6etJ2IhHhTAjrONYngJtpKD8WUc0FvW9kyG8rm8BMoIMQVFiyblyf0rlUaojvFUTQKKiye1LlwL.fo8QqX2e7D4HSqVsHt3ZElwL9G..38du+IJqrZ9DUTJjWd4C.foMsogktzkI5JBYswfAC..3vG9vXcqKK7Ye1rPqZUajzwvUSiZTij09WxRneoKU.BLv.kptyk0ZVyZwN24ui91WSmc4IjPhnAMnA17yH6Dm3DH2b2OV6ZWCt3EKvtkHG.HnfB.wGeB..LYNoJoSmNjXhIB.fW4UlJdy27Msaisu95Gd228ehd26di1zl1fHhHRap+zqWON0oNE18t2M..9tuaU3l2rTlLWBH2G5URVB80st0gIO4lKUcmCCkX+Mle9WBu5qZZFsIkTRnCcni39u+6Gst0h6ET50qGok1rAfoJ5z91WNnQMRdl4+cSPAEHdgW3EYhbR0y7G5N4jSF95qOnjRJ0tM1G6XGG+5uNcjPBIhN1wNB.ft28til0Lw8dxkUVY3+7e9OX26dWH6rMclSz7l2RIOdcUsl0rZYs+krU49oO8ovZWaVx9sTvdydrJ2qM6aeYi3hKNL3AODzfFz...T25VO3u+9YYwkUc0lt8X27lEiqbkqfyblyhCe3Cgu4aVF.LU9Hs272eewTlxzP7wGOSnStT18t2Ed228ehxKuR69XefCX58qhO93w.Fv.PzQWeT25VWK0Fj5Tm5f.BH.bricTTXgEhKcoKA.SONtibjifScpSa2i46D03pbO1XaAhIllIa8OeWVhHhHU.IsvxDRH0EewW7kRU24PvQXF5lcnCcPDP.lJgid6s2vc28.l28Wlez.UVYknrxJC23FEi3hy9rm1+y71aSGTLu9q+FHt3hiyNmb4Tc0Ui8u+8iW+0es+2u2fhDGG4HGB96u+vKu7Fd4koWW5kWdBO8zKTXgWCkWd4nzRM8nAtwMJVzOVO4jZaF5m6bmEol5Dj0wPR2zjW9xWEyadyEcricBwDSL..h5HBkpYwFabJcHTqzoSKd2288.foBdASlSthzoSGhO93wLm4+F..O2yMI3lata2ii6VYbVu9pfe9E.7yu.ryQjqCymtcG6XGC6XGaGKcoKA95qzWS8uURdUPXUq5awpV02J0cqj4Aevdfm4YFqUcTAR0rEtvEhfBJHq5Zu5UMUui+ge3Gj3nhHow.Fv.vfG7PrbbiVazpUKZdyMsnz99u++hqd0qh9129f5V2PjyvzkSwEWLRO8zvu7KaVoCkZjbmLGvE7zVSiFwMiQVQyDF85qvpRlWXgWC..Yl4bvu9qaUpCKhjLqXEqDkVZoX3CeD..BNwtY0st0EYk05wHFwHjiviHWuD5jzSmNsHyLst0NQlYlI..SlSNEV+5+dKOFogMrgg.BPb0difCNXnWekvc28PNBOxEGe.mDQDQp.bF5jUy7pY+8du2GgGdDh95KrvBwl2r5531kT+xJq0A.S6rjILgIJ5q+S9j+ClxTdY..Tc01+BWEodwD5jUwe+8Cu5qZp1UaMGEpW8pWEyYNYHGgFQ1EqacqGCaXOonK40Mu4MGu4a91..3se62DUTgd4H7HWP7VtShVfAF.lxTlJhM1XQrwFqnSleoKcI7Ye1rvV251joHjH6i4Mu4hBKTb0masZ0h3iOdDe7wioMsY.e7gasWRZvD5jn8hu3KYobtJ18Yd94mOl0r9T76+9NkoniH6mMrgMh4LmLvUu5UE00Y90NIkTR3Udko.+7iaiVx1wD5jnDP.9gDSLQQmH+hW7h3hW7hXVy5Sw7l2bkoniH6uYO6OCYjQ53pW8phNwtNc5PxImLdoW5kkonibkvD5DQDQp.LgNUq71auf2d6El4LmIVzh9ZQO677xKOzgNzNzgNzNjc14nHm7aDIWZSaR.aaaaGsu8sEsu8sEuy67+IpqWqVsncsqc38du2CZ0pAZ0xhYEYc3pbmpQZ0pA+6+so5QcCZPCE8BfK+7yGyd1eFRHgjjiviHGFwEWqA.PFYjARM0TQvAWWQd8wgO7C+P..jZpiGd5IWrbj3vYnS2UUTQ4Xdy6yQCZPCspj4W9xWFok1rQ1YmiLEgD43I93S.yctyEW+5WWTWmVsZQLwzTDSLMEe4W9U35W+ZxTDRpULgNcGUd4kg0rl0hPBIDnQiFQkL+5WuPb8qWHlybx.6d26QFiRhbLs4MuE7ke47QwEWLJt3hE70Y90ZQFYjX8q++hBKTbKxNx0Fuk6zczxV12X47SVLJrvBQFYjN..1912gTGVD4z3G+weBt4lo2hc3CeDh9vbwe+8GqbkeKFwHdR3t6dJGgHoxvYnSDQDoBvYnS+Ed5o6H3fCVzW20u904wfJQ2h0u9uG.ld93O4SNb3u+h6LwNzPCEYjwbvy9rSRNBORkgIzIK7yOe..rTmoEqLxHcrks7qRYHQjpPVYsNXznQL7gOBQkTWiFMngMrQvKuLcbqVd4UJWgHoBvD5DBJn.wK9huDRLwDA.rpslVFYjN14N2kbDdDoJrt0sdrt0sdrfE7khZKsoQiFrrksb..r28tWLyY9uvMuYIxUXRNwbASnyiqvaUfA5Od4W9kQ7wmfnSjetycN..jd5ogbxYexQ3I4zpUKdrG6w..PPAEzs80h8jMmK...H.jDQAQUKszThPhbwjQFYfwLlw..fPBITAcMlKlSIkTR3kdoWFu268O4r0o+Btn3HhHhTAb4lgtQihaF5hs8Nal3DeVjPBIJ5q6rm8rXVy5SA.vAO3gj5vR1LxQNR3om24s.TpolJ.3L0I4UFYjNpt5pA.vXG63PngJrYoCXZl5ImbxXBSXhXpScp..HzPCSVhSx4iKWBc510111NQeMm6bmCyZVeJV7hWD..RLwjk5vR1b2Rleqdlm4YPlYlocHZHWQst0wiO+ymmkeu0jTuyc9dP26d2Afy0GnljW7Vt6h5zm9T3zm9TBJA2e1rl0mhEsnEhDSLYmpj4O4S9jBpct4laVlsNQxg3hq0Ht3ZMl27lGxLy4fKe4KKpq2au8FcpScBcpScBG+3GUlhRxYiKWBcwtvuTq7xKOgWdI9j4W7hWDG3.Gzo7DSSr6A3TSMU3iO9.e7wGYJhHWcspUsFae66vR0UTLhLxnPjQFE71adHtPl3xkPGPbIzUqe..MZzBMZD2+7ekqbELm4jgLEQNldpm5ovS8TOkn+v.DIF6XG+FJpHwcXt3t6tC2c2cQ+5XR8h+j.QDQjJ.SnS0phJpHTTQEg4LmLbYKdLB84uSj0ZAKXA3l27l3l27lBp8Zz7G+hH.lPmDfBJn.TPAEfEsnEpzghUyc2c2l6iTSMUq5DniHgXIKYI3RW5R3RW5RJcnPNoXBcxkPDQDgjzOiZTixRU6hHhbjv8gN4RPpRnC.LtwMNjSN4..fssssIY8KQDYK3TMHWBR8sJOgDR.IjPBRZeRDQ1BlPmHhHREfIzIWBgGd3xR+N9wOdYoeIhHwhOCcxkPvAGrrzuZznAO8S+zXdyad0diIEyvF1vP.ADvs8mkWd4gu669NEJhHR5wD5DYi7vCOvPG5PwhW7hU5Pg9SpoZxejQFIRM0Tgd85A.vbm6bsWgEQxBIOgdYkUB5cu6CBHf.k5tVRzwN1Q3gGdnzggC.08wBq8VfAFH5W+5GVyZViRGJt7D6Aqi4ZTPpolJl6bmqkD7N5LexNqxOgmqUd4kmnG83AQfAFjRGJ2QEV30v5VWVve+k+bhRZB8INwIfd269HkcohSsednS+Uomd5V0yFO5ni1Rs+m+bixn28t21z0OlwLFjVZoIQQCYO3t6dfjSNYjbxNtm7iSYJSE50qGCbfCTVGGtn3HhHhTAjrD5AGbcTcyNGP8dZqY5TmSs98lswnQiV8hba7ie7X7ie7bOpq.F1vFFZTiZjM2OMnAMv1CF6.VK2ct3t6tihJpPYcLjrD5icriSp5JhTbUVYk3F23FV80eO2y83zjXPMnScpS+kUwt0pm8rmRR+Pze13G+Dj09WxdF5st0sVp5JhbHrnEsHDRHg..fgLjgH5qOkTRAe0W8UB9zyhDuwN1wB..c5zIY8oGd3AznQiC+5fvAO7n6f10t1hu9q+ZYq+krYnWQEUHUckCEG8WTa8LBtR2qcW9xWFW9xWFFLXvpt9gO7gKwQDA.3u+9iTSMUnSmNIMYtYwDSLRdeJWTsuEkJjNcx6NEmKJNhHhHU.IKg9d26djpthrK3hhSLxHiLr5qUr6KZplMzgNT7jO4SJqiQSaZSk09WJvEEmymcsqcJq8ujkPOyLyDkTRIRU2QjCmzRKMbjibDq5ZMu52IaSpolJBLP4u.cTu5UOYeLHWOYl4bj09WBeF5UhEsnEJUcGQNj1vF1.xO+7E80oQiFnQiFLxQNRoOnT4ZUqZERM0Tsq2oCmkpEG47n7xKGd6sux5XHoOg9Uu50fkrjuF0oNACsZcLe77iXDi.8rm8RvmO1p28gNYsV0pVEBJHSkYxm3IdBQcsd6s2H0TSkUiLAPiFMXbiabRxqASKszD0GH3RW5R17XJ2Xoe0jxJqLr90uNYc0iaKpt5pvUu5Uc9J8q..93ienhJpTp6VIyIO4oP0UWsRGFjStqe8qC..CFLXUe30t28tiMsoMIwQk5hT8HJrlhDz4N24jjwVNY9y43pOmipppJbhSbBTVYkqzgxck8HYN.Wk6DQDQpBLgNQ1.qc0uGarwJwQh5gT97xyJqrPkUVIBN3fE004LLCch9y34gNQ1Hq8zYybRK97zM4we7GG0oN0wl6GiFMhzSO8a6OqacqahpOTqEJKRciyPmHajQiFw7m+7s5qO0TSUvKRS0nPBIDjZpoJIIy2zl1zeIYN.PDQDgM22D4niIzIRBTVYkYSypaTiZTNr6LD4l0Tm7uSxImbvgNzgr49Iu7xSBhFhr+bMeGDhjAe9m+41z0Otw45bhEVu5UOI8Ykmd5oissssII805V25jj9gH6MlPmHhHREfKJNhjPlWfaOvC7.nEsnEh95cEJ5L8nG8.Mu4M2l6me3G9AbhSbhZschcAwwpDG4rhIzIRFrgMrAr0stUL5QOZQesp4U+tTbK1KszRwW9keofaeqZUqr4wjHmA7VtSjLohJp.kWt0W8pTKmRaMrgMDMrgMTR99wfAChJYt0z+D4rhIzIRF8EewWXSWepolpnKJJNJhLxHQpolJ5Se5C5Se5ijzm1xwXqPr0stUYs+IRNwa4NQxLwdvf7m8XO1ica+9u9q+ZK0RdGIwGe7..3du26UR62CcnCY0089G9geXQ09byMWqZbHxQ.mgNQDQjJ.mgNQ1AyYNyA..icri0l6qa8Ha0fACH6ryF..+1u8a1beWab2c2QrwFqkEZl4iQV4x7l27PkUZ8mdiQFYjBtsG3.GvpGGhbDvD5DYGX9H6cQKZQXXCaXRV+pUqVjbxIC.X4+9mUVYkgyblyfKe4Kiqbkq..fqbkqfpppJnSmN3qu9B+7yO..DbvAiF1vFhPBID3s2dKYwoXXth6YqEpGwZyady10wiHoFSnSjczMtwMv28cemne1t1Bu81azxV1RzxV1R61XZKjhD4coKcQBhDhbtvD5DYmkWd4gMtwMh6+9uekNTbnrl0rFb9yedIouZSaZifaaIkThjLlDoz3hhiHhHREfyPmHEvgO7gwgO7gAf5o.xXsJt3hwBW3Bkr9aDiXDhp8KXAKPxFahTRbF5Dovl27lmRGBJh7yOeje94KoIyA.70Wekz9iHmEbF5DovprxJsT21ejG4QP8pW8T3HRds+8ue7q+5upzgA.fMsk3HxQCSnSjCju4a9FDUTQA.f92+9qvQiz5RW5RXEqXEx5XzidzCQ09Uu5UKSQBQ1eLgNQNXtvEt..9iSasN0oNgjRJIkLjDsBKrPrpUsJK6ob6Ewdrrd4KeYYJRHx9iOCchHhHU.NCchbvsicrCricria6OKpnhBojRJPmNcJTT8G1111FxImbT5vPzJpnhT5PfHIESnSjSnKbgKXo9veqzpUKZQKZAhM1XQXgElMMFlKYr.lpy4W5RWxl5O4Ve6aeEU6W7hWrLEIDoLXBchTQLXv.NzgNDNzgNTM1NsZ0Bu7xKTZokZmhL4W8qe8U5PfHEEeF5D4BxfACppj4hkq726j5ESnSD4xYiabiJcHPjjiIzIhHhTAXBchHmd0oN0QTs+rm8rxTjPjxgKJNRUQqVsPiFMPiFM21elVsZgACFTvHijSB8nnUpNdVIxQDSnSNEznQC5YO6IRN4jA.PW6ZWkr9tpppBW+5W2x9R9du26EG8nGkUQLmHBcK5cvCdPYNRHR4vD5jCEMZzfQNxQhgLjgX2FS2byMTu5UOKGJJSe5SWz8w92+9wzl1zfQiFk5vijPm3DmPoCAhjMLgN4P3Ue0WEctycVoCCqVaZSavZW6Zus+rhJpHjZpoxJRFQjcAWTbDQDQp.R9LzG8nGEhIllBO8zCotqkDgFZnvau8Vvsm2BU4yTlxTP25V2T5vP1DXfAZo7hZ9miFzfFDOCtIRB4qu9hQMpQi90u9ozgxcT4kWAN5QOBV7hWDppJ4cg4JoIzaZSiA8u+OLbyMdm7c7orePkIMoIopSl+mYdU2uvEtP7pu5qhidzipvQj5fO93iRGBJFyy0vUeNGZ0p81VCLNhZUqZEZaaaKl7j+6x53HYYduvENGVvB9RUWx7ac6OotnLee4u+9ikrjknHisi.e80W7QezGA.fu5q9J..W5+9vVkPBIH31pV2xZp12hREwc2cGwDSSwAO3APbw0JYabjrruO2y82QvAWWop6bXnduk612uu5Uu5E..l7jmrccbcjM7gObK+2SbhSfm64dNENhb9De7wK315LdDuJDp12hRE5odpmB6bm6R15etn3HhHhTAjrYnmRJoHUcEoxDe7wyYlWKhIlXPVYkExN6rwLlwLT5vwogVsBeNIrbuRJs90u9KqyPWxRn6kWdIUcEohnQiF7tu66pzggSiDSLQjUVYA.WmOjbaZSaf6t6N7xKuf6t6tkcghmd5I7vCOfWd4kk2ewKu7Bd6s2VZaCaXCAfohCjNc5r7eMmnWmNc3ZW6Z3jm7jvc2cG50qWY9ljH.T25JuOVZIKg9YO6YQqacqkptiTIV1xVlr024latX+6e+Vp9WW5RWBm9zmFUWc02V6RM0TgFMZPPAEDBLv.QPAED..BJnffe94mrEe1pUu5Ui92+9qzggMyWe8E..sqcsC8pW8BIlXh10wO3fCFAGbv3a+1u819yO6YOKV0pVE9we7GAfy25kw7hgiKJNmGG5PxaoGVxRnurksTlPmtMKe4KWT64+6jKdwKhIMoIgxJqLapeLZzHJrvBQgEV3csMokVZBpu71auQDQDA.LcnfLnAMHaJ1tazoSGxJqrb5lodXgEF97O+yU5vnV0fFz.L4IO463iCp3hKFuy67N.vTY8kHofb+5BIKg9d1ydw.FP+wRW52.O8zSopaImXVax7W4UdEbfCb.ad7EyyWULJqrxvIO4IA.vIO4Iw7l27.foY7md5oC.SaOOohidR8fBJHrnEsHkNLjT96u+38du2619yJnfBvnG8nUnH5uh6CcmC50WIxKu7vV1xVPokZaSLo1vU4NQDQjJfjVEXppJC38du2C0u9QC2c2corqkLImbxnEsnkptBfiiDaoDLJkyDM5niVx5Kg35W+53we7G2xuOt3hCyblyTR56UtxUJa2Zeawa8VuEZaaaqRGF1EgEVXHqrxB+vO7C..3S9jOQgiHB.Pud83PG5PHmbxVoCkaS4kWN..xO+7wINwIvV1xlQrwJeEUF.YnVtuyctSL+4+4PmNGyDlScpSCMtwMQvIzYkhS7F+3GuUccR8sUtAMnARZ+IVG7fGDojRJXxSdxVJrNVKGoGikGd3gkZTustFIbFY9eK6Uu5Ed3G9gQUUUkBGQt1pnhJvu9q+J9vO7CT5P41TYkU..f3i2zh.UtSlCHSGepspUsQN5VIQIkThS2pY0Ufb7LhaUqj+W.IDexm7IVlM23F23r5Uttiv1YybLPl7ce22A.fCbfCfW4UdE65XyU4tIFMZDkTxMQKaYrJcnn33yPmjThcKIMm4LGLm4LGYIVzpUqfWXb0zpeWJkQFYfTRIEr0stUqtOThC0lV1xVxj40fV0pVgrxJK92Qjhxw79hSNsdy27MEU6MOCGk1UtxUrqi2+7e9OQvAGL.9iCoEgZJSYJXW6ZWnzRKUNBsayi8XOF..FwHFgrOVpEYkUV3Idhm.23F2PoCExECmgNQDQjJ.SnSRJwr6AbjVKCJwBa5ZW6Z3ZW6Z3QdjGQzW627MeC96+c48rUtG8nGXDiXDb14Vgu9q+ZDYjQpzgA4hg2xcRxH1hohiTwH4PG5PJ1XWZokh+9e+uiO9i+XQcc8rm8D8rm8zRoKUrWes4EdgWPR6ua0N24Nw+8+9eA.v1291E80OlwLFQs0XSO8zQ7wGOF3.GH..ZaaaqrU3gLKyLyD8su8E.NVe3UR8hIzIISaZi31cCqcsqUlhDwqfBJPQG+icrig8su8Ipy2ay5YO6ok+6l27lw6+9uuMEKMnAM.e1m8Y1Tebq17l2L..V5RWJN8oOsjzmhsNWXznQjSN4bGOSzGv.F...dlm4YjjX6Vs5UuZ.Xa0lAhDJlPmjLcsqcUTsu3hKVlhDmSSaZSylWkzcqacSQVE7+Yomd5XMqYMJcX.fZuVra9Pa4VO7VzpUqkOTisTOCLeW.5RW5B90e8Ws59gHgfIzIISW5RWT5PvpoQiFdaQsQlO3IVwJVgBGI2tctycJ5qwfACH0TS0xuOrvBComd5vCO7vphgoMso4PWO9I0Atn3HhHhTAXBcRxHlEYj8XOTKFMrgMToCA..K0IbmM8u+8GqXEqvga14.lJMn1pBJn.LvANP7K+xuX08QfAFnMGGDUSXBcRQrksrEkNDtM228ceJcH..myC7iTRIETc0Ua2FOkLw3+5e8uPe6aesr50ECy0+dhjKLgNoHrGKPHCFL.CFLHn15iO9HyQi5jR7bg6Tm5jceLuUFMZDFMZzp9d2YdclPN9XBcRQbxSdRYeL17l2rksLkyjyd1yhyd1ypzgQMZvCdvXvCdvJxX2jlzDEYbuSV5RWpnZ+zl1zjoHgHlPmTHW+5WW1GiCcnCIpBFiXNLWjS+5u9qNzawoQNxQhxKubKm2yNxN9wOtr1+KXAKf6NBxggx+tWDQDQjMiIzoZkFMl9kivrWkSgEVXHrvBSoCCb0qdUb0qdUkNLtqt7kurRGBB10t10j8w3NU84rFBc8dPzci59cnIRD5e+6O5e+6uRGF3zm9zRVIRUp8rO6ypzgfnrm8rGYeLlwLlgrOFDIDrRwQpdFMZDZznoVamixcfPud8JcHbWcpScJEc7CJnfDU6cDe91rpDRxEGi2AiHYjiRMEWnppppTjiyUmAO7C+vJcHbGkWd4I311gNzAYLRHWYLgNQDQjJ.SnSpdW3BWPTsWrGCrRspqtZ6ZkWSnLe9kqjbTK.PhY6Q1xV1RYLRHWYLgN4RPLq1YktZdYqIzqrxJkkil1zSOcIuOkKG9vGFG9vG1tMdhotAnz+7EodwEEGoH72e+sqmG5KcoK81NNLcjESLwH31d3CeX7hu3KJ5wve+8GCYHCACYHCQvWSkUVonGGohmd5onZ+F23FkoH4Na26d2BtsgGd3xXjPtxXBcRQDZngZWSnKVJ4JQtwMtwBtsV6pNu3hKFewW7EhJgtR5u829aJcHTiDycTwQY2TPpO7mrHEQHgDhRGB0nN1wNpXicLwDifmktRuMxrWhJpnPTQEkfZqi7GTjH4DSnSDQDoBvD5jhXPCZP18wTLmfYIkTRxXjTyZe6aOZe6aufZqXd1stJVxRVhRGBDoHXBcRQzpV0J69XlUVYY2GS4V94muRGBxtm3IdBQ0dVTdHWULgNIY99u+6EU6czWbPcsqcUoCABhqbuVVYkIiQBQN1breGUxoxW7EegnZuRbnVHlyg8V25VKiQxc13F23r6ioirm9oeZQ094O+4KOARsPLa0PmgyQdx4DSnSRladyaJp12oN0IYJRt6V+5WuceLECwbZuIlObhynniNZ3gGdnzggfHlp+1QNxQjwHgbkwD5DQDQp.LgNIoN+4OuRGB0HwNq13hKNDWbwISQis4YdlmQoCAYU+5W+DU6ES8TWpcO2y8H31t0stUYLRHWYxRkhqfBtH7xKujit1lEVXg5vuXrbTIjBm1hVzhvTlxTDbeFe7wC.f8su8Ysgkr59tu6C..G7fGT1GKwtZtKszRkoHQY83O9iaUW2l1zlj1.QDDysb+tWi44Yjt0PqVsHrvBGEUTgJcnbGUVYkgvCOR6xXI4Iz6RWtWjXhI4vdpH03F2XQ8b4Tpx+oij+3uBp8+tXyadyhJg969tuK..RIkTrhHy9wc2cG50qW15+fCNX7jO4SJa8uyB+82eTm5TGkNLDMwLAlSbhSTCeU99MhkWd4E5d2uOznF0HkNTtiJojah8rm8fu+6WOBLP48mskzD596ue34e9WPzGjBjRvw5MNTxZmtPLxQNRjYlYJa8+BVvBDU6Uh8Tu83ei3GpQ3L+OENvurwtPmNcnAMngnAMngJcnbW08te+nacqa38e++krNNR18d9Dm3X30e82P0kLWiFMJcHHSz7+9k.ZoFS+RnV8pWMV8pWsnhl0t10Jp1asBHf.rpqyM2juywnu669NQ+yYyd1yVRFawjfVtel8icriUV6e4hzV2+E9qKImGd6s2nqcsaXe6KaYcb3CSlHhHREPxRnO5Q+zhZggPJMiPn21ciFE2s0KiLx.YjQFhNhrlqQrrk89tTedp28t2cz8t2cQO6eo7HO8+7e9OBtsO7C+vR139mEVXgAc5zYS8gRTHf..dsW60Tjwkb9LvAJumgERVB8AOXmiyUYwxQ945ZuI1+t3BW3Bhp8QGcz3EdgWPTWiXIlJ50chXqbY2Md3gG3ke4WFu7K+xh9Zkxxa5O7C+fj0WVq1111JIGVOJQo50c2cWTsu1WXkB+CZSNej6CkJIKgti94aMY6D6y4cricrh9CAzidzCG5CQEonxkoQiFrpUsJQec8qe8Sz6MaoV25V2jr9J3fCFAGbvnCcnCRVeZushUrBQ0dwrCPpMlWaKp1k4iJTSZhsMghZijkP+ZW6pRUWQNnrl6Vg0tX2ZZSaJZZSapUcsxsvCOba55etm64rpqyfACvfAC1zXaqjxOPQJojhC+1Ur1H1GSvQO5Qkrw17iBi2DQmGEVn7tW44hhiHhHREPxRn2id7.3xW9xRU2QpDomd5V008IexmfO4S9DrxUtRIKVjpEs4.G3.gVsZspJNXVYkE5Uu5knutW4UdEQeMBUN4jifaabwEGBN3fs4wrm8rmvO+7C94me1becqRN4jkz9qlH1GAUUUUEWSNt3l9zmtr1+RVB8V1x3vTm5TPUUUkT0kjCGq6g0YK2VUO8zSjUVYII6S86+9ueatOLabiabB9nNsMsoMHqrxxpWa.Se5SGG3.GvptVg1+hwW8UekMMdcu6cW1dbJR6dBulI1elb3Ce3xTjPN5prxJwwN1wj8wQRqVFETvkvJVwxQ8qeCP.A3uoAPFKHGViPCMTDTP0g0ycqfsr3a9nO5i..vy+7OuUN1ZtsDhqbkqDyadyy5CHIRxImL1yd1yc8qaqKvuyblyHpYPauX96Kw9g0t268dQrwFqbDR1MV6GF4F23FRbjP.lVaIW6ZWCW4JNV2g3JqzzNZ3F2nHb5SeFr3EuHnUqss0LqMRd11u5qVHt3EyCQEkohQuiVkia3C+oPu5UuDbsWV8Vo3ru9oe5m.f0mP+OaPCZPXPCZPBNwtstc0ta5XG63skP27Ou7Vu0aII292ILgIXy8gPr28tW..jTRIIpqyWe8EkTRIBt8lOLdjSd5omnhJpP15+O4S9DQeMUWc0Brk78aDqJpnBr4M+K3q+5EqzgxsorxLc3IctycdT+52PYOYNfLcZqEQDQByKF2xJS9dgk03Tm5Th3EWpYB+MNL+YZjhObSJojhjtszLmX+VUZokhMrgMX4VCeyadSq54VKTcnCc.8nG8.coKcQR629129Jo8WM4Ue0WE.h+NJrrksrZcV5l+PBVaQ8YAKXAXDiXDBt8ibjiT1JRQhsl6aV+6e+EPqD2qu9iWWJ93QMopppBm3DmvgKWCfoD30u91uZLOuuyDQDQp.NVOfaxkPJojBF1vFFF5PGprz+93iOnu8su1sY3J0iy.Fv..fxTkB6ae6qnWrWYkUVnu8su2w30VKWt+7O+ynjRJwREsSH2oEsZ0Z4QpUd4kaSi+sJiLx.0st0UTWCWU6j8DSnSJhEsnEgEsnE4PWU3TB2sDi1KFMZDFMZTzOdk0t10hqe8qC.fgMrgA.aOYdFYjgkBoSMeFh+WMxQNR.X8aaxakVsZwZVyZrpq0d9XSHh2xcRQoFpVXRkoLko3PLiNqsdSGTPAgfBJHjYlYZSaKsSe5SiSe5SaSUEOMZzXyq4Cy8g0lLWpV.nDITLgN4PvUOo9i+3ONxM2bU5v..l1yrye9y2pu9HiLR7ge3GZ0W+5W+5w5W+5uiesJqrRqteECe7wGr10tVap9GHkk4UhDBlPmbXjRJoHqUDMGMe0W8U3q9puBojRJn3hKVoCmay27MeiMc85zoyx5Xn90u9n90u9050bwKdQjVZoUis4K9huPTwQaZSaDba0nQClzjlDxJqrr4u+4sZmTBLgNQDQjJ.WTbjCkCbfCfTRIEKO+y0rl0n5JtOFLXPwOFTEBoplAjPBIba+2JqrR7K+xubaE+kKe4Kiu8a+1ZsuD6yUuKcoKX+6e+2wul6t6N9nO5iPiabiEUeVal5TmpCwZgfb8vD5jCIyugn4acYjQFIxLyLUxPxlXNoxTm5TU3HQbLu1FjxcifGd3A5YO64e4O+QezGEacqa0xyOWud8vfACnpppxxYDQ0UWMLZzH7vCOrrh7ALkn+NkD0SO8DOwS7D3u829aHjPBQx9d3NwbgL5t8AHHRtwD5jSg7xKuaagyMyYNSDWbwofQjvMhQLBb0qdUkNLrICcnCEKdwxao0zWe8E8pW8RVqpexokrjknzg.4hiIzImRu7K+xV9+8vCO..v8ce2GFyXFijejbJF4me9..H6ry1xrJc1SlC.TTQEg90u9Y0agK0rW3EdAbjibDkNLHhIzImel2JS+3O9i3G+weD.2dQMwSO8Dd5omvGe7wxu..71augO93CzoSmk+LqQ94mOxImbfd85uiecu7xKIshkoTLXv.dxm7IwBW3BU5PwgQ+5W+ro8KOQRItJ2IhHhTA3LzIUuJpnBTQEUbWOOp26d2K1wN1gf5qHiLR7vO7CKpweTiZT059q1Ywi7HOBV6ZWKzp0zbA5Se5iBGQ1eEUTQ..x1YQ.QVKlPmTcZUqZkfaqACFvu+6+tfaed4kGJojRfu95qnhIyOB.m4D625iwv7sYdsqcsnwMtwh5uycl0+92ed7KSNr3sbmTcZdyatfa6wN1wD8y.0ZOSrA.F8nGsUesJo1111dW+Zm5TmBqacqCkVZonzRK0NFU1Oomd5HkLQzRsC...B.IQTPTURgIyIGZbF5jpS3gGtfaqPuU6+YlmosXOQw7zSOQpolpSyL06d26N..hM1Xqw1YvfArgMrAK+9HiLRjbxIKmglry7I11ku7kU1.gHAhyPmHhHREfyPmboYq2h3O+y+bq51n6LLK8G3Ad.zhVzBq5ZyKu7vxV1xtspl18e+2OdoW5kjpvSxM+4Oer7kubV1VImVLgNQ1fJpnBrksrEz0t1UQesNxKTtt28ta0IyA.99u+6woN0ots+rMtwMhMtwMZ426u+9C.fgMrggt10thfBJHqd7DJywTlYlIxImbj8wiH6IlPmHaTt4lqUkP2LGsYq2st0sZ8YlWSzqW+eIY9ch4iL1zSOcjd5oa0iG.vS8TOE7wGefVsZgVsZsbf9nQil63YnNSlSpQ7YnSjDXtyct1z0mZpoZYucqzr0sfls92EViUspUA.X4vbQud8Pud82wj4DoVwYnSjDPud8XEqXEXvCdvVceLtwMNr7kubEYUUeO2y8.f+3HNUrJpnhj8CukZxcqnAc2z111Vr6cuaYJZHRY3XLk.hHhHxlvYnSpJgFZnBtslOMzjJW5RWB+xu7K.vzI+l0XHCYH37m+7..1sS1rt10thV25Va0WeAET.V4JWoDFQxuNzgNvYnSpNbF5jpRyZVyDbaO1wNljO9G7fGDG7fGDokVZV8GXH5niFQGczhtn0XMFzfFjMkL+Tm5TNLIyUCGSsDYKXBcRUIhHhPvs07YWtbIyLyzl6C4LodPAEDBKrvro936+9uWhhFa2AO3AU5PfHEEuk6jpRHgDhfaqbLC8+rzRKMaNobpolJxImbv1111jnnx19fBm6bmCqcsqUxhEohst8AIxYGSnStrrWGzFRQR8DRHAK6M74Mu4YU8gVsZw3F23ro3HyLyTxW6ADQRCdK2IhHhTAXBchrCxHiLPFYjgM0Gd3gGvCO7.CcnCE5zoSTWqO93iMO677xKOU0ry8zSOU5PfHIESnSjcfACFfACFjjmCdfAFHF6XGKF0nFkkRb5che94G7yO+v8bO2Cdpm5or4w869tuyl6CGIhY8VPjy.9LzIxNJmbxA4jSNRxpW2Ku7Bie7iWBhpZmiTslWpznF0HK64ehTCb4lgtGd3dMNqF5timpjRmzRKMTXgEhBKrPkNTpQokVZpxj4..MrgMToCg+Dw8BLiF+ie4pyCO7PoCAGBR9Lzqt5pPrwFKBLv.k5tVRjPBI.2bS3eaqdOajE92Wl+q.iFMHSwhqokrjk..f.BH.LrgMLENZtcUUUURx9n2QV.ADfRGB2Ap02uQ93gGdfjSNYb8qeckNTtit90uNN3AO.NvAN.RLwjk0wxkaF5DQDQpQR5LzOyYNE91uc0HlXhQJ6VxAAeTExiabiafzRKM3t6tiwLlwnzgCxHiLfACNm2MlxKub3kWdozgAYG4omdht10tgt10tozgxc0QNxQvJVwxw1111k0wQRmg9zm9LXxbhrR50qG+2+6+UQigktzk5zlLGvzeGRjilVzhVfW7EeIYebjrYnGRH0CO5i9XRU2QjKoSdxSZY+paq6abgRoOKykRkWd4ve+8WoCCh9K7zSOQUUUIbyM4aA7IYyPezidzhtXWPJIM+ueQNZLum0m6bmqrOVm6bmS0jLGv0ZF5Zz7G+hbNL7gOBYs+4hhiHhHREPxtk61xYpLoDD+1iQ0tC9bPoWudjVZoAO8zSzqd0KDczQKY881111PN4jij0eNJbklg9ercRU13fDt10t1iu9qWhr0+RVB8ctycgd0qdIUcmCC06J6V3eeY9uBzpUs92EN1pnhJvZVyZr76GzfFjUcNlqWud6xswWI4bWe1E2iAy7qKUsuEkJjb+gnkrD5evGLSUYBchbzrxUtx63etWd4EpW8pG70WewYNyYP4kWtcNxTd94meJcHPzc0G7A+aDRHgJa8uj8Lzc2cOwW9keoT0cDQhT4kWNN+4OONxQNhKYxb..e80WkNDH5NpxJqTVSlCHwEVlu4a9F7fO3CBe7wGK25KGsaYs6t6NK8q.vZJ8qNy6OYx0fXd+lJpnBYLRrFFg3dcow+2+UlBGmHUUUUNbqeByueYEUTAJszRwxV1Rk8wjqxchHhHU.I+vYYHCYPnicrinwMtI..vau8QpGBaRG6XGQbwEGb2c2ET6cztCCDQRihKtXkNDtC362HV50WI1+9yE6ZW6RoCkayMuooe953G+3XG6X6HxHktcoxcijmPut0MDb7ieRb7ieRotqkDkUVYnoMsoBNgt5k0rJ2UW2PGMZznhejJTs4pW8pJcH7mHtj4lmrgq9bNJu7JvO+y+D9keYyJcnbWYORlCva4NoxHlmKZcqackwHgbzckqbEkNDHRRwD5jpxYO6YEbaaPCZfLFIjityctyozg.QRJlPmTUNyYNifaKOY.csUXgEpzg.QRJlPmHhHREfIzIUEw7bQqW8pmLFIDQj8ESnSpJ71n55RssKLHRr3q.HhTERHgDT5PfHEESnS0pvBKbDVXgigO7QnzgBQ2UcpScRoCAaR+5W+Pcqac41ojrZRdgkgTeBHf...vXFyy.850isu8cnvQjzwe+82AshgQtZF6XGGBLv.Eb644gN8mwYnSDQDoB3BlPWbebV0ZoA0nQCvnQwc5oEbvAiwLlmQlhHkQhIlnRGBjB3zm9zJcHbaRLwDD8ttnpppBUUUUh90wj5kKWBc0ZBZwp7xK2pNyrCKrvPaZSqQ1YuGYHpjFabiaTvss0st0ve+8WFiFxQz+8+9eU5P...6cu6Ast0sBol5DD80dwKlGt3EyCkUl3ecLoNwmgtKpF0HSmFd6XGaGcpScVTW669tuGl3DeVLqY8o..H2bOfjGe1hCe3Ci6+9ueA2d9bzc8X9rpVoz5VGG..RO8zPzQWeQcsFLX.+7O+y3cdm+O..zzl1LIO9HmStbIzE6wgpZ+3ScVy5Sg2d6MhO9DD02qQGczXRS54..vrm8mgbxYexUHZUJt3hEzLuO5QOJxKu7rCQD4HXaaaaJcHfDRHdKyHO5nE2ovkACFvd1ydPZoMaDVXQHGgG4Dyk6VtSDQDoF4BlPWcOiaw55W+FXlyblH6ryFFMZTTqwfnhJJDUTQgIMomCsu8sSFiRwaYKaYBpcaXCaPliDxQRN4jCxImbTzXXRS54PzQGsnlctACFfACFvd26dw+9eOSTYk5kwHjbV4BlPm9yt90KB+6+8+B4latH2byUzKbvvCObLgILQYJ5rNUVYk3zm9z03pY92+8emKRRUjzRKsZ7qu90ud6Tjb204N2IDd3gK5qa+6e+X+6e+3e8udebyaVhLDYjZfK2yPmtyJpnhw67NuM..dy27sQKZQKD00GRHgft10tfsrkeUNBOqxs9F3ImbxHgDR.m8rmE+7O+yJXTQxozRKMDd3gi1111B.f5Tm5fsrksHpiUW4RW6ZWvXG63D80YznQ71u8aB.fxKuRoNrHUDlPmr3l2rT..L8oOUrhUrJQe8iabiGt6t6XCaP3aaL6k8rm8f8rGG2sZGIcxO+7QVYkkRGF2lt0sthwN1wgfBJHQccFMZDm4LmlIxIAgIzo+hJpPOt10tFBN3fE00ETPAgQO5m1xswdiabSxPzQjyitzk6E..OyyLVQmLG.3RW5RXbiarvc28TpCMREhOCchHhHU.NCc5NZDiXDnhJJGKdweskRRoP1m5AETP3EewWB..ibjiByd1eF9se62k0XkHGMcric.SXBSTzmbZlu6VW7hWDO5iNDDTPAyYmSBFmgNcW4omdgm9oGMN6YOCN6YOinWQ30st0EiabiGsssIKSQHQNdxN68fwMtwK5j4FLX.m3DGGm3DGGO0SMbDTPh6QdQDmgNUiLXvHdoWxzLteq25sQKaYKEUEkKzPCEol5DPG5fo8od7wyCCERcZe6Ka.X5NSEZngJ5q+fG7fX5SeZ..vSO8VRiMx0.mgNUqJqrxQYkUNdi230v91m3KwqgGd3XDiXDXDiXDHmb1qLDgDorxIm8Z4mwm3DeVQe8FLX.u9q+ZvfAivfAVaDHqCmgNIXkTRY38e+2EKbgKFZ0JtOK3Dm3j9e+eZvW7EeNRJo1J8AHQJf8t2ciQMpQaIQdDQHtZrt45ydEUvslFYa3LzIhHhTA3LzIQ4F23lH6++169O9Z799+O9ijHhHDR7qjHIBAM9QITrPUTq61mg8oFcePaYyVUrpce2mO6yp1ttQo5OoaqZqNRYcjhR0YyOV6nU8q0VjDI9UIBRjHD4GjHIjbNmu+wYQ6mdibtNw04GNmm2+G2bKuttd+xQNWutd+958062YlIImbxNUuzquWKO9i+DDXfAR5oqgdW7M7HOxz3wdrY0nVRWsXwx0We1E4Vk5gt3zVzhVHYkUVWeCivYDUTQwi+3OACZPCzEkch39LnAMPd7G+Ib5h4eyMaEs9rKlEUPWbZW5RWlW9keIN5QOJG8nG0oec1Ze6aOyZVON28cODWTFJh6wrl0i6zyncqVsRVYkEYkUV7hu3Bnppp1Ekch+FMj6RiREUTIyd1yF.BJn.4se62lniNFCe7soMsgm9oeFdsWaQ.3Ut9uKxMxHG48B.+ze5OiHhHBm93G0n99DbvM0rSKQTAc4VmEKVYpS8mvG8Q+Sm9X+Y+rGAvduV1wN9LyN0DwTMhQL7q+6rMl0l8RKsTULWbYzPtKhHh3CvuqG51r4bShKm84C6uJ3fCgxKubmtWK0G+i7HSiV1xVxV1xVbEomH2xF8nGMSXBSrQ0yb.JojRXLiYzz111NSNyDwNSufdFYb.ZdyatSuvi3tL9wONmZoK0Yh0e23G+3XkqbUDSL1eV5NymcQDQDLiYLSlwLloqJ8Dwsq9NDb1ydVd3G9gTwbWf.BH.ZYKaIm3DekmNUtgrXwBIkTOcKsU.iZTixT6B5Tlxj46+8GEspUsxLOsdLO8S+Tjc1GxSmF21HnfBjEsnWC.5RW5hW6M1IhqlUqVImbxA.9E+hmflzjf8vYzsW1zl1jmNELEkVZor4MuIV9xWNgEVKbosko1C83hKVl3DmjYdJkukCeX62bQqacqnksLbBLP68Bt92G7pppZJqrRoG8nWdj7yhEq7TO0SB.yctyid1ydph5heGKVrP1YmMyYN+N.7nEyO1wNBst0QPyadyA3abMCaTQEWlxK+R.Pu5Uu8X4nurHiLRlxT9wL7gOBdrG6wbosktRqHhHhO.SqG5kTRw7W9KuqYc5jukhK9BLzgNTF8nGE.jXhIR7wGOAETP.Pc0Y45wc7iebN9wON4me9djUfpZpw9lLwBVv7Y1y9ooO8oOpW5hekLxHCdwW7EvhEmaR3ZlJqrR3tu66lwN1wR26d2ocsy9yuuIMw90LrXwB4kWdbxSdR.Hmbxg7yOept5Z7X4rur3iOdNwINNcqac2k0FlVA8oO8YPjQ1Fy5zI+aAFHjRJClAMnuC268duWu.9MWOY3CeD.PwE+02j0W7EeNUUk68KpUTwU3Ue0Wge0u5WQ+6u1c0D+CVrXgW4UdI29tmVlYlN2y8bO7c9No..8qe8mgO7g2fGSO5wWOYspqt5n3hu.uy67Nr28tWBLPGcsFwY8POzCw9129cYmeSaRwsxUtxF0plj2tm4YdZxJqrcasW26d23+5+ZBz+92e.HjPBwzN2VrXgCbfCvG7Aqm268RC.5ae6moc9aHKXAOO.bm2o5st36wpUqjYlYB.u3K9Bt0d4dzidXV+52.8su80T+tU0UaeIoc+6e+7duWZje9m0zN2Fguxjh6a5Tm5T7DOwS33.ajLsdnmWd44SVP2c9dne5SeJRM0kQTQ4b6mxFUPAEDCbfCjDRHA5W+rWHeUqJMWRa8ssfEr..34dtmijRpG50AT7YX0pUNxQNBKXAyG.t5Uq0sztUUk8Gm1BW3hH4jS1z+NUngFJ.bO2y8PBIj.+y+4GyF1vGZpsg+lydVW6MEYZ2N2ZW6ZLqSkemRJoXJojh4Mdi2zkULudADP.z912dF23FOiabi+5WTvUqppplpppZdlm4Y3zm9TZA6Q7IXylMxM2b4oe5mhqd0ZcaEyCJn.YdyadLu4MOFyX9At7aPNt3hiG7AeHN8oykSe5bcoskurUspU5RO+ZrOEQDQ7AXZEzyJqr4PGRK.KNqBK7r7Zu1efW609CLzgNT2V6FRHgPHgDBO0S8TTVYk31Z2ZqsNl1zdDNxQNhaqMEwUIyLyfe1O6mh6b.mpqtZY1y9oHkTFLojxfooM08rYuDZngxBW3hXgKbQbriou+1XTPAE5RO+l5BKyLlwzYO6Yul4ozm1gOb175u9av.Fv..flzD2+Rq+8ceeOJojR34dt4RW6pq60o3aJzPCiYO6YSDQzZl9zmNfmcg2PDmw0t1UAfrxJK9nO5iI7vceqJlEUTgLu4MeRIkT7HStzQLhQ..yYNyk0t122s292NK6ryxk2FlZEjHhHRl6bmCibjeW5QORB.BKrvLyl3VVvA2TBNXuihG+O+O+JF4HGoGMeBLv.Y7i+A3jm7j74e9W3Va6xJqbd4W9UbqsoH2N5PGx9aZyS9jylQO5w3wxil0L6STtwLlwPN4jCG3.o6wxk5UWc0Q94mO4l6I8zoxMTEUTI+q+0dYUqZUzu90eWZaY5cIb+6+.r+8e.y9zZZ9deu6ioMsG0v2ngqZtlzwNFCicri0q3FdBIjP3QdjowgO7gAr+KfhHdOF8nGMf88JCuAQFYaXBSXhbjibXpt5q5QykpqtZV+5WGe1msSOZd3Ht5h4fe31mpyy0TQ+9u+6m3iuSN8wUWc0A.kWd4TVYkRM0bUrYyFgFZy.fV25Hn0st0Ncu9iN5nYRS5AAfm8YeF5Tm5rSmahHtF+3e7OA.ZYKC2oO1qcsqQ4kWNkWd4.PM0TC0VasDd3gSjQF402NXc7hV0+W8nG8fwN1eHyYN+NO1dGg7+klk6hHhH9.TOz8.Jt3KvXFyOvoNlRJoD9u+u+kr8suM.ne86luTplYloyHFw8xC7.+HF23FmgaiwN1wB.srksjW60dMmJ+DQbMN+4OGojRJFN95WiGt3EuH+7e9LolZZ3gDOqrruB28e7e78Y7i+AXTiZTFpcBLv.4ge3ICD.qYMZcHwaf5gtC3JV.TpeUZynJnfyxJVwxozRKi90u6pAKlCPxI2eJu7KwblyukRKsDJsTm60RaHCYvNU7hHtNCaXM75w92jMa13bm6bbtycNV7hecGVLGf9zmjoO8IYN24Jhe6u82vEtvELb6EP.Av8bO2igiWbsTAc2nie7iwwO9wXHC4tM7wTVYkw5W+54sdq2zoau3iOARKszHszRipppJCeb0OSVEQ77lvDlngisxJqjktz+DKco+IRO8Lb51JpnhgMu4MSkUZ7IFabwEGYlY5jYld9Y7t+NMj6NfYtjJ1gNDE.LnAMHGFqEK12NTSO8zY4K+cnm8r2Mp17Mdi2..tq6Z.L3AOXC+umCdvLbaabKhH2Xm+7mijSNYCEqUqV4S+zOk+7edE.Pu6ceZTsYpotT5Uu5ICbf1uNkitlQfAF302ZVEOKUP2Mpicri.Pm6rimA40OrWaXCqm3hy4mM70q98d2krj2hANvAZ3Y+dW5RhM51TDwbjRJC1v63h0UWc7G+i+9Fcg75EQDsgMsoMQhI1U.nMswwaK1Zqy16fFxcQDQDe.pftaThIlHIlXhN7NtsYyF4medje94wF23FMk1trxJmu5q9JCGuQGlOQDWm65tZ3I.62zN1wNHzPMmEpp+5e8Cu9jqyHZe6aOsu8s2TZaowyOrftmYe3N6rOHIjPmIgDb7vsWUUUwd1ydXO6YOjbxl2pKze6uY7aN3NtijLs1UDowoG8nGFN12+8MuWcr3iOAN7gODG9vGhqcsq4v3iKt3Ht3hyzZeowwOrftmQSZRSHxHijHiLRGFaM0TCG5PGxz28510tL9RiXm6bBlZaKh37bld894e9maps8AO3A4fG7fTSMU6vXiN5nI5niVyzcOL+tIEmMaVc1ivs21VsZgKcoxMs1sdYmc1FN1tzktX5suHhywpUie8pDRvb+NaN4jC.b0q53dnW+D9soM0XSfOw0vuqfty+ZnYNCQuUqVM76BdPA0jq+Zfje9EXJsO70eoyHbl2CUQDWCm46gEUTgDUTwXZsc8iNfQ1Vmq+ZaVsZwzZew4ogbWDQDwGfeWOz8Tpqt53RW5RFJ1l1zlRm6r8gOyL6gdu68cZ3XKt3hMs1UDowojRJ0vw1yd1KJszxLs1tqc096gdHgzTGFaYkYucqe2fT7LTAc2j9129QgEVnghMzPC856ct6bm6xzxgQO5wX3XyM2bMs1UDow4zm9TFN1QMpQQZo8dlVaW+qLmQVJnKn.6c7vLeqbDmmFxc2n7yOexO+7c3cwFTPAc82Y8.CzbdF9EUTgLzgNTCG+QNxQLk1UDow6XG6XFN1gO7gS94eFSocCMzlQ7wGOwGe7DXfNtLwYO6Y4rm8rlRaKMdpftaTgEVHEVXgFZwZHlXhgXhIFdvG7A4vG9V+0W6W7K9+4Tq2xewW7E2xsoHxslu7K+RCGaG5PT7XO1ieK2lG+3GiINwIRTQEMQEUzF5XJpnyQQEYrEgFw0QEzEQDQ7A32UP2Y2eyMy8C8RJ4hTRIWzPuO3MqYMil0rlw8duijIMoI0naydzijnG8HIF8nGigF5r5U+NCmHhmyoNUtbpSYr4yRPAED+ve3XI93ii3iuwups8vO7jY3CeDDRHgX3MFlhKtXMQZ8B32UP2SJt35DwEWm3e8u1qgOl1291yTm5OkNzgF25j7zm9LX5SeFFZEpSDw6xcdm8kMu4Ma33aW6ZOyZVyhYMqYQKZQiacceJSYJz111VCGes0VKctyIRm6r1gF8zTAcOf28c+yFN1.CLPti63NH0TeGl4LmIAETfDTPM7+s0rl0TdrG6mSZokFcqacit0st4T8NeoK8OY3XEQbsVzhVjgiMv.Cjd0qdSu5Uu48duUyjm7CS0U2vKnUgEVyIrvZN+xe4uj0t10RW5RhN0Bv0e7O9GLbrhqke5qsl4ML5MF8oOIyQO5QcpMdg.BH.9A+fe.iYL1e0ytxUtB6e+6i8rm8fUqVYXCaX.PxI2OBO7vaDqHde8dv9pW8pIrvZgSe7hHlud0qdyku7kAfvCObCebAFXfLwINIl3DmDW7hEyAO3AAf8t28xwN1wXVyZVz+9eWzrl0LfFypnIjd5GfssssQSZRvN8wJlO+tB51+kVi+KtMleI2H9nO5ePhIlHMsoNdQa3FkOsnEsfQLh6kQLh60Txm5pqNVwJVN.jSNmf9129YJmWQjacu26kF.7nO5zInfBxvGW8Wuncsq8be222Cfq+m2pprxJYKaYKpXtWDMj6hHhH9.765gtyOq0cMCO+5V25nO8ouLrgMLCs4G3JYwhE1yd1Cabi12uzUuyEw6xZWq8857ANvAR+6+c4xF4Pip1ZqkcriOk0u90Srwp8AcuE9c8POf.b1+I6Z9hSDQDIqXEKmSbhSfUqVcpsIQyjUqVImbNAKYIuIQFYaHxHaiGIODQt4BKrVRXg0RVxRVB4medl5qSqyvhEKXwhExJqrH0TWlJl6kwuqftmdBw8MUVYkyJVwxonhJhhJpHOxWRKnfB3se6kPkUZrs1UQDOmst0sPpol50m.qtam4LmlyblSyRW5eh5pyyzID4lyuaH281bjibTV1xVF.LyYNC21B5R827vxV1R4C9fOf9zmjcKsqHRiW+52cwpW8poEsnE7S9ISE.5PG5faossYyFu0a8V.PAEXrMZJw8REzc.2Qul229120+yoO8oynG8ncYOW85pqN1zl96W+cgu1Zsnh4hbaj63NRhctycwhW7qC.ibjijku7+rSM62cFUWc0r90udRKsUoYztWN+vgbWDQDw2ieWOz8TSlDiZty82w92+9XJS4GC.cqacyzN24latjZpKkst0sRG6nlLKhb6r5eaTJojxXQKZgL0o9So8suwsDQeijUVYA.qXEKmst0sRW6p4csHw0vuqftm908vQhIlXI8zyfO6y9L.XPCZPLtwMNFv.FnSuHz.vm7IeB.7ge3FHiLxfV25HTwbQ7wr3E+5r0stUF1vtG9O+OGK.LfALfF045i+3OlMtwOjLxHC.HxHaqJleaB+tB52tnksz9R73QO5wXSa5QHkTRg4Lm4RrwFK.M3yXu1Zqkyblyv9129XtycN.P25V2o0sNBWehKh31Ueu0OvAxfMrgM..ojxfYdya9DczM7dZ90t10.fSdxb3y+7OmErfmmjRpmDYjFeCZQ7N32UP2aeH2uQRLwtRwEeQF5PGBspUsB.hJpnIlXhgN1wX.f7xKe.3bmqPJpnhnhJpfjSt+zst0cOVdKh390oN0Y.3bmqHFzfF.spUshN1wNRG6n8NCDUTQQqacqIiLRmBJn.JrvyA.UWcUzu9cWjTR8zik6xsl.F0nFkoVgq4MuYL4IOEZSa7Nu6tDRnSDUTQa3YD5S+zOEYm8gbwYkHhHeSaZSaxPwYwhEJrvBIu7xyEmQMNW3Bmm28ceWpqNKt71RyxcQDQDe.l5PtexSdBN5Q+Jy7TJhHhbSETPAQbwEGwEm26j8cbia7rwM9WYYKKUWZ6Xp8PekqLMy7z4UvKeRwKhHxsAF6X+gt71vzJn+7O+7azulDd2TEcQDQt0MyYNCW542zJnmPBIXVmJuJAFnJnKhHxstdzid3RO+ZRwIhHh3CvzJne9yedy5T4UIzPatmNEDQDwGPokVlK87aZEz+6+ci8NCd6l5WHWDQDw8HyLS2SmBtDe3GtAW542zJnmZpKkSdxSZVmNuFcriczSmBhHhekvCObOcJ3Rr5UuZW542zJn20t1cd1m82XVmNuF8su80SmBhHhekNzgN3oSASWN4bB5Uu5sKsML0EVlJpnRVxRdKFxPt6quse17le68yftScJAOcFICdsA..JrRRDEDUJHhH9URJIW6rA2cnhJp..9pu5qXW6Zmr5UuZZe6cs2nhlk6hHhH9.L8MmEucYjwAXEq3Oy286de.XnMokd26dQBIzYWcpIhH98N0oxkEu32fQNxQ1fwUas0B.aYKagksrk4NRMud9cEzA3xWt7quL01oN0IGF+oO8o3gdnGB.hLx13RyMQDweTokdQ.6Kg3IlXhNL9byMW.XBS3GQTQEiKM2tcge29gN.gGdq4Dm33.PrwFqC6kdBIzY98+9+..LiYLchMVu2MA.QD41METP971u8RAvPEyqqt53vG191ZsJl+07K6gN.snEgA.KYIuMQDQDF931yd1MO6y9aHrvZoqJ0DQD+FUUUkrfE7BL3AODCeLW7hWjoN0e7+9uooBV87a+jnxJuBUV4U3K+xuzoNt69tGJKdwuIcriwP94eFxO+y3hxPQDw2Vrw1Qdy2bINUwb.10t1I1Ke42VB6FReZHhHh3CvucH2q20tVMr10tNmZX2A3xW9xrsssM.H0TWF4kWdboKUN8su8yUjlhHxs0N3AyjHiLBhO93nac6N.fm64dNZYKc9UEtgMrgR3g2ZyNEusmeeAc.F1vtGdxmb1N8wYyl8O5xLyLHu7xmxKubpnhKSc0UmYmhhHxssZRSZBsrkgSjQFIwGebzktzE.ZTEysZ0J2+8e+lcJ5SPEzAN7gODm5Tm1SmFhHh3.+i+wV4Mdi2zSmFdkzyPGnW8p2jSN43oSCQDQZ.G4HGgErfE3oSCuVpG5eCIlXWXNyYt.PjQFomMYDQDgBKrP.3286dVJpnK3gyFuapG5hHhH9.TOz+VZW6ZK.L+4+7Darw5gyFQDw+UN4bB9M+F6aK2W4JU4gyFuepG5eKEW7Eo3huHyblOJ6e+6WyXcQDwMylMaryctSl9zeTtxUpREyMHUP+lJHlzjl.KZQKjZpoFrYy10eM0DQDwbU+0Xqppp33G+37POzjn4MuEd5z51J9kaNKFURI0S10t1McnCcfTRYv.12LWZQKzujIhHlkKcoKQd4kG.ric7orxUtRRN496gypa+ndnKhHh3CPSJNC5RWpb.3AdfGfALfARrw1QhJpnAfl0rl4ISMQD41R4l6II+7ym8rm8vG7AqG.hN5N5gypaeoB5MBG6XGggMrgyXG6OD.F6XGaCFuMa1nlZpgKe4K6NROGJnfBh1111ZnXsZ0JEWbwt3LxXBHf.t9ZtevAGrCiu971pUqtz7xHBOb6KwkgFZnNL1xK29MOd0qdUWZNYD0mu0m+Mjqbkq..UVYktzbxHZRSr+zDaSaZigOlKbgK30LOYZW6ZGAFnwG.0ye9y6ByFiqUspUNUGblxTlL6XGep1CLLI5Yn2HjTR8jKbgh48e+0B33B5VsZkryNaRKsU4NROGpssss7LOi8WEjfBJnFL1KdwKxK7BdGqLSgDRH7DOwS..wEW7MXrVsZkEu3WGv9ymySahSbh.vPFxc6vXqumJYkUVtzbxHFxPrusVNwINIGF6d1yd.fMu4M4RyIiHlXhA.90+5mzvEFe0W8U3ZW6Ztxzxvl+7edCcST.TUUU407czoN0oRe5Sec30UpWYkoMzJyjJn6FX0pENwINNm7j45oSE.3S9jsyrm8SA33B5kTRIdM4M.W7hk.33B51rYi0rlUC.cu6I4xyKG4nG8X.Fqf91291AfKe4Jbo4jQXyl8Q2vHEzO3AyD.uhee4K9hOG.9e+e+0F9Xp++i7FTUUUY3B5UVYkdEelCvoN0on289NMbAcwboIEmHhHhO.UPWDQDwGfJnKhHh3CPEzEQDQ7AnB5hHhH9.TAcQDQDe.pftHhHhO.UPWDQDwGfJnKhHh3CPEzEQDQ7AnB5hHhH9.TAcQDQDe.pftHhHhO.UPWDQDwGfJnKhHh3CPEzEQDQ7AnB5hHhH9.TAcQDQDe.pftHhHhO.UPWDQDwGfJnKhHh3CPEzEQDQ7AnB5hHhH9.TAcQDQDe.pftHhHhO.UPWDQDwGfJnKhHh3CPEzEQDQ7AnB5hHhH9.TAcQDQDe.pftHhHhO.UPWDQDwGfJnKhHh3CPEzEQDQ7AnB5hHhH9.TAcQDQDe.pftHhHhOfl3oSfamUasWyPwYyFbsqYrXcGrYyF0Vas.PSaZSavXu5Uup6HkLLi9YN3ck6W6ZFOWt5UqwElINGm4yPuqOu8d99Vigyj+dS+a0aJW7GoB52BJszRMTbVrXgyd1y5hyFiqt5piyctyA.csqc8lFmMa13Lm4LtqzxPJnfBLTbkVZobm2YecwYiwkWd4Y3XO4IyE.hM13bUoigc5SeZCGat4lqqKQbRW3BW.vdAlPCMTOb137JnfBH93i2PwVXgE5hyFiqvBKDKVrPvAGbCFW4kWtaJi7ungb+Vv4O+E37m+BNLtpqtZ15V2paHiLlJqrR9jOY67Iex1av3rYyFe3GtA2TVYLaYKagsrks3v39fO3CbCYiwsss8OYaa6eREUTQCF2912WRrwFmWQwb.BN3PH3fCwPEq28t2M6d261MjUNVxI2eRN49yG+werCis1Zq85iXk2h+1eaiXylMCE6G+wejKNaLtst0sRM033QXZ26dWr6cuK2PF4eQEzuEzoNk.cpSIvku7kuowXylM9K+k2kHirMtwLqgkbx8m0rl0vZVyZZv39zO8S3hWrD2TVYL6bm6jctyc1fwje94yBW3q3lxHioCcHZ5PGhl24cRsAiadyattmDxI8BuvBbXLcu62Acu62gaHaLt4O+miJqrxFLl0u90w5W+5bSYjwjc1GhidzizfwbfCreNvA1OadyaxMkUNVHgzL13Fa3aF4BW3BjVZqhzRaUtwLy+fJnKhHh3CPEzMAKYIuEUWc02ve1F23eksssFdns8DZdyCil27v37m+72ved5omNSe5OpaNqbrt0stS25V2I6ry5lFyzl1iPRI0S2XVYbu4a9F2zeVM0TC1r4c9UxhJ577xu7KcS+4u0a8ltwrw3hJpXXlybFbkqbka3O+y9rcvhVzBYQKZgt4LywlxTl7McNLjSN4vK8RuDuzK8Rzl1zN2ah4.O6y9L2zG8xku7kXwK90ohJtBUTwM9+SjFu.F0nFkwdPMRCJf.fG3Ad.hKt3InfreQ4TSMUJu7K4gyrFVQEUHSdxSgd1ydQSap8IxxktzkXYKqgGZXOsie7iwDlvDIkTFLsnEgAXufX5omN6cu+KOb10vZW6ZKidzil10N6WHtt5rPN4bh+8ilosd3rqg8i9Q+H5Tm95IqUAET.qacuOVr3ceYjyd173Ue0EQvAaed.WZokx1291YSaZSbm2Ye7vY2MWlYlNSaZSiQLh6E.pt5ZHiLRm0rl0P7w2IOb10vhIlnYTiZz.PKZQKHmbxg0st0RyadK7vYluKUPWDQDwGf2436IhHhHNEUPWDQDwGfJnKhHh3CPEzEQDQ7AnB5hHhH9.TAcQDQDe.pftHhHhO.UPWDQDwGv+evZNeRRLTBaa.....jTQNQjqBAlf\"\n              ]\n            },\n            \"inlets\": 1,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"jit_matrix\"\n            ],\n            \"box_extras\": {\n              \"autofit\": 1,\n              \"forceaspect\": 1,\n              \"pic\": \"icon.png\"\n            }\n          },\n          \"jit_gl_pass\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              335,\n              710\n            ],\n            \"text\": \"jit.gl.pass @fxname ssao @quality hi @radius 0.4\",\n            \"size\": [\n              273,\n              22\n            ],\n            \"attrs\": {\n              \"textfile\": {\n                \"filename\": \"ssao.jxp\",\n                \"flags\": 0,\n                \"embed\": 0,\n                \"autowatch\": 1\n              },\n              \"filename\": \"ssao.jxp\"\n            },\n            \"inlets\": 1,\n            \"outlets\": 3,\n            \"outlettype\": [\n              \"jit_gl_texture\",\n              \"\",\n              \"\"\n            ]\n          },\n          \"jit_gl_pass_2\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              311,\n              674\n            ],\n            \"text\": \"jit.gl.pass @fxname ssao @quality hi @radius 0.2\",\n            \"size\": [\n              273,\n              22\n            ],\n            \"attrs\": {\n              \"textfile\": {\n                \"filename\": \"ssao.jxp\",\n                \"flags\": 0,\n                \"embed\": 0,\n                \"autowatch\": 1\n              },\n              \"filename\": \"ssao.jxp\"\n            },\n            \"inlets\": 1,\n            \"outlets\": 3,\n            \"outlettype\": [\n              \"jit_gl_texture\",\n              \"\",\n              \"\"\n            ]\n          },\n          \"jit_gl_pass_3\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              367,\n              750\n            ],\n            \"text\": \"jit.gl.pass @fxname gamma @quality hi\",\n            \"size\": [\n              220,\n              22\n            ],\n            \"attrs\": {\n              \"textfile\": {\n                \"filename\": \"gamma.jxp\",\n                \"flags\": 0,\n                \"embed\": 0,\n                \"autowatch\": 1\n              },\n              \"filename\": \"gamma.jxp\"\n            },\n            \"inlets\": 1,\n            \"outlets\": 3,\n            \"outlettype\": [\n              \"jit_gl_texture\",\n              \"\",\n              \"\"\n            ]\n          },\n          \"jit_gl_pass_4\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              279,\n              637\n            ],\n            \"text\": \"jit.gl.pass @fxname ssao @quality hi @radius 0.1\",\n            \"size\": [\n              273,\n              22\n            ],\n            \"attrs\": {\n              \"textfile\": {\n                \"filename\": \"ssao.jxp\",\n                \"flags\": 0,\n                \"embed\": 0,\n                \"autowatch\": 1\n              },\n              \"filename\": \"ssao.jxp\"\n            },\n            \"inlets\": 1,\n            \"outlets\": 3,\n            \"outlettype\": [\n              \"jit_gl_texture\",\n              \"\",\n              \"\"\n            ]\n          },\n          \"jit_gl_light\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              348,\n              582\n            ],\n            \"text\": \"jit.gl.light @type directional @direction 1 -0.3 -0.3 @shadows 1 @shadowquality hi @shadowrange 5. @shadowblur 0. @diffuse 3 3 3\",\n            \"size\": [\n              719,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"loadbang_2\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              936,\n              353\n            ],\n            \"text\": \"loadbang\",\n            \"size\": [\n              58,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"bang\"\n            ]\n          },\n          \"exprfill\": {\n            \"type\": \"message\",\n            \"pos\": [\n              936,\n              387\n            ],\n            \"text\": \"exprfill 0 norm[0], exprfill 1 norm[1], bang\",\n            \"size\": [\n              226,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"jit_matrix\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              936,\n              425\n            ],\n            \"text\": \"jit.matrix 2 float32 160 160\",\n            \"size\": [\n              149,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"jit_matrix\",\n              \"\"\n            ]\n          },\n          \"jit_gl_mesh\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              877,\n              512\n            ],\n            \"text\": \"jit.gl.mesh @auto_normals 1 @draw_mode tri_grid @cull_face 1\",\n            \"size\": [\n              449,\n              22\n            ],\n            \"inlets\": 9,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"\",\n              \"\"\n            ]\n          },\n          \"jit_dimmap\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              877,\n              467\n            ],\n            \"text\": \"jit.dimmap @invert 1 0\",\n            \"size\": [\n              128,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"jit_matrix\",\n              \"\"\n            ]\n          },\n          \"jit_gl_pbr_2\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              703,\n              215\n            ],\n            \"text\": \"jit.gl.pbr @mat_diffuse 0.6 0.6 0.6 @mat_emission 0.1 0.1 0.1 @gamma_correction 0 @shadow_eps 0.001 @shadow_hard 1 @shadow_soft 0.\",\n            \"size\": [\n              185,\n              89\n            ],\n            \"inlets\": 8,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"\",\n              \"\"\n            ]\n          },\n          \"jit_gl_mesh_2\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              403,\n              512\n            ],\n            \"text\": \"jit.gl.mesh @auto_normals 1 @draw_mode tri_grid @cull_face 1\",\n            \"size\": [\n              449,\n              22\n            ],\n            \"inlets\": 9,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"\",\n              \"\"\n            ]\n          },\n          \"jit_unpack\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              403,\n              380\n            ],\n            \"text\": \"jit.unpack 1 @jump 3 @offset 1\",\n            \"size\": [\n              175,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"jit_matrix\",\n              \"\"\n            ]\n          },\n          \"inlet\": {\n            \"type\": \"inlet\",\n            \"pos\": [\n              403,\n              309\n            ],\n            \"inlets\": 0,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"jit_matrix\"\n            ],\n            \"box_extras\": {\n              \"comment\": \"jit_matrix: cloth point positions\",\n              \"index\": 1\n            }\n          },\n          \"inlet_2\": {\n            \"type\": \"inlet\",\n            \"pos\": [\n              700,\n              625\n            ],\n            \"inlets\": 0,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ],\n            \"box_extras\": {\n              \"comment\": \"sphere x y z radius, or floorY y (from r COLLIDER)\",\n              \"index\": 4\n            }\n          },\n          \"sphere\": {\n            \"type\": \"comment\",\n            \"pos\": [\n              735,\n              623\n            ],\n            \"text\": \"sphere x y z radius, or floorY y. The shapes are drawn where the shader collides with them.\",\n            \"size\": [\n              300,\n              33\n            ],\n            \"inlets\": 1,\n            \"outlets\": 0,\n            \"outlettype\": []\n          },\n          \"route\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              700,\n              662\n            ],\n            \"text\": \"route sphere floorY\",\n            \"size\": [\n              274,\n              22\n            ],\n            \"inlets\": 3,\n            \"outlets\": 3,\n            \"outlettype\": [\n              \"\",\n              \"\",\n              \"\"\n            ]\n          },\n          \"position\": {\n            \"type\": \"message\",\n            \"pos\": [\n              700,\n              694\n            ],\n            \"text\": \"position $1 $2 $3, scale $4 $4 $4\",\n            \"size\": [\n              125,\n              35\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"position_2\": {\n            \"type\": \"message\",\n            \"pos\": [\n              830,\n              694\n            ],\n            \"text\": \"position 0. $1 0.\",\n            \"size\": [\n              105,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"jit_gl_gridshape_2\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              700,\n              750\n            ],\n            \"text\": \"jit.gl.gridshape @shape sphere @dim 40 40\",\n            \"size\": [\n              125,\n              35\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"\",\n              \"\"\n            ]\n          },\n          \"jit_gl_gridshape_3\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              830,\n              750\n            ],\n            \"text\": \"jit.gl.gridshape @shape plane @rotatexyz -90. 0. 0. @scale 2.5 2.5 1. @cull_face 1\",\n            \"size\": [\n              215,\n              49\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"\",\n              \"\"\n            ]\n          },\n          \"jit_gl_pbr_3\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              1060,\n              640\n            ],\n            \"text\": \"jit.gl.pbr @mat_diffuse 0.75 0.3 0.2 @mat_emission 0.1 0.1 0.1 @gamma_correction 0 @shadow_eps 0.001 @shadow_hard 1 @shadow_soft 0.\",\n            \"size\": [\n              185,\n              89\n            ],\n            \"inlets\": 8,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"\",\n              \"\"\n            ]\n          },\n          \"route_2\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              24,\n              70\n            ],\n            \"text\": \"route front top bottom left right\",\n            \"size\": [\n              639,\n              22\n            ],\n            \"inlets\": 6,\n            \"outlets\": 6,\n            \"outlettype\": [\n              \"\",\n              \"\",\n              \"\",\n              \"\",\n              \"\",\n              \"\"\n            ]\n          },\n          \"position_3\": {\n            \"type\": \"message\",\n            \"pos\": [\n              24,\n              110\n            ],\n            \"text\": \"tripod 1, locklook 1, position 0. 0. 5., lookat 0. 0. 0.\",\n            \"size\": [\n              120,\n              49\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"position_4\": {\n            \"type\": \"message\",\n            \"pos\": [\n              149,\n              110\n            ],\n            \"text\": \"locklook 0, tripod 0, position 0. 5. 0., rotatexyz -90. 0. 0.\",\n            \"size\": [\n              120,\n              49\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"position_5\": {\n            \"type\": \"message\",\n            \"pos\": [\n              274,\n              110\n            ],\n            \"text\": \"locklook 0, tripod 0, position 0. -5. 0., rotatexyz 90. 0. 0.\",\n            \"size\": [\n              120,\n              49\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"position_6\": {\n            \"type\": \"message\",\n            \"pos\": [\n              399,\n              110\n            ],\n            \"text\": \"tripod 1, locklook 1, position -5. 0. 0., lookat 0. 0. 0.\",\n            \"size\": [\n              120,\n              49\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"position_7\": {\n            \"type\": \"message\",\n            \"pos\": [\n              524,\n              110\n            ],\n            \"text\": \"tripod 1, locklook 1, position 5. 0. 0., lookat 0. 0. 0.\",\n            \"size\": [\n              120,\n              49\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"inlet_4\": {\n            \"type\": \"inlet\",\n            \"pos\": [\n              650,\n              170\n            ],\n            \"inlets\": 0,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"jit_gl_texture\"\n            ],\n            \"box_extras\": {\n              \"comment\": \"jit_gl_texture: video for the cloth (from jit.playlist)\",\n              \"index\": 3\n            }\n          },\n          \"inlet_3\": {\n            \"type\": \"inlet\",\n            \"pos\": [\n              600,\n              24\n            ],\n            \"inlets\": 0,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ],\n            \"box_extras\": {\n              \"comment\": \"camera view: front, top, bottom, left or right\",\n              \"index\": 2\n            }\n          },\n          \"camera\": {\n            \"type\": \"comment\",\n            \"pos\": [\n              320,\n              29\n            ],\n            \"text\": \"camera view: front, top, bottom, left or right\",\n            \"size\": [\n              275,\n              20\n            ],\n            \"inlets\": 1,\n            \"outlets\": 0,\n            \"outlettype\": []\n          },\n          \"video\": {\n            \"type\": \"comment\",\n            \"pos\": [\n              520,\n              180\n            ],\n            \"text\": \"video for the cloth (from jit.playlist)\",\n            \"size\": [\n              128,\n              33\n            ],\n            \"inlets\": 1,\n            \"outlets\": 0,\n            \"outlettype\": []\n          },\n          \"r\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              450,\n              262\n            ],\n            \"text\": \"r CLOTH_GRID\",\n            \"size\": [\n              90,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"dim\": {\n            \"type\": \"message\",\n            \"pos\": [\n              450,\n              300\n            ],\n            \"text\": \"dim $1 $1\",\n            \"size\": [\n              65,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"r_2\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              1100,\n              300\n            ],\n            \"text\": \"r CLOTH_GRID\",\n            \"size\": [\n              90,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"t\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              1100,\n              335\n            ],\n            \"text\": \"t b i\",\n            \"size\": [\n              40,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"bang\",\n              \"int\"\n            ]\n          },\n          \"dim_2\": {\n            \"type\": \"message\",\n            \"pos\": [\n              1175,\n              387\n            ],\n            \"text\": \"dim $1 $1\",\n            \"size\": [\n              65,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"resize\": {\n            \"type\": \"comment\",\n            \"pos\": [\n              1194,\n              301\n            ],\n            \"text\": \"resize the texture coordinates, then fill them again\",\n            \"size\": [\n              150,\n              33\n            ],\n            \"inlets\": 1,\n            \"outlets\": 0,\n            \"outlettype\": []\n          }\n        },\n        \"connections\": [\n          [\n            \"jit_dimmap\",\n            0,\n            \"jit_gl_mesh\",\n            0\n          ],\n          [\n            \"jit_submatrix\",\n            0,\n            \"jit_unpack\",\n            0\n          ],\n          [\n            \"loadbang_2\",\n            0,\n            \"exprfill\",\n            0\n          ],\n          [\n            \"jit_anim_drive\",\n            0,\n            \"jit_gl_camera\",\n            0\n          ],\n          [\n            \"anim_reset\",\n            0,\n            \"jit_anim_drive\",\n            0\n          ],\n          [\n            \"anim_reset\",\n            0,\n            \"jit_gl_camera\",\n            0\n          ],\n          [\n            \"jit_unpack\",\n            0,\n            \"jit_dimmap\",\n            0\n          ],\n          [\n            \"jit_unpack\",\n            0,\n            \"jit_gl_mesh_2\",\n            0\n          ],\n          [\n            \"jit_gl_pass_4\",\n            1,\n            \"jit_gl_pass_2\",\n            0\n          ],\n          [\n            \"jit_gl_pass_3\",\n            0,\n            \"outlet\",\n            0\n          ],\n          [\n            \"jit_gl_pass_2\",\n            1,\n            \"jit_gl_pass\",\n            0\n          ],\n          [\n            \"jit_gl_pass\",\n            1,\n            \"jit_gl_pass_3\",\n            0\n          ],\n          [\n            \"fpic\",\n            0,\n            \"jit_gen\",\n            0\n          ],\n          [\n            \"jit_gl_node\",\n            1,\n            \"jit_gl_light\",\n            0\n          ],\n          [\n            \"jit_gl_node\",\n            1,\n            \"jit_gl_mesh\",\n            0\n          ],\n          [\n            \"jit_gl_node\",\n            1,\n            \"jit_gl_camera\",\n            0\n          ],\n          [\n            \"jit_gl_node\",\n            1,\n            \"jit_gl_mesh_2\",\n            0\n          ],\n          [\n            \"jit_matrix\",\n            0,\n            \"jit_gl_mesh\",\n            1\n          ],\n          [\n            \"jit_matrix\",\n            0,\n            \"jit_gl_mesh_2\",\n            1\n          ],\n          [\n            \"exprfill\",\n            0,\n            \"jit_matrix\",\n            0\n          ],\n          [\n            \"loadbang\",\n            0,\n            \"fpic\",\n            0\n          ],\n          [\n            \"inlet\",\n            0,\n            \"jit_submatrix\",\n            0\n          ],\n          [\n            \"jit_gl_pbr_2\",\n            0,\n            \"jit_gl_mesh\",\n            0\n          ],\n          [\n            \"jit_gl_pbr_2\",\n            0,\n            \"jit_gl_mesh_2\",\n            0\n          ],\n          [\n            \"jit_gen\",\n            0,\n            \"jit_gl_pbr_2\",\n            6\n          ],\n          [\n            \"jit_gen\",\n            0,\n            \"jit_gl_pbr_2\",\n            0\n          ],\n          [\n            \"inlet_2\",\n            0,\n            \"route\",\n            0\n          ],\n          [\n            \"route\",\n            0,\n            \"position\",\n            0\n          ],\n          [\n            \"route\",\n            1,\n            \"position_2\",\n            0\n          ],\n          [\n            \"position\",\n            0,\n            \"jit_gl_gridshape_2\",\n            0\n          ],\n          [\n            \"position_2\",\n            0,\n            \"jit_gl_gridshape_3\",\n            0\n          ],\n          [\n            \"jit_gl_node\",\n            1,\n            \"jit_gl_gridshape_2\",\n            0\n          ],\n          [\n            \"jit_gl_node\",\n            1,\n            \"jit_gl_gridshape_3\",\n            0\n          ],\n          [\n            \"jit_gl_pbr_3\",\n            0,\n            \"jit_gl_gridshape_2\",\n            0\n          ],\n          [\n            \"jit_gl_pbr_3\",\n            0,\n            \"jit_gl_gridshape_3\",\n            0\n          ],\n          [\n            \"inlet_3\",\n            0,\n            \"route_2\",\n            0\n          ],\n          [\n            \"route_2\",\n            0,\n            \"position_3\",\n            0\n          ],\n          [\n            \"position_3\",\n            0,\n            \"jit_gl_camera\",\n            0\n          ],\n          [\n            \"route_2\",\n            1,\n            \"position_4\",\n            0\n          ],\n          [\n            \"position_4\",\n            0,\n            \"jit_gl_camera\",\n            0\n          ],\n          [\n            \"route_2\",\n            2,\n            \"position_5\",\n            0\n          ],\n          [\n            \"position_5\",\n            0,\n            \"jit_gl_camera\",\n            0\n          ],\n          [\n            \"route_2\",\n            3,\n            \"position_6\",\n            0\n          ],\n          [\n            \"position_6\",\n            0,\n            \"jit_gl_camera\",\n            0\n          ],\n          [\n            \"route_2\",\n            4,\n            \"position_7\",\n            0\n          ],\n          [\n            \"position_7\",\n            0,\n            \"jit_gl_camera\",\n            0\n          ],\n          [\n            \"inlet_4\",\n            0,\n            \"jit_gl_pbr_2\",\n            0\n          ],\n          [\n            \"inlet_4\",\n            0,\n            \"jit_gl_pbr_2\",\n            6\n          ],\n          [\n            \"r\",\n            0,\n            \"dim\",\n            0\n          ],\n          [\n            \"dim\",\n            0,\n            \"jit_submatrix\",\n            0\n          ],\n          [\n            \"r_2\",\n            0,\n            \"t\",\n            0\n          ],\n          [\n            \"t\",\n            1,\n            \"dim_2\",\n            0\n          ],\n          [\n            \"dim_2\",\n            0,\n            \"jit_matrix\",\n            0\n          ],\n          [\n            \"t\",\n            0,\n            \"exprfill\",\n            0\n          ]\n        ],\n        \"patcher_extras\": {\n          \"rect\": [\n            80.0,\n            101.0,\n            1367.0,\n            898.0\n          ],\n          \"toolbaradditions\": [\n            \"Vsynth\",\n            \"User-Package\",\n            \"Vizzie\"\n          ]\n        }\n      }\n    },\n    \"Wind\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        579,\n        243\n      ],\n      \"text\": \"Wind strength\",\n      \"size\": [\n        83,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"flonum\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        527,\n        242\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"format\": 6,\n        \"parameter_enable\": 0\n      },\n      \"size\": [\n        50,\n        22\n      ]\n    },\n    \"p_2\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        527,\n        278\n      ],\n      \"text\": \"p wind\",\n      \"size\": [\n        43,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"jit_gl_texture\"\n      ],\n      \"patcher\": {\n        \"width\": 645,\n        \"height\": 588,\n        \"objects\": {\n          \"inlet\": {\n            \"type\": \"inlet\",\n            \"pos\": [\n              398,\n              365\n            ],\n            \"inlets\": 0,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ],\n            \"box_extras\": {\n              \"comment\": \"\",\n              \"index\": 1\n            }\n          },\n          \"jit_gl_pix\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              81,\n              460\n            ],\n            \"text\": \"jit.gl.pix\",\n            \"size\": [\n              49,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"jit_gl_texture\",\n              \"\"\n            ],\n            \"patcher\": {\n              \"width\": 600,\n              \"height\": 450,\n              \"objects\": {\n                \"param\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    226,\n                    121\n                  ],\n                  \"text\": \"param wind_strength 0.\",\n                  \"size\": [\n                    134,\n                    22\n                  ],\n                  \"inlets\": 0,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"obj\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    77,\n                    63\n                  ],\n                  \"text\": \"- 0.5 0.5 0.5\",\n                  \"size\": [\n                    73,\n                    22\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"obj_2\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    41,\n                    154\n                  ],\n                  \"text\": \"*\",\n                  \"size\": [\n                    29,\n                    22\n                  ],\n                  \"inlets\": 2,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"in\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    50,\n                    14\n                  ],\n                  \"text\": \"in 1\",\n                  \"size\": [\n                    28,\n                    22\n                  ],\n                  \"inlets\": 0,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"out\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    176,\n                    418\n                  ],\n                  \"text\": \"out 1\",\n                  \"size\": [\n                    35,\n                    22\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 0,\n                  \"outlettype\": []\n                }\n              },\n              \"connections\": [\n                [\n                  \"in\",\n                  0,\n                  \"obj\",\n                  0\n                ],\n                [\n                  \"param\",\n                  0,\n                  \"obj_2\",\n                  1\n                ],\n                [\n                  \"obj_2\",\n                  0,\n                  \"out\",\n                  0\n                ],\n                [\n                  \"obj\",\n                  0,\n                  \"obj_2\",\n                  0\n                ]\n              ],\n              \"patcher_extras\": {\n                \"rect\": [\n                  311.0,\n                  260.0,\n                  600.0,\n                  450.0\n                ]\n              }\n            }\n          },\n          \"jit_bang\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              285,\n              118\n            ],\n            \"text\": \"jit.bang\",\n            \"size\": [\n              47,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"\",\n              \"\"\n            ]\n          },\n          \"loadmess\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              350,\n              118\n            ],\n            \"text\": \"loadmess 0.01\",\n            \"size\": [\n              87,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"flonum\": {\n            \"type\": \"flonum\",\n            \"pos\": [\n              350,\n              163\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"\",\n              \"bang\"\n            ],\n            \"box_extras\": {\n              \"format\": 6,\n              \"parameter_enable\": 0\n            },\n            \"size\": [\n              50,\n              22\n            ]\n          },\n          \"t\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              285,\n              236\n            ],\n            \"text\": \"t f f\",\n            \"size\": [\n              29,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"float\",\n              \"float\"\n            ]\n          },\n          \"obj\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              285,\n              201\n            ],\n            \"text\": \"+ 0.\",\n            \"size\": [\n              29,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"float\"\n            ]\n          },\n          \"f\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              285,\n              163\n            ],\n            \"text\": \"f 0.\",\n            \"size\": [\n              29,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"float\"\n            ]\n          },\n          \"jit_gl_pix_2\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              81,\n              410\n            ],\n            \"text\": \"jit.gl.pix\",\n            \"size\": [\n              146,\n              22\n            ],\n            \"inlets\": 3,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"jit_gl_texture\",\n              \"\"\n            ],\n            \"patcher\": {\n              \"width\": 600,\n              \"height\": 450,\n              \"objects\": {\n                \"vec\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    282,\n                    208\n                  ],\n                  \"text\": \"vec 0. 0. 0. 1.\",\n                  \"size\": [\n                    81,\n                    22\n                  ],\n                  \"inlets\": 4,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"swiz\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    369,\n                    67\n                  ],\n                  \"text\": \"swiz r\",\n                  \"size\": [\n                    39,\n                    22\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"swiz_3\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    50,\n                    67\n                  ],\n                  \"text\": \"swiz r\",\n                  \"size\": [\n                    39,\n                    22\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"in\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    365,\n                    14\n                  ],\n                  \"text\": \"in 3\",\n                  \"size\": [\n                    28,\n                    22\n                  ],\n                  \"inlets\": 0,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"in_2\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    50,\n                    14\n                  ],\n                  \"text\": \"in 1\",\n                  \"size\": [\n                    28,\n                    22\n                  ],\n                  \"inlets\": 0,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"in_3\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    215,\n                    14\n                  ],\n                  \"text\": \"in 2\",\n                  \"size\": [\n                    28,\n                    22\n                  ],\n                  \"inlets\": 0,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"out\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    176,\n                    418\n                  ],\n                  \"text\": \"out 1\",\n                  \"size\": [\n                    35,\n                    22\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 0,\n                  \"outlettype\": []\n                },\n                \"swiz_2\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    209,\n                    67\n                  ],\n                  \"text\": \"swiz r\",\n                  \"size\": [\n                    39,\n                    22\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                }\n              },\n              \"connections\": [\n                [\n                  \"in_2\",\n                  0,\n                  \"swiz_3\",\n                  0\n                ],\n                [\n                  \"in_3\",\n                  0,\n                  \"swiz_2\",\n                  0\n                ],\n                [\n                  \"in\",\n                  0,\n                  \"swiz\",\n                  0\n                ],\n                [\n                  \"swiz_3\",\n                  0,\n                  \"vec\",\n                  0\n                ],\n                [\n                  \"swiz_2\",\n                  0,\n                  \"vec\",\n                  1\n                ],\n                [\n                  \"swiz\",\n                  0,\n                  \"vec\",\n                  2\n                ],\n                [\n                  \"vec\",\n                  0,\n                  \"out\",\n                  0\n                ]\n              ],\n              \"patcher_extras\": {\n                \"rect\": [\n                  84.0,\n                  144.0,\n                  600.0,\n                  450.0\n                ]\n              }\n            }\n          },\n          \"obj_2\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              237,\n              299\n            ],\n            \"text\": \"+ 20.\",\n            \"size\": [\n              36,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"float\"\n            ]\n          },\n          \"time\": {\n            \"type\": \"message\",\n            \"pos\": [\n              237,\n              332\n            ],\n            \"text\": \"time $1\",\n            \"size\": [\n              48,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"time_2\": {\n            \"type\": \"message\",\n            \"pos\": [\n              171,\n              332\n            ],\n            \"text\": \"time $1\",\n            \"size\": [\n              48,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"time_3\": {\n            \"type\": \"message\",\n            \"pos\": [\n              110,\n              332\n            ],\n            \"text\": \"time $1\",\n            \"size\": [\n              48,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"obj_3\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              171,\n              299\n            ],\n            \"text\": \"+ 10.\",\n            \"size\": [\n              36,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"float\"\n            ]\n          },\n          \"jit_gl_bfg\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              208,\n              369\n            ],\n            \"text\": \"jit.gl.bfg\",\n            \"size\": [\n              50,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"jit_gl_texture\",\n              \"\"\n            ]\n          },\n          \"jit_gl_bfg_2\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              144,\n              369\n            ],\n            \"text\": \"jit.gl.bfg\",\n            \"size\": [\n              50,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"jit_gl_texture\",\n              \"\"\n            ]\n          },\n          \"jit_bang_2\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              81,\n              44\n            ],\n            \"text\": \"jit.bang\",\n            \"size\": [\n              47,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"\",\n              \"\"\n            ]\n          },\n          \"attrui\": {\n            \"type\": \"attrui\",\n            \"pos\": [\n              302,\n              299\n            ],\n            \"size\": [\n              165,\n              22\n            ],\n            \"attrs\": {\n              \"text_width\": 55.333343505859375,\n              \"attr\": \"basis\"\n            },\n            \"inlets\": 1,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ],\n            \"box_extras\": {\n              \"parameter_enable\": 0,\n              \"style\": \"default\"\n            }\n          },\n          \"jit_gl_texture\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              81,\n              81\n            ],\n            \"text\": \"jit.gl.texture @type float32 @adapt 0 @dim 160 160\",\n            \"size\": [\n              285,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"jit_gl_texture\",\n              \"\"\n            ]\n          },\n          \"jit_gl_bfg_3\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              81,\n              369\n            ],\n            \"text\": \"jit.gl.bfg\",\n            \"size\": [\n              50,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"jit_gl_texture\",\n              \"\"\n            ]\n          },\n          \"attrui_2\": {\n            \"type\": \"attrui\",\n            \"pos\": [\n              302,\n              323\n            ],\n            \"size\": [\n              117,\n              22\n            ],\n            \"attrs\": {\n              \"text_width\": 56.0,\n              \"attr\": \"zoom\"\n            },\n            \"inlets\": 1,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ],\n            \"box_extras\": {\n              \"parameter_enable\": 0\n            }\n          },\n          \"outlet\": {\n            \"type\": \"outlet\",\n            \"pos\": [\n              81,\n              503\n            ],\n            \"inlets\": 1,\n            \"outlets\": 0,\n            \"outlettype\": [],\n            \"box_extras\": {\n              \"comment\": \"\",\n              \"index\": 1\n            }\n          },\n          \"attrui_3\": {\n            \"type\": \"attrui\",\n            \"pos\": [\n              398,\n              410\n            ],\n            \"size\": [\n              150,\n              22\n            ],\n            \"attrs\": {\n              \"attr\": \"wind_strength\"\n            },\n            \"inlets\": 1,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ],\n            \"box_extras\": {\n              \"parameter_enable\": 0\n            }\n          },\n          \"r\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              200,\n              8\n            ],\n            \"text\": \"r CLOTH_GRID\",\n            \"size\": [\n              90,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"dim\": {\n            \"type\": \"message\",\n            \"pos\": [\n              200,\n              44\n            ],\n            \"text\": \"dim $1 $1\",\n            \"size\": [\n              65,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          }\n        },\n        \"connections\": [\n          [\n            \"inlet\",\n            0,\n            \"attrui_3\",\n            0\n          ],\n          [\n            \"jit_bang\",\n            0,\n            \"f\",\n            0\n          ],\n          [\n            \"loadmess\",\n            0,\n            \"flonum\",\n            0\n          ],\n          [\n            \"flonum\",\n            0,\n            \"obj\",\n            1\n          ],\n          [\n            \"t\",\n            1,\n            \"f\",\n            1\n          ],\n          [\n            \"t\",\n            0,\n            \"obj_2\",\n            0\n          ],\n          [\n            \"t\",\n            0,\n            \"time_3\",\n            0\n          ],\n          [\n            \"t\",\n            0,\n            \"obj_3\",\n            0\n          ],\n          [\n            \"obj\",\n            0,\n            \"t\",\n            0\n          ],\n          [\n            \"f\",\n            0,\n            \"obj\",\n            0\n          ],\n          [\n            \"jit_gl_pix\",\n            0,\n            \"outlet\",\n            0\n          ],\n          [\n            \"attrui_3\",\n            0,\n            \"jit_gl_pix\",\n            0\n          ],\n          [\n            \"jit_gl_pix_2\",\n            0,\n            \"jit_gl_pix\",\n            0\n          ],\n          [\n            \"obj_2\",\n            0,\n            \"time\",\n            0\n          ],\n          [\n            \"time\",\n            0,\n            \"jit_gl_bfg\",\n            0\n          ],\n          [\n            \"time_2\",\n            0,\n            \"jit_gl_bfg_2\",\n            0\n          ],\n          [\n            \"time_3\",\n            0,\n            \"jit_gl_bfg_3\",\n            0\n          ],\n          [\n            \"obj_3\",\n            0,\n            \"time_2\",\n            0\n          ],\n          [\n            \"jit_gl_bfg\",\n            0,\n            \"jit_gl_pix_2\",\n            2\n          ],\n          [\n            \"jit_gl_bfg_2\",\n            0,\n            \"jit_gl_pix_2\",\n            1\n          ],\n          [\n            \"jit_bang_2\",\n            0,\n            \"jit_gl_texture\",\n            0\n          ],\n          [\n            \"attrui\",\n            0,\n            \"jit_gl_bfg\",\n            0\n          ],\n          [\n            \"attrui\",\n            0,\n            \"jit_gl_bfg_2\",\n            0\n          ],\n          [\n            \"attrui\",\n            0,\n            \"jit_gl_bfg_3\",\n            0\n          ],\n          [\n            \"jit_gl_texture\",\n            0,\n            \"jit_gl_bfg\",\n            0\n          ],\n          [\n            \"jit_gl_texture\",\n            0,\n            \"jit_gl_bfg_2\",\n            0\n          ],\n          [\n            \"jit_gl_texture\",\n            0,\n            \"jit_gl_bfg_3\",\n            0\n          ],\n          [\n            \"jit_gl_bfg_3\",\n            0,\n            \"jit_gl_pix_2\",\n            0\n          ],\n          [\n            \"attrui_2\",\n            0,\n            \"jit_gl_bfg\",\n            0\n          ],\n          [\n            \"attrui_2\",\n            0,\n            \"jit_gl_bfg_2\",\n            0\n          ],\n          [\n            \"attrui_2\",\n            0,\n            \"jit_gl_bfg_3\",\n            0\n          ],\n          [\n            \"r\",\n            0,\n            \"dim\",\n            0\n          ],\n          [\n            \"dim\",\n            0,\n            \"jit_gl_texture\",\n            0\n          ]\n        ],\n        \"patcher_extras\": {\n          \"rect\": [\n            59.0,\n            119.0,\n            645.0,\n            588.0\n          ],\n          \"toolbaradditions\": [\n            \"Vsynth\",\n            \"User-Package\",\n            \"Vizzie\"\n          ]\n        }\n      }\n    },\n    \"p_3\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        211,\n        402\n      ],\n      \"text\": \"p set_cloth_sim_params\",\n      \"size\": [\n        139,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"patcher\": {\n        \"width\": 659,\n        \"height\": 535,\n        \"objects\": {\n          \"prepend\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              50,\n              352\n            ],\n            \"text\": \"prepend param\",\n            \"size\": [\n              90,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"prepend_2\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              207,\n              291\n            ],\n            \"text\": \"prepend restLengthHoriz\",\n            \"size\": [\n              141,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"prepend_3\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              375,\n              291\n            ],\n            \"text\": \"prepend restLengthVert\",\n            \"size\": [\n              134,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"prepend_4\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              50,\n              291\n            ],\n            \"text\": \"prepend restLengthDiag\",\n            \"size\": [\n              137,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"expr\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              50,\n              245\n            ],\n            \"text\": \"expr sqrt($f1*$f1 + $f2*$f2)\",\n            \"size\": [\n              153,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"obj\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              184,\n              209\n            ],\n            \"text\": \"!/ 2.\",\n            \"size\": [\n              29,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"float\"\n            ]\n          },\n          \"obj_2\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              50,\n              202\n            ],\n            \"text\": \"!/ 2.\",\n            \"size\": [\n              29,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"float\"\n            ]\n          },\n          \"unpack\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              50,\n              169\n            ],\n            \"text\": \"unpack f f\",\n            \"size\": [\n              153,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"float\",\n              \"float\"\n            ]\n          },\n          \"route\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              51,\n              133\n            ],\n            \"text\": \"route dim\",\n            \"size\": [\n              59,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"\",\n              \"\"\n            ]\n          },\n          \"jit_matrixinfo\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              51,\n              100\n            ],\n            \"text\": \"jit.matrixinfo\",\n            \"size\": [\n              73,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"inlet\": {\n            \"type\": \"inlet\",\n            \"pos\": [\n              51,\n              40\n            ],\n            \"inlets\": 0,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"jit_matrix\"\n            ],\n            \"box_extras\": {\n              \"comment\": \"\",\n              \"index\": 1\n            }\n          },\n          \"outlet\": {\n            \"type\": \"outlet\",\n            \"pos\": [\n              50,\n              394\n            ],\n            \"inlets\": 1,\n            \"outlets\": 0,\n            \"outlettype\": [],\n            \"box_extras\": {\n              \"comment\": \"\",\n              \"index\": 1\n            }\n          }\n        },\n        \"connections\": [\n          [\n            \"prepend_4\",\n            0,\n            \"prepend\",\n            0\n          ],\n          [\n            \"jit_matrixinfo\",\n            0,\n            \"route\",\n            0\n          ],\n          [\n            \"route\",\n            0,\n            \"unpack\",\n            0\n          ],\n          [\n            \"prepend\",\n            0,\n            \"outlet\",\n            0\n          ],\n          [\n            \"unpack\",\n            0,\n            \"obj_2\",\n            0\n          ],\n          [\n            \"unpack\",\n            1,\n            \"obj\",\n            0\n          ],\n          [\n            \"obj_2\",\n            0,\n            \"expr\",\n            0\n          ],\n          [\n            \"obj_2\",\n            0,\n            \"prepend_2\",\n            0\n          ],\n          [\n            \"obj\",\n            0,\n            \"expr\",\n            1\n          ],\n          [\n            \"obj\",\n            0,\n            \"prepend_3\",\n            0\n          ],\n          [\n            \"expr\",\n            0,\n            \"prepend_4\",\n            0\n          ],\n          [\n            \"prepend_3\",\n            0,\n            \"prepend\",\n            0\n          ],\n          [\n            \"prepend_2\",\n            0,\n            \"prepend\",\n            0\n          ],\n          [\n            \"inlet\",\n            0,\n            \"jit_matrixinfo\",\n            0\n          ]\n        ],\n        \"patcher_extras\": {\n          \"rect\": [\n            59.0,\n            119.0,\n            659.0,\n            535.0\n          ],\n          \"toolbaradditions\": [\n            \"Vsynth\",\n            \"User-Package\",\n            \"Vizzie\"\n          ]\n        }\n      }\n    },\n    \"jit_gpu_image\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        527,\n        316\n      ],\n      \"text\": \"jit.gpu.image @format rgba32_float @name windImg @dim 160 160\",\n      \"size\": [\n        209,\n        35\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"uzi\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        71,\n        471\n      ],\n      \"text\": \"uzi 10 0\",\n      \"size\": [\n        51,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"bang\",\n        \"bang\",\n        \"int\"\n      ]\n    },\n    \"t\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        40,\n        429\n      ],\n      \"text\": \"t b b\",\n      \"size\": [\n        50,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"bang\",\n        \"bang\"\n      ]\n    },\n    \"jit_gpu_bang\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        40,\n        250\n      ],\n      \"text\": \"jit.gpu.bang\",\n      \"size\": [\n        71,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"jit_gpu_submit\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        40,\n        740\n      ],\n      \"text\": \"jit.gpu.submit\",\n      \"size\": [\n        79,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\"\n      ]\n    },\n    \"p_4\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        211,\n        204\n      ],\n      \"text\": \"p create gridshape\",\n      \"size\": [\n        108,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"jit_matrix\"\n      ],\n      \"patcher\": {\n        \"width\": 760,\n        \"height\": 457,\n        \"objects\": {\n          \"uzi\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              50,\n              67\n            ],\n            \"text\": \"uzi 2\",\n            \"size\": [\n              40,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 3,\n            \"outlettype\": [\n              \"bang\",\n              \"bang\",\n              \"int\"\n            ]\n          },\n          \"jit_gen\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              50,\n              236\n            ],\n            \"text\": \"jit.gen\",\n            \"size\": [\n              41,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"jit_matrix\",\n              \"\"\n            ],\n            \"patcher\": {\n              \"width\": 600,\n              \"height\": 450,\n              \"objects\": {\n                \"in\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    50,\n                    14\n                  ],\n                  \"text\": \"in 1\",\n                  \"size\": [\n                    28,\n                    22\n                  ],\n                  \"inlets\": 0,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"swiz_3\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    50,\n                    200\n                  ],\n                  \"text\": \"out 1\",\n                  \"size\": [\n                    35,\n                    22\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 0,\n                  \"outlettype\": []\n                },\n                \"obj_6\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    50,\n                    140\n                  ],\n                  \"text\": \"+ 0. 1.2 0.\",\n                  \"size\": [\n                    75,\n                    22\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"swiz_4\": {\n                  \"type\": \"newobj\",\n                  \"pos\": [\n                    50,\n                    80\n                  ],\n                  \"text\": \"swiz xzy\",\n                  \"size\": [\n                    55,\n                    22\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 1,\n                  \"outlettype\": [\n                    \"\"\n                  ]\n                },\n                \"lay\": {\n                  \"type\": \"comment\",\n                  \"pos\": [\n                    128,\n                    141\n                  ],\n                  \"text\": \"lay the sheet level (y and z swapped) and lift it to y = 1.2\",\n                  \"size\": [\n                    330,\n                    20\n                  ],\n                  \"inlets\": 1,\n                  \"outlets\": 0,\n                  \"outlettype\": []\n                }\n              },\n              \"connections\": [\n                [\n                  \"in\",\n                  0,\n                  \"swiz_4\",\n                  0\n                ],\n                [\n                  \"swiz_4\",\n                  0,\n                  \"obj_6\",\n                  0\n                ],\n                [\n                  \"obj_6\",\n                  0,\n                  \"swiz_3\",\n                  0\n                ]\n              ],\n              \"patcher_extras\": {\n                \"rect\": [\n                  178.0,\n                  311.0,\n                  600.0,\n                  450.0\n                ]\n              }\n            }\n          },\n          \"jit_gl_gridshape\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              50,\n              100\n            ],\n            \"text\": \"jit.gl.gridshape @shape plane @dim 160 160 @matrixoutput 2 @automatic 0 @rotatexyz 0 0 0\",\n            \"size\": [\n              512,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"jit_matrix\",\n              \"\"\n            ]\n          },\n          \"inlet\": {\n            \"type\": \"inlet\",\n            \"pos\": [\n              50,\n              24\n            ],\n            \"inlets\": 0,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"bang\"\n            ],\n            \"box_extras\": {\n              \"comment\": \"bang: build the starting cloth\",\n              \"index\": 1\n            }\n          },\n          \"r\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              600,\n              24\n            ],\n            \"text\": \"r CLOTH_GRID\",\n            \"size\": [\n              90,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"dim\": {\n            \"type\": \"message\",\n            \"pos\": [\n              600,\n              60\n            ],\n            \"text\": \"dim $1 $1\",\n            \"size\": [\n              65,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"jit_matrix\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              49,\n              289\n            ],\n            \"text\": \"jit.matrix 4 float32 160 160 @planemap 3 0 1 2\",\n            \"size\": [\n              257,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"jit_matrix\",\n              \"\"\n            ]\n          },\n          \"jit_pack\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              49,\n              260\n            ],\n            \"text\": \"jit.pack 2 @jump 3 1\",\n            \"size\": [\n              117,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 2,\n            \"outlettype\": [\n              \"jit_matrix\",\n              \"\"\n            ]\n          },\n          \"outlet\": {\n            \"type\": \"outlet\",\n            \"pos\": [\n              49,\n              341\n            ],\n            \"inlets\": 1,\n            \"outlets\": 0,\n            \"outlettype\": [],\n            \"box_extras\": {\n              \"comment\": \"jit_matrix: starting positions, x y z per point\",\n              \"index\": 1\n            }\n          }\n        },\n        \"connections\": [\n          [\n            \"jit_gl_gridshape\",\n            0,\n            \"jit_gen\",\n            0\n          ],\n          [\n            \"jit_pack\",\n            0,\n            \"jit_matrix\",\n            0\n          ],\n          [\n            \"uzi\",\n            0,\n            \"jit_gl_gridshape\",\n            0\n          ],\n          [\n            \"jit_matrix\",\n            0,\n            \"outlet\",\n            0\n          ],\n          [\n            \"inlet\",\n            0,\n            \"uzi\",\n            0\n          ],\n          [\n            \"jit_gen\",\n            0,\n            \"jit_pack\",\n            0\n          ],\n          [\n            \"r\",\n            0,\n            \"dim\",\n            0\n          ],\n          [\n            \"dim\",\n            0,\n            \"jit_gl_gridshape\",\n            0\n          ],\n          [\n            \"dim\",\n            0,\n            \"jit_matrix\",\n            0\n          ]\n        ],\n        \"patcher_extras\": {\n          \"rect\": [\n            59.0,\n            119.0,\n            760.0,\n            457.0\n          ],\n          \"toolbaradditions\": [\n            \"Vsynth\",\n            \"User-Package\",\n            \"Vizzie\"\n          ]\n        }\n      }\n    },\n    \"attrui_2\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        234,\n        463\n      ],\n      \"size\": [\n        176,\n        22\n      ],\n      \"attrs\": {\n        \"attr\": \"gravity\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"parameter_enable\": 0\n      }\n    },\n    \"jit_gpu_compute\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        71,\n        620\n      ],\n      \"text\": \"jit.gpu.compute @shader clothsim_collide.comp @workgroups 10 10 1 @gravity -9.8 @mass 0.1 @springK 10000 @deltaT 0.00004 @damping 0.18 @deltaT 0.0005 @eo 0 @friction 0.02 @release 0 @posImg posImg @velImg velImg @windImg windImg\",\n      \"size\": [\n        374,\n        62\n      ],\n      \"attrs\": {\n        \"textfile\": {\n          \"filename\": \"clothsim_collide.comp\",\n          \"flags\": 0,\n          \"embed\": 0,\n          \"autowatch\": 1\n        },\n        \"filename\": \"clothsim_collide.comp\"\n      },\n      \"inlets\": 5,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"attrui_3\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        234,\n        565\n      ],\n      \"size\": [\n        176,\n        22\n      ],\n      \"attrs\": {\n        \"attr\": \"damping\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"parameter_enable\": 0\n      }\n    },\n    \"attrui_4\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        234,\n        488\n      ],\n      \"size\": [\n        176,\n        22\n      ],\n      \"attrs\": {\n        \"attr\": \"mass\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"parameter_enable\": 0\n      }\n    },\n    \"attrui_5\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        234,\n        514\n      ],\n      \"size\": [\n        176,\n        22\n      ],\n      \"attrs\": {\n        \"attr\": \"springK\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"parameter_enable\": 0\n      }\n    },\n    \"attrui_6\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        234,\n        538\n      ],\n      \"size\": [\n        176,\n        22\n      ],\n      \"attrs\": {\n        \"attr\": \"deltaT\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"parameter_enable\": 0\n      }\n    },\n    \"setall\": {\n      \"type\": \"message\",\n      \"pos\": [\n        313,\n        250\n      ],\n      \"text\": \"setall 0, bang\",\n      \"size\": [\n        80,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"jit_matrix\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        313,\n        282\n      ],\n      \"text\": \"jit.matrix 4 float32 160 160\",\n      \"size\": [\n        149,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ]\n    },\n    \"jit_gpu_tomatrix\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        40,\n        700\n      ],\n      \"text\": \"jit.gpu.tomatrix @source posImg\",\n      \"size\": [\n        211,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"\",\n        \"jit_matrix\",\n        \"\"\n      ]\n    },\n    \"loadbang\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        211,\n        142\n      ],\n      \"text\": \"loadbang\",\n      \"size\": [\n        58,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"bang\"\n      ]\n    },\n    \"jit_concat\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        238,\n        316\n      ],\n      \"text\": \"jit.concat\",\n      \"size\": [\n        56,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"jit_matrix\",\n        \"\"\n      ]\n    },\n    \"jit_gpu_image_2\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        313,\n        316\n      ],\n      \"text\": \"jit.gpu.image @format rgba32_float @name velImg @dim 160 160\",\n      \"size\": [\n        199,\n        35\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"jit_gpu_image_3\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        238,\n        365\n      ],\n      \"text\": \"jit.gpu.image @format rgba32_float @name posImg @dim 320 160\",\n      \"size\": [\n        366,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"\"\n      ]\n    },\n    \"Cloth\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        470,\n        29\n      ],\n      \"text\": \"Cloth with collisions: Compute's comp.cloth.simulation plus a sphere and a floor. The cloth starts level, pinned at its four corners above the sphere. The shader, clothsim_collide.comp, sits next to this patch.\",\n      \"size\": [\n        330,\n        60\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"loadmess_3\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        760,\n        150\n      ],\n      \"text\": \"loadmess 0. 0. 0. 0.5 -1.\",\n      \"size\": [\n        150,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"unjoin\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        760,\n        195\n      ],\n      \"text\": \"unjoin 5\",\n      \"size\": [\n        294,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 6,\n      \"outlettype\": [\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\",\n        \"\"\n      ]\n    },\n    \"flonum_2\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        760,\n        245\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"format\": 6,\n        \"parameter_enable\": 0\n      },\n      \"size\": [\n        50,\n        22\n      ]\n    },\n    \"x\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        811,\n        246\n      ],\n      \"text\": \"x\",\n      \"size\": [\n        18,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"flonum_3\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        830,\n        245\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"format\": 6,\n        \"parameter_enable\": 0\n      },\n      \"size\": [\n        50,\n        22\n      ]\n    },\n    \"y\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        881,\n        246\n      ],\n      \"text\": \"y\",\n      \"size\": [\n        18,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"flonum_4\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        900,\n        245\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"format\": 6,\n        \"parameter_enable\": 0\n      },\n      \"size\": [\n        50,\n        22\n      ]\n    },\n    \"z\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        951,\n        246\n      ],\n      \"text\": \"z\",\n      \"size\": [\n        18,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"flonum_5\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        970,\n        245\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"format\": 6,\n        \"parameter_enable\": 0\n      },\n      \"size\": [\n        50,\n        22\n      ]\n    },\n    \"r\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        1021,\n        246\n      ],\n      \"text\": \"r\",\n      \"size\": [\n        18,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"flonum_6\": {\n      \"type\": \"flonum\",\n      \"pos\": [\n        1040,\n        245\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"format\": 6,\n        \"parameter_enable\": 0\n      },\n      \"size\": [\n        50,\n        22\n      ]\n    },\n    \"floor\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        1091,\n        246\n      ],\n      \"text\": \"floor\",\n      \"size\": [\n        40,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"join\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        760,\n        295\n      ],\n      \"text\": \"join 4 @triggers -1\",\n      \"size\": [\n        224,\n        22\n      ],\n      \"inlets\": 4,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"prepend_2\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        760,\n        345\n      ],\n      \"text\": \"prepend sphere\",\n      \"size\": [\n        95,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"prepend_3\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        1040,\n        345\n      ],\n      \"text\": \"prepend floorY\",\n      \"size\": [\n        95,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"toggle_2\": {\n      \"type\": \"toggle\",\n      \"pos\": [\n        1040,\n        440\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"int\"\n      ],\n      \"box_extras\": {\n        \"parameter_enable\": 0\n      }\n    },\n    \"release\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        1068,\n        442\n      ],\n      \"text\": \"release the four corner pins\",\n      \"size\": [\n        125,\n        33\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"prepend_4\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        1040,\n        490\n      ],\n      \"text\": \"prepend release\",\n      \"size\": [\n        100,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"s\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        880,\n        400\n      ],\n      \"text\": \"s COLLIDER\",\n      \"size\": [\n        85,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"prepend_5\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        880,\n        540\n      ],\n      \"text\": \"prepend param\",\n      \"size\": [\n        90,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"attrui_7\": {\n      \"type\": \"attrui\",\n      \"pos\": [\n        980,\n        540\n      ],\n      \"size\": [\n        176,\n        22\n      ],\n      \"attrs\": {\n        \"attr\": \"friction\"\n      },\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ],\n      \"box_extras\": {\n        \"parameter_enable\": 0\n      }\n    },\n    \"Collision_2\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        760,\n        110\n      ],\n      \"text\": \"Collision: sphere x, y, z and radius, the floor height, and the pins. s COLLIDER carries the sphere and floor to the shapes drawn in p rendering.\",\n      \"size\": [\n        420,\n        33\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"Video\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        553,\n        393\n      ],\n      \"text\": \"Video on the cloth: drop a clip here and click it to play\",\n      \"size\": [\n        200,\n        33\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"jit_playlist\": {\n      \"type\": \"jit.playlist\",\n      \"pos\": [\n        553,\n        430\n      ],\n      \"size\": [\n        200,\n        62\n      ],\n      \"inlets\": 1,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"jit_gl_texture\",\n        \"\",\n        \"dictionary\"\n      ],\n      \"box_extras\": {\n        \"output_texture\": 1,\n        \"loop\": 1,\n        \"parameter_enable\": 0\n      }\n    },\n    \"r_2\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        693,\n        708\n      ],\n      \"text\": \"r COLLIDER\",\n      \"size\": [\n        85,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"umenu\": {\n      \"type\": \"umenu\",\n      \"pos\": [\n        279,\n        708\n      ],\n      \"attrs\": {\n        \"items\": [\n          \"front\",\n          \",\",\n          \"top\",\n          \",\",\n          \"bottom\",\n          \",\",\n          \"left\",\n          \",\",\n          \"right\"\n        ]\n      },\n      \"inlets\": 1,\n      \"outlets\": 3,\n      \"outlettype\": [\n        \"int\",\n        \"\",\n        \"\"\n      ],\n      \"box_extras\": {\n        \"parameter_enable\": 0\n      },\n      \"size\": [\n        100,\n        22\n      ]\n    },\n    \"camera\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        382,\n        709\n      ],\n      \"text\": \"camera view\",\n      \"size\": [\n        80,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"loadmess_4\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        330,\n        100\n      ],\n      \"text\": \"loadmess set 160\",\n      \"size\": [\n        100,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"number_2\": {\n      \"type\": \"number\",\n      \"pos\": [\n        330,\n        130\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"\",\n        \"bang\"\n      ],\n      \"box_extras\": {\n        \"parameter_enable\": 0,\n        \"minimum\": 16,\n        \"maximum\": 512\n      },\n      \"size\": [\n        50,\n        22\n      ]\n    },\n    \"grid\": {\n      \"type\": \"comment\",\n      \"pos\": [\n        384,\n        131\n      ],\n      \"text\": \"grid size: points along each side\",\n      \"size\": [\n        190,\n        20\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": []\n    },\n    \"t_2\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        330,\n        160\n      ],\n      \"text\": \"t b i\",\n      \"size\": [\n        40,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 2,\n      \"outlettype\": [\n        \"bang\",\n        \"int\"\n      ]\n    },\n    \"p_5\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        351,\n        195\n      ],\n      \"text\": \"p GRID_SENDS\",\n      \"size\": [\n        90,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 0,\n      \"outlettype\": [],\n      \"patcher\": {\n        \"width\": 560,\n        \"height\": 330,\n        \"objects\": {\n          \"inlet\": {\n            \"type\": \"inlet\",\n            \"pos\": [\n              50,\n              30\n            ],\n            \"inlets\": 0,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"int\"\n            ],\n            \"box_extras\": {\n              \"comment\": \"int: points along each side of the cloth\",\n              \"index\": 1\n            }\n          },\n          \"points\": {\n            \"type\": \"comment\",\n            \"pos\": [\n              84,\n              35\n            ],\n            \"text\": \"points along each side. Sent on to every box that has a size.\",\n            \"size\": [\n              330,\n              20\n            ],\n            \"inlets\": 1,\n            \"outlets\": 0,\n            \"outlettype\": []\n          },\n          \"s\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              50,\n              200\n            ],\n            \"text\": \"s CLOTH_GRID\",\n            \"size\": [\n              100,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 0,\n            \"outlettype\": []\n          },\n          \"the\": {\n            \"type\": \"comment\",\n            \"pos\": [\n              50,\n              225\n            ],\n            \"text\": \"the size\",\n            \"size\": [\n              100,\n              20\n            ],\n            \"inlets\": 1,\n            \"outlets\": 0,\n            \"outlettype\": []\n          },\n          \"expr\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              180,\n              90\n            ],\n            \"text\": \"expr $i1*2\",\n            \"size\": [\n              70,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"join\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              200,\n              140\n            ],\n            \"text\": \"join\",\n            \"size\": [\n              60,\n              22\n            ],\n            \"inlets\": 2,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"s_2\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              200,\n              200\n            ],\n            \"text\": \"s CLOTH_GRID_POS\",\n            \"size\": [\n              130,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 0,\n            \"outlettype\": []\n          },\n          \"twice\": {\n            \"type\": \"comment\",\n            \"pos\": [\n              200,\n              225\n            ],\n            \"text\": \"twice the size, then the size: the position image\",\n            \"size\": [\n              150,\n              33\n            ],\n            \"inlets\": 1,\n            \"outlets\": 0,\n            \"outlettype\": []\n          },\n          \"expr_2\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              380,\n              90\n            ],\n            \"text\": \"expr ($i1+15)/16\",\n            \"size\": [\n              105,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 1,\n            \"outlettype\": [\n              \"\"\n            ]\n          },\n          \"s_3\": {\n            \"type\": \"newobj\",\n            \"pos\": [\n              380,\n              200\n            ],\n            \"text\": \"s CLOTH_GRID_GROUPS\",\n            \"size\": [\n              150,\n              22\n            ],\n            \"inlets\": 1,\n            \"outlets\": 0,\n            \"outlettype\": []\n          },\n          \"16_point\": {\n            \"type\": \"comment\",\n            \"pos\": [\n              380,\n              225\n            ],\n            \"text\": \"16-point tiles per side, for the shader\",\n            \"size\": [\n              150,\n              33\n            ],\n            \"inlets\": 1,\n            \"outlets\": 0,\n            \"outlettype\": []\n          }\n        },\n        \"connections\": [\n          [\n            \"inlet\",\n            0,\n            \"s\",\n            0\n          ],\n          [\n            \"inlet\",\n            0,\n            \"expr\",\n            0\n          ],\n          [\n            \"inlet\",\n            0,\n            \"join\",\n            1\n          ],\n          [\n            \"inlet\",\n            0,\n            \"expr_2\",\n            0\n          ],\n          [\n            \"expr\",\n            0,\n            \"join\",\n            0\n          ],\n          [\n            \"join\",\n            0,\n            \"s_2\",\n            0\n          ],\n          [\n            \"expr_2\",\n            0,\n            \"s_3\",\n            0\n          ]\n        ],\n        \"patcher_extras\": {\n          \"rect\": [\n            100.0,\n            120.0,\n            560.0,\n            330.0\n          ]\n        }\n      }\n    },\n    \"r_3\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        450,\n        165\n      ],\n      \"text\": \"r CLOTH_GRID\",\n      \"size\": [\n        90,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dim\": {\n      \"type\": \"message\",\n      \"pos\": [\n        450,\n        200\n      ],\n      \"text\": \"dim $1 $1\",\n      \"size\": [\n        65,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_4\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        585,\n        100\n      ],\n      \"text\": \"r CLOTH_GRID_POS\",\n      \"size\": [\n        120,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"prepend_6\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        585,\n        160\n      ],\n      \"text\": \"prepend dim\",\n      \"size\": [\n        80,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_5\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        670,\n        243\n      ],\n      \"text\": \"r CLOTH_GRID\",\n      \"size\": [\n        85,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"dim_2\": {\n      \"type\": \"message\",\n      \"pos\": [\n        670,\n        278\n      ],\n      \"text\": \"dim $1 $1\",\n      \"size\": [\n        65,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"r_6\": {\n      \"type\": \"newobj\",\n      \"pos\": [\n        600,\n        515\n      ],\n      \"text\": \"r CLOTH_GRID_GROUPS\",\n      \"size\": [\n        140,\n        22\n      ],\n      \"inlets\": 1,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    },\n    \"workgroups\": {\n      \"type\": \"message\",\n      \"pos\": [\n        600,\n        560\n      ],\n      \"text\": \"workgroups $1 $1 1\",\n      \"size\": [\n        130,\n        22\n      ],\n      \"inlets\": 2,\n      \"outlets\": 1,\n      \"outlettype\": [\n        \"\"\n      ]\n    }\n  },\n  \"connections\": [\n    [\n      \"loadmess_2\",\n      0,\n      \"flonum\",\n      0\n    ],\n    [\n      \"loadmess\",\n      0,\n      \"number\",\n      0\n    ],\n    [\n      \"jit_concat\",\n      0,\n      \"jit_gpu_image_3\",\n      0\n    ],\n    [\n      \"loadbang\",\n      0,\n      \"button\",\n      0\n    ],\n    [\n      \"obj_2\",\n      0,\n      \"prepend\",\n      0\n    ],\n    [\n      \"obj\",\n      0,\n      \"uzi\",\n      1\n    ],\n    [\n      \"button\",\n      0,\n      \"p_4\",\n      0\n    ],\n    [\n      \"jit_gpu_bang\",\n      0,\n      \"t\",\n      0\n    ],\n    [\n      \"attrui_2\",\n      0,\n      \"jit_gpu_compute\",\n      0\n    ],\n    [\n      \"p_3\",\n      0,\n      \"jit_gpu_compute\",\n      0\n    ],\n    [\n      \"attrui_4\",\n      0,\n      \"jit_gpu_compute\",\n      0\n    ],\n    [\n      \"prepend\",\n      0,\n      \"jit_gpu_compute\",\n      0\n    ],\n    [\n      \"attrui_5\",\n      0,\n      \"jit_gpu_compute\",\n      0\n    ],\n    [\n      \"attrui_6\",\n      0,\n      \"jit_gpu_compute\",\n      0\n    ],\n    [\n      \"attrui_3\",\n      0,\n      \"jit_gpu_compute\",\n      0\n    ],\n    [\n      \"p_2\",\n      0,\n      \"jit_gpu_image\",\n      0\n    ],\n    [\n      \"p_4\",\n      0,\n      \"jit_concat\",\n      1\n    ],\n    [\n      \"p_4\",\n      0,\n      \"jit_concat\",\n      0\n    ],\n    [\n      \"p_4\",\n      0,\n      \"p_3\",\n      0\n    ],\n    [\n      \"p_4\",\n      0,\n      \"setall\",\n      0\n    ],\n    [\n      \"t\",\n      0,\n      \"jit_gpu_tomatrix\",\n      0\n    ],\n    [\n      \"t\",\n      1,\n      \"uzi\",\n      0\n    ],\n    [\n      \"jit_gpu_tomatrix\",\n      1,\n      \"p\",\n      0\n    ],\n    [\n      \"jit_gpu_tomatrix\",\n      0,\n      \"jit_gpu_submit\",\n      0\n    ],\n    [\n      \"uzi\",\n      2,\n      \"obj_2\",\n      0\n    ],\n    [\n      \"uzi\",\n      0,\n      \"jit_gpu_compute\",\n      0\n    ],\n    [\n      \"number\",\n      0,\n      \"obj\",\n      0\n    ],\n    [\n      \"flonum\",\n      0,\n      \"p_2\",\n      0\n    ],\n    [\n      \"p\",\n      0,\n      \"jit_gl_videoplane\",\n      0\n    ],\n    [\n      \"attrui\",\n      0,\n      \"jit_world\",\n      0\n    ],\n    [\n      \"jit_matrix\",\n      0,\n      \"jit_gpu_image_2\",\n      0\n    ],\n    [\n      \"setall\",\n      0,\n      \"jit_matrix\",\n      0\n    ],\n    [\n      \"unjoin\",\n      0,\n      \"flonum_2\",\n      0\n    ],\n    [\n      \"unjoin\",\n      1,\n      \"flonum_3\",\n      0\n    ],\n    [\n      \"unjoin\",\n      2,\n      \"flonum_4\",\n      0\n    ],\n    [\n      \"unjoin\",\n      3,\n      \"flonum_5\",\n      0\n    ],\n    [\n      \"unjoin\",\n      4,\n      \"flonum_6\",\n      0\n    ],\n    [\n      \"loadmess_3\",\n      0,\n      \"unjoin\",\n      0\n    ],\n    [\n      \"flonum_2\",\n      0,\n      \"join\",\n      0\n    ],\n    [\n      \"flonum_3\",\n      0,\n      \"join\",\n      1\n    ],\n    [\n      \"flonum_4\",\n      0,\n      \"join\",\n      2\n    ],\n    [\n      \"flonum_5\",\n      0,\n      \"join\",\n      3\n    ],\n    [\n      \"join\",\n      0,\n      \"prepend_2\",\n      0\n    ],\n    [\n      \"flonum_6\",\n      0,\n      \"prepend_3\",\n      0\n    ],\n    [\n      \"toggle_2\",\n      0,\n      \"prepend_4\",\n      0\n    ],\n    [\n      \"prepend_2\",\n      0,\n      \"s\",\n      0\n    ],\n    [\n      \"prepend_3\",\n      0,\n      \"s\",\n      0\n    ],\n    [\n      \"prepend_2\",\n      0,\n      \"prepend_5\",\n      0\n    ],\n    [\n      \"prepend_3\",\n      0,\n      \"prepend_5\",\n      0\n    ],\n    [\n      \"prepend_4\",\n      0,\n      \"prepend_5\",\n      0\n    ],\n    [\n      \"prepend_5\",\n      0,\n      \"jit_gpu_compute\",\n      0\n    ],\n    [\n      \"attrui_7\",\n      0,\n      \"jit_gpu_compute\",\n      0\n    ],\n    [\n      \"r_2\",\n      0,\n      \"p\",\n      3\n    ],\n    [\n      \"umenu\",\n      1,\n      \"p\",\n      1\n    ],\n    [\n      \"jit_playlist\",\n      0,\n      \"p\",\n      2\n    ],\n    [\n      \"loadmess_4\",\n      0,\n      \"number_2\",\n      0\n    ],\n    [\n      \"number_2\",\n      0,\n      \"t_2\",\n      0\n    ],\n    [\n      \"t_2\",\n      0,\n      \"p_4\",\n      0\n    ],\n    [\n      \"t_2\",\n      1,\n      \"p_5\",\n      0\n    ],\n    [\n      \"r_3\",\n      0,\n      \"dim\",\n      0\n    ],\n    [\n      \"dim\",\n      0,\n      \"jit_matrix\",\n      0\n    ],\n    [\n      \"dim\",\n      0,\n      \"jit_gpu_image_2\",\n      0\n    ],\n    [\n      \"r_4\",\n      0,\n      \"prepend_6\",\n      0\n    ],\n    [\n      \"prepend_6\",\n      0,\n      \"jit_gpu_image_3\",\n      0\n    ],\n    [\n      \"r_5\",\n      0,\n      \"dim_2\",\n      0\n    ],\n    [\n      \"dim_2\",\n      0,\n      \"jit_gpu_image\",\n      0\n    ],\n    [\n      \"r_6\",\n      0,\n      \"workgroups\",\n      0\n    ],\n    [\n      \"workgroups\",\n      0,\n      \"jit_gpu_compute\",\n      0\n    ]\n  ],\n  \"patcher_extras\": {\n    \"rect\": [\n      34.0,\n      100.0,\n      1200.0,\n      866.0\n    ],\n    \"autosave\": 0,\n    \"toolbaradditions\": [\n      \"Vsynth\",\n      \"User-Package\",\n      \"Vizzie\"\n    ],\n    \"oscprefix\": \"max\"\n  }\n}\n--- END SPEC ---",
          "fontsize": 9.0,
          "hidden": 1
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "obj-61",
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
            "obj-11",
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
            "obj-13",
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
            "obj-14",
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
            "obj-15",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-58",
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
            "obj-49",
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
            "obj-55",
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
            "obj-5",
            0
          ],
          "midpoints": [
            243.5,
            605.87890625,
            80.5,
            605.87890625
          ],
          "source": [
            "obj-30",
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
            "obj-34",
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
          "midpoints": [
            243.5,
            608.96875,
            80.5,
            608.96875
          ],
          "source": [
            "obj-36",
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
            "obj-5",
            0
          ],
          "midpoints": [
            243.5,
            609.37890625,
            80.5,
            609.37890625
          ],
          "source": [
            "obj-40",
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
          "midpoints": [
            243.5,
            608.078125,
            80.5,
            608.078125
          ],
          "source": [
            "obj-43",
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
          "midpoints": [
            243.5,
            608.4453125,
            80.5,
            608.4453125
          ],
          "source": [
            "obj-44",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-73",
            0
          ],
          "source": [
            "obj-47",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-13",
            1
          ],
          "order": 1,
          "source": [
            "obj-49",
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
          "order": 2,
          "source": [
            "obj-49",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-34",
            0
          ],
          "order": 3,
          "source": [
            "obj-49",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-71",
            0
          ],
          "order": 0,
          "source": [
            "obj-49",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-57",
            0
          ],
          "source": [
            "obj-55",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-58",
            0
          ],
          "source": [
            "obj-55",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-66",
            0
          ],
          "source": [
            "obj-57",
            1
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
            "obj-57",
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
            "obj-58",
            2
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
            "obj-58",
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
            "obj-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-47",
            0
          ],
          "source": [
            "obj-61",
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
            "obj-66",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-2",
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
            "obj-70",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "obj-70",
            0
          ],
          "source": [
            "obj-71",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c12",
            0
          ],
          "destination": [
            "obj-c20",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c12",
            1
          ],
          "destination": [
            "obj-c21",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c12",
            2
          ],
          "destination": [
            "obj-c22",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c12",
            3
          ],
          "destination": [
            "obj-c23",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c12",
            4
          ],
          "destination": [
            "obj-c24",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c11",
            0
          ],
          "destination": [
            "obj-c12",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c20",
            0
          ],
          "destination": [
            "obj-c13",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c21",
            0
          ],
          "destination": [
            "obj-c13",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c22",
            0
          ],
          "destination": [
            "obj-c13",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c23",
            0
          ],
          "destination": [
            "obj-c13",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c13",
            0
          ],
          "destination": [
            "obj-c14",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c24",
            0
          ],
          "destination": [
            "obj-c15",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c16",
            0
          ],
          "destination": [
            "obj-c18",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c14",
            0
          ],
          "destination": [
            "obj-c19",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c15",
            0
          ],
          "destination": [
            "obj-c19",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c14",
            0
          ],
          "destination": [
            "obj-c40",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c15",
            0
          ],
          "destination": [
            "obj-c40",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c18",
            0
          ],
          "destination": [
            "obj-c40",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c40",
            0
          ],
          "destination": [
            "obj-5",
            0
          ],
          "midpoints": [
            889.5,
            612.0,
            80.5,
            612.0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c41",
            0
          ],
          "destination": [
            "obj-5",
            0
          ],
          "midpoints": [
            989.5,
            612.0,
            80.5,
            612.0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c50",
            0
          ],
          "destination": [
            "obj-66",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c60",
            1
          ],
          "destination": [
            "obj-66",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-c63",
            0
          ],
          "destination": [
            "obj-66",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-g1",
            0
          ],
          "destination": [
            "obj-g2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-g2",
            0
          ],
          "destination": [
            "obj-g4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-g4",
            0
          ],
          "destination": [
            "obj-49",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-g4",
            1
          ],
          "destination": [
            "obj-g5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-g10",
            0
          ],
          "destination": [
            "obj-g11",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-g11",
            0
          ],
          "destination": [
            "obj-70",
            0
          ],
          "midpoints": [
            459.5,
            235.0,
            400.0,
            235.0,
            400.0,
            277.0,
            322.5,
            277.0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-g11",
            0
          ],
          "destination": [
            "obj-10",
            0
          ],
          "midpoints": [
            459.5,
            235.0,
            470.0,
            235.0,
            470.0,
            310.0,
            322.5,
            310.0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-g12",
            0
          ],
          "destination": [
            "obj-g13",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-g13",
            0
          ],
          "destination": [
            "obj-8",
            0
          ],
          "midpoints": [
            594.5,
            190.0,
            520.0,
            190.0,
            520.0,
            358.0,
            247.5,
            358.0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-g14",
            0
          ],
          "destination": [
            "obj-g15",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-g15",
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
            "obj-g16",
            0
          ],
          "destination": [
            "obj-g17",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "obj-g17",
            0
          ],
          "destination": [
            "obj-5",
            0
          ],
          "midpoints": [
            609.5,
            612.0,
            80.5,
            612.0
          ]
        }
      }
    ],
    "autosave": 0,
    "toolbaradditions": [
      "Vsynth",
      "User-Package",
      "Vizzie"
    ],
    "oscprefix": "max"
  }
}
