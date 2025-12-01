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
		"description" : "tv.ingest - Audio encoder and matrix writer",
		"digest" : "Encodes stereo audio to ARGB and writes to matrix",
		"tags" : "teevee, ingest, writer, encode",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [
			{
				"box" : {
					"comment" : "Audio Left",
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
					"comment" : "Audio Right",
					"id" : "obj-in2",
					"index" : 2,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 120.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "Write Index (signal)",
					"id" : "obj-in3",
					"index" : 3,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 350.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-comment1",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 450.0, 30.0, 200.0, 20.0 ],
					"text" : "tv.ingest - Writer Module"
				}
			},
			{
				"box" : {
					"id" : "obj-encode",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 4,
					"outlettype" : [ "signal", "signal", "signal", "signal" ],
					"patching_rect" : [ 50.0, 100.0, 150.0, 22.0 ],
					"text" : "gen~ @file tv.encode.gendsp"
				}
			},
			{
				"box" : {
					"id" : "obj-matrix",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 450.0, 100.0, 180.0, 22.0 ],
					"text" : "jit.matrix ---tv_ram 4 float32 256 256"
				}
			},
			{
				"box" : {
					"id" : "obj-y-counter",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 250.0, 150.0, 100.0, 22.0 ],
					"text" : "r ---tv_write_y"
				}
			},
			{
				"box" : {
					"id" : "obj-sig-y",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 250.0, 180.0, 31.0, 22.0 ],
					"text" : "sig~"
				}
			},
			{
				"box" : {
					"id" : "obj-poke-alpha",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 250.0, 180.0, 22.0 ],
					"text" : "jit.poke~ ---tv_ram 0 @interp 0"
				}
			},
			{
				"box" : {
					"id" : "obj-poke-red",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 300.0, 180.0, 22.0 ],
					"text" : "jit.poke~ ---tv_ram 1 @interp 0"
				}
			},
			{
				"box" : {
					"id" : "obj-poke-green",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 350.0, 180.0, 22.0 ],
					"text" : "jit.poke~ ---tv_ram 2 @interp 0"
				}
			},
			{
				"box" : {
					"id" : "obj-poke-blue",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 400.0, 180.0, 22.0 ],
					"text" : "jit.poke~ ---tv_ram 3 @interp 0"
				}
			}
		],
		"lines" : [
			{
				"patchline" : {
					"destination" : [ "obj-encode", 0 ],
					"source" : [ "obj-in1", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-encode", 1 ],
					"source" : [ "obj-in2", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-poke-alpha", 0 ],
					"source" : [ "obj-encode", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-poke-red", 0 ],
					"source" : [ "obj-encode", 1 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-poke-green", 0 ],
					"source" : [ "obj-encode", 2 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-poke-blue", 0 ],
					"source" : [ "obj-encode", 3 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-poke-alpha", 1 ],
					"source" : [ "obj-in3", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-poke-red", 1 ],
					"source" : [ "obj-in3", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-poke-green", 1 ],
					"source" : [ "obj-in3", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-poke-blue", 1 ],
					"source" : [ "obj-in3", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-sig-y", 0 ],
					"source" : [ "obj-y-counter", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-poke-alpha", 2 ],
					"source" : [ "obj-sig-y", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-poke-red", 2 ],
					"source" : [ "obj-sig-y", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-poke-green", 2 ],
					"source" : [ "obj-sig-y", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-poke-blue", 2 ],
					"source" : [ "obj-sig-y", 0 ]
				}
			}
		]
	}
}
