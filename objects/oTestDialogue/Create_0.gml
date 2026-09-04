lineSeq = LINE_SEQ_TEST;
lineNum = 0;
lineData = {title: undefined, line: undefined};

image_alpha = 1;
textW = room_width - 32;

typist = scribble_typist();
typist.in(0.7,0);

DrawLineText = function(_x,_y, _data){
	
	//check data
	if (_data == undefined) exit;
	
	//setup vars
	var _strFont, _str, _strCol, _strAlpha, _text, _c, _font;
	
	//move to data
	with _data {
		_str		= str;
		_strFont	= font;
		_strCol		= col;
		_strAlpha	= alpha;
	}
	
	//limit alpha
	_strAlpha = min(_strAlpha, image_alpha);
	
	//setup vars
	_text = _str;
	_c = _strCol;
	if !font_exists(_strFont) _strFont = fConsol;
	_font = font_get_name(_strFont);
	
	//setup scribble object
	var _sId = scribble(_text)
		.starting_format(_font, _c)
		.blend(c_white, _strAlpha)
		.wrap(textW);
	
	//draw the scribble object
	_sId.draw(_x,_y, typist);
	
}
DrawLineTitle = function(_x,_y, _data){
	
	//check data
	if (_data == undefined) exit;
	
	//setup vars
	var _posMod, _strFont, _str, _strCol, _strAlpha, _text, _c, _font;
	
	//move to data
	with _data {
		_str		= str;
		_strFont	= font;
		_strCol		= col;
		_strAlpha	= alpha;
	}
	
	//limit alpha
	_strAlpha = min(_strAlpha, image_alpha);
	
	//setup vars
	_text = _str;
	_c = _strCol;
	if !font_exists(_strFont) _strFont = fConsol;
	_font = font_get_name(_strFont);
	
	//draw with scribble
	scribble(_text).starting_format(_font, _c).blend(c_white, _strAlpha).wrap(textW).draw(_x,_y);
	
}
	
DialogueProgress();