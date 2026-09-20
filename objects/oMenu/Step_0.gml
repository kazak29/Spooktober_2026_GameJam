if global.midTransition exit;
elementSelectedMain = noone;
elementSelectedSub = noone;
mouseHoverMain = false;
mouseHoverSub = false;

if oInputManager.mouse.released.left mouseClickLock = false;
var _mouseClickLockCheck = true;
var _sfx = "none";

#region repeating scripts
	
	//execute a script from element data with set argument(s)
	var _elemScrExecute = function(_elemData) {
		var _scr = _elemData[$"scr"] ?? noone;
		var _arg = _elemData[$"arg"] ?? noone;
		
		if script_exists(_scr) _scr(_arg);
	}
	
	//execute settings script from element data
	var _elemSettingSet = function(_elemData) {
		var _arg		= _elemData[$"arg"];
		var _varName	= _elemData[$"varName"];
		
		if !is_string(_varName) {
			show_debug_message("settings variable name is not set properly YOU FOOL");
			exit;
		}
		
		if variable_global_exists(_varName) {
			variable_global_set(_varName, _arg);
			
			//additional triggers
			switch _varName {
				case "volMusic": {
					VolumeUpdateAmbient();
				} break;
				
				case "volSound": {
					VolumeUpdateAmbient();
					
					if menuType == MENU_TYPE_TITLE && !audio_is_playing(sfxTypewriterDefault)
					{ SoundPlay(sfxTypewriterDefault, 50); }
				} break;
				
				case "volTypeWriter": {
					VolumeUpdateAmbient();
					with oDirector TypewriterSoundPlay();
					
					if menuType == MENU_TYPE_TITLE && !audio_is_playing(sfxTypewriterSpook)
					{ SoundPlay(sfxTypewriterSpook, 50, false, global.volTypeWriter); }
				} break;
				
			}
			
		} else {
			
			//special vars
			switch _varName {
				default: {
					
					//nested struct variables
					var _varParts = string_split(_varName, ".");
					var _al = array_length(_varParts)
					if _al > 0 && variable_global_exists(_varParts[0]) {
						
						var _nestedArg = variable_global_get(_varParts[0]);
						for (var i = 1; i < _al - 1; i++) {
							_nestedArg = _nestedArg[$ _varParts[i]];
						}
						
						_nestedArg[$ _varParts[_al - 1]] = _arg;
						
					}
					
				} break;
				
				case "fullscreen": {
					window_set_fullscreen(_arg);
				} break;
			}
			
		}
	}
	
	//check for menu element id when hovering with a mouse
	var _elemMouseHoverGet = function(_id){
		//special collision
		with _id {
			if (object_get_parent(object_index) == oMenuElementSub) && (elementData.elemType == MENU_ELEMENT_TYPE.SLIDER) {
				var _scale = (image_xscale+image_yscale)/2;
				
				var _x1 = bbox_left		- 64*_scale;
				var _x2 = bbox_right	+ 64*_scale;
				var _y1 = bbox_top		- 24*_scale;
				var _y2 = bbox_bottom	+ 24*_scale;
					
				return oInputManager.MouseHoverRectangle(_x1,_y1, _x2,_y2);
			}
		}
		//regular collision
		return uiMouseCollision(_id);
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
		_sfx = "hover";
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
	
	//mouse hover sfx
	with elementSelectedMain {
		if (hoverCd <= 0) && other.mouseHoverMain _sfx = "hover";
		hoverCd = other.mouseHoverCdMax;
	}
	
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
			case MENU_ELEMENT_TYPE.SLIDER: {
				elementSelectedSub = _subIds[0];
			} break;
		}
		//shift element highlites whole
		
	}
	
	//mouse navigation for sub elements
	with oMenuElementSub {
		
		if _elemMouseHoverGet(id) {
			other.mouseHoverSub = true;
			other.elementSelectedSub = id;
			break;
		}
	
	}
	
	//mouse hover sfx
	with elementSelectedSub {
		if (hoverCd <= 0) && other.mouseHoverSub _sfx = "hover";
		hoverCd = other.mouseHoverCdMax;
	}
	
#endregion


