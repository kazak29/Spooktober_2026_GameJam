//create the menu page data set - a main struct, from which menu pages will be pulled
//menu page data is a struct of structs, containing arrays of structs
//first page must be named main for pause check
function MenuDataCreate() {
	return {
	
		//main menu
		menuTitle: {
			main: {
				pageNamePrev: "",
				layout: MENU_LAYOUT.TITLE_MAIN,
				elemSpr: sPlaceholderButton,
				elements: [
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
				pageNamePrev: "main",
				layout: MENU_LAYOUT.TITLE_SETTINGS,
				elemSpr: noone,
				elements: [
					//fullscreen
					{
						title:		global.uiData.menuFullscreen,
						elemType:	MENU_ELEMENT_TYPE.TOGGLE,
						scr:		MenuFullscreen,
						arg:		window_get_fullscreen(),
					},
					//language
					{
						title:			global.uiData.menuLanguage,
						elemType:		MENU_ELEMENT_TYPE.SHIFT,
						scr:			MenuLanguage,
						arg:			0,
						argTitles:		[global.uiData.menuLanguageEng, global.uiData.menuLanguageTur, global.uiData.menuLanguageKaz],
					},
					//music volume
					{
						title:			global.uiData.menuVolMusic,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						scr:			MenuVolMusic,
						arg:			global.volMusic,
						argClamp:		[0,1],
					},
					//sound volume
					{
						title:			global.uiData.menuVolSound,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						scr:			MenuVolSound,
						arg:			global.volSound,
						argClamp:		[0,1],
					},
					//dialogue volume (type writer)
					{
						title:			global.uiData.menuVolTypeWriter,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						scr:			MenuVolTypeWriter,
						arg:			global.volTypeWriter,
						argClamp:		[0,1],
					},
					//back to main page
					{
						title:		global.uiData.menuBack,
						elemType:	MENU_ELEMENT_TYPE.PAGE_TRANSFER,
						pageName:	"main",
					},
				],
			},
		},
	
		//pause menu
		menuPause: {
			main: {
				pageNamePrev: "",
				layout: MENU_LAYOUT.PAUSE_MAIN,
				elemSpr: sPlaceholderButton,
				elements: [
					//resume game
					{
						title:		global.uiData.menuResume,
						elemType:	MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
						scr:		MenuResume,
						arg:		[],
					},
					//settings page
					{
						title:		global.uiData.menuSettings,
						elemType:	MENU_ELEMENT_TYPE.PAGE_TRANSFER,
						pageName:	"settings",
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
			settings: {
				pageNamePrev: "main",
				layout: MENU_LAYOUT.PAUSE_SETTINGS,
				elemSpr: noone,
				elements: [
					//fullscreen
					{
						title:		global.uiData.menuFullscreen,
						elemType:	MENU_ELEMENT_TYPE.TOGGLE,
						scr:		MenuFullscreen,
						arg:		window_get_fullscreen(),
					},
					//language
					{
						title:			global.uiData.menuLanguage,
						elemType:		MENU_ELEMENT_TYPE.SHIFT,
						scr:			MenuLanguage,
						arg:			0,
						argTitles:		[global.uiData.menuLanguageEng, global.uiData.menuLanguageTur, global.uiData.menuLanguageKaz],
					},
					//music volume
					{
						title:			global.uiData.menuVolMusic,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						scr:			MenuVolMusic,
						arg:			global.volMusic,
						argClamp:		[0,1],
					},
					//sound volume
					{
						title:			global.uiData.menuVolSound,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						scr:			MenuVolSound,
						arg:			global.volSound,
						argClamp:		[0,1],
					},
					//dialogue volume (type writer)
					{
						title:			global.uiData.menuVolTypeWriter,
						elemType:		MENU_ELEMENT_TYPE.SLIDER,
						scr:			MenuVolTypeWriter,
						arg:			global.volTypeWriter,
						argClamp:		[0,1],
					},
					//back to main page
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


//menu element position change based on whether a sprite is used or not
function MenuSubElementUpdateGeneralPosition(_scribId, _spr = noone){
	var _offsetX = 0;
	var _offsetY = 0;
	if sprite_exists(_spr) {
		sprite_index = _spr;
			
		var _sprW = sprite_get_width(_spr);
		var _sprH = sprite_get_height(_spr);
	
		_offsetX = sprite_get_xoffset(_spr) - _sprW/2;
		_offsetY = sprite_get_yoffset(_spr) - _sprH/2;
	
	}

	var _bbox = _scribId.get_bbox(strX,strY);
	x = _bbox.left + _bbox.width/2 + _offsetX;
	y = _bbox.top + _bbox.height/2 + _offsetY;
}