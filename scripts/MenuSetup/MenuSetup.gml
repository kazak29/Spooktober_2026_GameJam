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
				elemSpr:		sPlaceholderButton,
				elements:		[
					//start game
					{
						title:		global.uiData.menuStart,
						elemType:	MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
						scr:		MenuTransitionStart,
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
				bg:				noone,
				elemSpr:		noone,
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
					},
					//sound volume
					{
						title:			global.uiData.menuVolSound,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"volSound",
						argClamp:		[0,1],
					},
					//dialogue volume (type writer)
					{
						title:			global.uiData.menuVolTypeWriter,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"volTypeWriter",
						argClamp:		[0,1],
					},
					//ui sfx flag
					{
						title:			global.uiData.menuSfxUI,
						elemType:		MENU_ELEMENT_TYPE.TOGGLE,
						varName:		"uiSfxActive",
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
				bg:				noone,
				elemSpr:		noone,
				elements:		[
					//crt filter flag
					//{
					//	title:			global.uiData.menuCrtActive,
					//	elemType:		MENU_ELEMENT_TYPE.TOGGLE,
					//	scr:			MenuCrtActive,
					//	arg:			global.crt.active,
					//},
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
					col:	c_blue,
					alpha:	0.75,
				},
				elemSpr: noone,
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
					},
					//sound volume
					{
						title:			global.uiData.menuVolSound,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"volSound",
						argClamp:		[0,1],
					},
					//dialogue volume (type writer)
					{
						title:			global.uiData.menuVolTypeWriter,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						varName:		"volTypeWriter",
						argClamp:		[0,1],
					},
					//ui sfx flag
					{
						title:			global.uiData.menuSfxUI,
						elemType:		MENU_ELEMENT_TYPE.TOGGLE,
						varName:		"uiSfxActive",
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
		},
	
	};
}