if global.midTransition || global.gamePaused exit;
elementSelectedMain = noone;
elementSelectedSub = noone;


var _page = menuPages[$ pageName];
var _elems = _page.elements;
var _elemsL = array_length(_elems);

//execute a script from element data with set argument(s)
var _elemScrExecute = function() {
	var _scr = menuPages[$ pageName].elements[elementNum].scr;
	var _arg = menuPages[$ pageName].elements[elementNum].arg;
			
	_scr(_arg);
}

//keyboard and gamepad logic
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
			}
		} break;
		
	}
	
} else {
	//navigate menu
	var _pressVer = oInputManager.pressed.down - oInputManager.pressed.up;
	if (_pressVer != 0) {
		elementNum += _pressVer;
		if (elementNum > _elemsL-1)	{ elementNum = 0;			}
		if (elementNum < 0)			{ elementNum = _elemsL-1;	}
	}
	
}

//check for menu element id when hovering with a mouse (must be called from within object itself)
var _elemMouseHoverGet = function(_id){
	with _id {
		if sprite_exists(sprite_index) {
			return oInputManager.MouseHoverObjectId(id, false);
		} else {
			if !variable_instance_exists(id, "scribId") return noone;
			
			var _bbox = scribId.get_bbox(strX,strY);
			if oInputManager.MouseHoverRectangle(_bbox.x0, _bbox.y0, _bbox.x3, _bbox.y3, false) return id;
		}
		return noone;
	}
}

//mouse logic
var _mouseElementMain = noone;
var _mouseElementSub = noone;
with oMenuElementMain {
	
	_mouseElementMain = _elemMouseHoverGet(id);
	if instance_exists(_mouseElementMain) {
		if !other.inputting other.elementNum = elementNum;
		break;
	}
	
}
with oMenuElementSub {
	
	_mouseElementSub = _elemMouseHoverGet(id);
	if instance_exists(_mouseElementSub) {
		switch elemSubtype {
			case MENU_ELEMENT_SUBTYPE.TOGGLE_OFF:	other.elementSelectedSub = _mouseElementSub; break;
			case MENU_ELEMENT_SUBTYPE.TOGGLE_ON:	other.elementSelectedSub = _mouseElementSub; break;
		}
		break;
	}
	
}


elementSelectedMain = struct_get(_elems[elementNum], "elemId") ?? noone;
if (oInputManager.pressed.confirm) {
	
	var _mouseClicked = mouse_check_button_pressed(mb_any);
	var _triggerMain = !(_mouseClicked && !instance_exists(_mouseElementMain) && !inputting);	//DO NOT trigger if mouse clicked on empty space in room while not inputting
	var _triggerSub = _mouseClicked && instance_exists(_mouseElementSub);						//DO trigger if clicked on sub element
	
	//triggered by keyboard + gamepad + mouse
	if _triggerMain {
		switch _elems[elementNum].elemType {
		
			case MENU_ELEMENT_TYPE.SCRIPT_RUNNER: {
				_elemScrExecute();
			} break;
		
			case MENU_ELEMENT_TYPE.PAGE_TRANSFER: {
				pageName = _elems[elementNum].pageName;
				elementNum = 0;
				PageUpdate();
			} break;
		
			case MENU_ELEMENT_TYPE.SHIFT:	_elemScrExecute(); inputting = !inputting; break;
			case MENU_ELEMENT_TYPE.SLIDER:	_elemScrExecute(); inputting = !inputting; break;
			case MENU_ELEMENT_TYPE.TOGGLE:	_elemScrExecute(); inputting = !inputting; break;
		
		}
	}
	
	//triggered by only mouse
	if _triggerSub {
		switch _mouseElementSub.elemSubtype {
		
			case MENU_ELEMENT_SUBTYPE.TOGGLE_OFF: {
				elementNum = _mouseElementSub.elementNum;
				_elems[elementNum].arg = 0;
				_elemScrExecute();
			} break;
			case MENU_ELEMENT_SUBTYPE.TOGGLE_ON: {
				elementNum = _mouseElementSub.elementNum;
				_elems[elementNum].arg = 1;
				_elemScrExecute();
			} break;
		
		}
	}
}
if (oInputManager.pressed.cancel) {
	if inputting {
		switch _elems[elementNum].elemType {
			
			case MENU_ELEMENT_TYPE.SHIFT:	_elemScrExecute(); inputting = !inputting; break;
			case MENU_ELEMENT_TYPE.SLIDER:	_elemScrExecute(); inputting = !inputting; break;
			case MENU_ELEMENT_TYPE.TOGGLE:	_elemScrExecute(); inputting = !inputting; break;
			
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