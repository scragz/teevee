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
		"rect" : [ 100.0, 100.0, 700.0, 550.0 ],
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
		"description" : "tv.egress - Matrix reader and audio decoder",
		"digest" : "Reads ARGB from matrix and decodes to stereo audio",
		"tags" : "teevee, egress, reader, decode",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [
			{
				"box" : {
					"comment" : "Read Index (signal)",
					"id" : "obj-in1",
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
					"comment" : "Y-Axis Scrubber (0-1)",
					"id" : "obj-in2",
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
					"comment" : "Audio Left",
					"id" : "obj-out1",
					"index" : 1,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 450.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "Audio Right",
					"id" : "obj-out2",
					"index" : 2,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 150.0, 450.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-comment1",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 450.0, 30.0, 200.0, 20.0 ],
					"text" : "tv.egress - Reader Module"
				}
			},
			{
				"box" : {
					"id" : "obj-peek-alpha",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 150.0, 180.0, 22.0 ],
					"text" : "jit.peek~ ---tv_ram 0 @interp 1"
				}
			},
			{
				"box" : {
					"id" : "obj-peek-red",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 190.0, 180.0, 22.0 ],
					"text" : "jit.peek~ ---tv_ram 1 @interp 1"
				}
			},
			{
				"box" : {
					"id" : "obj-peek-green",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 230.0, 180.0, 22.0 ],
					"text" : "jit.peek~ ---tv_ram 2 @interp 1"
				}
			},
			{
				"box" : {
					"id" : "obj-peek-blue",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 270.0, 180.0, 22.0 ],
					"text" : "jit.peek~ ---tv_ram 3 @interp 1"
				}
			},
			{
				"box" : {
					"id" : "obj-decode",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 50.0, 350.0, 150.0, 22.0 ],
					"text" : "gen~ @file tv.decode.gendsp"
				}
			},
			{
				"box" : {
					"id" : "obj-scale-y",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 100.0, 120.0, 22.0 ],
					"text" : "scale~ 0. 1. 0. 255."
				}
			}
		],
		"lines" : [
			{
				"patchline" : {
					"destination" : [ "obj-peek-alpha", 0 ],
					"source" : [ "obj-in1", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-peek-red", 0 ],
					"source" : [ "obj-in1", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-peek-green", 0 ],
					"source" : [ "obj-in1", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-peek-blue", 0 ],
					"source" : [ "obj-in1", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-y", 0 ],
					"source" : [ "obj-in2", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-peek-alpha", 1 ],
					"source" : [ "obj-scale-y", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-peek-red", 1 ],
					"source" : [ "obj-scale-y", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-peek-green", 1 ],
					"source" : [ "obj-scale-y", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-peek-blue", 1 ],
					"source" : [ "obj-scale-y", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-decode", 0 ],
					"source" : [ "obj-peek-alpha", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-decode", 1 ],
					"source" : [ "obj-peek-red", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-decode", 2 ],
					"source" : [ "obj-peek-green", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-decode", 3 ],
					"source" : [ "obj-peek-blue", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-out1", 0 ],
					"source" : [ "obj-decode", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-out2", 0 ],
					"source" : [ "obj-decode", 1 ]
				}
			}
		]
	}
}
