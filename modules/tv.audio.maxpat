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
		"description" : "tv.audio v7.1 - Hi-Def Audio Engine with Freeze (Path A)",
		"digest" : "Pure MSP audio processing with delay, pitch, freqshift, reverb, freeze",
		"tags" : "teevee, audio, dsp, delay, pitch, freqshift, reverb, freeze",
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
					"patching_rect" : [ 50.0, 780.0, 30.0, 30.0 ]
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
					"patching_rect" : [ 150.0, 780.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 850.0, 30.0, 350.0, 20.0 ],
					"text" : "tv.audio v7.1 - Hi-Def Audio Engine with Freeze (Path A)"
				}
			},
			{
				"box" : {
					"id" : "obj-r-scroll",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 600.0, 30.0, 120.0, 22.0 ],
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
					"patching_rect" : [ 700.0, 30.0, 115.0, 22.0 ],
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
					"patching_rect" : [ 600.0, 60.0, 120.0, 22.0 ],
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
					"patching_rect" : [ 700.0, 60.0, 115.0, 22.0 ],
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
					"patching_rect" : [ 800.0, 60.0, 120.0, 22.0 ],
					"text" : "r ---tv_audio_freeze"
				}
			},
			{
				"box" : {
					"id" : "obj-recv-scrub",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 450.0, 200.0, 140.0, 22.0 ],
					"text" : "receive~ ---tv_scrub_audio"
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-line",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 600.0, 100.0, 60.0, 22.0 ],
					"text" : "line~ 0 20"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-line",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 700.0, 100.0, 60.0, 22.0 ],
					"text" : "line~ 1 20"
				}
			},
			{
				"box" : {
					"id" : "obj-rotate-line",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 600.0, 130.0, 60.0, 22.0 ],
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
					"patching_rect" : [ 700.0, 130.0, 60.0, 22.0 ],
					"text" : "line~ 0 20"
				}
			},
			{
				"box" : {
					"id" : "obj-freeze-line",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "bang" ],
					"patching_rect" : [ 800.0, 130.0, 65.0, 22.0 ],
					"text" : "line~ 0 50"
				}
			},
			{
				"box" : {
					"id" : "obj-freeze-inv",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 800.0, 160.0, 45.0, 22.0 ],
					"text" : "!-~ 1."
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
					"id" : "obj-delay-buf-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 50.0, 110.0, 180.0, 22.0 ],
					"text" : "buffer~ ---tv_delay_l 2000 1"
				}
			},
			{
				"box" : {
					"id" : "obj-delay-buf-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 250.0, 110.0, 180.0, 22.0 ],
					"text" : "buffer~ ---tv_delay_r 2000 1"
				}
			},
			{
				"box" : {
					"id" : "obj-freeze-gate-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 140.0, 30.0, 22.0 ],
					"text" : "*~"
				}
			},
			{
				"box" : {
					"id" : "obj-freeze-gate-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 140.0, 30.0, 22.0 ],
					"text" : "*~"
				}
			},
			{
				"box" : {
					"id" : "obj-delay-poke-l",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 200.0, 115.0, 22.0 ],
					"text" : "poke~ ---tv_delay_l"
				}
			},
			{
				"box" : {
					"id" : "obj-delay-poke-r",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 0,
					"patching_rect" : [ 150.0, 200.0, 120.0, 22.0 ],
					"text" : "poke~ ---tv_delay_r"
				}
			},
			{
				"box" : {
					"id" : "obj-delay-phasor",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 140.0, 70.0, 22.0 ],
					"text" : "phasor~ 0.5"
				}
			},
			{
				"box" : {
					"id" : "obj-delay-write-idx",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 170.0, 125.0, 22.0 ],
					"text" : "scale~ 0. 1. 0 88200"
				}
			},
			{
				"box" : {
					"id" : "obj-delay-offset",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 600.0, 170.0, 125.0, 22.0 ],
					"text" : "scale~ 0. 1000. 0 44100"
				}
			},
			{
				"box" : {
					"id" : "obj-delay-read-idx",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 230.0, 30.0, 22.0 ],
					"text" : "-~"
				}
			},
			{
				"box" : {
					"id" : "obj-scrub-add",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 260.0, 30.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-delay-wrap",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 290.0, 70.0, 22.0 ],
					"text" : "%~ 88200"
				}
			},
			{
				"box" : {
					"id" : "obj-delay-play-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 290.0, 115.0, 22.0 ],
					"text" : "index~ ---tv_delay_l"
				}
			},
			{
				"box" : {
					"id" : "obj-delay-play-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 290.0, 120.0, 22.0 ],
					"text" : "index~ ---tv_delay_r"
				}
			},
			{
				"box" : {
					"id" : "obj-section-pitch",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 330.0, 220.0, 20.0 ],
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
					"patching_rect" : [ 50.0, 360.0, 170.0, 22.0 ],
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
					"patching_rect" : [ 250.0, 360.0, 170.0, 22.0 ],
					"text" : "buffer~ ---tv_pitch_r 500 1"
				}
			},
			{
				"box" : {
					"id" : "obj-poke-l",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 420.0, 105.0, 22.0 ],
					"text" : "poke~ ---tv_pitch_l"
				}
			},
			{
				"box" : {
					"id" : "obj-poke-r",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 0,
					"patching_rect" : [ 150.0, 420.0, 110.0, 22.0 ],
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
					"patching_rect" : [ 350.0, 390.0, 70.0, 22.0 ],
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
					"patching_rect" : [ 350.0, 420.0, 125.0, 22.0 ],
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
					"patching_rect" : [ 350.0, 470.0, 56.0, 22.0 ],
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
					"patching_rect" : [ 700.0, 180.0, 50.0, 22.0 ],
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
					"patching_rect" : [ 350.0, 500.0, 125.0, 22.0 ],
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
					"patching_rect" : [ 50.0, 530.0, 105.0, 22.0 ],
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
					"patching_rect" : [ 150.0, 530.0, 110.0, 22.0 ],
					"text" : "index~ ---tv_pitch_r"
				}
			},
			{
				"box" : {
					"id" : "obj-section-freqshift",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 570.0, 240.0, 20.0 ],
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
					"patching_rect" : [ 50.0, 600.0, 70.0, 22.0 ],
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
					"patching_rect" : [ 150.0, 600.0, 70.0, 22.0 ],
					"text" : "freqshift~"
				}
			},
			{
				"box" : {
					"id" : "obj-section-reverb",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 640.0, 200.0, 20.0 ],
					"text" : "=== STAGE 4: REVERB (SMEAR) ==="
				}
			},
			{
				"box" : {
					"id" : "obj-rev-tapin-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "tapconnect" ],
					"patching_rect" : [ 300.0, 660.0, 80.0, 22.0 ],
					"text" : "tapin~ 1000"
				}
			},
			{
				"box" : {
					"id" : "obj-rev-tapin-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "tapconnect" ],
					"patching_rect" : [ 400.0, 660.0, 80.0, 22.0 ],
					"text" : "tapin~ 1000"
				}
			},
			{
				"box" : {
					"id" : "obj-rev-tap-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 690.0, 85.0, 22.0 ],
					"text" : "tapout~ 29 67"
				}
			},
			{
				"box" : {
					"id" : "obj-rev-tap-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 400.0, 690.0, 85.0, 22.0 ],
					"text" : "tapout~ 37 79"
				}
			},
			{
				"box" : {
					"id" : "obj-rev-fb-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 300.0, 720.0, 50.0, 22.0 ],
					"text" : "*~ 0.4"
				}
			},
			{
				"box" : {
					"id" : "obj-rev-fb-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 400.0, 720.0, 50.0, 22.0 ],
					"text" : "*~ 0.4"
				}
			},
			{
				"box" : {
					"id" : "obj-dry-l",
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
					"id" : "obj-dry-r",
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
					"id" : "obj-wet-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 720.0, 30.0, 22.0 ],
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
					"patching_rect" : [ 150.0, 720.0, 30.0, 22.0 ],
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
					"patching_rect" : [ 700.0, 660.0, 45.0, 22.0 ],
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
					"patching_rect" : [ 50.0, 750.0, 30.0, 22.0 ],
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
					"patching_rect" : [ 150.0, 750.0, 30.0, 22.0 ],
					"text" : "+~"
				}
			},
			{
				"box" : {
					"id" : "obj-freeze-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 870.0, 130.0, 150.0, 20.0 ],
					"text" : "Freeze: gates input to buffers"
				}
			}
		],
		"lines" : [
			{
				"patchline" : {
					"destination" : [ "obj-freeze-gate-l", 0 ],
					"source" : [ "obj-in-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-freeze-gate-r", 0 ],
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
					"destination" : [ "obj-zoom-line", 0 ],
					"source" : [ "obj-r-zoom", 0 ]
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
					"destination" : [ "obj-smear-line", 0 ],
					"source" : [ "obj-r-smear", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-freeze-line", 0 ],
					"source" : [ "obj-r-freeze", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-freeze-inv", 0 ],
					"source" : [ "obj-freeze-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-freeze-gate-l", 1 ],
					"order" : 1,
					"source" : [ "obj-freeze-inv", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-freeze-gate-r", 1 ],
					"order" : 0,
					"source" : [ "obj-freeze-inv", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-delay-poke-l", 0 ],
					"source" : [ "obj-freeze-gate-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-delay-poke-r", 0 ],
					"source" : [ "obj-freeze-gate-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-delay-offset", 0 ],
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
					"destination" : [ "obj-delay-write-idx", 0 ],
					"source" : [ "obj-delay-phasor", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-delay-poke-l", 1 ],
					"order" : 1,
					"source" : [ "obj-delay-write-idx", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-delay-poke-r", 1 ],
					"order" : 0,
					"source" : [ "obj-delay-write-idx", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-delay-read-idx", 0 ],
					"source" : [ "obj-delay-write-idx", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-delay-read-idx", 1 ],
					"source" : [ "obj-delay-offset", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scrub-add", 0 ],
					"source" : [ "obj-delay-read-idx", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scrub-add", 1 ],
					"source" : [ "obj-recv-scrub", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-delay-wrap", 0 ],
					"source" : [ "obj-scrub-add", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-delay-play-l", 0 ],
					"order" : 1,
					"source" : [ "obj-delay-wrap", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-delay-play-r", 0 ],
					"order" : 0,
					"source" : [ "obj-delay-wrap", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-poke-l", 0 ],
					"source" : [ "obj-delay-play-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-poke-r", 0 ],
					"source" : [ "obj-delay-play-r", 0 ]
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
					"destination" : [ "obj-rev-tapin-l", 0 ],
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
					"destination" : [ "obj-rev-tapin-r", 0 ],
					"order" : 0,
					"source" : [ "obj-freqshift-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rev-tap-l", 0 ],
					"source" : [ "obj-rev-tapin-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rev-tap-r", 0 ],
					"source" : [ "obj-rev-tapin-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rev-fb-l", 0 ],
					"source" : [ "obj-rev-tap-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-rev-fb-r", 0 ],
					"source" : [ "obj-rev-tap-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-wet-l", 0 ],
					"source" : [ "obj-rev-fb-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-wet-r", 0 ],
					"source" : [ "obj-rev-fb-r", 0 ]
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
