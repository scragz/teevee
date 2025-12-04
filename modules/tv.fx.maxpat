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
		"rect" : [ 100.0, 100.0, 1200.0, 800.0 ],
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
		"description" : "tv.fx - All Effects Chain",
		"digest" : "Mosaic, Aberration, Bloom, Solarize, Crush, Shutter, Ghosting, Smear",
		"tags" : "teevee, fx, effects",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [
			{
				"box" : {
					"comment" : "Audio In L",
					"id" : "obj-in-l",
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
					"comment" : "Audio In R",
					"id" : "obj-in-r",
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
					"id" : "obj-title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 400.0, 30.0, 300.0, 20.0 ],
					"text" : "tv.fx - Full Effects Chain"
				}
			},
			{
				"box" : {
					"id" : "obj-r-mosaic",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 400.0, 60.0, 115.0, 22.0 ],
					"text" : "r ---tv_audio_mosaic"
				}
			},
			{
				"box" : {
					"id" : "obj-r-aberration",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 520.0, 60.0, 130.0, 22.0 ],
					"text" : "r ---tv_audio_aberration"
				}
			},
			{
				"box" : {
					"id" : "obj-r-bloom",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 660.0, 60.0, 110.0, 22.0 ],
					"text" : "r ---tv_audio_bloom"
				}
			},
			{
				"box" : {
					"id" : "obj-r-solarize",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 780.0, 60.0, 120.0, 22.0 ],
					"text" : "r ---tv_audio_solarize"
				}
			},
			{
				"box" : {
					"id" : "obj-r-crush",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 400.0, 90.0, 110.0, 22.0 ],
					"text" : "r ---tv_audio_crush"
				}
			},
			{
				"box" : {
					"id" : "obj-r-shutter",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 520.0, 90.0, 115.0, 22.0 ],
					"text" : "r ---tv_audio_shutter"
				}
			},
			{
				"box" : {
					"id" : "obj-r-ghosting",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 660.0, 90.0, 120.0, 22.0 ],
					"text" : "r ---tv_audio_ghosting"
				}
			},
			{
				"box" : {
					"id" : "obj-r-smear",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 780.0, 90.0, 110.0, 22.0 ],
					"text" : "r ---tv_audio_smear"
				}
			},
			{
				"box" : {
					"id" : "obj-mosaic-line",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 400.0, 130.0, 55.0, 22.0 ],
					"text" : "line~ 1 20"
				}
			},
			{
				"box" : {
					"id" : "obj-aberration-line",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 520.0, 130.0, 55.0, 22.0 ],
					"text" : "line~ 0 20"
				}
			},
			{
				"box" : {
					"id" : "obj-bloom-line",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 660.0, 130.0, 55.0, 22.0 ],
					"text" : "line~ 1 20"
				}
			},
			{
				"box" : {
					"id" : "obj-solarize-line",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 780.0, 130.0, 55.0, 22.0 ],
					"text" : "line~ 0 20"
				}
			},
			{
				"box" : {
					"id" : "obj-crush-line",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 400.0, 160.0, 60.0, 22.0 ],
					"text" : "line~ 24 20"
				}
			},
			{
				"box" : {
					"id" : "obj-shutter-line",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 520.0, 160.0, 55.0, 22.0 ],
					"text" : "line~ 0 20"
				}
			},
			{
				"box" : {
					"id" : "obj-ghosting-line",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 660.0, 160.0, 55.0, 22.0 ],
					"text" : "line~ 0 20"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-line",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 780.0, 160.0, 55.0, 22.0 ],
					"text" : "line~ 0 20"
				}
			},
			{
				"box" : {
					"id" : "obj-label-mosaic",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 70.0, 150.0, 20.0 ],
					"text" : "Stage 1: Mosaic (degrade~)"
				}
			},
			{
				"box" : {
					"id" : "obj-degrade-l",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 100.0, 70.0, 22.0 ],
					"text" : "degrade~ 1"
				}
			},
			{
				"box" : {
					"id" : "obj-degrade-r",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 100.0, 70.0, 22.0 ],
					"text" : "degrade~ 1"
				}
			},
			{
				"box" : {
					"id" : "obj-label-aberr",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 140.0, 180.0, 20.0 ],
					"text" : "Stage 2: Aberration (delay spread)"
				}
			},
			{
				"box" : {
					"id" : "obj-aberr-tapin-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "tapconnect" ],
					"patching_rect" : [ 50.0, 170.0, 80.0, 22.0 ],
					"text" : "tapin~ 100"
				}
			},
			{
				"box" : {
					"id" : "obj-aberr-tapin-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "tapconnect" ],
					"patching_rect" : [ 150.0, 170.0, 80.0, 22.0 ],
					"text" : "tapin~ 100"
				}
			},
			{
				"box" : {
					"id" : "obj-aberr-tap-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 200.0, 65.0, 22.0 ],
					"text" : "tapout~ 0"
				}
			},
			{
				"box" : {
					"id" : "obj-aberr-tap-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 200.0, 65.0, 22.0 ],
					"text" : "tapout~ 0"
				}
			},
			{
				"box" : {
					"id" : "obj-aberr-neg",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 250.0, 200.0, 40.0, 22.0 ],
					"text" : "*~ -1"
				}
			},
			{
				"box" : {
					"id" : "obj-label-bloom",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 240.0, 180.0, 20.0 ],
					"text" : "Stage 3: Bloom (soft saturation)"
				}
			},
			{
				"box" : {
					"id" : "obj-bloom-drive-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 270.0, 30.0, 22.0 ],
					"text" : "*~"
				}
			},
			{
				"box" : {
					"id" : "obj-bloom-drive-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 270.0, 30.0, 22.0 ],
					"text" : "*~"
				}
			},
			{
				"box" : {
					"id" : "obj-bloom-sat-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 300.0, 40.0, 22.0 ],
					"text" : "tanh~"
				}
			},
			{
				"box" : {
					"id" : "obj-bloom-sat-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 300.0, 40.0, 22.0 ],
					"text" : "tanh~"
				}
			},
			{
				"box" : {
					"id" : "obj-label-solar",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 340.0, 180.0, 20.0 ],
					"text" : "Stage 4: Solarize (ring mod)"
				}
			},
			{
				"box" : {
					"id" : "obj-solar-freq",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 370.0, 120.0, 22.0 ],
					"text" : "scale~ 0. 1. 50. 2000."
				}
			},
			{
				"box" : {
					"id" : "obj-solar-osc",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 400.0, 50.0, 22.0 ],
					"text" : "cycle~"
				}
			},
			{
				"box" : {
					"id" : "obj-solar-wet-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 400.0, 30.0, 22.0 ],
					"text" : "*~"
				}
			},
			{
				"box" : {
					"id" : "obj-solar-wet-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 400.0, 30.0, 22.0 ],
					"text" : "*~"
				}
			},
			{
				"box" : {
					"id" : "obj-solar-inv",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 250.0, 430.0, 45.0, 22.0 ],
					"text" : "!-~ 1."
				}
			},
			{
				"box" : {
					"id" : "obj-solar-dry-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 430.0, 30.0, 22.0 ],
					"text" : "*~"
				}
			},
			{
				"box" : {
					"id" : "obj-solar-dry-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 430.0, 30.0, 22.0 ],
					"text" : "*~"
				}
			},
			{
				"box" : {
					"id" : "obj-solar-mix-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 460.0, 30.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-solar-mix-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 460.0, 30.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-label-crush",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 500.0, 180.0, 20.0 ],
					"text" : "Stage 5: Crush (bit reduction)"
				}
			},
			{
				"box" : {
					"id" : "obj-crush-l",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 530.0, 75.0, 22.0 ],
					"text" : "degrade~ 1"
				}
			},
			{
				"box" : {
					"id" : "obj-crush-r",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 530.0, 75.0, 22.0 ],
					"text" : "degrade~ 1"
				}
			},
			{
				"box" : {
					"id" : "obj-label-shutter",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 570.0, 180.0, 20.0 ],
					"text" : "Stage 6: Shutter (tremolo)"
				}
			},
			{
				"box" : {
					"id" : "obj-shutter-rate",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 570.0, 110.0, 22.0 ],
					"text" : "scale~ 0. 20. 1. 30."
				}
			},
			{
				"box" : {
					"id" : "obj-shutter-lfo",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 600.0, 80.0, 22.0 ],
					"text" : "rect~ 1"
				}
			},
			{
				"box" : {
					"id" : "obj-shutter-bypass",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 630.0, 45.0, 22.0 ],
					"text" : "<~ 0.01"
				}
			},
			{
				"box" : {
					"id" : "obj-shutter-sel",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 660.0, 80.0, 22.0 ],
					"text" : "selector~ 2 1"
				}
			},
			{
				"box" : {
					"id" : "obj-shutter-one",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 350.0, 630.0, 40.0, 22.0 ],
					"text" : "sig~ 1"
				}
			},
			{
				"box" : {
					"id" : "obj-shutter-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 690.0, 30.0, 22.0 ],
					"text" : "*~"
				}
			},
			{
				"box" : {
					"id" : "obj-shutter-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 690.0, 30.0, 22.0 ],
					"text" : "*~"
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
					"patching_rect" : [ 50.0, 740.0, 30.0, 30.0 ]
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
					"patching_rect" : [ 150.0, 740.0, 30.0, 30.0 ]
				}
			}
		],
		"lines" : [
			{
				"patchline" : {
					"destination" : [ "obj-mosaic-line", 0 ],
					"source" : [ "obj-r-mosaic", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-aberration-line", 0 ],
					"source" : [ "obj-r-aberration", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-bloom-line", 0 ],
					"source" : [ "obj-r-bloom", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solarize-line", 0 ],
					"source" : [ "obj-r-solarize", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-crush-line", 0 ],
					"source" : [ "obj-r-crush", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-line", 0 ],
					"source" : [ "obj-r-shutter", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ghosting-line", 0 ],
					"source" : [ "obj-r-ghosting", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-line", 0 ],
					"source" : [ "obj-r-smear", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-degrade-l", 0 ],
					"source" : [ "obj-in-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-degrade-r", 0 ],
					"source" : [ "obj-in-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-degrade-l", 1 ],
					"order" : 1,
					"source" : [ "obj-mosaic-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-degrade-r", 1 ],
					"order" : 0,
					"source" : [ "obj-mosaic-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-aberr-tapin-l", 0 ],
					"source" : [ "obj-degrade-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-aberr-tapin-r", 0 ],
					"source" : [ "obj-degrade-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-aberr-tap-l", 0 ],
					"source" : [ "obj-aberr-tapin-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-aberr-tap-r", 0 ],
					"source" : [ "obj-aberr-tapin-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-aberr-tap-l", 1 ],
					"order" : 1,
					"source" : [ "obj-aberration-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-aberr-neg", 0 ],
					"order" : 0,
					"source" : [ "obj-aberration-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-aberr-tap-r", 1 ],
					"source" : [ "obj-aberr-neg", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-bloom-drive-l", 0 ],
					"source" : [ "obj-aberr-tap-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-bloom-drive-r", 0 ],
					"source" : [ "obj-aberr-tap-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-bloom-drive-l", 1 ],
					"order" : 1,
					"source" : [ "obj-bloom-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-bloom-drive-r", 1 ],
					"order" : 0,
					"source" : [ "obj-bloom-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-bloom-sat-l", 0 ],
					"source" : [ "obj-bloom-drive-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-bloom-sat-r", 0 ],
					"source" : [ "obj-bloom-drive-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solar-wet-l", 0 ],
					"order" : 1,
					"source" : [ "obj-bloom-sat-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solar-dry-l", 0 ],
					"order" : 0,
					"source" : [ "obj-bloom-sat-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solar-wet-r", 0 ],
					"order" : 1,
					"source" : [ "obj-bloom-sat-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solar-dry-r", 0 ],
					"order" : 0,
					"source" : [ "obj-bloom-sat-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solar-freq", 0 ],
					"order" : 0,
					"source" : [ "obj-solarize-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solar-inv", 0 ],
					"order" : 1,
					"source" : [ "obj-solarize-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solar-osc", 0 ],
					"source" : [ "obj-solar-freq", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solar-wet-l", 1 ],
					"order" : 1,
					"source" : [ "obj-solar-osc", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solar-wet-r", 1 ],
					"order" : 0,
					"source" : [ "obj-solar-osc", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solar-dry-l", 1 ],
					"order" : 1,
					"source" : [ "obj-solar-inv", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solar-dry-r", 1 ],
					"order" : 0,
					"source" : [ "obj-solar-inv", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solar-mix-l", 0 ],
					"source" : [ "obj-solar-wet-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solar-mix-r", 0 ],
					"source" : [ "obj-solar-wet-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solar-mix-l", 1 ],
					"source" : [ "obj-solar-dry-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solar-mix-r", 1 ],
					"source" : [ "obj-solar-dry-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-crush-l", 0 ],
					"source" : [ "obj-solar-mix-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-crush-r", 0 ],
					"source" : [ "obj-solar-mix-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-crush-l", 2 ],
					"order" : 1,
					"source" : [ "obj-crush-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-crush-r", 2 ],
					"order" : 0,
					"source" : [ "obj-crush-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-l", 0 ],
					"source" : [ "obj-crush-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-r", 0 ],
					"source" : [ "obj-crush-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-rate", 0 ],
					"order" : 0,
					"source" : [ "obj-shutter-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-bypass", 0 ],
					"order" : 1,
					"source" : [ "obj-shutter-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-lfo", 0 ],
					"source" : [ "obj-shutter-rate", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-sel", 2 ],
					"source" : [ "obj-shutter-lfo", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-sel", 0 ],
					"source" : [ "obj-shutter-bypass", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-sel", 1 ],
					"source" : [ "obj-shutter-one", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-l", 1 ],
					"order" : 1,
					"source" : [ "obj-shutter-sel", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-r", 1 ],
					"order" : 0,
					"source" : [ "obj-shutter-sel", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-out-l", 0 ],
					"source" : [ "obj-shutter-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-out-r", 0 ],
					"source" : [ "obj-shutter-r", 0 ]
				}
			}
		]
	}
}
