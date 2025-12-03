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
		"rect" : [ 100.0, 100.0, 1400.0, 900.0 ],
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
		"description" : "tv.fx - Audio artifacts engine (Phase 2)",
		"digest" : "Serial chain of MSP objects for texture and space effects",
		"tags" : "teevee, audio, fx, effects, distortion, reverb",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [
			{
				"box" : {
					"comment" : "Audio Left In",
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
					"comment" : "Audio Right In",
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
					"comment" : "Audio Left Out",
					"id" : "obj-out-l",
					"index" : 1,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 850.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "Audio Right Out",
					"id" : "obj-out-r",
					"index" : 2,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 150.0, 850.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 300.0, 30.0, 400.0, 20.0 ],
					"text" : "tv.fx - Audio Artifacts Engine (Phase 2: First 6 Effects)"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage1",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 80.0, 350.0, 20.0 ],
					"text" : "=== STAGE 1: MOSAIC (Sample Rate Reduction) ==="
				}
			},
			{
				"box" : {
					"id" : "obj-r-mosaic",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 600.0, 80.0, 120.0, 22.0 ],
					"text" : "r ---tv_param_mosaic"
				}
			},
			{
				"box" : {
					"id" : "obj-mosaic-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 600.0, 110.0, 115.0, 22.0 ],
					"text" : "scale 0. 1. 1. 0.05"
				}
			},
			{
				"box" : {
					"id" : "obj-mosaic-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 140.0, 100.0, 22.0 ],
					"text" : "degrade~ 2 1."
				}
			},
			{
				"box" : {
					"id" : "obj-mosaic-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 140.0, 100.0, 22.0 ],
					"text" : "degrade~ 2 1."
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage2",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 180.0, 450.0, 20.0 ],
					"text" : "=== STAGE 2: ABERRATION (3-Band Split + Delays on Mid/High) ==="
				}
			},
			{
				"box" : {
					"id" : "obj-r-aberration",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 800.0, 180.0, 140.0, 22.0 ],
					"text" : "r ---tv_param_aberration"
				}
			},
			{
				"box" : {
					"id" : "obj-aberration-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 800.0, 210.0, 115.0, 22.0 ],
					"text" : "scale 0. 1. 0. 40."
				}
			},
			{
				"box" : {
					"id" : "obj-svf-l",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 4,
					"outlettype" : [ "signal", "signal", "signal", "signal" ],
					"patching_rect" : [ 50.0, 240.0, 100.0, 22.0 ],
					"text" : "svf~ 250 0.7"
				}
			},
			{
				"box" : {
					"id" : "obj-svf-r",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 4,
					"outlettype" : [ "signal", "signal", "signal", "signal" ],
					"patching_rect" : [ 400.0, 240.0, 100.0, 22.0 ],
					"text" : "svf~ 250 0.7"
				}
			},
			{
				"box" : {
					"id" : "obj-tapin-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "tapconnect" ],
					"patching_rect" : [ 50.0, 280.0, 90.0, 22.0 ],
					"text" : "tapin~ 50"
				}
			},
			{
				"box" : {
					"id" : "obj-tapin-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "tapconnect" ],
					"patching_rect" : [ 400.0, 280.0, 90.0, 22.0 ],
					"text" : "tapin~ 50"
				}
			},
			{
				"box" : {
					"id" : "obj-tapout-mid-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 100.0, 310.0, 70.0, 22.0 ],
					"text" : "tapout~ 20"
				}
			},
			{
				"box" : {
					"id" : "obj-tapout-high-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 310.0, 70.0, 22.0 ],
					"text" : "tapout~ 40"
				}
			},
			{
				"box" : {
					"id" : "obj-tapout-mid-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 450.0, 310.0, 70.0, 22.0 ],
					"text" : "tapout~ 20"
				}
			},
			{
				"box" : {
					"id" : "obj-tapout-high-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 500.0, 310.0, 70.0, 22.0 ],
					"text" : "tapout~ 40"
				}
			},
			{
				"box" : {
					"id" : "obj-sum-l",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 350.0, 120.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-sum-r",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 400.0, 350.0, 120.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage3",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 390.0, 400.0, 20.0 ],
					"text" : "=== STAGE 3: BLOOM (Saturation with Gain Compensation) ==="
				}
			},
			{
				"box" : {
					"id" : "obj-r-bloom",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 800.0, 390.0, 115.0, 22.0 ],
					"text" : "r ---tv_param_bloom"
				}
			},
			{
				"box" : {
					"id" : "obj-bloom-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 800.0, 420.0, 105.0, 22.0 ],
					"text" : "scale 0. 1. 1. 8."
				}
			},
			{
				"box" : {
					"id" : "obj-bloom-drive-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 450.0, 40.0, 22.0 ],
					"text" : "*~ 1."
				}
			},
			{
				"box" : {
					"id" : "obj-bloom-drive-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 450.0, 40.0, 22.0 ],
					"text" : "*~ 1."
				}
			},
			{
				"box" : {
					"id" : "obj-bloom-tanh-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 480.0, 45.0, 22.0 ],
					"text" : "tanh~"
				}
			},
			{
				"box" : {
					"id" : "obj-bloom-tanh-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 480.0, 45.0, 22.0 ],
					"text" : "tanh~"
				}
			},
			{
				"box" : {
					"id" : "obj-bloom-comp-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 510.0, 50.0, 22.0 ],
					"text" : "*~ 0.5"
				}
			},
			{
				"box" : {
					"id" : "obj-bloom-comp-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 510.0, 50.0, 22.0 ],
					"text" : "*~ 0.5"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage4",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 550.0, 350.0, 20.0 ],
					"text" : "=== STAGE 4: SOLARIZE (Wavefolding) ==="
				}
			},
			{
				"box" : {
					"id" : "obj-r-solarize",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 600.0, 550.0, 125.0, 22.0 ],
					"text" : "r ---tv_param_solarize"
				}
			},
			{
				"box" : {
					"id" : "obj-solarize-l",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 580.0, 80.0, 22.0 ],
					"text" : "pong~ -1. 1."
				}
			},
			{
				"box" : {
					"id" : "obj-solarize-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 580.0, 80.0, 22.0 ],
					"text" : "pong~ -1. 1."
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage5",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 620.0, 350.0, 20.0 ],
					"text" : "=== STAGE 5: CRUSH (Bit Depth Reduction) ==="
				}
			},
			{
				"box" : {
					"id" : "obj-r-crush",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 600.0, 620.0, 115.0, 22.0 ],
					"text" : "r ---tv_param_crush"
				}
			},
			{
				"box" : {
					"id" : "obj-crush-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 600.0, 650.0, 110.0, 22.0 ],
					"text" : "scale 0. 1. 24. 4."
				}
			},
			{
				"box" : {
					"id" : "obj-crush-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 680.0, 100.0, 22.0 ],
					"text" : "degrade~ 1 24."
				}
			},
			{
				"box" : {
					"id" : "obj-crush-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 680.0, 100.0, 22.0 ],
					"text" : "degrade~ 1 24."
				}
			},
			{
				"box" : {
					"id" : "obj-comment-stage6",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 720.0, 350.0, 20.0 ],
					"text" : "=== STAGE 6: SHUTTER (Square Wave Gating) ==="
				}
			},
			{
				"box" : {
					"id" : "obj-r-shutter",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 600.0, 720.0, 120.0, 22.0 ],
					"text" : "r ---tv_param_shutter"
				}
			},
			{
				"box" : {
					"id" : "obj-shutter-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 600.0, 750.0, 110.0, 22.0 ],
					"text" : "scale 0. 1. 0. 20."
				}
			},
			{
				"box" : {
					"id" : "obj-shutter-phasor",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 780.0, 60.0, 22.0 ],
					"text" : "phasor~ 0"
				}
			},
			{
				"box" : {
					"id" : "obj-shutter-square",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 810.0, 50.0, 22.0 ],
					"text" : ">~ 0.5"
				}
			},
			{
				"box" : {
					"id" : "obj-shutter-gate-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 810.0, 30.0, 22.0 ],
					"text" : "*~"
				}
			},
			{
				"box" : {
					"id" : "obj-shutter-gate-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 810.0, 30.0, 22.0 ],
					"text" : "*~"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-todo",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 800.0, 30.0, 500.0, 20.0 ],
					"text" : "TODO: STAGE 7 (GHOSTING) & STAGE 8 (SMEAR) - Need tapin~/tapout~ reverb",
					"textcolor" : [ 1.0, 0.5, 0.0, 1.0 ]
				}
			}
		],
		"lines" : [
			{
				"patchline" : {
					"destination" : [ "obj-mosaic-l", 0 ],
					"source" : [ "obj-in-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-mosaic-r", 0 ],
					"source" : [ "obj-in-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-mosaic-scale", 0 ],
					"source" : [ "obj-r-mosaic", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-mosaic-l", 1 ],
					"order" : 1,
					"source" : [ "obj-mosaic-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-mosaic-r", 1 ],
					"order" : 0,
					"source" : [ "obj-mosaic-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-svf-l", 0 ],
					"source" : [ "obj-mosaic-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-svf-r", 0 ],
					"source" : [ "obj-mosaic-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-aberration-scale", 0 ],
					"source" : [ "obj-r-aberration", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-tapin-l", 0 ],
					"source" : [ "obj-svf-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-sum-l", 0 ],
					"source" : [ "obj-svf-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-tapin-r", 0 ],
					"source" : [ "obj-svf-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-sum-r", 0 ],
					"source" : [ "obj-svf-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-tapout-mid-l", 0 ],
					"order" : 1,
					"source" : [ "obj-tapin-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-tapout-high-l", 0 ],
					"order" : 0,
					"source" : [ "obj-tapin-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-tapout-mid-r", 0 ],
					"order" : 1,
					"source" : [ "obj-tapin-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-tapout-high-r", 0 ],
					"order" : 0,
					"source" : [ "obj-tapin-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-sum-l", 1 ],
					"source" : [ "obj-tapout-mid-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-sum-l", 2 ],
					"source" : [ "obj-tapout-high-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-sum-r", 1 ],
					"source" : [ "obj-tapout-mid-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-sum-r", 2 ],
					"source" : [ "obj-tapout-high-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-bloom-drive-l", 0 ],
					"source" : [ "obj-sum-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-bloom-drive-r", 0 ],
					"source" : [ "obj-sum-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-bloom-scale", 0 ],
					"source" : [ "obj-r-bloom", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-bloom-drive-l", 1 ],
					"order" : 1,
					"source" : [ "obj-bloom-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-bloom-drive-r", 1 ],
					"order" : 0,
					"source" : [ "obj-bloom-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-bloom-tanh-l", 0 ],
					"source" : [ "obj-bloom-drive-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-bloom-tanh-r", 0 ],
					"source" : [ "obj-bloom-drive-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-bloom-comp-l", 0 ],
					"source" : [ "obj-bloom-tanh-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-bloom-comp-r", 0 ],
					"source" : [ "obj-bloom-tanh-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solarize-l", 0 ],
					"source" : [ "obj-bloom-comp-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solarize-r", 0 ],
					"source" : [ "obj-bloom-comp-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-crush-l", 0 ],
					"source" : [ "obj-solarize-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-crush-r", 0 ],
					"source" : [ "obj-solarize-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-crush-scale", 0 ],
					"source" : [ "obj-r-crush", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-crush-l", 1 ],
					"order" : 1,
					"source" : [ "obj-crush-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-crush-r", 1 ],
					"order" : 0,
					"source" : [ "obj-crush-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-gate-l", 0 ],
					"source" : [ "obj-crush-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-gate-r", 0 ],
					"source" : [ "obj-crush-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-scale", 0 ],
					"source" : [ "obj-r-shutter", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-phasor", 0 ],
					"source" : [ "obj-shutter-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-square", 0 ],
					"source" : [ "obj-shutter-phasor", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-gate-l", 1 ],
					"order" : 1,
					"source" : [ "obj-shutter-square", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-gate-r", 1 ],
					"order" : 0,
					"source" : [ "obj-shutter-square", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-out-l", 0 ],
					"source" : [ "obj-shutter-gate-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-out-r", 0 ],
					"source" : [ "obj-shutter-gate-r", 0 ]
				}
			}
		]
	}
}
