if global.midTransition || global.gamePaused exit;

var _page = menuPages[$ pageName];
var _elems = _page.elements;
var _elemsL = array_length(_elems);

//execute a script from element data with set argument(s)
var _elemScrExecute = function() {
	var _scr = menuPages[$ pageName].elements[elementNum].scr;
	var _arg = menuPages[$ pageName].elements[elementNum].arg;
			
	_scr(_arg);
}

if inputting {
	//change settings in input mode
	switch _elems[elementNum].elemType {
		
		case MENU_ELEMENT_TYPE.SHIFT: {
			
		} break;
		case MENU_ELEMENT_TYPE.SLIDER: {
			
		} break;
		case MENU_ELEMENT_TYPE.TOGGLE: {
			var _hinput = oInputManager.pressed.right - oInputManager.pressed.left;
			if (_hinput != 0) {
				_elems[elementNum].arg += _hinput;
				_elems[elementNum].arg = clamp(_elems[elementNum].arg, 0,1);		
				_elemScrExecute();
			}
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
	
}

//navigate menu (mouse)
var _mouseHover = false;
if oInputManager.using_mouse {
	with oMenuElementMain {
		
		if sprite_exists(sprite_index) {
			_mouseHover = oInputManager.MouseHoverObjectBool(id);
		} else {
			var _bbox = scribId.get_bbox(strX,strY);
			_mouseHover = oInputManager.MouseHoverRectangle(_bbox.x0, _bbox.y0, _bbox.x3, _bbox.y3);
		}
		
		if _mouseHover {
			if !other.inputting other.elementNum = elementNum;
			break;
		}
		
	}
}
var _mouseClickCheck = mouse_check_button_pressed(mb_any) && !_mouseHover && !inputting;

if (oInputManager.pressed.confirm) && !_mouseClickCheck {
	switch _elems[elementNum].elemType {
		
		case MENU_ELEMENT_TYPE.SCRIPT_RUNNER: {
			_elemScrExecute();
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

if (oInputManager.pressed.cancel) {
	if inputting {
		switch _elems[elementNum].elemType {
			
			case MENU_ELEMENT_TYPE.SHIFT:	inputting = !inputting; break;
			case MENU_ELEMENT_TYPE.SLIDER:	inputting = !inputting; break;
			case MENU_ELEMENT_TYPE.TOGGLE:	inputting = !inputting; break;
			
		}
	} else {
		var _prev = _page.pageNamePrev;
		if is_string(_prev) && (_prev != "") {
			pageName = _prev;
			elementNum = 0;
			PageUpdate();
		}
	}
}