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
		"description" : "tv.param - Parameter scaling and distribution hub",
		"digest" : "Receives raw 0-1 values from UI and scales/distributes them",
		"tags" : "teevee, param, parameters, scaling",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [
			{
				"box" : {
					"comment" : "Scroll Speed (0-1)",
					"id" : "obj-in-scroll",
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
					"comment" : "Zoom (0-1)",
					"id" : "obj-in-zoom",
					"index" : 2,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 150.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "Rotation (0-1)",
					"id" : "obj-in-rotation",
					"index" : 3,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 250.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "Smear (0-1)",
					"id" : "obj-in-smear",
					"index" : 4,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 350.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "Edge (0-1)",
					"id" : "obj-in-edge",
					"index" : 5,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 450.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "Warp X (0-1)",
					"id" : "obj-in-warp-x",
					"index" : 6,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 550.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "Warp Y (0-1)",
					"id" : "obj-in-warp-y",
					"index" : 7,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 650.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-comment1",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 500.0, 300.0, 20.0 ],
					"text" : "tv.param - Parameter Hub"
				}
			},
			{
				"box" : {
					"id" : "obj-scale-scroll",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 50.0, 100.0, 110.0, 22.0 ],
					"text" : "scale 0. 1. 0. 0.1"
				}
			},
			{
				"box" : {
					"id" : "obj-scale-zoom",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 150.0, 100.0, 110.0, 22.0 ],
					"text" : "scale 0. 1. 0.25 4."
				}
			},
			{
				"box" : {
					"id" : "obj-scale-rotation",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 250.0, 100.0, 140.0, 22.0 ],
					"text" : "scale 0. 1. -3.14159 3.14159"
				}
			},
			{
				"box" : {
					"id" : "obj-scale-warp-x",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 550.0, 100.0, 100.0, 22.0 ],
					"text" : "scale 0. 1. -1. 1."
				}
			},
			{
				"box" : {
					"id" : "obj-scale-warp-y",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 650.0, 100.0, 100.0, 22.0 ],
					"text" : "scale 0. 1. -1. 1."
				}
			},
			{
				"box" : {
					"id" : "obj-s-scroll",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 200.0, 120.0, 22.0 ],
					"text" : "s ---tv_param_scroll"
				}
			},
			{
				"box" : {
					"id" : "obj-s-zoom",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 150.0, 200.0, 110.0, 22.0 ],
					"text" : "s ---tv_param_zoom"
				}
			},
			{
				"box" : {
					"id" : "obj-s-rotation",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 250.0, 200.0, 120.0, 22.0 ],
					"text" : "s ---tv_param_rotation"
				}
			},
			{
				"box" : {
					"id" : "obj-s-smear",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 350.0, 200.0, 115.0, 22.0 ],
					"text" : "s ---tv_param_smear"
				}
			},
			{
				"box" : {
					"id" : "obj-s-edge",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 450.0, 200.0, 105.0, 22.0 ],
					"text" : "s ---tv_param_edge"
				}
			},
			{
				"box" : {
					"id" : "obj-s-warp-x",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 550.0, 200.0, 115.0, 22.0 ],
					"text" : "s ---tv_param_warp_x"
				}
			},
			{
				"box" : {
					"id" : "obj-s-warp-y",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 650.0, 200.0, 115.0, 22.0 ],
					"text" : "s ---tv_param_warp_y"
				}
			},
			{
				"box" : {
					"id" : "obj-dim-inlet",
					"comment" : "Matrix Dimension",
					"index" : 8,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 750.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-s-dim",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 750.0, 200.0, 80.0, 22.0 ],
					"text" : "s ---tv_dim"
				}
			}
		],
		"lines" : [
			{
				"patchline" : {
					"destination" : [ "obj-scale-scroll", 0 ],
					"source" : [ "obj-in-scroll", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-zoom", 0 ],
					"source" : [ "obj-in-zoom", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-rotation", 0 ],
					"source" : [ "obj-in-rotation", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-smear", 0 ],
					"source" : [ "obj-in-smear", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-edge", 0 ],
					"source" : [ "obj-in-edge", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-warp-x", 0 ],
					"source" : [ "obj-in-warp-x", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-warp-y", 0 ],
					"source" : [ "obj-in-warp-y", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-scroll", 0 ],
					"source" : [ "obj-scale-scroll", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-zoom", 0 ],
					"source" : [ "obj-scale-zoom", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-rotation", 0 ],
					"source" : [ "obj-scale-rotation", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-warp-x", 0 ],
					"source" : [ "obj-scale-warp-x", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-warp-y", 0 ],
					"source" : [ "obj-scale-warp-y", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-dim", 0 ],
					"source" : [ "obj-dim-inlet", 0 ]
				}
			}
		]
	}
}