//inputs
var _mouseEmpty	= !mouseHoverMain && !mouseHoverSub;	//hovering empty space on screen
var _pressedMain = oInputManager.pressed.confirm  || (oInputManager.mouse.pressed.left && !mouseHoverSub && !_mouseEmpty);
var _pressedSub	= oInputManager.mouse.pressed.left && mouseHoverSub;
var _heldSub	= oInputManager.mouse.held.left && mouseHoverSub && !mouseClickLock;

//main element confirm logic
if instance_exists(elementSelectedMain) {
	var _elemData = elementSelectedMain.elementData;
	switch _elemData.elemType {
	
		case MENU_ELEMENT_TYPE.SCRIPT_RUNNER: {
			if _pressedMain {
				_elemScrExecute(_elemData);
				_sfx = "click";
			}
		} break;
		
		case MENU_ELEMENT_TYPE.PAGE_TRANSFER: {
			if _pressedMain {
				pageName = _elemData.pageName;
				elementNum = 0;
				PageUpdate();
				_sfx = "click";
			}
		} break;
	
		case MENU_ELEMENT_TYPE.TOGGLE: {
			var _hinput = oInputManager.pressed.right - oInputManager.pressed.left;
			if _pressedMain _hinput = _elemData.arg ? -1 : 1;
			
			if (_hinput != 0) {
				
				_elemData.arg += _hinput;
				_elemData.arg = clamp(_elemData.arg, 0,1);
				_elemSettingSet(_elemData);
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
				
				with elementSelectedMain UpdateShift();
				_elemSettingSet(_elemData);
				_sfx = "click";
				
			}
		} break;
		
		case MENU_ELEMENT_TYPE.SLIDER: {
			var _hinput = oInputManager.held.right - oInputManager.held.left;
			if (_hinput != 0) {
				
				_elemData.arg += _hinput*0.005;
				_elemData.arg = clamp(_elemData.arg, _elemData.argClamp[0], _elemData.argClamp[1]);
				_elemSettingSet(_elemData);
				
			}
		} break;
		
	}
}


//sub element confirm logic
if instance_exists(elementSelectedSub) {
	var _elemData = elementSelectedSub.elementData;
	switch _elemData.elemType {
	
		case MENU_ELEMENT_TYPE.TOGGLE: {
			if _pressedSub {
			
				elementNum = elementSelectedSub.elementNum;
				elementSelectedMain = elementSelectedSub.mainId;
			
				_elemData.arg = elementSelectedSub.side;
				_elemSettingSet(_elemData);
				_sfx = "click";
			
			}
		} break;
	
		case MENU_ELEMENT_TYPE.SHIFT: {
			if _pressedSub {
			
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
					_elemSettingSet(_elemData);
					_sfx = "click";
					
				}
			
			}
		} break;
		
		case MENU_ELEMENT_TYPE.SLIDER: {
			if _heldSub {
				_mouseClickLockCheck = false;
				
				elementNum = elementSelectedSub.elementNum;
				elementSelectedMain = elementSelectedSub.mainId;
				
				//get what percentage mouse position is hovering at (from 0 to 1)
				var _perc = 0;
				with elementSelectedSub {
					var _mX = clamp(oInputManager.mouse.x, bbox_left, bbox_right);
					_perc = (_mX - bbox_left)/(bbox_right - bbox_left);
				}
				
				//calculate correct argument from percentage (we can set argClamp to be between different numbers, not just from 0 to 1)
				_elemData.arg = ((_elemData.argClamp[1] - _elemData.argClamp[0]) * _perc) + _elemData.argClamp[0];
				_elemData.arg = clamp(_elemData.arg, _elemData.argClamp[0], _elemData.argClamp[1]);
				_elemSettingSet(_elemData);
			}
		} break;
		
	}
}

//cancel logic
if oInputManager.pressed.cancel || oInputManager.mouse.pressed.right {
	var _prev = _page.pageNamePrev;
	if is_string(_prev) && (_prev != "") {
		pageName = _prev;
		elementNum = 0;
		PageUpdate();
		_sfx = "click";
	}
}


switch _sfx {
	case "hover": uiSfxPlayHover(); break;
	case "click": uiSfxPlayClick(); break;
}
	
if (oInputManager.mouse.held.any && _mouseClickLockCheck) mouseClickLock = true;

//son
switch menuType {
	case MENU_TYPE_TITLE: menuPages.settings.elements[0].arg = window_get_fullscreen(); break;
	case MENU_TYPE_PAUSE: menuPages.main.elements[0].arg = window_get_fullscreen();		break;
}