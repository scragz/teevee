{
	"patcher" : {
		"fileversion" : 1,
		"appversion" : {
			"major" : 8,
			"minor" : 6,
			"revision" : 0,
			"architecture" : "x64",
			"modernui" : 1
		},
		"classnamespace" : "box",
		"rect" : [ 100.0, 100.0, 800.0, 600.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [
			{
				"box" : {
					"id" : "obj-matrix-ref",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 400.0, 30.0, 200.0, 22.0 ],
					"text" : "jit.matrix tv_ram 4 float32 65536"
				}
			},
			{
				"box" : {
					"comment" : "Audio Out L",
					"id" : "obj-out-l",
					"index" : 1,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 500.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "Audio Out R",
					"id" : "obj-out-r",
					"index" : 2,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 150.0, 500.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "X Position (0-1)",
					"id" : "obj-in-x",
					"index" : 1,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "Y Position (0-1)",
					"id" : "obj-in-y",
					"index" : 2,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-scale-x",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 80.0, 120.0, 22.0 ],
					"text" : "scale~ 0. 1. 0. 255."
				}
			},
			{
				"box" : {
					"id" : "obj-scale-y",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 80.0, 120.0, 22.0 ],
					"text" : "scale~ 0. 1. 0. 255."
				}
			},
			{
				"box" : {
					"id" : "obj-index-calc",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 130.0, 120.0, 22.0 ],
					"text" : "gen~",
					"patcher" : {
						"fileversion" : 1,
						"appversion" : {
							"major" : 8,
							"minor" : 6,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						},
						"classnamespace" : "dsp.gen",
						"rect" : [ 100.0, 100.0, 400.0, 300.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"assistshowspatchername" : 0,
						"boxes" : [
							{
								"box" : {
									"id" : "obj-in1",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 30.0, 30.0, 22.0 ],
									"text" : "in 1"
								}
							},
							{
								"box" : {
									"id" : "obj-in2",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 150.0, 30.0, 30.0, 22.0 ],
									"text" : "in 2"
								}
							},
							{
								"box" : {
									"id" : "obj-trunc-x",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 70.0, 40.0, 22.0 ],
									"text" : "trunc"
								}
							},
							{
								"box" : {
									"id" : "obj-trunc-y",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 150.0, 70.0, 40.0, 22.0 ],
									"text" : "trunc"
								}
							},
							{
								"box" : {
									"id" : "obj-mult",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 150.0, 110.0, 56.0, 22.0 ],
									"text" : "* 256"
								}
							},
							{
								"box" : {
									"id" : "obj-add",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 100.0, 150.0, 30.0, 22.0 ],
									"text" : "+"
								}
							},
							{
								"box" : {
									"id" : "obj-out1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 100.0, 200.0, 42.0, 22.0 ],
									"text" : "out 1"
								}
							}
						],
						"lines" : [
							{
								"patchline" : {
									"destination" : [ "obj-trunc-x", 0 ],
									"source" : [ "obj-in1", 0 ]
								}
							},
							{
								"patchline" : {
									"destination" : [ "obj-trunc-y", 0 ],
									"source" : [ "obj-in2", 0 ]
								}
							},
							{
								"patchline" : {
									"destination" : [ "obj-add", 0 ],
									"source" : [ "obj-trunc-x", 0 ]
								}
							},
							{
								"patchline" : {
									"destination" : [ "obj-mult", 0 ],
									"source" : [ "obj-trunc-y", 0 ]
								}
							},
							{
								"patchline" : {
									"destination" : [ "obj-add", 1 ],
									"source" : [ "obj-mult", 0 ]
								}
							},
							{
								"patchline" : {
									"destination" : [ "obj-out1", 0 ],
									"source" : [ "obj-add", 0 ]
								}
							}
						]
					}
				}
			},
			{
				"box" : {
					"id" : "obj-peek-0",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 200.0, 100.0, 22.0 ],
					"text" : "jit.peek~ tv_ram 0"
				}
			},
			{
				"box" : {
					"id" : "obj-peek-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 170.0, 200.0, 100.0, 22.0 ],
					"text" : "jit.peek~ tv_ram 1"
				}
			},
			{
				"box" : {
					"id" : "obj-peek-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 290.0, 200.0, 100.0, 22.0 ],
					"text" : "jit.peek~ tv_ram 2"
				}
			},
			{
				"box" : {
					"id" : "obj-peek-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 410.0, 200.0, 100.0, 22.0 ],
					"text" : "jit.peek~ tv_ram 3"
				}
			},
			{
				"box" : {
					"id" : "obj-decoder",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 50.0, 300.0, 380.0, 22.0 ],
					"text" : "gen~",
					"patcher" : {
						"fileversion" : 1,
						"appversion" : {
							"major" : 8,
							"minor" : 6,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						},
						"classnamespace" : "dsp.gen",
						"rect" : [ 100.0, 100.0, 600.0, 400.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"assistshowspatchername" : 0,
						"boxes" : [
							{
								"box" : {
									"id" : "obj-in-a",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 30.0, 30.0, 22.0 ],
									"text" : "in 1"
								}
							},
							{
								"box" : {
									"id" : "obj-in-r",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 150.0, 30.0, 30.0, 22.0 ],
									"text" : "in 2"
								}
							},
							{
								"box" : {
									"id" : "obj-in-g",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 250.0, 30.0, 30.0, 22.0 ],
									"text" : "in 3"
								}
							},
							{
								"box" : {
									"id" : "obj-in-b",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 350.0, 30.0, 30.0, 22.0 ],
									"text" : "in 4"
								}
							},
							{
								"box" : {
									"id" : "obj-scale-r",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 150.0, 80.0, 82.0, 22.0 ],
									"text" : "* 2. - 1."
								}
							},
							{
								"box" : {
									"id" : "obj-scale-g",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 250.0, 80.0, 82.0, 22.0 ],
									"text" : "* 2. - 1."
								}
							},
							{
								"box" : {
									"id" : "obj-scale-b",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 350.0, 80.0, 82.0, 22.0 ],
									"text" : "* 2. - 1."
								}
							},
							{
								"box" : {
									"id" : "obj-left-add",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 100.0, 150.0, 30.0, 22.0 ],
									"text" : "+"
								}
							},
							{
								"box" : {
									"id" : "obj-right-add",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 300.0, 150.0, 30.0, 22.0 ],
									"text" : "+"
								}
							},
							{
								"box" : {
									"id" : "obj-left-scale",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 100.0, 200.0, 42.0, 22.0 ],
									"text" : "* 0.5"
								}
							},
							{
								"box" : {
									"id" : "obj-right-scale",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 300.0, 200.0, 42.0, 22.0 ],
									"text" : "* 0.5"
								}
							},
							{
								"box" : {
									"id" : "obj-out-l",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 100.0, 250.0, 42.0, 22.0 ],
									"text" : "out 1"
								}
							},
							{
								"box" : {
									"id" : "obj-out-r",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 300.0, 250.0, 42.0, 22.0 ],
									"text" : "out 2"
								}
							}
						],
						"lines" : [
							{
								"patchline" : {
									"destination" : [ "obj-scale-r", 0 ],
									"source" : [ "obj-in-r", 0 ]
								}
							},
							{
								"patchline" : {
									"destination" : [ "obj-scale-g", 0 ],
									"source" : [ "obj-in-g", 0 ]
								}
							},
							{
								"patchline" : {
									"destination" : [ "obj-scale-b", 0 ],
									"source" : [ "obj-in-b", 0 ]
								}
							},
							{
								"patchline" : {
									"destination" : [ "obj-left-add", 0 ],
									"source" : [ "obj-scale-r", 0 ]
								}
							},
							{
								"patchline" : {
									"destination" : [ "obj-left-add", 1 ],
									"source" : [ "obj-scale-g", 0 ]
								}
							},
							{
								"patchline" : {
									"destination" : [ "obj-right-add", 0 ],
									"source" : [ "obj-scale-g", 0 ]
								}
							},
							{
								"patchline" : {
									"destination" : [ "obj-right-add", 1 ],
									"source" : [ "obj-scale-b", 0 ]
								}
							},
							{
								"patchline" : {
									"destination" : [ "obj-left-scale", 0 ],
									"source" : [ "obj-left-add", 0 ]
								}
							},
							{
								"patchline" : {
									"destination" : [ "obj-right-scale", 0 ],
									"source" : [ "obj-right-add", 0 ]
								}
							},
							{
								"patchline" : {
									"destination" : [ "obj-out-l", 0 ],
									"source" : [ "obj-left-scale", 0 ]
								}
							},
							{
								"patchline" : {
									"destination" : [ "obj-out-r", 0 ],
									"source" : [ "obj-right-scale", 0 ]
								}
							}
						]
					}
				}
			}
		],
		"lines" : [
			{
				"patchline" : {
					"destination" : [ "obj-scale-x", 0 ],
					"source" : [ "obj-in-x", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-y", 0 ],
					"source" : [ "obj-in-y", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-index-calc", 0 ],
					"source" : [ "obj-scale-x", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-index-calc", 1 ],
					"source" : [ "obj-scale-y", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-peek-0", 0 ],
					"source" : [ "obj-index-calc", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-peek-1", 0 ],
					"source" : [ "obj-index-calc", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-peek-2", 0 ],
					"source" : [ "obj-index-calc", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-peek-3", 0 ],
					"source" : [ "obj-index-calc", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-decoder", 0 ],
					"source" : [ "obj-peek-0", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-decoder", 1 ],
					"source" : [ "obj-peek-1", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-decoder", 2 ],
					"source" : [ "obj-peek-2", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-decoder", 3 ],
					"source" : [ "obj-peek-3", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-out-l", 0 ],
					"source" : [ "obj-decoder", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-out-r", 0 ],
					"source" : [ "obj-decoder", 1 ]
				}
			}
		]
	}
}
