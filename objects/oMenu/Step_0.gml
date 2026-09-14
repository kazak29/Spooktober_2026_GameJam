if global.midTransition || global.gamePaused exit;
elementSelectedMain = noone;
elementSelectedSub = noone;
mouseHoverMain = false;
mouseHoverSub = false;

#region small repeating scripts
	
	//execute a script from element data with set argument(s)
	var _elemScrExecute = function(_elemData) {
		var _scr = _elemData.scr;
		var _arg = _elemData.arg;
			
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
	
#endregion

var _page = menuPages[$ pageName];
var _elems = _page.elements;
var _elemsL = array_length(_elems);

#region selecting main element
	
	//discret navigation for main elements
	var _pressVer = oInputManager.pressed.down - oInputManager.pressed.up;
	if (_pressVer != 0) {
		elementNum += _pressVer;
		if (elementNum > _elemsL-1)	{ elementNum = 0;			}
		if (elementNum < 0)			{ elementNum = _elemsL-1;	}
	}
	
	//mouse navigation for main elements
	with oMenuElementMain {

		if _elemMouseHoverGet(id) {
			other.mouseHoverMain = true;
			other.elementNum = elementNum;
			break;
		}
	
	}
	
	elementSelectedMain = struct_get(_elems[elementNum], "elemId") ?? noone;
	
#endregion
#region selecting sub element
	
	//discrete navigation for sub element
	if instance_exists(elementSelectedMain) {
		
		var _subIds = elementSelectedMain.subIds;
		var _elem = _elems[elementNum];
	
		switch _elem.elemType {
			case MENU_ELEMENT_TYPE.TOGGLE: {
				elementSelectedSub = _subIds[_elem.arg];
			} break;
		}
		
	}
	
	//mouse navigation for sub elements
	with oMenuElementSub {
		
		if _elemMouseHoverGet(id) {
			other.mouseHoverSub = true;
			other.elementSelectedSub = id;
			break;
		}
	
	}
	
#endregion

//inputs
var _confirm		= oInputManager.pressed.confirm;
var _mouseClick		= mouse_check_button_pressed(mb_any);
var _mouseMain		= _confirm && mouseHoverMain;
var _mouseSub		= _confirm && mouseHoverSub;
var _mouseEmpty		= _mouseClick && !mouseHoverMain && !mouseHoverSub;	//clicked empty space on screen

//main element confirm logic
if instance_exists(elementSelectedMain) {
	var _elemData = elementSelectedMain.elementData;
	switch _elemData.elemType {
	
		case MENU_ELEMENT_TYPE.SCRIPT_RUNNER: {
			if (_confirm && !_mouseEmpty && !_mouseSub) {
				_elemScrExecute(_elemData);
			}
		} break;
		
		case MENU_ELEMENT_TYPE.PAGE_TRANSFER: {
			if (_confirm && !_mouseEmpty && !_mouseSub) {
				pageName = _elemData.pageName;
				elementNum = 0;
				PageUpdate();
			}
		} break;
	
		case MENU_ELEMENT_TYPE.TOGGLE: {
			var _hinput = oInputManager.pressed.right - oInputManager.pressed.left;
			if (_hinput != 0) {
				
				_elemData.arg += _hinput;
				_elemData.arg = clamp(_elemData.arg, 0,1);
				_elemScrExecute(_elemData);
			
			}
		} break;
	
		case MENU_ELEMENT_TYPE.SHIFT: {
			var _hinput = oInputManager.pressed.right - oInputManager.pressed.left;
			if (_hinput != 0) {
				
				_elemData.arg += _hinput;
				var _argMax = array_length(_elemData.argTitles) - 1;
				if (_elemData.arg > _argMax)	_elemData.arg = 0;
				if (_elemData.arg < 0)			_elemData.arg = _argMax;
				
				with elementSelectedMain UpdateShift();
				_elemScrExecute(_elemData);
				
			}
		} break;
		case MENU_ELEMENT_TYPE.SLIDER: {
			
		} break;
		
	}
}


//sub element confirm logic
if instance_exists(elementSelectedSub) {
	var _elemData = elementSelectedSub.elementData;
	switch _elemData.elemType {
	
		case MENU_ELEMENT_TYPE.TOGGLE: {
			if _mouseSub {
			
				elementNum = elementSelectedSub.elementNum;
				elementSelectedMain = elementSelectedSub.mainId;
			
				_elemData.arg = elementSelectedSub.side;
				_elemScrExecute(_elemData);
			
			}
		} break;
	
		case MENU_ELEMENT_TYPE.SHIFT: {
			if _mouseSub {
			
				elementNum = elementSelectedSub.elementNum;
				elementSelectedMain = elementSelectedSub.mainId;
				
				switch elementSelectedSub.side {
					case 0: _elemData.arg--; break;
					case 2: _elemData.arg++; break;
				}
				
				//do not run when clicked on center
				if elementSelectedSub.side != 1 {
				
					var _argMax = array_length(_elemData.argTitles) - 1;
					if (_elemData.arg > _argMax)	_elemData.arg = 0;
					if (_elemData.arg < 0)			_elemData.arg = _argMax;
				
					with elementSelectedSub.mainId UpdateShift();
					_elemScrExecute(_elemData);
					
				}
			
			}
		} break;
		case MENU_ELEMENT_TYPE.SLIDER: {
			
		} break;
		
	}
}

//cancel logic
if (oInputManager.pressed.cancel) {
	var _prev = _page.pageNamePrev;
	if is_string(_prev) && (_prev != "") {
		pageName = _prev;
		elementNum = 0;
		PageUpdate();
	}
}

//son
menuPages.settings.elements[0].arg = window_get_fullscreen();