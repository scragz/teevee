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
		"rect" : [ 100.0, 100.0, 1000.0, 750.0 ],
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
		"description" : "tv.audio - Hi-Def Audio Engine (Path A)",
		"digest" : "Pure MSP audio processing with delay, pitch, freqshift, and reverb",
		"tags" : "teevee, audio, dsp, delay, pitch, freqshift, reverb",
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
					"patching_rect" : [ 50.0, 680.0, 30.0, 30.0 ]
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
					"patching_rect" : [ 150.0, 680.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 700.0, 30.0, 250.0, 20.0 ],
					"text" : "tv.audio - Hi-Def Audio Engine (Path A)"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-scroll",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 700.0, 60.0, 200.0, 20.0 ],
					"text" : "SCROLL → Delay (0-1500ms)"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-zoom",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 700.0, 80.0, 200.0, 20.0 ],
					"text" : "ZOOM → Pitch (0.25x - 4x)"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-rotate",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 700.0, 100.0, 200.0, 20.0 ],
					"text" : "ROTATE → FreqShift (-1000 to +1000Hz)"
				}
			},
			{
				"box" : {
					"id" : "obj-comment-smear",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 700.0, 120.0, 200.0, 20.0 ],
					"text" : "SMEAR → Reverb (0-100% wet)"
				}
			},
			{
				"box" : {
					"id" : "obj-r-scroll",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 400.0, 30.0, 120.0, 22.0 ],
					"text" : "r ---tv_audio_scroll"
				}
			},
			{
				"box" : {
					"id" : "obj-r-zoom",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 30.0, 115.0, 22.0 ],
					"text" : "r ---tv_audio_zoom"
				}
			},
			{
				"box" : {
					"id" : "obj-r-rotate",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 400.0, 60.0, 120.0, 22.0 ],
					"text" : "r ---tv_audio_rotate"
				}
			},
			{
				"box" : {
					"id" : "obj-r-smear",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 60.0, 115.0, 22.0 ],
					"text" : "r ---tv_audio_smear"
				}
			},
			{
				"box" : {
					"id" : "obj-r-freeze",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 600.0, 60.0, 120.0, 22.0 ],
					"text" : "r ---tv_audio_freeze"
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 400.0, 100.0, 120.0, 22.0 ],
					"text" : "scale 0. 1. 0. 1500."
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 500.0, 100.0, 115.0, 22.0 ],
					"text" : "scale 0. 1. 0.25 4."
				}
			},
			{
				"box" : {
					"id" : "obj-rotate-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 400.0, 130.0, 145.0, 22.0 ],
					"text" : "scale 0. 1. -1000. 1000."
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-line",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 400.0, 160.0, 60.0, 22.0 ],
					"text" : "line~ 0. 20"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-line",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 500.0, 160.0, 60.0, 22.0 ],
					"text" : "line~ 1. 20"
				}
			},
			{
				"box" : {
					"id" : "obj-rotate-line",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 400.0, 190.0, 60.0, 22.0 ],
					"text" : "line~ 0. 20"
				}
			},
			{
				"box" : {
					"id" : "obj-smear-line",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 500.0, 190.0, 60.0, 22.0 ],
					"text" : "line~ 0. 20"
				}
			},
			{
				"box" : {
					"id" : "obj-section-delay",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 80.0, 200.0, 20.0 ],
					"text" : "=== STAGE 1: DELAY (SCROLL) ==="
				}
			},
			{
				"box" : {
					"id" : "obj-tapin-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "tapconnect" ],
					"patching_rect" : [ 50.0, 110.0, 100.0, 22.0 ],
					"text" : "tapin~ 2000"
				}
			},
			{
				"box" : {
					"id" : "obj-tapin-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "tapconnect" ],
					"patching_rect" : [ 150.0, 110.0, 100.0, 22.0 ],
					"text" : "tapin~ 2000"
				}
			},
			{
				"box" : {
					"id" : "obj-tapout-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 150.0, 60.0, 22.0 ],
					"text" : "tapout~"
				}
			},
			{
				"box" : {
					"id" : "obj-tapout-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 150.0, 60.0, 22.0 ],
					"text" : "tapout~"
				}
			},
			{
				"box" : {
					"id" : "obj-section-pitch",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 200.0, 220.0, 20.0 ],
					"text" : "=== STAGE 2: VARISPEED (ZOOM) ==="
				}
			},
			{
				"box" : {
					"id" : "obj-buffer-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 50.0, 230.0, 180.0, 22.0 ],
					"text" : "buffer~ ---tv_pitch_l 500 1"
				}
			},
			{
				"box" : {
					"id" : "obj-buffer-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 50.0, 260.0, 180.0, 22.0 ],
					"text" : "buffer~ ---tv_pitch_r 500 1"
				}
			},
			{
				"box" : {
					"id" : "obj-poke-l",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 320.0, 100.0, 22.0 ],
					"text" : "poke~ ---tv_pitch_l"
				}
			},
			{
				"box" : {
					"id" : "obj-poke-r",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 0,
					"patching_rect" : [ 150.0, 320.0, 105.0, 22.0 ],
					"text" : "poke~ ---tv_pitch_r"
				}
			},
			{
				"box" : {
					"id" : "obj-write-phasor",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 280.0, 260.0, 75.0, 22.0 ],
					"text" : "phasor~ 86"
				}
			},
			{
				"box" : {
					"id" : "obj-write-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 280.0, 290.0, 130.0, 22.0 ],
					"text" : "scale~ 0. 1. 0 22050"
				}
			},
			{
				"box" : {
					"id" : "obj-read-phasor",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 280.0, 340.0, 56.0, 22.0 ],
					"text" : "phasor~"
				}
			},
			{
				"box" : {
					"id" : "obj-speed-calc",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 500.0, 220.0, 55.0, 22.0 ],
					"text" : "*~ 86."
				}
			},
			{
				"box" : {
					"id" : "obj-read-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 280.0, 370.0, 130.0, 22.0 ],
					"text" : "scale~ 0. 1. 0 22050"
				}
			},
			{
				"box" : {
					"id" : "obj-index-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 400.0, 100.0, 22.0 ],
					"text" : "index~ ---tv_pitch_l"
				}
			},
			{
				"box" : {
					"id" : "obj-index-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 400.0, 105.0, 22.0 ],
					"text" : "index~ ---tv_pitch_r"
				}
			},
			{
				"box" : {
					"id" : "obj-section-freqshift",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 440.0, 240.0, 20.0 ],
					"text" : "=== STAGE 3: FREQ SHIFT (ROTATE) ==="
				}
			},
			{
				"box" : {
					"id" : "obj-freqshift-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 50.0, 470.0, 85.0, 22.0 ],
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
					"patching_rect" : [ 150.0, 470.0, 85.0, 22.0 ],
					"text" : "freqshift~"
				}
			},
			{
				"box" : {
					"id" : "obj-section-reverb",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 510.0, 200.0, 20.0 ],
					"text" : "=== STAGE 4: REVERB (SMEAR) ==="
				}
			},
			{
				"box" : {
					"id" : "obj-reverb",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 50.0, 540.0, 150.0, 22.0 ],
					"text" : "yafr2 @revtime 3000"
				}
			},
			{
				"box" : {
					"id" : "obj-dry-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 580.0, 45.0, 22.0 ],
					"text" : "*~ 1."
				}
			},
			{
				"box" : {
					"id" : "obj-dry-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 580.0, 45.0, 22.0 ],
					"text" : "*~ 1."
				}
			},
			{
				"box" : {
					"id" : "obj-wet-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 250.0, 580.0, 35.0, 22.0 ],
					"text" : "*~"
				}
			},
			{
				"box" : {
					"id" : "obj-wet-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 330.0, 580.0, 35.0, 22.0 ],
					"text" : "*~"
				}
			},
			{
				"box" : {
					"id" : "obj-one-minus",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 500.0, 540.0, 45.0, 22.0 ],
					"text" : "!-~ 1."
				}
			},
			{
				"box" : {
					"id" : "obj-mix-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 620.0, 35.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-mix-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 620.0, 35.0, 22.0 ],
					"text" : "+~"
				}
			}
		],
		"lines" : [
			{
				"patchline" : {
					"destination" : [ "obj-tapin-l", 0 ],
					"source" : [ "obj-in-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-tapin-r", 0 ],
					"source" : [ "obj-in-r", 0 ]
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
					"destination" : [ "obj-zoom-scale", 0 ],
					"source" : [ "obj-r-zoom", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rotate-scale", 0 ],
					"source" : [ "obj-r-rotate", 0 ]
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
					"destination" : [ "obj-scroll-line", 0 ],
					"source" : [ "obj-scroll-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-line", 0 ],
					"source" : [ "obj-zoom-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rotate-line", 0 ],
					"source" : [ "obj-rotate-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-tapout-l", 0 ],
					"order" : 1,
					"source" : [ "obj-scroll-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-tapout-r", 0 ],
					"order" : 0,
					"source" : [ "obj-scroll-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-speed-calc", 0 ],
					"source" : [ "obj-zoom-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-freqshift-l", 1 ],
					"order" : 1,
					"source" : [ "obj-rotate-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-freqshift-r", 1 ],
					"order" : 0,
					"source" : [ "obj-rotate-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-one-minus", 0 ],
					"order" : 1,
					"source" : [ "obj-smear-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-wet-l", 1 ],
					"order" : 0,
					"source" : [ "obj-smear-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-wet-r", 1 ],
					"order" : 0,
					"source" : [ "obj-smear-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-tapout-l", 0 ],
					"source" : [ "obj-tapin-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-tapout-r", 0 ],
					"source" : [ "obj-tapin-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-poke-l", 0 ],
					"source" : [ "obj-tapout-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-poke-r", 0 ],
					"source" : [ "obj-tapout-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-write-scale", 0 ],
					"source" : [ "obj-write-phasor", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-poke-l", 1 ],
					"order" : 1,
					"source" : [ "obj-write-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-poke-r", 1 ],
					"order" : 0,
					"source" : [ "obj-write-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-read-phasor", 0 ],
					"source" : [ "obj-speed-calc", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-read-scale", 0 ],
					"source" : [ "obj-read-phasor", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-index-l", 0 ],
					"order" : 1,
					"source" : [ "obj-read-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-index-r", 0 ],
					"order" : 0,
					"source" : [ "obj-read-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-freqshift-l", 0 ],
					"source" : [ "obj-index-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-freqshift-r", 0 ],
					"source" : [ "obj-index-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-dry-l", 0 ],
					"order" : 1,
					"source" : [ "obj-freqshift-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-reverb", 0 ],
					"order" : 0,
					"source" : [ "obj-freqshift-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-dry-r", 0 ],
					"order" : 1,
					"source" : [ "obj-freqshift-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-reverb", 1 ],
					"order" : 0,
					"source" : [ "obj-freqshift-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-wet-l", 0 ],
					"source" : [ "obj-reverb", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-wet-r", 0 ],
					"source" : [ "obj-reverb", 1 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-dry-l", 1 ],
					"order" : 1,
					"source" : [ "obj-one-minus", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-dry-r", 1 ],
					"order" : 0,
					"source" : [ "obj-one-minus", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-mix-l", 0 ],
					"source" : [ "obj-dry-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-mix-r", 0 ],
					"source" : [ "obj-dry-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-mix-l", 1 ],
					"source" : [ "obj-wet-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-mix-r", 1 ],
					"source" : [ "obj-wet-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-out-l", 0 ],
					"source" : [ "obj-mix-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-out-r", 0 ],
					"source" : [ "obj-mix-r", 0 ]
				}
			}
		]
	}
}
