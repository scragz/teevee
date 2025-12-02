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
		"description" : "tv.param v7 - Dual-path parameter hub (Audio + Viz)",
		"digest" : "Routes parameters to both audio engine and visualization paths",
		"tags" : "teevee, param, parameters, dual-path, twin-engine",
		"style" : "",
		"subpatcher_template" : "",
		"assistshowspatchername" : 0,
		"boxes" : [
			{
				"box" : {
					"id" : "obj-title",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 600.0, 30.0, 280.0, 20.0 ],
					"text" : "tv.param v7 - Twin Engine Parameter Router"
				}
			},
			{
				"box" : {
					"id" : "obj-audio-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 210.0, 200.0, 20.0 ],
					"text" : "=== Path A: Audio Engine (MSP) ==="
				}
			},
			{
				"box" : {
					"id" : "obj-viz-label",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 400.0, 220.0, 20.0 ],
					"text" : "=== Path B: Visualization (Jitter) ==="
				}
			},
			{
				"box" : {
					"comment" : "Scroll Speed (0-1) -> Delay",
					"id" : "obj-in-scroll",
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
					"comment" : "Zoom (0-1) -> Pitch/Varispeed",
					"id" : "obj-in-zoom",
					"index" : 2,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 120.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "Rotation (0-1) -> FreqShift",
					"id" : "obj-in-rotation",
					"index" : 3,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 190.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "Smear (0-1) -> Reverb",
					"id" : "obj-in-smear",
					"index" : 4,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 260.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "Edge (0-1) -> Edge Viz Only",
					"id" : "obj-in-edge",
					"index" : 5,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 330.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "Warp X (0-1) -> Viz Only",
					"id" : "obj-in-warp-x",
					"index" : 6,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 400.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "Warp Y (0-1) -> Viz Only",
					"id" : "obj-in-warp-y",
					"index" : 7,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 470.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"comment" : "Freeze (0/1) -> Buffer Loop",
					"id" : "obj-in-freeze",
					"index" : 8,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 540.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-scale-scroll-audio",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 50.0, 100.0, 140.0, 22.0 ],
					"text" : "scale 0. 1. 0. 1000."
				}
			},
			{
				"box" : {
					"id" : "obj-scale-zoom-audio",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 120.0, 140.0, 120.0, 22.0 ],
					"text" : "scale 0. 1. 0.5 2."
				}
			},
			{
				"box" : {
					"id" : "obj-scale-rotate-audio",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 190.0, 100.0, 135.0, 22.0 ],
					"text" : "scale 0. 1. -500. 500."
				}
			},
			{
				"box" : {
					"id" : "obj-scale-smear-audio",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 260.0, 140.0, 100.0, 22.0 ],
					"text" : "scale 0. 1. 0. 1."
				}
			},
			{
				"box" : {
					"id" : "obj-s-audio-scroll",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 250.0, 120.0, 22.0 ],
					"text" : "s ---tv_audio_scroll"
				}
			},
			{
				"box" : {
					"id" : "obj-s-audio-zoom",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 120.0, 290.0, 115.0, 22.0 ],
					"text" : "s ---tv_audio_zoom"
				}
			},
			{
				"box" : {
					"id" : "obj-s-audio-rotate",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 190.0, 250.0, 120.0, 22.0 ],
					"text" : "s ---tv_audio_rotate"
				}
			},
			{
				"box" : {
					"id" : "obj-s-audio-smear",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 260.0, 290.0, 120.0, 22.0 ],
					"text" : "s ---tv_audio_smear"
				}
			},
			{
				"box" : {
					"id" : "obj-s-audio-freeze",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 540.0, 250.0, 120.0, 22.0 ],
					"text" : "s ---tv_audio_freeze"
				}
			},
			{
				"box" : {
					"id" : "obj-scale-scroll-viz",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 50.0, 440.0, 110.0, 22.0 ],
					"text" : "scale 0. 1. 0. 1."
				}
			},
			{
				"box" : {
					"id" : "obj-scale-zoom-viz",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 120.0, 480.0, 110.0, 22.0 ],
					"text" : "scale 0. 1. 0.5 2."
				}
			},
			{
				"box" : {
					"id" : "obj-scale-rotation-viz",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 190.0, 440.0, 140.0, 22.0 ],
					"text" : "scale 0. 1. -3.14159 3.14159"
				}
			},
			{
				"box" : {
					"id" : "obj-scale-warp-x",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 400.0, 440.0, 100.0, 22.0 ],
					"text" : "scale 0. 1. -1. 1."
				}
			},
			{
				"box" : {
					"id" : "obj-scale-warp-y",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 470.0, 480.0, 100.0, 22.0 ],
					"text" : "scale 0. 1. -1. 1."
				}
			},
			{
				"box" : {
					"id" : "obj-s-viz-scroll",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 540.0, 120.0, 22.0 ],
					"text" : "s ---tv_param_scroll"
				}
			},
			{
				"box" : {
					"id" : "obj-s-viz-zoom",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 120.0, 580.0, 110.0, 22.0 ],
					"text" : "s ---tv_param_zoom"
				}
			},
			{
				"box" : {
					"id" : "obj-s-viz-rotation",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 190.0, 540.0, 120.0, 22.0 ],
					"text" : "s ---tv_param_rotation"
				}
			},
			{
				"box" : {
					"id" : "obj-scale-smear-viz",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 260.0, 520.0, 100.0, 22.0 ],
					"text" : "scale 0. 1. 0. 0.95"
				}
			},
			{
				"box" : {
					"id" : "obj-s-viz-smear",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 260.0, 580.0, 115.0, 22.0 ],
					"text" : "s ---tv_param_smear"
				}
			},
			{
				"box" : {
					"id" : "obj-s-viz-edge",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 330.0, 540.0, 105.0, 22.0 ],
					"text" : "s ---tv_param_edge"
				}
			},
			{
				"box" : {
					"id" : "obj-s-viz-warp-x",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 400.0, 540.0, 115.0, 22.0 ],
					"text" : "s ---tv_param_warp_x"
				}
			},
			{
				"box" : {
					"id" : "obj-s-viz-warp-y",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 470.0, 580.0, 115.0, 22.0 ],
					"text" : "s ---tv_param_warp_y"
				}
			},
			{
				"box" : {
					"id" : "obj-dim-inlet",
					"comment" : "Matrix Dimension",
					"index" : 9,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 700.0, 30.0, 30.0, 30.0 ]
				}
			},
			{
				"box" : {
					"id" : "obj-s-dim",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 700.0, 250.0, 80.0, 22.0 ],
					"text" : "s ---tv_dim"
				}
			}
		],
		"lines" : [
			{
				"patchline" : {
					"destination" : [ "obj-scale-scroll-audio", 0 ],
					"source" : [ "obj-in-scroll", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-scroll-viz", 0 ],
					"source" : [ "obj-in-scroll", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-zoom-audio", 0 ],
					"source" : [ "obj-in-zoom", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-zoom-viz", 0 ],
					"source" : [ "obj-in-zoom", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-rotate-audio", 0 ],
					"source" : [ "obj-in-rotation", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-rotation-viz", 0 ],
					"source" : [ "obj-in-rotation", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-smear-audio", 0 ],
					"source" : [ "obj-in-smear", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-smear-viz", 0 ],
					"source" : [ "obj-in-smear", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-viz-smear", 0 ],
					"source" : [ "obj-scale-smear-viz", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-viz-edge", 0 ],
					"source" : [ "obj-in-edge", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-warp-x", 0 ],
					"source" : [ "obj-in-warp-x", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-scale-warp-y", 0 ],
					"source" : [ "obj-in-warp-y", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-audio-freeze", 0 ],
					"source" : [ "obj-in-freeze", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-audio-scroll", 0 ],
					"source" : [ "obj-scale-scroll-audio", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-audio-zoom", 0 ],
					"source" : [ "obj-scale-zoom-audio", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-audio-rotate", 0 ],
					"source" : [ "obj-scale-rotate-audio", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-audio-smear", 0 ],
					"source" : [ "obj-scale-smear-audio", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-viz-scroll", 0 ],
					"source" : [ "obj-scale-scroll-viz", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-viz-zoom", 0 ],
					"source" : [ "obj-scale-zoom-viz", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-viz-rotation", 0 ],
					"source" : [ "obj-scale-rotation-viz", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-viz-warp-x", 0 ],
					"source" : [ "obj-scale-warp-x", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-viz-warp-y", 0 ],
					"source" : [ "obj-scale-warp-y", 0 ]
				}
			},
			{
				"patchline" : {
					"destination" : [ "obj-s-dim", 0 ],
					"source" : [ "obj-dim-inlet", 0 ]
				}
			}
		]
	}
}
