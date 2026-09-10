//set scale and alpha
image_xscale	= tbW/sprite_get_width(sprite_index);
image_yscale	= tbH/sprite_get_height(sprite_index);
image_alpha		= 1; //maybe use this in animation later

//calculate maximum string width for line
textW = floor((bbox_right - bbox_left) - 32);

//state machine
textboxState = TextboxStateDialogue;

//title object
titleId = noone;

//scribble typist
typist = scribble_typist();
typist.in(textSpd,textSmooth);

//setup font name for scribble
if !is_string(textFont) {
	textFont = font_get_name(textFont);
}

//get scribble instance for text
TextScribGet = function(){
	
	//set all scribble parameters
	var _scribId = scribble(textStr)
		.starting_format(textFont, textCol)
		.blend(c_white, textAlpha)
		.wrap(textW);
		
	//return scribble id
	return _scribId;
	
}