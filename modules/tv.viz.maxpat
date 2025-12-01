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
		"rect" : [ 100.0, 100.0, 500.0, 400.0 ],
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
		"description" : "tv.viz - UI visualization for the processed texture",
		"digest" : "Displays the GPU-processed texture output",
		"tags" : "teevee, viz, visualization, display",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [
			{
				"box" : {
					"comment" : "jit_gl_texture input",
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
					"id" : "obj-comment1",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 300.0, 30.0, 150.0, 20.0 ],
					"text" : "tv.viz - Monitor Module"
				}
			},
			{
				"box" : {
					"id" : "obj-videoplane",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 100.0, 200.0, 22.0 ],
					"text" : "jit.gl.videoplane ---tv_ctx @transform_reset 2"
				}
			},
			{
				"box" : {
					"id" : "obj-render",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 50.0, 150.0, 200.0, 22.0 ],
					"text" : "jit.gl.render ---tv_ctx @erase_color 0 0 0 1"
				}
			},
			{
				"box" : {
					"id" : "obj-window",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "jit_matrix", "", "" ],
					"patching_rect" : [ 50.0, 200.0, 230.0, 22.0 ],
					"text" : "jit.pwindow @name ---tv_ctx @rect 0 0 256 256"
				}
			},
			{
				"box" : {
					"id" : "obj-qmetro",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 200.0, 60.0, 65.0, 22.0 ],
					"text" : "qmetro 16"
				}
			},
			{
				"box" : {
					"id" : "obj-toggle",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 200.0, 30.0, 24.0, 24.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-loadbang",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 250.0, 30.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}
			},
			{
				"box" : {
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 250.0, 55.0, 29.5, 22.0 ],
					"text" : "t 1"
				}
			}
		],
		"lines" : [
			{
				"patchline" : {
					"destination" : [ "obj-videoplane", 0 ],
					"source" : [ "obj-in1", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-render", 0 ],
					"source" : [ "obj-videoplane", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-window", 0 ],
					"source" : [ "obj-render", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-qmetro", 0 ],
					"source" : [ "obj-toggle", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-loadbang", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-toggle", 0 ],
					"source" : [ "obj-1", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-render", 0 ],
					"source" : [ "obj-qmetro", 0 ]
				}
			}
		]
	}
}
