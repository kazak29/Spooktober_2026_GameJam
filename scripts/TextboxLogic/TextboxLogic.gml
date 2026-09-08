//compare new style to currently present textbox
function TextboxCompare(_styleNew){
	
	//true = same, false = different
	var _result = false;
	
	//check if previous textbox present
	if !instance_exists(global.tbId) return _result;
	
	//check if styles match
	var _styleOld = global.tbId.tbStyle;
	if (_styleOld == _styleNew) _result = true;
	
	//return bool
	return _result;
	
}

//create a new textbox (replaces current textbox id)
function TextboxCreate(_dataTbStyle){
	
	//setup textbox position
	var _x = _dataTbStyle.x;
	var _y = _dataTbStyle.y;
	
	//create a textbox
	var _tb = instance_create_layer(_x,_y, "Textbox", oTextbox, _dataTbStyle);
	with _tb {
		
		//save style struct (to compare to later)
		tbStyle = _dataTbStyle;
		
	}
	
	//save textbox id
	global.tbId = _tb;
	
}

//set title for textbox
function TextboxTitleSet(_text){
		
	//remove previous title
	with titleId instance_destroy();
		
	//check if title necessary
	if (!is_string(_text) || _text == "") exit;
		
	//create a title object
	titleId = instance_create_layer(x,y, "Textbox", oTextboxTitle, tbStyle.title);
	with titleId {
			
		//set depth
		depth = other.depth - 1;
			
		//set displayed text
		textStr = _text;
			
		//get scribble instance for text and its params
		var _scribId = TextScribGet();
		var _w = _scribId.get_right() + textX*2;
		var _h = _scribId.get_bottom() + textY*2;
			
		//change scale
		image_xscale = _w/sprite_get_width(sprite_index);
		image_yscale = _h/sprite_get_height(sprite_index);
		
		//update position relative to set enum
		TextboxTitlePositionSet();
			
	}
	
}

//set textbox title position (adds to pre-set position shift in textbox data)
function TextboxTitlePositionSet(){
	
	//change position
	switch shiftPos {
		case TB_TITLE_POS.ABOVE_TOP_LEFT: {
			shiftY -= sprite_height + 4;
			shiftX += 0;
		} break;
		case TB_TITLE_POS.ABOVE_TOP_RIGHT: {
			shiftY -= sprite_height + 4;
			shiftX += global.tbId.sprite_width - sprite_width;
		} break;
		case TB_TITLE_POS.INSIDE_TOP_LEFT: {
			shiftY -= sprite_height/2;
			shiftX += 0;
		} break;
		case TB_TITLE_POS.INSIDE_TOP_RIGHT: {
			shiftY -= sprite_height/2;
			shiftX += global.tbId.sprite_width - sprite_width;
		} break;
	}
	
	//update position
	x += shiftX;
	y += shiftY;
	
}