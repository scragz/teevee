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
		"rect" : [ 100.0, 100.0, 900.0, 700.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 0,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 220.0,
		"description" : "Teevee - Audio-reactive video feedback synthesizer",
		"digest" : "Stereo audio to ARGB matrix with effects",
		"tags" : "audio video jitter m4l feedback",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [
			{
				"box" : {
					"id" : "obj-matrix",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 400.0, 30.0, 200.0, 22.0 ],
					"text" : "jit.matrix tv_ram 4 float32 65536"
				}
			},
			{
				"box" : {
					"id" : "obj-matrix-out",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 620.0, 30.0, 220.0, 22.0 ],
					"text" : "jit.matrix tv_ram_out 4 float32 65536"
				}
			},
			{
				"box" : {
					"id" : "obj-plugin",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 30.0, 50.0, 75.0, 22.0 ],
					"text" : "plugin~ 2 2"
				}
			},
			{
				"box" : {
					"id" : "obj-plugout",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 400.0, 84.0, 22.0 ],
					"text" : "plugout~ 1 2"
				}
			},
			{
				"box" : {
					"id" : "obj-sync",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 200.0, 100.0, 60.0, 22.0 ],
					"text" : "tv.sync"
				}
			},
			{
				"box" : {
					"id" : "obj-ingest",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 200.0, 60.0, 22.0 ],
					"text" : "tv.ingest"
				}
			},
			{
				"box" : {
					"id" : "obj-egress",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 30.0, 320.0, 60.0, 22.0 ],
					"text" : "tv.egress"
				}
			},
			{
				"box" : {
					"id" : "obj-fx",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 400.0, 200.0, 40.0, 22.0 ],
					"text" : "tv.fx"
				}
			},
			{
				"box" : {
					"id" : "obj-viz",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 400.0, 300.0, 45.0, 22.0 ],
					"text" : "tv.viz"
				}
			},
			{
				"box" : {
					"id" : "obj-qmetro",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 400.0, 130.0, 65.0, 22.0 ],
					"text" : "qmetro 16"
				}
			},
			{
				"box" : {
					"id" : "obj-toggle-render",
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 400.0, 80.0, 24.0, 24.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-loadbang",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 440.0, 80.0, 58.0, 22.0 ],
					"text" : "loadbang"
				}
			},
			{
				"box" : {
					"id" : "obj-t1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 440.0, 105.0, 22.0, 22.0 ],
					"text" : "t 1"
				}
			},
			{
				"box" : {
					"id" : "obj-dial-scroll",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 550.0, 100.0, 44.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 10.0, 80.0, 44.0, 48.0 ],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_longname" : "Scroll",
							"parameter_shortname" : "Scroll",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 1.0,
							"parameter_initial" : [ 0.5 ],
							"parameter_initial_enable" : 1
						}
					},
					"varname" : "scroll"
				}
			},
			{
				"box" : {
					"id" : "obj-dial-smear",
					"maxclass" : "live.dial",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 610.0, 100.0, 44.0, 48.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 60.0, 80.0, 44.0, 48.0 ],
					"saved_attribute_attributes" : {
						"valueof" : {
							"parameter_longname" : "Smear",
							"parameter_shortname" : "Smear",
							"parameter_type" : 0,
							"parameter_unitstyle" : 1,
							"parameter_mmin" : 0.0,
							"parameter_mmax" : 1.0,
							"parameter_initial" : [ 0.0 ],
							"parameter_initial_enable" : 1
						}
					},
					"varname" : "smear"
				}
			},
			{
				"box" : {
					"id" : "obj-s-scroll",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 550.0, 160.0, 110.0, 22.0 ],
					"text" : "s ---tv_param_scroll"
				}
			},
			{
				"box" : {
					"id" : "obj-s-smear",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 610.0, 190.0, 110.0, 22.0 ],
					"text" : "s ---tv_param_smear"
				}
			},
			{
				"box" : {
					"fontface" : 1,
					"fontsize" : 18.0,
					"id" : "obj-title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 700.0, 100.0, 100.0, 27.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 10.0, 10.0, 100.0, 27.0 ],
					"text" : "TEEVEE",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-version",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 700.0, 130.0, 50.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 10.0, 38.0, 50.0, 20.0 ],
					"text" : "v6.0",
					"textcolor" : [ 0.7, 0.7, 0.7, 1.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-pwindow",
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "jit_matrix", "" ],
					"patching_rect" : [ 400.0, 400.0, 256.0, 256.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 120.0, 10.0, 64.0, 64.0 ]
				}
			},
			{
				"box" : {
					"bgcolor" : [ 0.15, 0.15, 0.15, 1.0 ],
					"id" : "obj-panel",
					"maxclass" : "panel",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 700.0, 160.0, 100.0, 30.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 200.0, 140.0 ]
				}
			}
		],
		"lines" : [
			{
				"patchline" : {
					"destination" : [ "obj-ingest", 0 ],
					"source" : [ "obj-plugin", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ingest", 1 ],
					"source" : [ "obj-plugin", 1 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ingest", 2 ],
					"source" : [ "obj-sync", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-egress", 0 ],
					"source" : [ "obj-sync", 1 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-plugout", 0 ],
					"source" : [ "obj-egress", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-plugout", 1 ],
					"source" : [ "obj-egress", 1 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-qmetro", 0 ],
					"source" : [ "obj-toggle-render", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-t1", 0 ],
					"source" : [ "obj-loadbang", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-toggle-render", 0 ],
					"source" : [ "obj-t1", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-fx", 0 ],
					"source" : [ "obj-qmetro", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-viz", 0 ],
					"order" : 1,
					"source" : [ "obj-fx", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-pwindow", 0 ],
					"order" : 0,
					"source" : [ "obj-fx", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-scroll", 0 ],
					"source" : [ "obj-dial-scroll", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-smear", 0 ],
					"source" : [ "obj-dial-smear", 0 ]
				}
			}
		],
		"parameters" : {
			"obj-dial-scroll" : [ "Scroll", "Scroll", 0 ],
			"obj-dial-smear" : [ "Smear", "Smear", 0 ],
			"parameterbanks" : {
				"0" : {
					"index" : 0,
					"name" : "",
					"parameters" : [ "-", "-", "-", "-", "-", "-", "-", "-" ]
				}
			},
			"inherited_shortname" : 1
		},
		"dependency_cache" : [
			{
				"name" : "tv.sync.maxpat",
				"bootpath" : "~/Projects/max/teevee/modules",
				"type" : "JSON",
				"implicit" : 1
			},
			{
				"name" : "tv.ingest.maxpat",
				"bootpath" : "~/Projects/max/teevee/modules",
				"type" : "JSON",
				"implicit" : 1
			},
			{
				"name" : "tv.egress.maxpat",
				"bootpath" : "~/Projects/max/teevee/modules",
				"type" : "JSON",
				"implicit" : 1
			},
			{
				"name" : "tv.fx.maxpat",
				"bootpath" : "~/Projects/max/teevee/modules",
				"type" : "JSON",
				"implicit" : 1
			},
			{
				"name" : "tv.viz.maxpat",
				"bootpath" : "~/Projects/max/teevee/modules",
				"type" : "JSON",
				"implicit" : 1
			}
		],
		"autosave" : 0
	}
}
