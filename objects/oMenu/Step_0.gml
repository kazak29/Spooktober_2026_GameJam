if global.midTransition exit;
if oInputManager.mouse.released.left mouseClickLock = false;
ElemSelectReset();

var _mouseClickLockCheck = true;
var _sfx = "none";

var _data = global.dataMenu[$ menuName];
var _elems = _data.elements;
var _elemsL = array_length(_elems);

#region selecting main element
	
	//discret navigation for main elements
	var _pressVer = oInputManager.pressed.down - oInputManager.pressed.up;
	if (_pressVer != 0) {
		num += _pressVer;
		if (num > _elemsL-1)	{ num = 0;			}
		if (num < 0)			{ num = _elemsL-1;	}
		
		_sfx = "hover";
	}
	
	//mouse navigation for main elements
	with oMenuElementMain {

		if uiMouseCollision(id) {
			if other.num != num _sfx = "hover";
			
			other.num = num;
			other.main.hover = true;
			break;
		}
	
	}
	
	main.elemId = struct_get(_elems[num], "elemId") ?? noone;
	
#endregion
#region selecting sub element
	
	//mouse navigation for sub elements
	with oMenuElementSub {
		
		if uiMouseCollision(id) {
			if (hoverCd <= 0) _sfx = "hover";
			hoverCd = other.sub.hoverCdMax;
			
			other.sub.elemId = id;
			other.sub.hover = true;
			
			other.num = num;
			other.main.elemId = struct_get(_elems[num], "elemId") ?? noone;
			break;
		}
	
	}
	
#endregion


//inputs
var _pressedMain	= oInputManager.pressed.confirm  || (oInputManager.mouse.pressed.left && main.hover);
var _pressedSub		= oInputManager.mouse.pressed.left && sub.hover;
var _heldSub		= oInputManager.mouse.held.left && sub.hover && !mouseClickLock;

//main element confirm logic
if instance_exists(main.elemId) {
	var _elemData = _elems[num];
	switch _elemData.elemType {
	
		case MENU_ELEMENT_TYPE.SCRIPT_RUNNER: {
			if _pressedMain {
				var _scr = _elemData[$"scr"] ?? noone;
				var _arg = _elemData[$"arg"] ?? noone;
		
				if script_exists(_scr) _scr(_arg);
				_sfx = "click";
			}
		} break;
		
		case MENU_ELEMENT_TYPE.PAGE_TRANSFER: {
			if _pressedMain {
				MenuCreate(_elemData.menuName);
				_sfx = "click";
			}
		} break;
		
		case MENU_ELEMENT_TYPE.BACK: {
			if _pressedMain {
				MenuCreate(menuNamePrev);
				_sfx = "click";
			}
		} break;
	
		case MENU_ELEMENT_TYPE.TOGGLE: {
			var _hinput = oInputManager.pressed.right - oInputManager.pressed.left;
			if _pressedMain _hinput = _elemData.arg ? -1 : 1;
			
			if (_hinput != 0) {
				
				_elemData.arg += _hinput;
				_elemData.arg = clamp(_elemData.arg, 0,1);
				MenuSettingSet(_elemData);
				_sfx = "click";
			
			}
		} break;
	
		case MENU_ELEMENT_TYPE.SHIFT: {
			var _hinput = oInputManager.pressed.right - oInputManager.pressed.left;
			if _pressedMain _hinput = 1;
			
			if (_hinput != 0) {
				
				_elemData.arg += _hinput;
				var _argMax = array_length(_elemData.argTitles) - 1;
				if (_elemData.arg > _argMax)	_elemData.arg = 0;
				if (_elemData.arg < 0)			_elemData.arg = _argMax;
				
				MenuUpdateShift(_elemData);
				MenuSettingSet(_elemData);
				_sfx = "click";
				
			}
		} break;
		
		case MENU_ELEMENT_TYPE.SLIDER: {
			var _hinput = oInputManager.held.right - oInputManager.held.left;
			if (_hinput != 0) {
				
				if _elemData.whole {
					_hinput = oInputManager.pressed.right - oInputManager.pressed.left;
					_elemData.arg = round(_elemData.arg + _hinput);
				} else {
					_elemData.arg += _hinput*((_elemData.argClamp[1] - _elemData.argClamp[0])/200);//*0.005;
				}		
				_elemData.arg = clamp(_elemData.arg, _elemData.argClamp[0], _elemData.argClamp[1]);
				MenuSettingSet(_elemData);
				
			}
		} break;
		
	}
}


//sub element confirm logic
if instance_exists(sub.elemId) {
	var _elemData = _elems[num];
	switch _elemData.elemType {
	
		case MENU_ELEMENT_TYPE.TOGGLE: {
			if _pressedSub {
				
				num = sub.elemId.num;
				
				_elemData.arg = sub.elemId.side;
				MenuSettingSet(_elemData);
				
				_sfx = "click";
			
			}
		} break;
	
		case MENU_ELEMENT_TYPE.SHIFT: {
			if _pressedSub {
			
				num = sub.elemId.num;
				
				switch sub.elemId.side {
					case 0: _elemData.arg--; break;
					case 2: _elemData.arg++; break;
				}
				
				//do not run when clicked on center
				if sub.elemId.side != 1 {
				
					var _argMax = array_length(_elemData.argTitles) - 1;
					if (_elemData.arg > _argMax)	_elemData.arg = 0;
					if (_elemData.arg < 0)			_elemData.arg = _argMax;
				
					MenuUpdateShift(_elemData);
					MenuSettingSet(_elemData);
					_sfx = "click";
					
				}
			
			}
		} break;
		
		case MENU_ELEMENT_TYPE.SLIDER: {
			if _heldSub && !sub.elemId.percent {
				_mouseClickLockCheck = false;
				
				num = sub.elemId.num;
				
				//get what percentage mouse position is hovering at (from 0 to 1)
				var _perc = 0;
				with sub.elemId {
					var _mX = clamp(oInputManager.mouse.x, bbox_left + bufferX, bbox_right - bufferX);
					_perc = (_mX - (bbox_left + bufferX))/(sprite_width - bufferX*2);
				}
				
				//calculate correct argument from percentage (we can set argClamp to be between different numbers, not just from 0 to 1)
				_elemData.arg = ((_elemData.argClamp[1] - _elemData.argClamp[0]) * _perc) + _elemData.argClamp[0];
				_elemData.arg = _elemData.whole ? round(_elemData.arg) : _elemData.arg;
				
				_elemData.arg = clamp(_elemData.arg, _elemData.argClamp[0], _elemData.argClamp[1]);
				MenuSettingSet(_elemData);
			}
		} break;
		
	}
}

//cancel logic
if (oInputManager.pressed.cancel || oInputManager.mouse.pressed.right) {
	
	switch menuName {
		default:				{ if (is_string(menuNamePrev) && menuNamePrev != "") MenuCreate(menuNamePrev);	} break;
		case "pauseSettings":	{ uiButtonSettings();															} break;
	}
	
	_sfx = "click";
}


switch _sfx {
	case "hover": uiSfxPlayHover(); break;
	case "click": uiSfxPlayClick(); break;
}
	
if (oInputManager.mouse.held.any && _mouseClickLockCheck) mouseClickLock = true;

//son
switch menuName {
	case "titleSettings": _elems[0].arg = window_get_fullscreen(); break;
	case "pauseSettings": _elems[0].arg = window_get_fullscreen(); break;
}

//lock input for anything else
with oInputManager InputReset();