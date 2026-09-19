event_inherited();

//move from first toggle
if array_length(mainId.subIds) > 0 {
	var _off = mainId.subIds[0];
	
	if sprite_exists(_off.sprite_index) {
		x += _off.sprite_width*1.8;
	} else {
		var _bbox = _off.scribId.get_bbox(_off.strX, _off.strY);
		x += _bbox.width*1.8;
	}
}

var _text = global.uiData.menuOff;
if side _text = global.uiData.menuOn;
scribId = scribble(_text).starting_format(strFont, c_white).align(fa_left, fa_middle);

strX = x;
strY = y;
uiElementPositionUpdate();