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
		"rect" : [ 100.0, 100.0, 600.0, 500.0 ],
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
		"description" : "tv.egress - Read from processed buffer with scroll offset",
		"digest" : "Matrix reader with integer scroll and M/S decoding",
		"tags" : "teevee, egress, reader, decode, scroll",
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
					"patching_rect" : [ 400.0, 30.0, 220.0, 22.0 ],
					"text" : "jit.matrix tv_ram_out 4 float32 65536"
				}
			},
			{
				"box" : {
					"comment" : "Read Index (linear 0-65535)",
					"id" : "obj-in-idx",
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
					"id" : "obj-r-scroll",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 250.0, 30.0, 110.0, 22.0 ],
					"text" : "r ---tv_param_scroll"
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 250.0, 60.0, 140.0, 22.0 ],
					"text" : "scale 0. 1. -32768. 32768."
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-int",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 250.0, 90.0, 30.0, 22.0 ],
					"text" : "int"
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-sig",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 250.0, 120.0, 35.0, 22.0 ],
					"text" : "sig~"
				}
			},
			{
				"box" : {
					"id" : "obj-add-offset",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 80.0, 35.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-add-size",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 120.0, 75.0, 22.0 ],
					"text" : "+~ 65536."
				}
			},
			{
				"box" : {
					"id" : "obj-mod",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 160.0, 75.0, 22.0 ],
					"text" : "%~ 65536."
				}
			},
			{
				"box" : {
					"id" : "obj-trunc",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 200.0, 45.0, 22.0 ],
					"text" : "trunc~"
				}
			},
			{
				"box" : {
					"id" : "obj-peek-mid",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 250.0, 130.0, 22.0 ],
					"text" : "jit.peek~ tv_ram_out 1 1"
				}
			},
			{
				"box" : {
					"id" : "obj-peek-side",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 200.0, 250.0, 130.0, 22.0 ],
					"text" : "jit.peek~ tv_ram_out 1 3"
				}
			},
			{
				"box" : {
					"id" : "obj-add-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 310.0, 35.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-sub-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 310.0, 35.0, 22.0 ],
					"text" : "-~"
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
					"patching_rect" : [ 50.0, 370.0, 30.0, 30.0 ]
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
					"patching_rect" : [ 150.0, 370.0, 30.0, 30.0 ]
				}
			}
		],
		"lines" : [
			{
				"patchline" : {
					"destination" : [ "obj-add-offset", 0 ],
					"source" : [ "obj-in-idx", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scroll-scale", 0 ],
					"source" : [ "obj-r-scroll", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scroll-int", 0 ],
					"source" : [ "obj-scroll-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scroll-sig", 0 ],
					"source" : [ "obj-scroll-int", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-add-offset", 1 ],
					"source" : [ "obj-scroll-sig", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-add-size", 0 ],
					"source" : [ "obj-add-offset", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-mod", 0 ],
					"source" : [ "obj-add-size", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-trunc", 0 ],
					"source" : [ "obj-mod", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-peek-mid", 0 ],
					"order" : 1,
					"source" : [ "obj-trunc", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-peek-side", 0 ],
					"order" : 0,
					"source" : [ "obj-trunc", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-add-l", 0 ],
					"source" : [ "obj-peek-mid", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-sub-r", 0 ],
					"source" : [ "obj-peek-mid", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-add-l", 1 ],
					"source" : [ "obj-peek-side", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-sub-r", 1 ],
					"source" : [ "obj-peek-side", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-out-l", 0 ],
					"source" : [ "obj-add-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-out-r", 0 ],
					"source" : [ "obj-sub-r", 0 ]
				}
			}
		]
	}
}
