if global.midTransition || global.gamePaused exit;
elementSelectedMain = noone;
elementSelectedSub = noone;

#region small repeating scripts
	
	//execute a script from element data with set argument(s)
	var _elemScrExecute = function() {
		var _scr = menuPages[$ pageName].elements[elementNum].scr;
		var _arg = menuPages[$ pageName].elements[elementNum].arg;
			
		_scr(_arg);
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
	
	//change shift argument
	var _shiftArgChange = function(_val){
		var _elem = menuPages[$ pageName].elements[elementNum];
		_elem.arg += _val;
				
		//cycle when out of bounds
		var _argMax = array_length(_elem.argTitles);
		if (_elem.arg > _argMax)	_elem.arg = 0;
		if (_elem.arg < 0)			_elem.arg = _argMax;
	}
	
#endregion

var _page = menuPages[$ pageName];
var _elems = _page.elements;
var _elemsL = array_length(_elems);

//keyboard and gamepad logic
if inputting {
	//change settings in input mode
	switch _elems[elementNum].elemType {
		
		case MENU_ELEMENT_TYPE.TOGGLE: {
			var _hinput = oInputManager.pressed.right - oInputManager.pressed.left;
			if (_hinput != 0) {
				_elems[elementNum].arg += _hinput;
				_elems[elementNum].arg = clamp(_elems[elementNum].arg, 0,1);
			}
		} break;
		case MENU_ELEMENT_TYPE.SHIFT: {
			var _hinput = oInputManager.pressed.right - oInputManager.pressed.left;
			if (_hinput != 0) _shiftArgChange(_hinput);
		} break;
		case MENU_ELEMENT_TYPE.SLIDER: {
			
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
			case MENU_ELEMENT_SUBTYPE.SHIFT_LEFT:	other.elementSelectedSub = _mouseElementSub; break;
			case MENU_ELEMENT_SUBTYPE.SHIFT_RIGHT:	other.elementSelectedSub = _mouseElementSub; break;
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
	if _triggerMain && !_triggerSub {
		switch _elems[elementNum].elemType {
		
			case MENU_ELEMENT_TYPE.SCRIPT_RUNNER: {
				_elemScrExecute();
			} break;
		
			case MENU_ELEMENT_TYPE.PAGE_TRANSFER: {
				pageName = _elems[elementNum].pageName;
				elementNum = 0;
				PageUpdate();
			} break;
			
			case MENU_ELEMENT_TYPE.TOGGLE:	_elemScrExecute(); inputting = !inputting; break;
			case MENU_ELEMENT_TYPE.SHIFT:	_elemScrExecute(); inputting = !inputting; break;
			case MENU_ELEMENT_TYPE.SLIDER:	_elemScrExecute(); inputting = !inputting; break;
		
		}
	}
	
	//triggered by only mouse
	if _triggerSub {
		inputting = false;
		elementNum = _mouseElementSub.elementNum;
		switch _mouseElementSub.elemSubtype {
		
			case MENU_ELEMENT_SUBTYPE.TOGGLE_OFF: {
				_elems[elementNum].arg = 0;
				_elemScrExecute();
			} break;
			case MENU_ELEMENT_SUBTYPE.TOGGLE_ON: {
				_elems[elementNum].arg = 1;
				_elemScrExecute();
			} break;
			
			case MENU_ELEMENT_SUBTYPE.SHIFT_LEFT: {
				_shiftArgChange(-1);
				_elemScrExecute();
			} break;
			case MENU_ELEMENT_SUBTYPE.SHIFT_RIGHT: {
				_shiftArgChange(1);
				_elemScrExecute();
			} break;
		
		}
	}
}
if (oInputManager.pressed.cancel) {
	if inputting {
		switch _elems[elementNum].elemType {
			
			case MENU_ELEMENT_TYPE.TOGGLE:	_elemScrExecute(); inputting = !inputting; break;
			case MENU_ELEMENT_TYPE.SHIFT:	_elemScrExecute(); inputting = !inputting; break;
			case MENU_ELEMENT_TYPE.SLIDER:	_elemScrExecute(); inputting = !inputting; break;
			
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