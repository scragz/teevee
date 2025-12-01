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
		"description" : "tv.fx - GPU processing engine with jit.gl.pix",
		"digest" : "Visual DSP chain: scroll, warp, smear, edge effects",
		"tags" : "teevee, fx, gpu, shader, pix",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [
			{
				"box" : {
					"comment" : "Bang/Trigger to render",
					"id" : "obj-in1",
					"index" : 1,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 50.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "jit_gl_texture output",
					"id" : "obj-out1",
					"index" : 1,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 520.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-comment1",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 500.0, 30.0, 250.0, 20.0 ],
					"text" : "tv.fx - GPU Processing Engine"
				}
			},
			{
				"box" : {
					"id" : "obj-node",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_gl_texture", "" ],
					"patching_rect" : [ 50.0, 80.0, 230.0, 22.0 ],
					"text" : "jit.gl.node ---tv_ctx @name ---tv_node @capture 1"
				}
			},
			{
				"box" : {
					"id" : "obj-matrix-ref",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 300.0, 80.0, 180.0, 22.0 ],
					"text" : "jit.matrix ---tv_ram 4 float32 256 256"
				}
			},
			{
				"box" : {
					"id" : "obj-tex-input",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_gl_texture", "" ],
					"patching_rect" : [ 50.0, 140.0, 280.0, 22.0 ],
					"text" : "jit.gl.texture ---tv_ctx @name ---tv_tex @type float32"
				}
			},
			{
				"box" : {
					"id" : "obj-pix",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_gl_texture", "" ],
					"patching_rect" : [ 50.0, 280.0, 200.0, 22.0 ],
					"text" : "jit.gl.pix ---tv_ctx @file tv.core.genjit"
				}
			},
			{
				"box" : {
					"id" : "obj-r-scroll",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 350.0, 200.0, 120.0, 22.0 ],
					"text" : "r ---tv_param_scroll"
				}
			},
			{
				"box" : {
					"id" : "obj-r-zoom",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 350.0, 230.0, 110.0, 22.0 ],
					"text" : "r ---tv_param_zoom"
				}
			},
			{
				"box" : {
					"id" : "obj-r-rotation",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 350.0, 260.0, 120.0, 22.0 ],
					"text" : "r ---tv_param_rotation"
				}
			},
			{
				"box" : {
					"id" : "obj-r-smear",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 350.0, 290.0, 115.0, 22.0 ],
					"text" : "r ---tv_param_smear"
				}
			},
			{
				"box" : {
					"id" : "obj-r-edge",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 350.0, 320.0, 105.0, 22.0 ],
					"text" : "r ---tv_param_edge"
				}
			},
			{
				"box" : {
					"id" : "obj-r-warp-x",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 350.0, 350.0, 115.0, 22.0 ],
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
					"patching_rect" : [ 350.0, 380.0, 115.0, 22.0 ],
					"text" : "r ---tv_param_warp_y"
				}
			},
			{
				"box" : {
					"id" : "obj-prepend-scroll",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 200.0, 110.0, 22.0 ],
					"text" : "prepend scroll_speed"
				}
			},
			{
				"box" : {
					"id" : "obj-prepend-zoom",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 230.0, 85.0, 22.0 ],
					"text" : "prepend zoom"
				}
			},
			{
				"box" : {
					"id" : "obj-prepend-rotation",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 260.0, 95.0, 22.0 ],
					"text" : "prepend rotation"
				}
			},
			{
				"box" : {
					"id" : "obj-prepend-smear",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 290.0, 90.0, 22.0 ],
					"text" : "prepend smear"
				}
			},
			{
				"box" : {
					"id" : "obj-prepend-edge",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 320.0, 110.0, 22.0 ],
					"text" : "prepend edge_amount"
				}
			},
			{
				"box" : {
					"id" : "obj-prepend-warp-x",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 350.0, 95.0, 22.0 ],
					"text" : "prepend warp_x"
				}
			},
			{
				"box" : {
					"id" : "obj-prepend-warp-y",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 380.0, 95.0, 22.0 ],
					"text" : "prepend warp_y"
				}
			},
			{
				"box" : {
					"id" : "obj-feedback-tex",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_gl_texture", "" ],
					"patching_rect" : [ 50.0, 360.0, 300.0, 22.0 ],
					"text" : "jit.gl.texture ---tv_ctx @name ---tv_feedback @type float32"
				}
			},
			{
				"box" : {
					"id" : "obj-copy-to-ram",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 420.0, 150.0, 22.0 ],
					"text" : "jit.gl.asyncread ---tv_ctx"
				}
			}
		],
		"lines" : [
			{
				"patchline" : {
					"destination" : [ "obj-node", 0 ],
					"source" : [ "obj-in1", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-tex-input", 0 ],
					"source" : [ "obj-node", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-pix", 0 ],
					"source" : [ "obj-tex-input", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-feedback-tex", 0 ],
					"source" : [ "obj-pix", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-copy-to-ram", 0 ],
					"source" : [ "obj-feedback-tex", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-out1", 0 ],
					"source" : [ "obj-feedback-tex", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-matrix-ref", 0 ],
					"source" : [ "obj-copy-to-ram", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-prepend-scroll", 0 ],
					"source" : [ "obj-r-scroll", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-prepend-zoom", 0 ],
					"source" : [ "obj-r-zoom", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-prepend-rotation", 0 ],
					"source" : [ "obj-r-rotation", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-prepend-smear", 0 ],
					"source" : [ "obj-r-smear", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-prepend-edge", 0 ],
					"source" : [ "obj-r-edge", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-prepend-warp-x", 0 ],
					"source" : [ "obj-r-warp-x", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-prepend-warp-y", 0 ],
					"source" : [ "obj-r-warp-y", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-pix", 0 ],
					"source" : [ "obj-prepend-scroll", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-pix", 0 ],
					"source" : [ "obj-prepend-zoom", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-pix", 0 ],
					"source" : [ "obj-prepend-rotation", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-pix", 0 ],
					"source" : [ "obj-prepend-smear", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-pix", 0 ],
					"source" : [ "obj-prepend-edge", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-pix", 0 ],
					"source" : [ "obj-prepend-warp-x", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-pix", 0 ],
					"source" : [ "obj-prepend-warp-y", 0 ]
				}
			}
		]
	}
}
