var _page = menuPages[$ pageName];
var _pageLength = array_length(_page);

if inputting {
	//change settings in input mode
	switch _page[pageOption].elemType {
		
		case MENU_ELEMENT_TYPE.SHIFT: {
			
		} break;
		case MENU_ELEMENT_TYPE.SLIDER: {
			
		} break;
		case MENU_ELEMENT_TYPE.TOGGLE: {
			
		} break;
		
	}
	
} else {
	//navigate menu (buttons)
	var _pressVer = oInputManager.pressed.down - oInputManager.pressed.up;
	if (_pressVer != 0) {
		pageOption += _pressVer;
		if (pageOption > _pageLength-1)	{ pageOption = 0;				}
		if (pageOption < 0)				{ pageOption = _pageLength-1;	}
	}
	//navigate menu (mouse)
	
}

if (oInputManager.pressed.confirm) {
	switch _page[pageOption].elemType {
		
		case MENU_ELEMENT_TYPE.SCRIPT_RUNNER: {
			var _scr = _page[pageOption].scr;
			var _args = _page[pageOption].args;
			
			_scr(_args);
		} break;
		
		case MENU_ELEMENT_TYPE.PAGE_TRANSFER: {
			pageName = _page[pageOption].pageName;
			pageOption = 0;
		} break;
		
		case MENU_ELEMENT_TYPE.SHIFT:	inputting = !inputting; break;
		case MENU_ELEMENT_TYPE.SLIDER:	inputting = !inputting; break;
		case MENU_ELEMENT_TYPE.TOGGLE:	inputting = !inputting; break;
		
	}
}
