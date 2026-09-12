if global.midTransition || global.gamePaused exit;

var _page = menuPages[$ pageName];
var _elems = _page.elements;
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
	with oInputManager {
		var _id = noone;
		if sprite_exists(_page.elemSpr) {
			
			_id = MouseHoverObjectId(oMenuElement);
			
		} else {
			
			with oMenuElement {
				var _bbox = scribId.get_bbox(strX,strY);
				if other.MouseHoverRectangle(_bbox.x0, _bbox.y0, _bbox.x3, _bbox.y3) _id = id;
			}
			
		}
		if instance_exists(_id) other.elementNum = _id.elementNum;
	}
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