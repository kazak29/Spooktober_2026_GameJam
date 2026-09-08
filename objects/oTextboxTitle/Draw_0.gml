//draw itself and text only when textbox active
if global.tbId.textboxState == TextboxStateDialogue {
	
	//draw itself
	draw_self();
	
	//draw with scribble (no typist)
	var _scribId = TextScribGet();
	_scribId.draw(x+textX,y+textY);

}