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
		"rect" : [ 100.0, 100.0, 1200.0, 850.0 ],
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
		"description" : "tv.audio v7.3 - Audio Engine with delay~/gizmo~/freqshift~/lores~",
		"digest" : "Pure MSP audio processing with variable delay, pitch, freqshift, filter",
		"tags" : "teevee, audio, dsp, delay, pitch, freqshift",
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
					"patching_rect" : [ 50.0, 650.0, 30.0, 30.0 ]
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
					"patching_rect" : [ 150.0, 650.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 400.0, 30.0, 400.0, 20.0 ],
					"text" : "tv.audio v7.3 - Audio Engine with delay~/gizmo~/freqshift~/lores~"
				}
			},
			{
				"box" : {
					"id" : "obj-section-delay",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 80.0, 300.0, 20.0 ],
					"text" : "=== STAGE 1: DELAY (SCROLL) ==="
				}
			},
			{
				"box" : {
					"id" : "obj-r-scroll",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 400.0, 110.0, 120.0, 22.0 ],
					"text" : "r ---tv_audio_scroll"
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-line",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 400.0, 140.0, 65.0, 22.0 ],
					"text" : "line~ 0 20"
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 400.0, 170.0, 120.0, 22.0 ],
					"text" : "scale~ 0. 1. 0. 1000."
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-samps-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 170.0, 70.0, 22.0 ],
					"text" : "mstosamps~"
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-samps-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 200.0, 70.0, 22.0 ],
					"text" : "mstosamps~"
				}
			},
			{
				"box" : {
					"id" : "obj-delay-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 200.0, 95.0, 22.0 ],
					"text" : "delay~ 44100 1"
				}
			},
			{
				"box" : {
					"id" : "obj-delay-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 200.0, 95.0, 22.0 ],
					"text" : "delay~ 44100 1"
				}
			},
			{
				"box" : {
					"id" : "obj-section-pitch",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 250.0, 300.0, 20.0 ],
					"text" : "=== STAGE 2: PITCH SHIFT (ZOOM) ==="
				}
			},
			{
				"box" : {
					"id" : "obj-r-zoom",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 400.0, 280.0, 115.0, 22.0 ],
					"text" : "r ---tv_audio_zoom"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-line",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 400.0, 310.0, 65.0, 22.0 ],
					"text" : "line~ 1 20"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 400.0, 340.0, 115.0, 22.0 ],
					"text" : "scale~ 0. 1. 0.5 2."
				}
			},
			{
				"box" : {
					"id" : "obj-gizmo-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 370.0, 55.0, 22.0 ],
					"text" : "gizmo~ 1"
				}
			},
			{
				"box" : {
					"id" : "obj-gizmo-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 370.0, 55.0, 22.0 ],
					"text" : "gizmo~ 1"
				}
			},
			{
				"box" : {
					"id" : "obj-section-freqshift",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 420.0, 300.0, 20.0 ],
					"text" : "=== STAGE 3: FREQ SHIFT (ROTATE) ==="
				}
			},
			{
				"box" : {
					"id" : "obj-r-rotate",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 400.0, 450.0, 120.0, 22.0 ],
					"text" : "r ---tv_audio_rotate"
				}
			},
			{
				"box" : {
					"id" : "obj-rotate-line",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 400.0, 480.0, 65.0, 22.0 ],
					"text" : "line~ 0 20"
				}
			},
			{
				"box" : {
					"id" : "obj-rotate-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 400.0, 510.0, 130.0, 22.0 ],
					"text" : "scale~ 0. 1. -500. 500."
				}
			},
			{
				"box" : {
					"id" : "obj-freqshift-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 50.0, 480.0, 70.0, 22.0 ],
					"text" : "freqshift~"
				}
			},
			{
				"box" : {
					"id" : "obj-freqshift-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 150.0, 480.0, 70.0, 22.0 ],
					"text" : "freqshift~"
				}
			},
			{
				"box" : {
					"id" : "obj-section-filter",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 530.0, 300.0, 20.0 ],
					"text" : "=== STAGE 4: LOWPASS FILTER (SMEAR) ==="
				}
			},
			{
				"box" : {
					"id" : "obj-r-smear",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 400.0, 560.0, 115.0, 22.0 ],
					"text" : "r ---tv_audio_smear"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-line",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 400.0, 590.0, 65.0, 22.0 ],
					"text" : "line~ 0 20"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 400.0, 620.0, 140.0, 22.0 ],
					"text" : "scale~ 0. 1. 20000. 200."
				}
			},
			{
				"box" : {
					"id" : "obj-lores-l",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 590.0, 95.0, 22.0 ],
					"text" : "lores~ 20000 0.5"
				}
			},
			{
				"box" : {
					"id" : "obj-lores-r",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 590.0, 95.0, 22.0 ],
					"text" : "lores~ 20000 0.5"
				}
			}
		],
		"lines" : [
			{
				"patchline" : {
					"destination" : [ "obj-delay-l", 0 ],
					"source" : [ "obj-in-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-delay-r", 0 ],
					"source" : [ "obj-in-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scroll-line", 0 ],
					"source" : [ "obj-r-scroll", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scroll-scale", 0 ],
					"source" : [ "obj-scroll-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scroll-samps-l", 0 ],
					"order" : 1,
					"source" : [ "obj-scroll-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scroll-samps-r", 0 ],
					"order" : 0,
					"source" : [ "obj-scroll-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-delay-l", 1 ],
					"source" : [ "obj-scroll-samps-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-delay-r", 1 ],
					"source" : [ "obj-scroll-samps-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-gizmo-l", 0 ],
					"source" : [ "obj-delay-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-gizmo-r", 0 ],
					"source" : [ "obj-delay-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-line", 0 ],
					"source" : [ "obj-r-zoom", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-scale", 0 ],
					"source" : [ "obj-zoom-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-gizmo-l", 1 ],
					"order" : 1,
					"source" : [ "obj-zoom-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-gizmo-r", 1 ],
					"order" : 0,
					"source" : [ "obj-zoom-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-freqshift-l", 0 ],
					"source" : [ "obj-gizmo-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-freqshift-r", 0 ],
					"source" : [ "obj-gizmo-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rotate-line", 0 ],
					"source" : [ "obj-r-rotate", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rotate-scale", 0 ],
					"source" : [ "obj-rotate-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-freqshift-l", 1 ],
					"order" : 1,
					"source" : [ "obj-rotate-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-freqshift-r", 1 ],
					"order" : 0,
					"source" : [ "obj-rotate-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-lores-l", 0 ],
					"source" : [ "obj-freqshift-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-lores-r", 0 ],
					"source" : [ "obj-freqshift-r", 0 ]
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
					"destination" : [ "obj-smear-scale", 0 ],
					"source" : [ "obj-smear-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-lores-l", 1 ],
					"order" : 1,
					"source" : [ "obj-smear-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-lores-r", 1 ],
					"order" : 0,
					"source" : [ "obj-smear-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-out-l", 0 ],
					"source" : [ "obj-lores-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-out-r", 0 ],
					"source" : [ "obj-lores-r", 0 ]
				}
			}
		]
	}
}
