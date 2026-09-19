if active {
	var _c = titleCol;
	if sprite_exists(sprite_index) {
	
		_c = COL_UI_BUTTON_DEFAULT;
		draw_self();
	
	}

	scribId.blend(_c, 1).draw(strX, strY);
}