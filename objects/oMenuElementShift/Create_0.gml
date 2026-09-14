event_inherited();

//side: 0 - left, 1 - center, 2 - right
PositionUpdate = function(){
	switch side {
		case 0: {
			
			var _centerId = mainId.subIds[1];
			if sprite_exists(_centerId.sprite_index) {
				strX = _centerId.bbox_left - MENU_BUFFER_X;
				strY = _centerId.strY;
			} else {
				var _bbox = _centerId.scribId.get_bbox(_centerId.strX, _centerId.strY);
				strX = _bbox.left - MENU_BUFFER_X/2;
				strY = _centerId.strY;
			}
			MenuSubElementUpdateGeneralPosition(scribId, sprite_index);
			
		} break;
		case 2: {
			
			var _centerId = mainId.subIds[1];
			if sprite_exists(_centerId.sprite_index) {
				strX = _centerId.bbox_right + MENU_BUFFER_X;
				strY = _centerId.strY;
			} else {
				var _bbox = _centerId.scribId.get_bbox(_centerId.strX, _centerId.strY);
				strX = _bbox.right + MENU_BUFFER_X/2;
				strY = _centerId.strY;
			}
			MenuSubElementUpdateGeneralPosition(scribId, sprite_index);
			
		} break;
	}
}
TextUpdate = function(){
	if side == 1 {
		var _text = elementData.argTitles[elementData.arg];
		scribId = scribble(_text).starting_format(MENU_FONT, c_white).align(fa_center, fa_middle);
		
		//do NOT update string position
		MenuSubElementUpdateGeneralPosition(scribId, sprite_index);
	}
}


//set first time text
switch side {
	case 0: {
		scribId = scribble("<<").starting_format(MENU_FONT, c_white).align(fa_right, fa_middle);
	} break;
	case 1: {
		var _text = elementData.argTitles[elementData.arg];
		scribId = scribble(_text).starting_format(MENU_FONT, c_white).align(fa_center, fa_middle);
		
		strX = x;
		strY = y;
		MenuSubElementUpdateGeneralPosition(scribId, sprite_index);
	} break;
	case 2: {
		scribId = scribble(">>").starting_format(MENU_FONT, c_white).align(fa_left, fa_middle);
	} break;
}