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
		"description" : "tv.sync - Master clock and index generation",
		"digest" : "Centralized timing authority for read/write synchronization",
		"tags" : "teevee, sync, clock",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [
			{
				"box" : {
					"comment" : "Master Phasor (0-1)",
					"id" : "obj-out1",
					"index" : 1,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 480.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "Write Index X (0 to Dim-1)",
					"id" : "obj-out2",
					"index" : 2,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 150.0, 480.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "Read Ramp (0-1 normalized)",
					"id" : "obj-out3",
					"index" : 3,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 250.0, 480.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-comment1",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 400.0, 50.0, 200.0, 20.0 ],
					"text" : "tv.sync - Master Clock Module"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-y",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 400.0, 70.0, 250.0, 20.0 ],
					"text" : "Y-row counter increments on phasor wrap"
				}
			},
			{
				"box" : {
					"id" : "obj-samplerate",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 50.0, 50.0, 72.0, 22.0 ],
					"text" : "dspstate~"
				}
			},
			{
				"box" : {
					"id" : "obj-unpack",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 5,
					"outlettype" : [ "int", "float", "int", "int", "int" ],
					"patching_rect" : [ 50.0, 80.0, 200.0, 22.0 ],
					"text" : "unpack i f i i i"
				}
			},
			{
				"box" : {
					"id" : "obj-div",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 50.0, 120.0, 80.0, 22.0 ],
					"text" : "!/ 1."
				}
			},
			{
				"box" : {
					"id" : "obj-phasor",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 160.0, 56.0, 22.0 ],
					"text" : "phasor~"
				}
			},
			{
				"box" : {
					"id" : "obj-dim",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 150.0, 200.0, 80.0, 22.0 ],
					"text" : "r ---tv_dim"
				}
			},
			{
				"box" : {
					"id" : "obj-scale-write",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 280.0, 120.0, 22.0 ],
					"text" : "scale~ 0. 1. 0. 255."
				}
			},
			{
				"box" : {
					"id" : "obj-sig-dim",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 220.0, 240.0, 31.0, 22.0 ],
					"text" : "sig~"
				}
			},
			{
				"box" : {
					"id" : "obj-minus1",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 220.0, 220.0, 32.0, 22.0 ],
					"text" : "- 1"
				}
			},
			{
				"box" : {
					"id" : "obj-floor",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 320.0, 45.0, 22.0 ],
					"text" : "trunc~"
				}
			},
			{
				"box" : {
					"id" : "obj-delta",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 350.0, 200.0, 45.0, 22.0 ],
					"text" : "delta~"
				}
			},
			{
				"box" : {
					"id" : "obj-lessthan",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 350.0, 230.0, 45.0, 22.0 ],
					"text" : "<~ 0."
				}
			},
			{
				"box" : {
					"id" : "obj-edge",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 350.0, 260.0, 45.0, 22.0 ],
					"text" : "edge~"
				}
			},
			{
				"box" : {
					"id" : "obj-counter",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 4,
					"outlettype" : [ "int", "", "", "int" ],
					"patching_rect" : [ 350.0, 330.0, 100.0, 22.0 ],
					"text" : "counter 0 0 255"
				}
			},
			{
				"box" : {
					"id" : "obj-send-y",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 350.0, 400.0, 100.0, 22.0 ],
					"text" : "s ---tv_write_y"
				}
			},
			{
				"box" : {
					"id" : "obj-dim-y",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 420.0, 290.0, 80.0, 22.0 ],
					"text" : "r ---tv_dim"
				}
			},
			{
				"box" : {
					"id" : "obj-minus1-y",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 420.0, 310.0, 32.0, 22.0 ],
					"text" : "- 1"
				}
			},
			{
				"box" : {
					"id" : "obj-setmax",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 420.0, 340.0, 65.0, 22.0 ],
					"text" : "pack 0 255"
				}
			},
			{
				"box" : {
					"id" : "obj-setmax-msg",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 420.0, 370.0, 85.0, 22.0 ],
					"text" : "route int"
				}
			},
			{
				"box" : {
					"id" : "obj-prepend-max",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 330.0, 57.0, 22.0 ],
					"text" : "prepend max"
				}
			}
		],
		"lines" : [
			{
				"patchline" : {
					"destination" : [ "obj-unpack", 0 ],
					"source" : [ "obj-samplerate", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-div", 0 ],
					"source" : [ "obj-unpack", 1 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-div", 1 ],
					"source" : [ "obj-unpack", 2 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-phasor", 0 ],
					"source" : [ "obj-div", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-out1", 0 ],
					"source" : [ "obj-phasor", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-write", 0 ],
					"source" : [ "obj-phasor", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-out3", 0 ],
					"source" : [ "obj-phasor", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-delta", 0 ],
					"source" : [ "obj-phasor", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-minus1", 0 ],
					"source" : [ "obj-dim", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-sig-dim", 0 ],
					"source" : [ "obj-minus1", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-write", 5 ],
					"source" : [ "obj-sig-dim", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-floor", 0 ],
					"source" : [ "obj-scale-write", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-out2", 0 ],
					"source" : [ "obj-floor", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-lessthan", 0 ],
					"source" : [ "obj-delta", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-edge", 0 ],
					"source" : [ "obj-lessthan", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-counter", 0 ],
					"source" : [ "obj-edge", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-send-y", 0 ],
					"source" : [ "obj-counter", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-minus1-y", 0 ],
					"source" : [ "obj-dim-y", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-prepend-max", 0 ],
					"source" : [ "obj-minus1-y", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-counter", 4 ],
					"source" : [ "obj-prepend-max", 0 ]
				}
			}
		]
	}
}
