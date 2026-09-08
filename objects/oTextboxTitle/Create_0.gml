//setup font name for scribble
if !is_string(textFont) {
	textFont = font_get_name(textFont);
}

//get scribble instance for text
TextScribGet = function(){
	
	//set all scribble parameters
	var _scribId = scribble(textStr)
		.starting_format(textFont, textCol)
		.blend(c_white, textAlpha);
		//.wrap(textW);	no wrap here
	
	//return scribble id
	return _scribId;
	
}