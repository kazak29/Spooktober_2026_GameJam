#region general
	
	//position change based on whether a sprite is used or not
	function MenuSubElementUpdateGeneralPosition(_scribId, _spr = noone){
		var _offsetX = 0;
		var _offsetY = 0;
		if sprite_exists(_spr) {
			sprite_index = _spr;
			
			var _sprW = sprite_get_width(_spr);
			var _sprH = sprite_get_height(_spr);
	
			_offsetX = sprite_get_xoffset(_spr) - _sprW/2;
			_offsetY = sprite_get_yoffset(_spr) - _sprH/2;
	
		}

		var _bbox = _scribId.get_bbox(strX,strY);
		x = _bbox.left + _bbox.width/2 + _offsetX;
		y = _bbox.top + _bbox.height/2 + _offsetY;
	}
	
	//update shift elements for menu settings
	function MenuSubElementUpdateShiftSides(_centerNum, _scribId, _spr = noone){
		with oMenuElementSub {
			if (elementNum != _centerNum) continue;
			switch elemSubtype {
				case MENU_ELEMENT_SUBTYPE.SHIFT_LEFT: {
					
					
					
				} break;
				case MENU_ELEMENT_SUBTYPE.SHIFT_RIGHT: {
					
				} break;
			}
		}
	}
	
	//update shift elements for menu settings
	function MenuSubElementUpdateShift(){
		with oMenuElementSub {
			if elemSubtype == MENU_ELEMENT_SUBTYPE.SHIFT_CENTER {
				if !instance_exists(elemId) exit;
				
				strX = elemId.strX + MENU_BUFFER_X*2;
				strY = elemId.strY;
				
				var _title = elem.argTitles[elem.arg];
				scribId = scribble(_title).starting_format(FONT_CONSOLE_24, c_white).align(fa_left, fa_middle);
				
				MenuSubElementUpdateGeneralPosition(scribId, sprite_index);
				MenuSubElementUpdateShiftSides(elementNum, scribId, sprite_index);
			}
		}
	}
	
#endregion
#region triggers set into buttons
	function MenuTransitionStart(_arg){
		var _al = array_length(_arg);
		if (_al < 3) show_debug_message("MENU TRANSITION DATA MISSING");
	
		TransitionStart(_arg[0], _arg[1], _arg[2]);
	}

	function MenuFullscreen(_arg){
		window_set_fullscreen(_arg);
	}

	function MenuLanguage(_arg){
	
	}
#endregion