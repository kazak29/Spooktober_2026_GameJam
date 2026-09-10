//draw textbox (even if not active)
draw_self();

//draw text
if textboxState == TextboxStateDialogue {
	
	//draw scribble object with typist
	var _scribId = TextScribGet();
	_scribId.draw(x+textX,y+textY, typist);
	
}
