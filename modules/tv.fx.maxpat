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
		"rect" : [ 100.0, 100.0, 1000.0, 750.0 ],
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
		"description" : "tv.fx - Matrix-based visual effects processor",
		"digest" : "Visual DSP chain using jit.rota, jit.slide, jit.sobel for scroll/zoom/rotation/smear/edge effects",
		"tags" : "teevee, fx, matrix, effects, rota, slide, sobel",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [
			{
				"box" : {
					"comment" : "Bang trigger from qmetro",
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
					"comment" : "Processed matrix output",
					"id" : "obj-outlet",
					"index" : 1,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 660.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-comment-title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 550.0, 30.0, 350.0, 20.0 ],
					"text" : "tv.fx - Matrix-Based Effects (jit.rota → jit.slide → jit.sobel)"
				}
			},
			{
				"box" : {
					"id" : "obj-trigger",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 50.0, 80.0, 40.0, 22.0 ],
					"text" : "t b b"
				}
			},
			{
				"box" : {
					"id" : "obj-ram-read",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 130.0, 200.0, 22.0 ],
					"text" : "jit.matrix tv_ram 4 float32 65536"
				}
			},
			{
				"box" : {
					"id" : "obj-reshape-to-2d",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 165.0, 170.0, 22.0 ],
					"text" : "jit.matrix 4 float32 256 256"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage1",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 290.0, 200.0, 250.0, 20.0 ],
					"text" : "Stage 1: Geometric transforms (scroll/zoom/rotate)"
				}
			},
			{
				"box" : {
					"id" : "obj-rota",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 220.0, 220.0, 22.0 ],
					"text" : "jit.rota @boundmode 1 @interp 1"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage2",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 290.0, 290.0, 200.0, 20.0 ],
					"text" : "Stage 2: Temporal smear (motion blur)"
				}
			},
			{
				"box" : {
					"id" : "obj-slide",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 310.0, 220.0, 22.0 ],
					"text" : "jit.slide @slide_up 1. @slide_down 1."
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage3",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 290.0, 380.0, 200.0, 20.0 ],
					"text" : "Stage 3: Edge detection + mixing"
				}
			},
			{
				"box" : {
					"id" : "obj-edge-branch",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 50.0, 400.0, 120.0, 22.0 ],
					"text" : "t l l"
				}
			},
			{
				"box" : {
					"id" : "obj-sobel",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 150.0, 440.0, 55.0, 22.0 ],
					"text" : "jit.sobel"
				}
			},
			{
				"box" : {
					"id" : "obj-xfade",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 490.0, 120.0, 22.0 ],
					"text" : "jit.xfade"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage4",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 290.0, 550.0, 250.0, 20.0 ],
					"text" : "Stage 4: Write back to tv_ram for feedback"
				}
			},
			{
				"box" : {
					"id" : "obj-output-branch",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 50.0, 570.0, 120.0, 22.0 ],
					"text" : "t l l"
				}
			},
			{
				"box" : {
					"id" : "obj-reshape-to-1d",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 150.0, 580.0, 170.0, 22.0 ],
					"text" : "jit.matrix 4 float32 65536"
				}
			},
			{
				"box" : {
					"id" : "obj-ram-write",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 150.0, 610.0, 200.0, 22.0 ],
					"text" : "jit.matrix tv_ram 4 float32 65536"
				}
			},
			{
				"box" : {
					"id" : "obj-r-scroll",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 550.0, 80.0, 120.0, 22.0 ],
					"text" : "r ---tv_param_scroll"
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-accum",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 550.0, 110.0, 70.0, 22.0 ],
					"text" : "accum 0. 1."
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-wrap",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 550.0, 140.0, 115.0, 22.0 ],
					"text" : "expr fmod($f1\\, 256.)"
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-msg",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 550.0, 170.0, 85.0, 22.0 ],
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
					"patching_rect" : [ 700.0, 80.0, 110.0, 22.0 ],
					"text" : "r ---tv_param_zoom"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-pack",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 700.0, 110.0, 32.0, 22.0 ],
					"text" : "t f f"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-msg",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 700.0, 140.0, 90.0, 22.0 ],
					"text" : "prepend zoom_x"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-msg-y",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 750.0, 140.0, 90.0, 22.0 ],
					"text" : "prepend zoom_y"
				}
			},
			{
				"box" : {
					"id" : "obj-r-rotation",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 850.0, 80.0, 120.0, 22.0 ],
					"text" : "r ---tv_param_rotation"
				}
			},
			{
				"box" : {
					"id" : "obj-theta-msg",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 850.0, 110.0, 85.0, 22.0 ],
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
					"patching_rect" : [ 550.0, 230.0, 115.0, 22.0 ],
					"text" : "r ---tv_param_smear"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 550.0, 260.0, 115.0, 22.0 ],
					"text" : "scale 0. 1. 1. 200."
				}
			},
			{
				"box" : {
					"id" : "obj-smear-split",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 550.0, 290.0, 35.0, 22.0 ],
					"text" : "t f f"
				}
			},
			{
				"box" : {
					"id" : "obj-slide-up-msg",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 550.0, 320.0, 100.0, 22.0 ],
					"text" : "prepend slide_up"
				}
			},
			{
				"box" : {
					"id" : "obj-slide-down-msg",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 680.0, 320.0, 115.0, 22.0 ],
					"text" : "prepend slide_down"
				}
			},
			{
				"box" : {
					"id" : "obj-r-edge",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 550.0, 400.0, 105.0, 22.0 ],
					"text" : "r ---tv_param_edge"
				}
			},
			{
				"box" : {
					"id" : "obj-edge-msg",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 550.0, 430.0, 85.0, 22.0 ],
					"text" : "prepend xfade"
				}
			},
			{
				"box" : {
					"id" : "obj-r-warp-x",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 550.0, 500.0, 115.0, 22.0 ],
					"text" : "r ---tv_param_warp_x"
				}
			},
			{
				"box" : {
					"id" : "obj-r-warp-y",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 700.0, 500.0, 115.0, 22.0 ],
					"text" : "r ---tv_param_warp_y"
				}
			},
			{
				"box" : {
					"id" : "obj-warp-comment",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 550.0, 530.0, 280.0, 20.0 ],
					"text" : "(warp_x/warp_y reserved for future jit.expr distortion)"
				}
			},
			{
				"box" : {
					"id" : "obj-loadbang",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 850.0, 170.0, 60.0, 22.0 ],
					"text" : "loadbang"
				}
			},
			{
				"box" : {
					"id" : "obj-anchor-msg",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 850.0, 200.0, 130.0, 22.0 ],
					"text" : "anchor_x 0.5, anchor_y 0.5"
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
					"destination" : [ "obj-reshape-to-2d", 0 ],
					"source" : [ "obj-ram-read", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rota", 0 ],
					"source" : [ "obj-reshape-to-2d", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-slide", 0 ],
					"source" : [ "obj-rota", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-edge-branch", 0 ],
					"source" : [ "obj-slide", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-xfade", 0 ],
					"source" : [ "obj-edge-branch", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-sobel", 0 ],
					"source" : [ "obj-edge-branch", 1 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-xfade", 1 ],
					"source" : [ "obj-sobel", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-output-branch", 0 ],
					"source" : [ "obj-xfade", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-outlet", 0 ],
					"source" : [ "obj-output-branch", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-reshape-to-1d", 0 ],
					"source" : [ "obj-output-branch", 1 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ram-write", 0 ],
					"source" : [ "obj-reshape-to-1d", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scroll-accum", 0 ],
					"source" : [ "obj-r-scroll", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scroll-wrap", 0 ],
					"source" : [ "obj-scroll-accum", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scroll-msg", 0 ],
					"source" : [ "obj-scroll-wrap", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rota", 0 ],
					"source" : [ "obj-scroll-msg", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-pack", 0 ],
					"source" : [ "obj-r-zoom", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-msg", 0 ],
					"source" : [ "obj-zoom-pack", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-msg-y", 0 ],
					"source" : [ "obj-zoom-pack", 1 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rota", 0 ],
					"source" : [ "obj-zoom-msg", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rota", 0 ],
					"source" : [ "obj-zoom-msg-y", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-theta-msg", 0 ],
					"source" : [ "obj-r-rotation", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rota", 0 ],
					"source" : [ "obj-theta-msg", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-scale", 0 ],
					"source" : [ "obj-r-smear", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-split", 0 ],
					"source" : [ "obj-smear-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-slide-up-msg", 0 ],
					"source" : [ "obj-smear-split", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-slide-down-msg", 0 ],
					"source" : [ "obj-smear-split", 1 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-slide", 0 ],
					"source" : [ "obj-slide-up-msg", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-slide", 0 ],
					"source" : [ "obj-slide-down-msg", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-edge-msg", 0 ],
					"source" : [ "obj-r-edge", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-xfade", 0 ],
					"source" : [ "obj-edge-msg", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-anchor-msg", 0 ],
					"source" : [ "obj-loadbang", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rota", 0 ],
					"source" : [ "obj-anchor-msg", 0 ]
				}
			}
		]
	}
}
