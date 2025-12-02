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
		"rect" : [ 100.0, 100.0, 900.0, 700.0 ],
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
					"patching_rect" : [ 50.0, 620.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-comment-params",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 500.0, 30.0, 200.0, 20.0 ],
					"text" : "=== PARAMETER RECEIVERS ==="
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
					"id" : "obj-scroll-val",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 500.0, 90.0, 35.0, 22.0 ],
					"text" : "float"
				}
			},
			{
				"box" : {
					"id" : "obj-r-zoom",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 600.0, 60.0, 105.0, 22.0 ],
					"text" : "r ---tv_param_zoom"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-val",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 600.0, 90.0, 35.0, 22.0 ],
					"text" : "float"
				}
			},
			{
				"box" : {
					"id" : "obj-r-rotate",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 700.0, 60.0, 120.0, 22.0 ],
					"text" : "r ---tv_param_rotation"
				}
			},
			{
				"box" : {
					"id" : "obj-rotate-val",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 700.0, 90.0, 35.0, 22.0 ],
					"text" : "float"
				}
			},
			{
				"box" : {
					"id" : "obj-r-smear",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 800.0, 60.0, 110.0, 22.0 ],
					"text" : "r ---tv_param_smear"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-val",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 800.0, 90.0, 35.0, 22.0 ],
					"text" : "float"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage1",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 200.0, 80.0, 200.0, 20.0 ],
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
					"patching_rect" : [ 50.0, 100.0, 220.0, 22.0 ],
					"text" : "jit.matrix ---tv_viz_ram 4 float32 65536"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage2",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 200.0, 140.0, 200.0, 20.0 ],
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
					"patching_rect" : [ 50.0, 160.0, 200.0, 22.0 ],
					"text" : "jit.matrix 4 float32 256 256 @adapt 0"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage3",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 200.0, 200.0, 250.0, 20.0 ],
					"text" : "Stage 3: SCROLL (Y offset via jit.rota)"
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
					"text" : "scale 0. 1. 0. 256."
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-pack",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 150.0, 100.0, 22.0 ],
					"text" : "prepend offset_y"
				}
			},
			{
				"box" : {
					"id" : "obj-rota-scroll",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 220.0, 130.0, 22.0 ],
					"text" : "jit.rota @boundmode 4"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage4",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 200.0, 260.0, 250.0, 20.0 ],
					"text" : "Stage 4: ZOOM (scale via jit.rota)"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 600.0, 120.0, 100.0, 22.0 ],
					"text" : "scale 0. 1. 0.5 2."
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-pack",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 600.0, 150.0, 100.0, 22.0 ],
					"text" : "prepend zoom_x"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-pack-y",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 650.0, 180.0, 100.0, 22.0 ],
					"text" : "prepend zoom_y"
				}
			},
			{
				"box" : {
					"id" : "obj-rota-zoom",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 280.0, 140.0, 22.0 ],
					"text" : "jit.rota @boundmode 4"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage5",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 200.0, 320.0, 250.0, 20.0 ],
					"text" : "Stage 5: ROTATE (theta via jit.rota)"
				}
			},
			{
				"box" : {
					"id" : "obj-rotate-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 700.0, 120.0, 130.0, 22.0 ],
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
					"patching_rect" : [ 700.0, 150.0, 70.0, 22.0 ],
					"text" : "prepend theta"
				}
			},
			{
				"box" : {
					"id" : "obj-rota-rotate",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 340.0, 140.0, 22.0 ],
					"text" : "jit.rota @boundmode 4"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage6",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 200.0, 380.0, 250.0, 20.0 ],
					"text" : "Stage 6: SMEAR (feedback blend)"
				}
			},
			{
				"box" : {
					"id" : "obj-prev-read",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 300.0, 400.0, 240.0, 22.0 ],
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
					"patching_rect" : [ 300.0, 440.0, 85.0, 22.0 ],
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
					"patching_rect" : [ 150.0, 400.0, 42.0, 22.0 ],
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
					"patching_rect" : [ 50.0, 440.0, 85.0, 22.0 ],
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
					"patching_rect" : [ 50.0, 480.0, 85.0, 22.0 ],
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
					"patching_rect" : [ 50.0, 520.0, 240.0, 22.0 ],
					"text" : "jit.matrix ---tv_viz_ram_out 4 float32 256 256"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage7",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 200.0, 560.0, 200.0, 20.0 ],
					"text" : "Stage 7: Normalize for display"
				}
			},
			{
				"box" : {
					"id" : "obj-abs",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 560.0, 85.0, 22.0 ],
					"text" : "jit.op @op abs"
				}
			},
			{
				"box" : {
					"id" : "obj-boost",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 590.0, 110.0, 22.0 ],
					"text" : "jit.op @op * @val 3."
				}
			}
		],
		"lines" : [
			{
				"patchline" : {
					"destination" : [ "obj-ram-read", 0 ],
					"order" : 1,
					"source" : [ "obj-inlet", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-prev-read", 0 ],
					"order" : 0,
					"source" : [ "obj-inlet", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scroll-val", 0 ],
					"source" : [ "obj-r-scroll", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scroll-scale", 0 ],
					"source" : [ "obj-scroll-val", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scroll-pack", 0 ],
					"source" : [ "obj-scroll-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rota-scroll", 0 ],
					"source" : [ "obj-scroll-pack", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-val", 0 ],
					"source" : [ "obj-r-zoom", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-scale", 0 ],
					"source" : [ "obj-zoom-val", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-pack", 0 ],
					"order" : 1,
					"source" : [ "obj-zoom-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-pack-y", 0 ],
					"order" : 0,
					"source" : [ "obj-zoom-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rota-zoom", 0 ],
					"source" : [ "obj-zoom-pack", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rota-zoom", 0 ],
					"source" : [ "obj-zoom-pack-y", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rotate-val", 0 ],
					"source" : [ "obj-r-rotate", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rotate-scale", 0 ],
					"source" : [ "obj-rotate-val", 0 ]
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
					"destination" : [ "obj-rota-rotate", 0 ],
					"source" : [ "obj-rotate-prepend", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-val", 0 ],
					"source" : [ "obj-r-smear", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-one-minus", 0 ],
					"order" : 1,
					"source" : [ "obj-smear-val", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-prev", 1 ],
					"order" : 0,
					"source" : [ "obj-smear-val", 0 ]
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
					"destination" : [ "obj-rota-scroll", 0 ],
					"source" : [ "obj-reshape-2d", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rota-zoom", 0 ],
					"source" : [ "obj-rota-scroll", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rota-rotate", 0 ],
					"source" : [ "obj-rota-zoom", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-new", 0 ],
					"source" : [ "obj-rota-rotate", 0 ]
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
					"destination" : [ "obj-abs", 0 ],
					"source" : [ "obj-copy-out", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-boost", 0 ],
					"source" : [ "obj-abs", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-outlet", 0 ],
					"source" : [ "obj-boost", 0 ]
				}
			}
		]
	}
}
