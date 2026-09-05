lineSeq = LINE_SEQ_TEST1;
lineNum = 0;
lineTbStyle = global.lineTbStyles.basic;
lineSfx = noone;
lineData = {};

image_alpha = 1;
textW = room_width - 32;

typist = scribble_typist();
typist.in(0.7,0);

//scribble_font_bake_outline_and_shadow("fConsol","fConsolBaked",4,4,SCRIBBLE_OUTLINE.EIGHT_DIR_THICK,2,false);
//scribble_font_bake_outline_and_shadow("fComic","fComicBaked",4,4,SCRIBBLE_OUTLINE.EIGHT_DIR_THICK,2,true);

DrawLine = function(_x,_y, _str, _wrapW, _font, _col, _alpha){
	
	//setup font name for scribble
	if !is_string(_font) {
		_font = font_get_name(_font)
	}
	
	//setup scribble object
	var _sId = scribble(_str)
		.starting_format(_font, _col)
		.shadow(c_black,1)
		.outline(c_yellow)
		.sdf_outline(c_yellow,1)
		.sdf_shadow(c_black,1,4,4)
		.blend(c_white, _alpha)
		.wrap(_wrapW);
	
	//draw scribble object
	_sId.draw(_x,_y);
	
}
DrawLineTypist = function(_x,_y, _str, _wrapW, _font, _col, _alpha){
	
	//setup font name for scribble
	if !is_string(_font) {
		_font = font_get_name(_font)
	}
	
	//setup scribble object
	var _sId = scribble(_str)
		.starting_format(_font, _col)
		.shadow(c_black,1)
		.outline(c_yellow)
		.sdf_outline(c_yellow,1)
		.sdf_shadow(c_black,1,4,4)
		.blend(c_white, _alpha)
		.wrap(_wrapW);
	
	//draw scribble object with typist
	_sId.draw(_x,_y, typist);
	
}
	
DialogueProgress();