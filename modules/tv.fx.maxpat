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
		"description" : "tv.fx - Visual effects processor with feedback",
		"digest" : "Copy tv_ram to tv_ram_out with optional feedback/smear",
		"tags" : "teevee, fx, effects, feedback",
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
					"patching_rect" : [ 50.0, 500.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-r-smear",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 400.0, 30.0, 110.0, 22.0 ],
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
					"patching_rect" : [ 400.0, 60.0, 35.0, 22.0 ],
					"text" : "float"
				}
			},
			{
				"box" : {
					"id" : "obj-ram-read",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 80.0, 200.0, 22.0 ],
					"text" : "jit.matrix tv_ram 4 float32 65536"
				}
			},
			{
				"box" : {
					"id" : "obj-prev-read",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 250.0, 80.0, 220.0, 22.0 ],
					"text" : "jit.matrix tv_ram_out 4 float32 65536"
				}
			},
			{
				"box" : {
					"id" : "obj-scale-prev",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 250.0, 120.0, 85.0, 22.0 ],
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
					"patching_rect" : [ 150.0, 120.0, 42.0, 22.0 ],
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
					"patching_rect" : [ 50.0, 160.0, 85.0, 22.0 ],
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
					"patching_rect" : [ 50.0, 200.0, 85.0, 22.0 ],
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
					"patching_rect" : [ 50.0, 240.0, 220.0, 22.0 ],
					"text" : "jit.matrix tv_ram_out 4 float32 65536"
				}
			},
			{
				"box" : {
					"id" : "obj-reshape-2d",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 320.0, 200.0, 22.0 ],
					"text" : "jit.matrix 4 float32 256 256 @adapt 0"
				}
			},
			{
				"box" : {
					"id" : "obj-abs",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 360.0, 85.0, 22.0 ],
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
					"patching_rect" : [ 50.0, 400.0, 110.0, 22.0 ],
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
					"destination" : [ "obj-scale-new", 0 ],
					"source" : [ "obj-ram-read", 0 ]
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
					"destination" : [ "obj-reshape-2d", 0 ],
					"source" : [ "obj-copy-out", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-abs", 0 ],
					"source" : [ "obj-reshape-2d", 0 ]
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
