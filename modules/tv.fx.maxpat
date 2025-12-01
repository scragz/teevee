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
		"rect" : [ 100.0, 100.0, 1100.0, 800.0 ],
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
		"description" : "tv.fx - GPU-based visual effects processor using jit.gl.pix",
		"digest" : "GPU processing: scroll, zoom, rotation, smear, edge, warp effects via tv.core.genjit",
		"tags" : "teevee, fx, gpu, opengl, jit.gl.pix, effects",
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
					"comment" : "Processed matrix output (2D for visualization)",
					"id" : "obj-outlet",
					"index" : 1,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 580.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-comment-title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 500.0, 30.0, 400.0, 20.0 ],
					"text" : "tv.fx - GPU Effects via jit.world + jit.gl.pix"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-flow",
					"linecount" : 5,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 500.0, 55.0, 400.0, 75.0 ],
					"text" : "Signal Flow:\n1. bang → jit.world renders scene → output_matrix\n2. jit.gl.pix processes texture with tv.core.genjit shader\n3. jit.gl.videoplane displays to capture in jit.world\n4. Matrix output → reshape 1D → write back to tv_ram"
				}
			},
			{
				"box" : {
					"id" : "obj-world",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "jit_matrix", "bang", "" ],
					"patching_rect" : [ 50.0, 70.0, 380.0, 22.0 ],
					"text" : "jit.world @visible 0 @enable 1 @output_matrix 1 @dim 256 256"
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
					"patching_rect" : [ 50.0, 170.0, 200.0, 22.0 ],
					"text" : "jit.matrix 4 float32 256 256 @adapt 0"
				}
			},
			{
				"box" : {
					"id" : "obj-texture",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_gl_texture", "" ],
					"patching_rect" : [ 50.0, 210.0, 200.0, 22.0 ],
					"text" : "jit.gl.texture @type float32 @dim 256 256"
				}
			},
			{
				"box" : {
					"id" : "obj-pix",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_gl_texture", "" ],
					"patching_rect" : [ 50.0, 250.0, 320.0, 22.0 ],
					"text" : "jit.gl.pix @file tv.core.genjit @type float32 @dim 256 256"
				}
			},
			{
				"box" : {
					"id" : "obj-videoplane",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_gl_texture", "" ],
					"patching_rect" : [ 50.0, 290.0, 200.0, 22.0 ],
					"text" : "jit.gl.videoplane @transform_reset 2"
				}
			},
			{
				"box" : {
					"id" : "obj-output-branch",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 50.0, 400.0, 32.0, 22.0 ],
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
					"patching_rect" : [ 150.0, 450.0, 200.0, 22.0 ],
					"text" : "jit.matrix 4 float32 65536 @adapt 0"
				}
			},
			{
				"box" : {
					"id" : "obj-ram-write",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 150.0, 490.0, 200.0, 22.0 ],
					"text" : "jit.matrix tv_ram 4 float32 65536"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-params",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 500.0, 150.0, 300.0, 20.0 ],
					"text" : "Parameter routing to jit.gl.pix"
				}
			},
			{
				"box" : {
					"id" : "obj-r-scroll",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 180.0, 120.0, 22.0 ],
					"text" : "r ---tv_param_scroll"
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-msg",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 210.0, 155.0, 22.0 ],
					"text" : "prepend param scroll_speed"
				}
			},
			{
				"box" : {
					"id" : "obj-r-zoom",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 680.0, 180.0, 110.0, 22.0 ],
					"text" : "r ---tv_param_zoom"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 680.0, 210.0, 100.0, 22.0 ],
					"text" : "scale 0. 1. 0.25 4."
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-msg",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 680.0, 240.0, 115.0, 22.0 ],
					"text" : "prepend param zoom"
				}
			},
			{
				"box" : {
					"id" : "obj-r-rotation",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 850.0, 180.0, 120.0, 22.0 ],
					"text" : "r ---tv_param_rotation"
				}
			},
			{
				"box" : {
					"id" : "obj-rotation-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 850.0, 210.0, 145.0, 22.0 ],
					"text" : "scale 0. 1. -3.14159 3.14159"
				}
			},
			{
				"box" : {
					"id" : "obj-rotation-msg",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 850.0, 240.0, 125.0, 22.0 ],
					"text" : "prepend param rotation"
				}
			},
			{
				"box" : {
					"id" : "obj-r-smear",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 280.0, 115.0, 22.0 ],
					"text" : "r ---tv_param_smear"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-msg",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 310.0, 120.0, 22.0 ],
					"text" : "prepend param smear"
				}
			},
			{
				"box" : {
					"id" : "obj-r-edge",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 680.0, 280.0, 105.0, 22.0 ],
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
					"patching_rect" : [ 680.0, 310.0, 140.0, 22.0 ],
					"text" : "prepend param edge_amount"
				}
			},
			{
				"box" : {
					"id" : "obj-r-warp-x",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 360.0, 115.0, 22.0 ],
					"text" : "r ---tv_param_warp_x"
				}
			},
			{
				"box" : {
					"id" : "obj-warpx-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 390.0, 100.0, 22.0 ],
					"text" : "scale 0. 1. -1. 1."
				}
			},
			{
				"box" : {
					"id" : "obj-warpx-msg",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 420.0, 125.0, 22.0 ],
					"text" : "prepend param warp_x"
				}
			},
			{
				"box" : {
					"id" : "obj-r-warp-y",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 680.0, 360.0, 115.0, 22.0 ],
					"text" : "r ---tv_param_warp_y"
				}
			},
			{
				"box" : {
					"id" : "obj-warpy-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 680.0, 390.0, 100.0, 22.0 ],
					"text" : "scale 0. 1. -1. 1."
				}
			},
			{
				"box" : {
					"id" : "obj-warpy-msg",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 680.0, 420.0, 125.0, 22.0 ],
					"text" : "prepend param warp_y"
				}
			}
		],
		"lines" : [
			{
				"patchline" : {
					"destination" : [ "obj-world", 0 ],
					"source" : [ "obj-inlet", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-output-branch", 0 ],
					"source" : [ "obj-world", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ram-read", 0 ],
					"source" : [ "obj-world", 1 ]
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
					"destination" : [ "obj-texture", 0 ],
					"source" : [ "obj-reshape-to-2d", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-pix", 0 ],
					"source" : [ "obj-texture", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-videoplane", 0 ],
					"source" : [ "obj-pix", 0 ]
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
					"destination" : [ "obj-scroll-msg", 0 ],
					"source" : [ "obj-r-scroll", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-pix", 0 ],
					"source" : [ "obj-scroll-msg", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-scale", 0 ],
					"source" : [ "obj-r-zoom", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-msg", 0 ],
					"source" : [ "obj-zoom-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-pix", 0 ],
					"source" : [ "obj-zoom-msg", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rotation-scale", 0 ],
					"source" : [ "obj-r-rotation", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rotation-msg", 0 ],
					"source" : [ "obj-rotation-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-pix", 0 ],
					"source" : [ "obj-rotation-msg", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-msg", 0 ],
					"source" : [ "obj-r-smear", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-pix", 0 ],
					"source" : [ "obj-smear-msg", 0 ]
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
					"destination" : [ "obj-pix", 0 ],
					"source" : [ "obj-edge-msg", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-warpx-scale", 0 ],
					"source" : [ "obj-r-warp-x", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-warpx-msg", 0 ],
					"source" : [ "obj-warpx-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-pix", 0 ],
					"source" : [ "obj-warpx-msg", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-warpy-scale", 0 ],
					"source" : [ "obj-r-warp-y", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-warpy-msg", 0 ],
					"source" : [ "obj-warpy-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-pix", 0 ],
					"source" : [ "obj-warpy-msg", 0 ]
				}
			}
		]
	}
}
