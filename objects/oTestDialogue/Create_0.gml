lineSeq = LINE_SEQ_TEST;
lineNum = 0;
lineTbStyle = global.lineTbStyles.basic;
lineSfx = noone;
lineData = {};

image_alpha = 1;
textW = room_width - 32;

typist = scribble_typist();
typist.in(0.7,0);

DrawLine = function(_x,_y, _str, _wrapW, _font, _col, _alpha){
	
	//setup font name for scribble
	_font = font_get_name(_font);
	
	//setup scribble object
	var _sId = scribble(_str)
		.starting_format(_font, _col)
		.blend(c_white, _alpha)
		.wrap(_wrapW);
	
	//draw scribble object
	_sId.draw(_x,_y);
	
}
DrawLineTypist = function(_x,_y, _str, _wrapW, _font, _col, _alpha){
	
	//setup font name for scribble
	_font = font_get_name(_font);
	
	//setup scribble object
	var _sId = scribble(_str)
		.starting_format(_font, _col)
		.blend(c_white, _alpha)
		.wrap(_wrapW);
	
	//draw scribble object with typist
	_sId.draw(_x,_y, typist);
	
}
	
DialogueProgress();