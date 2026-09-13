var _positionChange = function(_scribId){
	var _spr = sprite_index;
	var _offsetX = 0;
	var _offsetY = 0;
	if sprite_exists(_spr) {
	
		var _sprW = sprite_get_width(_spr);
		var _sprH = sprite_get_height(_spr);
	
		_offsetX = sprite_get_xoffset(_spr) - _sprW/2;
		_offsetY = sprite_get_yoffset(_spr) - _sprH/2;
	
	}

	var _bbox = _scribId.get_bbox(strX,strY);
	x = _bbox.left + _bbox.width/2 + _offsetX;
	y = _bbox.top + _bbox.height/2 + _offsetY;
}

switch elemSubtype {
	
	case MENU_ELEMENT_SUBTYPE.TOGGLE_OFF: {
		scribId = scribble(global.uiData.menuOff).starting_format(FONT_CONSOLE_24, c_white).align(fa_left, fa_middle);
		
		strX = x;
		strY = y;
		_positionChange(scribId);
	} break;
	case MENU_ELEMENT_SUBTYPE.TOGGLE_ON: {
		scribId = scribble(global.uiData.menuOn).starting_format(FONT_CONSOLE_24, c_white).align(fa_left, fa_middle);
		
		strX = x;
		strY = y;
		_positionChange(scribId);
	} break;
	
}