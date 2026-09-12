//struct of structs, containing arrays of structs
menuPages = {
	main: {
		layout: MENU_LAYOUT.MAIN,
		butSprite: sPlaceholderButton,
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
		layout: MENU_LAYOUT.SETTINGS,
		butSprite: noone,
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


PageCreateLayoutMain = function(){
	
}

PageCreateLayoutSettings = function(){
	
	var _elems = menuPages[$ pageName].elements;
	var _elemsL = array_length(_elems);
	
	var _bufferX = 64, _startX = VIEWPORT_WIDTH / 2;
	var _bufferY = 64, _startY = (VIEWPORT_HEIGHT / 2) - ((_elemsL-1)/2)*_bufferY;

	var _x = _startX - _bufferX;
	var _y = _startY;
	
	for (var i = 0; i < _elemsL; i++) {
		_y = _startY + i*_bufferY;
			
		var _id = instance_create_layer(_x,_y, "System", oMenuElement, {elementNum: i});
		_elems[i].elemId = _id;
	}
	
}

PageUpdate = function(){
	with oMenuElement instance_destroy();
	switch menuPages[$ pageName].layout {
		
		case MENU_LAYOUT.MAIN:		PageCreateLayoutSettings();		break;
		case MENU_LAYOUT.SETTINGS:	PageCreateLayoutSettings();	break;
		
	}
}
PageUpdate();