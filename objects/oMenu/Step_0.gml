var _elems = menuPages[$ pageName].elements;
var _elemsL = array_length(_elems);

if inputting {
	//change settings in input mode
	switch _elems[elementNum].elemType {
		
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
		elementNum += _pressVer;
		if (elementNum > _elemsL-1)	{ elementNum = 0;			}
		if (elementNum < 0)			{ elementNum = _elemsL-1;	}
	}
	//navigate menu (mouse)
	
}

if (oInputManager.pressed.confirm) {
	switch _elems[elementNum].elemType {
		
		case MENU_ELEMENT_TYPE.SCRIPT_RUNNER: {
			var _scr = _elems[elementNum].scr;
			var _args = _elems[elementNum].args;
			
			_scr(_args);
		} break;
		
		case MENU_ELEMENT_TYPE.PAGE_TRANSFER: {
			pageName = _elems[elementNum].pageName;
			elementNum = 0;
			PageUpdate();
		} break;
		
		case MENU_ELEMENT_TYPE.SHIFT:	inputting = !inputting; break;
		case MENU_ELEMENT_TYPE.SLIDER:	inputting = !inputting; break;
		case MENU_ELEMENT_TYPE.TOGGLE:	inputting = !inputting; break;
		
	}
}
