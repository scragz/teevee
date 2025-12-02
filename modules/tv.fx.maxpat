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
		"rect" : [ 100.0, 100.0, 1000.0, 800.0 ],
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
		"description" : "tv.fx - Visual effects processor with scroll, zoom, rotate, smear",
		"digest" : "GPU-style visual effects matching audio parameters",
		"tags" : "teevee, fx, effects, feedback, scroll, zoom, rotate",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [
			{
				"box" : {
					"comment" : "Bang to process frame",
					"id" : "obj-inlet",
					"index" : 1,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 50.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "Processed 2D matrix output for visualization",
					"id" : "obj-outlet",
					"index" : 1,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 720.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-trigger",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 6,
					"outlettype" : [ "bang", "bang", "bang", "bang", "bang", "bang" ],
					"patching_rect" : [ 50.0, 70.0, 400.0, 22.0 ],
					"text" : "t b b b b b b"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-params",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 500.0, 30.0, 350.0, 20.0 ],
					"text" : "=== PARAM STORAGE (stores values, bangs output them) ==="
				}
			},
			{
				"box" : {
					"id" : "obj-r-scroll",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 60.0, 110.0, 22.0 ],
					"text" : "r ---tv_param_scroll"
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-store",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 500.0, 90.0, 55.0, 22.0 ],
					"text" : "float 0.5"
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 120.0, 115.0, 22.0 ],
					"text" : "scale 0. 1. -128. 128."
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-prepend",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 150.0, 85.0, 22.0 ],
					"text" : "prepend offset_y"
				}
			},
			{
				"box" : {
					"id" : "obj-r-zoom",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 630.0, 60.0, 105.0, 22.0 ],
					"text" : "r ---tv_param_zoom"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-store",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 630.0, 90.0, 55.0, 22.0 ],
					"text" : "float 0.5"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 630.0, 120.0, 100.0, 22.0 ],
					"text" : "scale 0. 1. 0.5 2."
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-prepend-x",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 630.0, 150.0, 85.0, 22.0 ],
					"text" : "prepend zoom_x"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-prepend-y",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 630.0, 180.0, 85.0, 22.0 ],
					"text" : "prepend zoom_y"
				}
			},
			{
				"box" : {
					"id" : "obj-r-rotate",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 760.0, 60.0, 120.0, 22.0 ],
					"text" : "r ---tv_param_rotation"
				}
			},
			{
				"box" : {
					"id" : "obj-rotate-store",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 760.0, 90.0, 55.0, 22.0 ],
					"text" : "float 0.5"
				}
			},
			{
				"box" : {
					"id" : "obj-rotate-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 760.0, 120.0, 115.0, 22.0 ],
					"text" : "scale 0. 1. -180. 180."
				}
			},
			{
				"box" : {
					"id" : "obj-rotate-prepend",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 760.0, 150.0, 80.0, 22.0 ],
					"text" : "prepend theta"
				}
			},
			{
				"box" : {
					"id" : "obj-r-smear",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 890.0, 60.0, 110.0, 22.0 ],
					"text" : "r ---tv_param_smear"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-store",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 890.0, 90.0, 45.0, 22.0 ],
					"text" : "float 0."
				}
			},
			{
				"box" : {
					"id" : "obj-smear-output",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 890.0, 120.0, 45.0, 22.0 ],
					"text" : "float 0."
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage1",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 200.0, 200.0, 200.0, 20.0 ],
					"text" : "Stage 1: Read 1D matrix"
				}
			},
			{
				"box" : {
					"id" : "obj-ram-read",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 220.0, 220.0, 22.0 ],
					"text" : "jit.matrix ---tv_viz_ram 4 float32 65536"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage2",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 200.0, 260.0, 200.0, 20.0 ],
					"text" : "Stage 2: Reshape to 2D (256x256)"
				}
			},
			{
				"box" : {
					"id" : "obj-reshape-2d",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 280.0, 200.0, 22.0 ],
					"text" : "jit.matrix 4 float32 256 256 @adapt 0"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage3",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 200.0, 320.0, 300.0, 20.0 ],
					"text" : "Stage 3: Transform (scroll, zoom, rotate) - single jit.rota"
				}
			},
			{
				"box" : {
					"id" : "obj-rota",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 340.0, 130.0, 22.0 ],
					"text" : "jit.rota @boundmode 4"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage4",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 200.0, 400.0, 250.0, 20.0 ],
					"text" : "Stage 4: SMEAR (feedback blend)"
				}
			},
			{
				"box" : {
					"id" : "obj-prev-read",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 300.0, 420.0, 240.0, 22.0 ],
					"text" : "jit.matrix ---tv_viz_ram_out 4 float32 256 256"
				}
			},
			{
				"box" : {
					"id" : "obj-scale-prev",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 300.0, 460.0, 85.0, 22.0 ],
					"text" : "jit.op @op *"
				}
			},
			{
				"box" : {
					"id" : "obj-one-minus",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 150.0, 460.0, 42.0, 22.0 ],
					"text" : "!- 1."
				}
			},
			{
				"box" : {
					"id" : "obj-scale-new",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 500.0, 85.0, 22.0 ],
					"text" : "jit.op @op *"
				}
			},
			{
				"box" : {
					"id" : "obj-mix",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 540.0, 270.0, 22.0 ],
					"text" : "jit.op @op +"
				}
			},
			{
				"box" : {
					"id" : "obj-copy-out",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 580.0, 240.0, 22.0 ],
					"text" : "jit.matrix ---tv_viz_ram_out 4 float32 256 256"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage5",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 200.0, 620.0, 250.0, 20.0 ],
					"text" : "Stage 5: Colorize ARGB planes for display"
				}
			},
			{
				"box" : {
					"id" : "obj-colorize",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 640.0, 45.0, 22.0 ],
					"text" : "jit.gen",
					"patcher" : {
						"fileversion" : 1,
						"appversion" : {
							"major" : 8,
							"minor" : 6,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						},
						"classnamespace" : "jit.gen",
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
									"id" : "obj-codebox",
									"maxclass" : "codebox",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 70.0, 500.0, 250.0 ],
									"code" : "// Colorize ARGB planes for vibrant display\n// Boost all planes and output\n\na = abs(in1.x) * 3.;\nr = abs(in1.y) * 5.;\ng = abs(in1.z) * 10.;\nb = abs(in1.w) * 5.;\n\n// Cross-modulation for color mixing\nr = r + g * 0.3;\nb = b + a * 0.5;\n\n// Clamp\na = clamp(a, 0., 1.);\nr = clamp(r, 0., 1.);\ng = clamp(g, 0., 1.);\nb = clamp(b, 0., 1.);\n\nout1 = vec(a, r, g, b);"
								}
							},
							{
								"box" : {
									"id" : "obj-out1",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 340.0, 35.0, 22.0 ],
									"text" : "out 1"
								}
							}
						],
						"lines" : [
							{
								"patchline" : {
									"destination" : [ "obj-codebox", 0 ],
									"source" : [ "obj-in1", 0 ]
								}
							},
							{
								"patchline" : {
									"destination" : [ "obj-out1", 0 ],
									"source" : [ "obj-codebox", 0 ]
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
					"destination" : [ "obj-trigger", 0 ],
					"source" : [ "obj-inlet", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ram-read", 0 ],
					"source" : [ "obj-trigger", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-prev-read", 0 ],
					"source" : [ "obj-trigger", 1 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-output", 0 ],
					"source" : [ "obj-trigger", 2 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scroll-store", 0 ],
					"source" : [ "obj-trigger", 3 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-store", 0 ],
					"source" : [ "obj-trigger", 4 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rotate-store", 0 ],
					"source" : [ "obj-trigger", 5 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scroll-store", 1 ],
					"source" : [ "obj-r-scroll", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scroll-scale", 0 ],
					"source" : [ "obj-scroll-store", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scroll-prepend", 0 ],
					"source" : [ "obj-scroll-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rota", 0 ],
					"source" : [ "obj-scroll-prepend", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-store", 1 ],
					"source" : [ "obj-r-zoom", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-scale", 0 ],
					"source" : [ "obj-zoom-store", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-prepend-x", 0 ],
					"order" : 1,
					"source" : [ "obj-zoom-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-prepend-y", 0 ],
					"order" : 0,
					"source" : [ "obj-zoom-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rota", 0 ],
					"source" : [ "obj-zoom-prepend-x", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rota", 0 ],
					"source" : [ "obj-zoom-prepend-y", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rotate-store", 1 ],
					"source" : [ "obj-r-rotate", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rotate-scale", 0 ],
					"source" : [ "obj-rotate-store", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rotate-prepend", 0 ],
					"source" : [ "obj-rotate-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rota", 0 ],
					"source" : [ "obj-rotate-prepend", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-store", 1 ],
					"source" : [ "obj-r-smear", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-output", 1 ],
					"source" : [ "obj-smear-store", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-one-minus", 0 ],
					"order" : 1,
					"source" : [ "obj-smear-output", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-prev", 1 ],
					"order" : 0,
					"source" : [ "obj-smear-output", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-new", 1 ],
					"source" : [ "obj-one-minus", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-reshape-2d", 0 ],
					"source" : [ "obj-ram-read", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rota", 0 ],
					"source" : [ "obj-reshape-2d", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-new", 0 ],
					"source" : [ "obj-rota", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-prev", 0 ],
					"source" : [ "obj-prev-read", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-mix", 1 ],
					"source" : [ "obj-scale-prev", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-mix", 0 ],
					"source" : [ "obj-scale-new", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-copy-out", 0 ],
					"source" : [ "obj-mix", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-colorize", 0 ],
					"source" : [ "obj-copy-out", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-outlet", 0 ],
					"source" : [ "obj-colorize", 0 ]
				}
			}
		]
	}
}
