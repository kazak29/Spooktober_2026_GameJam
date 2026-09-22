event_inherited();

//side: 0 - left, 1 - center, 2 - right
/*
PositionUpdate = function(){
	switch side {
		case 0: {
			
			var _centerId = mainId.subIds[1];
			if sprite_exists(_centerId.sprite_index) {
				strX = _centerId.bbox_left - mainId.bufferX;
				strY = _centerId.strY;
			} else {
				var _bbox = _centerId.scribId.get_bbox(_centerId.strX, _centerId.strY);
				strX = _bbox.left - mainId.bufferX/2;
				strY = _centerId.strY;
			}
			uiElementPositionUpdate();
			
		} break;
		case 2: {
			
			var _centerId = mainId.subIds[1];
			if sprite_exists(_centerId.sprite_index) {
				strX = _centerId.bbox_right + mainId.bufferX;
				strY = _centerId.strY;
			} else {
				var _bbox = _centerId.scribId.get_bbox(_centerId.strX, _centerId.strY);
				strX = _bbox.right + mainId.bufferX/2;
				strY = _centerId.strY;
			}
			uiElementPositionUpdate();
			
		} break;
	}
}
*/
TextUpdate = function(){
	if side == 1 {
		var _text = elementData.argTitles[elementData.arg];
		scribId = scribble(_text, "shift").starting_format(strFont, c_white).align(fa_center, fa_middle);
		
		//do NOT update string position
		//uiElementPositionUpdate();
	}
}


//set first time text
strX = x;
strY = y;
switch side {
	case 0: {
		scribId = scribble("<<", "shift").starting_format(strFont, c_white).align(fa_left, fa_middle);
	} break;
	case 1: {
		var _text = elementData.argTitles[elementData.arg];
		scribId = scribble(_text, "shift").starting_format(strFont, c_white).align(fa_center, fa_middle);
	} break;
	case 2: {
		scribId = scribble(">>", "shift").starting_format(strFont, c_white).align(fa_left, fa_middle);
	} break;
}
//uiElementPositionUpdate();