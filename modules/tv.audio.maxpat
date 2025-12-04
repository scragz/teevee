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
		"rect" : [ 100.0, 100.0, 900.0, 600.0 ],
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
		"description" : "tv.audio v9 - Geometry audio effects (scroll/zoom/rotate/smear)",
		"digest" : "Delay (scroll), varispeed (zoom), freq shift (rotate), lowpass (smear)",
		"tags" : "teevee, audio, geometry",
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
					"id" : "obj-title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 300.0, 30.0, 450.0, 20.0 ],
					"text" : "tv.audio v9 - Geometry Effects (scroll/zoom/rotate/smear)"
				}
			},
			{
				"box" : {
					"id" : "obj-section-scroll",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 70.0, 300.0, 20.0 ],
					"text" : "SCROLL: Delay line (receives 0-1000 ms)"
				}
			},
			{
				"box" : {
					"id" : "obj-r-scroll",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 300.0, 70.0, 115.0, 22.0 ],
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
					"patching_rect" : [ 300.0, 100.0, 60.0, 22.0 ],
					"text" : "line~ 0 50"
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-tapin-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "tapconnect" ],
					"patching_rect" : [ 50.0, 100.0, 80.0, 22.0 ],
					"text" : "tapin~ 1100"
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-tapin-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "tapconnect" ],
					"patching_rect" : [ 150.0, 100.0, 80.0, 22.0 ],
					"text" : "tapin~ 1100"
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-tap-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 130.0, 65.0, 22.0 ],
					"text" : "tapout~ 0"
				}
			},
			{
				"box" : {
					"id" : "obj-scroll-tap-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 130.0, 65.0, 22.0 ],
					"text" : "tapout~ 0"
				}
			},
			{
				"box" : {
					"id" : "obj-section-zoom",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 170.0, 300.0, 20.0 ],
					"text" : "ZOOM: Varispeed via groove~ (receives 0.5-2.0)"
				}
			},
			{
				"box" : {
					"id" : "obj-r-zoom",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 300.0, 170.0, 110.0, 22.0 ],
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
					"patching_rect" : [ 300.0, 200.0, 60.0, 22.0 ],
					"text" : "line~ 1 50"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-buf-l",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 450.0, 170.0, 160.0, 22.0 ],
					"text" : "buffer~ ---tv_zoom_l 500 1"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-buf-r",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 450.0, 200.0, 160.0, 22.0 ],
					"text" : "buffer~ ---tv_zoom_r 500 1"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-phasor",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 450.0, 240.0, 70.0, 22.0 ],
					"text" : "phasor~ 2"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-rate-mul",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 450.0, 270.0, 45.0, 22.0 ],
					"text" : "*~ 2"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-scale",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 450.0, 300.0, 120.0, 22.0 ],
					"text" : "scale~ 0. 1. 0. 500."
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-write-l",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 200.0, 110.0, 22.0 ],
					"text" : "poke~ ---tv_zoom_l"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-write-r",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 200.0, 110.0, 22.0 ],
					"text" : "poke~ ---tv_zoom_r"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-read-l",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 50.0, 240.0, 110.0, 22.0 ],
					"text" : "index~ ---tv_zoom_l"
				}
			},
			{
				"box" : {
					"id" : "obj-zoom-read-r",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 150.0, 240.0, 110.0, 22.0 ],
					"text" : "index~ ---tv_zoom_r"
				}
			},
			{
				"box" : {
					"id" : "obj-section-freq",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 290.0, 300.0, 20.0 ],
					"text" : "ROTATE: Freq shift (receives -500 to 500 Hz)"
				}
			},
			{
				"box" : {
					"id" : "obj-r-rotate",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 300.0, 290.0, 120.0, 22.0 ],
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
					"patching_rect" : [ 300.0, 320.0, 55.0, 22.0 ],
					"text" : "line~ 0 20"
				}
			},
			{
				"box" : {
					"id" : "obj-freqshift-l",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 50.0, 350.0, 70.0, 22.0 ],
					"text" : "freqshift~ 0"
				}
			},
			{
				"box" : {
					"id" : "obj-freqshift-r",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 150.0, 350.0, 70.0, 22.0 ],
					"text" : "freqshift~ 0"
				}
			},
			{
				"box" : {
					"id" : "obj-section-filter",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 390.0, 250.0, 20.0 ],
					"text" : "SMEAR: Lowpass filter (receives 0-1)"
				}
			},
			{
				"box" : {
					"id" : "obj-r-smear",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 300.0, 390.0, 115.0, 22.0 ],
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
					"patching_rect" : [ 300.0, 420.0, 55.0, 22.0 ],
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
					"patching_rect" : [ 300.0, 450.0, 140.0, 22.0 ],
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
					"patching_rect" : [ 50.0, 450.0, 95.0, 22.0 ],
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
					"patching_rect" : [ 150.0, 450.0, 95.0, 22.0 ],
					"text" : "lores~ 20000 0.5"
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
					"patching_rect" : [ 50.0, 510.0, 30.0, 30.0 ]
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
					"patching_rect" : [ 150.0, 510.0, 30.0, 30.0 ]
				}
			}
		],
		"lines" : [
			{
				"patchline" : {
					"destination" : [ "obj-scroll-tapin-l", 0 ],
					"source" : [ "obj-in-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scroll-tapin-r", 0 ],
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
					"destination" : [ "obj-scroll-tap-l", 0 ],
					"source" : [ "obj-scroll-tapin-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scroll-tap-r", 0 ],
					"source" : [ "obj-scroll-tapin-r", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-write-l", 0 ],
					"source" : [ "obj-scroll-tap-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-write-r", 0 ],
					"source" : [ "obj-scroll-tap-r", 0 ]
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
					"destination" : [ "obj-zoom-rate-mul", 1 ],
					"source" : [ "obj-zoom-line", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-rate-mul", 0 ],
					"source" : [ "obj-zoom-phasor", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-scale", 0 ],
					"source" : [ "obj-zoom-rate-mul", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-write-l", 1 ],
					"order" : 1,
					"source" : [ "obj-zoom-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-write-r", 1 ],
					"order" : 0,
					"source" : [ "obj-zoom-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-read-l", 0 ],
					"order" : 1,
					"source" : [ "obj-zoom-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-zoom-read-r", 0 ],
					"order" : 0,
					"source" : [ "obj-zoom-scale", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-freqshift-l", 0 ],
					"source" : [ "obj-zoom-read-l", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-freqshift-r", 0 ],
					"source" : [ "obj-zoom-read-r", 0 ]
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
