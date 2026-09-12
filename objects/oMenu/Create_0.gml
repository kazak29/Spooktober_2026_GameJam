//struct of structs, containing arrays of structs
menuPages = {
	main: {
		pageNamePrev: "",
		layout: MENU_LAYOUT.MAIN,
		elemSpr: sPlaceholderButton,
		elements: [
			//start game
			{
				title:		global.uiData.menuStart,
				elemType:	MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:		MenuTransitionStart,
				args:		[rmStage, sqFadeOut, sqFadeIn],
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
				args:		[rmCredits, sqFadeOut, sqFadeIn],
			},
		],
	},
	settings: {
		pageNamePrev: "main",
		layout: MENU_LAYOUT.SETTINGS,
		elemSpr: noone,
		elements: [
			//fullscreen
			{
				title:		global.uiData.menuFullscreen,
				elemType:	MENU_ELEMENT_TYPE.TOGGLE,
				scr:		MenuFullscreen,
				arg:		window_get_fullscreen(),
			},
			//back to main page
			{
				title:		global.uiData.menuBack,
				elemType:	MENU_ELEMENT_TYPE.PAGE_TRANSFER,
				pageName:	"main",
			},
		],
	},
};

pageName = "main";
elementNum = 0;
inputting = false;

//create every page element as object on screen
PageUpdate = function(){
	with oMenuElement instance_destroy();
	
	var _elems = menuPages[$ pageName].elements;
	var _elemsL = array_length(_elems);
	for (var i = 0; i < _elemsL; i++) {	
		var _id = instance_create_layer(0,0, "System", oMenuElement, {elementNum: i});
		_elems[i].elemId = _id;
	}
}
PageUpdate();