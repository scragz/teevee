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
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 350.0, 30.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-sum-l-2",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 380.0, 30.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-sum-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 400.0, 350.0, 30.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-sum-r-2",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 400.0, 380.0, 30.0, 22.0 ],
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
					"id" : "obj-solarize-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 600.0, 580.0, 110.0, 22.0 ],
					"text" : "scale 0. 1. 1. 0."
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
					"id" : "obj-shutter-check",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 600.0, 780.0, 40.0, 22.0 ],
					"text" : "< 0.01"
				}
			},
			{
				"box" : {
					"id" : "obj-shutter-sig",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 600.0, 810.0, 33.0, 22.0 ],
					"text" : "sig~"
				}
			},
			{
				"box" : {
					"id" : "obj-shutter-sum",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 840.0, 30.0, 22.0 ],
					"text" : "+~"
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
					"id" : "obj-section-ghosting",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 850.0, 250.0, 20.0 ],
					"text" : "=== STAGE 7: GHOSTING (SLAPBACK) ==="
				}
			},
			{
				"box" : {
					"id" : "obj-r-ghosting",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 300.0, 850.0, 130.0, 22.0 ],
					"text" : "r ---tv_param_ghosting"
				}
			},
			{
				"box" : {
					"id" : "obj-ghosting-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 880.0, 120.0, 22.0 ],
					"text" : "scale~ 0. 1. 0. 0.8"
				}
			},
			{
				"box" : {
					"id" : "obj-ghosting-tapin-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 890.0, 65.0, 22.0 ],
					"text" : "tapin~ 50"
				}
			},
			{
				"box" : {
					"id" : "obj-ghosting-tapin-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 890.0, 65.0, 22.0 ],
					"text" : "tapin~ 50"
				}
			},
			{
				"box" : {
					"id" : "obj-ghosting-tapout-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 920.0, 70.0, 22.0 ],
					"text" : "tapout~ 15"
				}
			},
			{
				"box" : {
					"id" : "obj-ghosting-tapout-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 920.0, 70.0, 22.0 ],
					"text" : "tapout~ 15"
				}
			},
			{
				"box" : {
					"id" : "obj-ghosting-fb-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 950.0, 30.0, 22.0 ],
					"text" : "*~"
				}
			},
			{
				"box" : {
					"id" : "obj-ghosting-fb-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 950.0, 30.0, 22.0 ],
					"text" : "*~"
				}
			},
			{
				"box" : {
					"id" : "obj-ghosting-dry-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 500.0, 890.0, 35.0, 22.0 ],
					"text" : "*~ 1."
				}
			},
			{
				"box" : {
					"id" : "obj-ghosting-dry-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 600.0, 890.0, 35.0, 22.0 ],
					"text" : "*~ 1."
				}
			},
			{
				"box" : {
					"id" : "obj-ghosting-sum-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 990.0, 30.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-ghosting-sum-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 990.0, 30.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-section-smear",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 1030.0, 250.0, 20.0 ],
					"text" : "=== STAGE 8: SMEAR (REVERB) ==="
				}
			},
			{
				"box" : {
					"id" : "obj-r-smear",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 300.0, 1030.0, 125.0, 22.0 ],
					"text" : "r ---tv_param_smear"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 1060.0, 120.0, 22.0 ],
					"text" : "scale~ 0. 1. 0. 0.7"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-tapin-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 1070.0, 75.0, 22.0 ],
					"text" : "tapin~ 5000"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-tapin-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 1070.0, 75.0, 22.0 ],
					"text" : "tapin~ 5000"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-tapout1-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 1100.0, 80.0, 22.0 ],
					"text" : "tapout~ 1397"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-tapout2-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 140.0, 1100.0, 80.0, 22.0 ],
					"text" : "tapout~ 2053"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-tapout3-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 230.0, 1100.0, 80.0, 22.0 ],
					"text" : "tapout~ 3217"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-tapout4-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 320.0, 1100.0, 80.0, 22.0 ],
					"text" : "tapout~ 4441"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-tapout1-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 1150.0, 80.0, 22.0 ],
					"text" : "tapout~ 1511"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-tapout2-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 240.0, 1150.0, 80.0, 22.0 ],
					"text" : "tapout~ 2239"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-tapout3-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 330.0, 1150.0, 80.0, 22.0 ],
					"text" : "tapout~ 3491"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-tapout4-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 420.0, 1150.0, 80.0, 22.0 ],
					"text" : "tapout~ 4787"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-decay1-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 1180.0, 50.0, 22.0 ],
					"text" : "*~ 0.84"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-decay2-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 140.0, 1180.0, 50.0, 22.0 ],
					"text" : "*~ 0.79"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-decay3-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 230.0, 1180.0, 50.0, 22.0 ],
					"text" : "*~ 0.71"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-decay4-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 320.0, 1180.0, 50.0, 22.0 ],
					"text" : "*~ 0.63"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-decay1-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 1230.0, 50.0, 22.0 ],
					"text" : "*~ 0.82"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-decay2-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 240.0, 1230.0, 50.0, 22.0 ],
					"text" : "*~ 0.76"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-decay3-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 330.0, 1230.0, 50.0, 22.0 ],
					"text" : "*~ 0.68"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-decay4-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 420.0, 1230.0, 50.0, 22.0 ],
					"text" : "*~ 0.61"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-sum1-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 1220.0, 30.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-sum2-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 1250.0, 30.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-sum-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 1280.0, 30.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-sum1-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 1220.0, 30.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-sum2-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 1250.0, 30.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-sum-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 1280.0, 30.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-fb-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 1290.0, 30.0, 22.0 ],
					"text" : "*~"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-fb-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 1290.0, 30.0, 22.0 ],
					"text" : "*~"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-dry-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 500.0, 1070.0, 35.0, 22.0 ],
					"text" : "*~ 1."
				}
			},
			{
				"box" : {
					"id" : "obj-smear-dry-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 600.0, 1070.0, 35.0, 22.0 ],
					"text" : "*~ 1."
				}
			},
			{
				"box" : {
					"id" : "obj-smear-mix-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 1330.0, 30.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-mix-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 1330.0, 30.0, 22.0 ],
					"text" : "+~"
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
					"source" : [ "obj-svf-l", 1 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-tapin-l", 0 ],
					"source" : [ "obj-svf-l", 2 ]
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
					"destination" : [ "obj-sum-l", 0 ],
					"source" : [ "obj-svf-l", 1 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-sum-l", 0 ],
					"source" : [ "obj-svf-l", 2 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-tapin-r", 0 ],
					"source" : [ "obj-svf-r", 1 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-tapin-r", 0 ],
					"source" : [ "obj-svf-r", 2 ]
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
					"destination" : [ "obj-sum-r", 0 ],
					"source" : [ "obj-svf-r", 1 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-sum-r", 0 ],
					"source" : [ "obj-svf-r", 2 ]
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
					"destination" : [ "obj-sum-l-2", 0 ],
					"source" : [ "obj-sum-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-sum-l-2", 1 ],
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
					"destination" : [ "obj-sum-r-2", 0 ],
					"source" : [ "obj-sum-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-sum-r-2", 1 ],
					"source" : [ "obj-tapout-high-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-bloom-drive-l", 0 ],
					"source" : [ "obj-sum-l-2", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-bloom-drive-r", 0 ],
					"source" : [ "obj-sum-r-2", 0 ]
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
					"destination" : [ "obj-shutter-sum", 0 ],
					"source" : [ "obj-shutter-square", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-gate-l", 1 ],
					"order" : 1,
					"source" : [ "obj-shutter-sum", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-gate-r", 1 ],
					"order" : 0,
					"source" : [ "obj-shutter-sum", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ghosting-tapin-l", 0 ],
					"order" : 1,
					"source" : [ "obj-shutter-gate-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ghosting-dry-l", 0 ],
					"order" : 0,
					"source" : [ "obj-shutter-gate-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ghosting-tapin-r", 0 ],
					"order" : 1,
					"source" : [ "obj-shutter-gate-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ghosting-dry-r", 0 ],
					"order" : 0,
					"source" : [ "obj-shutter-gate-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ghosting-scale", 0 ],
					"source" : [ "obj-r-ghosting", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ghosting-tapout-l", 0 ],
					"source" : [ "obj-ghosting-tapin-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ghosting-tapout-r", 0 ],
					"source" : [ "obj-ghosting-tapin-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ghosting-fb-l", 0 ],
					"source" : [ "obj-ghosting-tapout-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ghosting-fb-r", 0 ],
					"source" : [ "obj-ghosting-tapout-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ghosting-fb-l", 1 ],
					"order" : 1,
					"source" : [ "obj-ghosting-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ghosting-fb-r", 1 ],
					"order" : 0,
					"source" : [ "obj-ghosting-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ghosting-tapin-l", 0 ],
					"source" : [ "obj-ghosting-fb-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ghosting-tapin-r", 0 ],
					"source" : [ "obj-ghosting-fb-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ghosting-sum-l", 0 ],
					"source" : [ "obj-ghosting-dry-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ghosting-sum-l", 1 ],
					"source" : [ "obj-ghosting-tapout-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ghosting-sum-r", 0 ],
					"source" : [ "obj-ghosting-dry-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-ghosting-sum-r", 1 ],
					"source" : [ "obj-ghosting-tapout-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-tapin-l", 0 ],
					"order" : 1,
					"source" : [ "obj-ghosting-sum-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-dry-l", 0 ],
					"order" : 0,
					"source" : [ "obj-ghosting-sum-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-tapin-r", 0 ],
					"order" : 1,
					"source" : [ "obj-ghosting-sum-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-dry-r", 0 ],
					"order" : 0,
					"source" : [ "obj-ghosting-sum-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-scale", 0 ],
					"source" : [ "obj-r-smear", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-tapout1-l", 0 ],
					"order" : 3,
					"source" : [ "obj-smear-tapin-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-tapout2-l", 0 ],
					"order" : 2,
					"source" : [ "obj-smear-tapin-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-tapout3-l", 0 ],
					"order" : 1,
					"source" : [ "obj-smear-tapin-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-tapout4-l", 0 ],
					"order" : 0,
					"source" : [ "obj-smear-tapin-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-tapout1-r", 0 ],
					"order" : 3,
					"source" : [ "obj-smear-tapin-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-tapout2-r", 0 ],
					"order" : 2,
					"source" : [ "obj-smear-tapin-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-tapout3-r", 0 ],
					"order" : 1,
					"source" : [ "obj-smear-tapin-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-tapout4-r", 0 ],
					"order" : 0,
					"source" : [ "obj-smear-tapin-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-decay1-l", 0 ],
					"source" : [ "obj-smear-tapout1-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-decay2-l", 0 ],
					"source" : [ "obj-smear-tapout2-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-decay3-l", 0 ],
					"source" : [ "obj-smear-tapout3-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-decay4-l", 0 ],
					"source" : [ "obj-smear-tapout4-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-decay1-r", 0 ],
					"source" : [ "obj-smear-tapout1-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-decay2-r", 0 ],
					"source" : [ "obj-smear-tapout2-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-decay3-r", 0 ],
					"source" : [ "obj-smear-tapout3-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-decay4-r", 0 ],
					"source" : [ "obj-smear-tapout4-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-sum1-l", 0 ],
					"source" : [ "obj-smear-decay1-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-sum1-l", 1 ],
					"source" : [ "obj-smear-decay2-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-sum2-l", 0 ],
					"source" : [ "obj-smear-decay3-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-sum2-l", 1 ],
					"source" : [ "obj-smear-decay4-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-sum-l", 0 ],
					"source" : [ "obj-smear-sum1-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-sum-l", 1 ],
					"source" : [ "obj-smear-sum2-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-sum1-r", 0 ],
					"source" : [ "obj-smear-decay1-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-sum1-r", 1 ],
					"source" : [ "obj-smear-decay2-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-sum2-r", 0 ],
					"source" : [ "obj-smear-decay3-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-sum2-r", 1 ],
					"source" : [ "obj-smear-decay4-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-sum-r", 0 ],
					"source" : [ "obj-smear-sum1-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-sum-r", 1 ],
					"source" : [ "obj-smear-sum2-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-fb-l", 0 ],
					"source" : [ "obj-smear-sum-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-fb-r", 0 ],
					"source" : [ "obj-smear-sum-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-fb-l", 1 ],
					"order" : 1,
					"source" : [ "obj-smear-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-fb-r", 1 ],
					"order" : 0,
					"source" : [ "obj-smear-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-tapin-l", 0 ],
					"source" : [ "obj-smear-fb-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-tapin-r", 0 ],
					"source" : [ "obj-smear-fb-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-mix-l", 0 ],
					"source" : [ "obj-smear-dry-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-mix-l", 1 ],
					"source" : [ "obj-smear-sum-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-mix-r", 0 ],
					"source" : [ "obj-smear-dry-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-smear-mix-r", 1 ],
					"source" : [ "obj-smear-sum-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-out-l", 0 ],
					"source" : [ "obj-smear-mix-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-out-r", 0 ],
					"source" : [ "obj-smear-mix-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solarize-scale", 0 ],
					"source" : [ "obj-r-solarize", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solarize-l", 2 ],
					"source" : [ "obj-solarize-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-solarize-r", 2 ],
					"source" : [ "obj-solarize-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-check", 0 ],
					"source" : [ "obj-r-shutter", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-sig", 0 ],
					"source" : [ "obj-shutter-check", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-shutter-sum", 1 ],
					"source" : [ "obj-shutter-sig", 0 ]
				}
			}
		]
	}
}
