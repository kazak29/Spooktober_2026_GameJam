//create the menu page data set - a main struct, from which menu pages will be pulled
//menu page data is a struct of structs, containing arrays of structs
function MenuDataCreate() {
	return {
	
		//main menu
		menuTitle: {
			main: {
				pageNamePrev:	"",
				layout:			MENU_LAYOUT.TITLE_MAIN,
				font:			FONT_CONSOLE_24,
				bg:				noone,
				spr:			{
					ind:		sChoiceBox,
					bufferStrX:	64,
					bufferStrY: 32,
					bufferElem: 16,
				},
				elements:		[
					//start game
					{
						title:		global.uiData.menuStart,
						elemType:	MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
						scr:		MenuGameStart,
						arg:		[rmStage, sqFadeOut, sqFadeIn],
					},
					//settings page
					{
						title:		global.uiData.menuSettings,
						elemType:	MENU_ELEMENT_TYPE.PAGE_TRANSFER,
						pageName:	"settings",
					},
					//credits
					{
						title:		global.uiData.menuCredits,
						elemType:	MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
						scr:		MenuTransitionStart,
						arg:		[rmCredits, sqFadeOut, sqFadeIn],
					},
				],
			},
			settings: {
				pageNamePrev:	"main",
				layout:			MENU_LAYOUT.TITLE_SETTINGS,
				font:			FONT_CONSOLE_24,
				bg: noone,
				//bg:				{
				//	active: true,
				//	offset: 32,
				//	sprInd:	sChoiceBox,
				//},
				//spr: noone,
				spr:			{
					ind:		sChoiceBox,
					bufferStrX:	32,
					bufferStrY: 16,
					bufferElem: 0,
				},
				elements:		[
					//fullscreen
					{
						title:			global.uiData.menuFullscreen,
						elemType:		MENU_ELEMENT_TYPE.TOGGLE,
						varName:		"fullscreen",
					},
					//music volume
					{
						title:			global.uiData.menuVolMusic,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"volMusic",
						argClamp:		[0,1],
						whole:			false,
						style:			MENU_SLIDER_STYLE.PERC_BAR,
					},
					//sound volume
					{
						title:			global.uiData.menuVolSound,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"volSound",
						argClamp:		[0,1],
						whole:			false,
						style:			MENU_SLIDER_STYLE.PERC_BAR,
					},
					//dialogue volume (type writer)
					{
						title:			global.uiData.menuVolTypeWriter,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"volTypeWriter",
						argClamp:		[0,1],
						whole:			false,
						style:			MENU_SLIDER_STYLE.PERC_BAR,
					},
					//ui sfx flag
					{
						title:			global.uiData.menuSfxUI,
						elemType:		MENU_ELEMENT_TYPE.TOGGLE,
						varName:		"uiSfxActive",
					},
					//crt filter flag
					{
						title:			global.uiData.menuCrtActive,
						elemType:		MENU_ELEMENT_TYPE.TOGGLE,
						varName:		"crt.active",
					},
					//crt page
					{
						title:			global.uiData.menuCrt,
						elemType:		MENU_ELEMENT_TYPE.PAGE_TRANSFER,
						pageName:		"crt",
					},
					//reset to default
					{
						title:			global.uiData.menuReset,
						elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
						scr:			MenuSettingsReset,
					},
					//back to main page
					{
						title:		global.uiData.menuBack,
						elemType:	MENU_ELEMENT_TYPE.PAGE_TRANSFER,
						pageName:	"main",
					},
				],
			},
			crt: {
				pageNamePrev:	"settings",
				layout:			MENU_LAYOUT.TITLE_SETTINGS,
				font:			FONT_CONSOLE_24,
				bg: noone,
				//bg:				{
				//	active: true,
				//	offset: 32,
				//	sprInd:	sChoiceBox,
				//},
				//spr: noone,
				spr:			{
					ind:		sChoiceBox,
					bufferStrX:	32,
					bufferStrY: 16,
					bufferElem: 0,
				},
				elements:		[
					//abberation
					{
						title:			global.uiData.menuCrtAbberation,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"crt.abberation",
						argClamp:		[-0.002, 0.002],
						whole:			false,
						style:			MENU_SLIDER_STYLE.PERC_SCALE_HUNDRED,
					},
					//noise
					{
						title:			global.uiData.menuCrtNoise,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"crt.noise",
						argClamp:		[0, 0.1],
						whole:			false,
						style:			MENU_SLIDER_STYLE.PERC_BAR,
					},
					//scanlines
					{
						title:			global.uiData.menuCrtScanlines,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"crt.scanlines",
						argClamp:		[0, 0.1],
						whole:			false,
						style:			MENU_SLIDER_STYLE.PERC_BAR,
					},
					//scanlines glow
					{
						title:			global.uiData.menuCrtScanlinesGlow,
						elemType:		MENU_ELEMENT_TYPE.TOGGLE,
						varName:		"crt.scanlinesGlow",
					},
					//mask
					{
						title:			global.uiData.menuCrtMask,
						elemType:		MENU_ELEMENT_TYPE.SHIFT,
						varName:		"crt.mask",
						argTitles:		[global.uiData.menuOff, global.uiData.menuCrtMaskGrille, global.uiData.menuCrtMaskDots, global.uiData.menuCrtMaskSlot],
					},
					//mask scale
					{
						title:			global.uiData.menuCrtMaskScale,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"crt.maskScale",
						argClamp:		[1, 4],
						whole:			true,
						style:			MENU_SLIDER_STYLE.UNMODIFIED,
					},
					//glow
					{
						title:			global.uiData.menuCrtGlow,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"crt.glow",
						argClamp:		[0, 0.5],
						whole:			false,
						style:			MENU_SLIDER_STYLE.PERC_BAR,
					},
					//bright
					{
						title:			global.uiData.menuCrtBright,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"crt.bright",
						argClamp:		[0.5, 1.5],
						whole:			false,
						style:			MENU_SLIDER_STYLE.PERC_SCALE_ROUNDED,
					},
					//flicker
					{
						title:			global.uiData.menuCrtFlicker,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"crt.flicker",
						argClamp:		[0, 0.03],
						whole:			false,
						style:			MENU_SLIDER_STYLE.PERC_BAR,
					},
					//roll
					{
						title:			global.uiData.menuCrtRoll,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"crt.roll",
						argClamp:		[0, 0.1],
						whole:			false,
						style:			MENU_SLIDER_STYLE.PERC_BAR,
					},
					//back to settings page
					{
						title:		global.uiData.menuBack,
						elemType:	MENU_ELEMENT_TYPE.PAGE_TRANSFER,
						pageName:	"settings",
					},
				],
			},
		},
	
		//pause menu
		menuPause: {
			main: {
				pageNamePrev:	"",
				layout:			MENU_LAYOUT.PAUSE_BOTTOM,
				font:			FONT_CONSOLE_16,
				bg:				{
					active: true,
					offset: 32,
					sprInd:	sChoiceBox,
				},
				spr:			noone,
				elements: [
					//fullscreen
					{
						title:			global.uiData.menuFullscreen,
						elemType:		MENU_ELEMENT_TYPE.TOGGLE,
						varName:		"fullscreen",
					},
					//music volume
					{
						title:			global.uiData.menuVolMusic,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"volMusic",
						argClamp:		[0,1],
						whole:			false,
						style:			MENU_SLIDER_STYLE.PERC_BAR,
					},
					//sound volume
					{
						title:			global.uiData.menuVolSound,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"volSound",
						argClamp:		[0,1],
						whole:			false,
						style:			MENU_SLIDER_STYLE.PERC_BAR,
					},
					//dialogue volume (type writer)
					{
						title:			global.uiData.menuVolTypeWriter,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"volTypeWriter",
						argClamp:		[0,1],
						whole:			false,
						style:			MENU_SLIDER_STYLE.PERC_BAR,
					},
					//ui sfx flag
					{
						title:			global.uiData.menuSfxUI,
						elemType:		MENU_ELEMENT_TYPE.TOGGLE,
						varName:		"uiSfxActive",
					},
					//crt filter flag
					{
						title:			global.uiData.menuCrtActive,
						elemType:		MENU_ELEMENT_TYPE.TOGGLE,
						varName:		"crt.active",
					},
					//crt page
					{
						title:			global.uiData.menuCrt,
						elemType:		MENU_ELEMENT_TYPE.PAGE_TRANSFER,
						pageName:		"crt",
					},
					//reset to default
					{
						title:			global.uiData.menuReset,
						elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
						scr:			MenuSettingsReset,
					},
					//to main
					{
						title:		global.uiData.menuToMain,
						elemType:	MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
						scr:		MenuTransitionStart,
						arg:		[rmTitleScreen, sqFadeOut, sqFadeIn],
					},
				],
			},
			crt: {
				pageNamePrev:	"main",
				layout:			MENU_LAYOUT.PAUSE_BOTTOM,
				font:			FONT_CONSOLE_16,
				bg:				{
					active: true,
					offset: 32,
					sprInd:	sChoiceBox,
				},
				spr:			noone,
				elements:		[
					//abberation
					{
						title:			global.uiData.menuCrtAbberation,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"crt.abberation",
						argClamp:		[-0.002, 0.002],
						whole:			false,
						style:			MENU_SLIDER_STYLE.PERC_SCALE_HUNDRED,
					},
					//noise
					{
						title:			global.uiData.menuCrtNoise,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"crt.noise",
						argClamp:		[0, 0.1],
						whole:			false,
						style:			MENU_SLIDER_STYLE.PERC_BAR,
					},
					//scanlines
					{
						title:			global.uiData.menuCrtScanlines,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"crt.scanlines",
						argClamp:		[0, 0.1],
						whole:			false,
						style:			MENU_SLIDER_STYLE.PERC_BAR,
					},
					//scanlines glow
					{
						title:			global.uiData.menuCrtScanlinesGlow,
						elemType:		MENU_ELEMENT_TYPE.TOGGLE,
						varName:		"crt.scanlinesGlow",
					},
					//mask
					{
						title:			global.uiData.menuCrtMask,
						elemType:		MENU_ELEMENT_TYPE.SHIFT,
						varName:		"crt.mask",
						argTitles:		[global.uiData.menuOff, global.uiData.menuCrtMaskGrille, global.uiData.menuCrtMaskDots, global.uiData.menuCrtMaskSlot],
					},
					//mask scale
					{
						title:			global.uiData.menuCrtMaskScale,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"crt.maskScale",
						argClamp:		[1, 4],
						whole:			true,
						style:			MENU_SLIDER_STYLE.UNMODIFIED,
					},
					//glow
					{
						title:			global.uiData.menuCrtGlow,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"crt.glow",
						argClamp:		[0, 0.5],
						whole:			false,
						style:			MENU_SLIDER_STYLE.PERC_BAR,
					},
					//bright
					{
						title:			global.uiData.menuCrtBright,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"crt.bright",
						argClamp:		[0.5, 1.5],
						whole:			false,
						style:			MENU_SLIDER_STYLE.PERC_SCALE_ROUNDED,
					},
					//flicker
					{
						title:			global.uiData.menuCrtFlicker,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"crt.flicker",
						argClamp:		[0, 0.03],
						whole:			false,
						style:			MENU_SLIDER_STYLE.PERC_BAR,
					},
					//roll
					{
						title:			global.uiData.menuCrtRoll,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"crt.roll",
						argClamp:		[0, 0.1],
						whole:			false,
						style:			MENU_SLIDER_STYLE.PERC_BAR,
					},
					//back
					{
						title:		global.uiData.menuBack,
						elemType:	MENU_ELEMENT_TYPE.PAGE_TRANSFER,
						pageName:	"main",
					},
				],
			},
		},
		
	};
}