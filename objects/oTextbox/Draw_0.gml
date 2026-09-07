//draw textbox
draw_self();

//draw text
if textboxState == TextboxStateDialogue {
	
	//setup scribble object
	var _sId = scribble(textStr)
		.starting_format(textFont, textCol)
		.blend(c_white, textAlpha)
		.wrap(textW);
	
	//draw scribble object with typist
	_sId.draw(x+textX,y+textY, typist);
	
}