if !instance_exists(oMenu) exit;
var _selected = (id == oMenu.elementSelectedSub);
var _selectedAlone = _selected && oMenu.mouseHoverSub;
var _elem = elementData;

var _circleSpr = sSliderCircle;
draw_self();

//calculate current slider value as percentage between min and max values set in data
var _circlePerc = ((_elem.arg - _elem.argClamp[0]) / (_elem.argClamp[1] - _elem.argClamp[0]));
var _circleX = x+_circlePerc*sprite_width;
var _circleY = y;

var _c = COL_MENU_OPTION_DEFAULT;
var _cText = COL_MENU_OPTION_DEFAULT;
var _frame = 0;
if _selected {
	_c = COL_MENU_OPTION_SELECTED;
	_cText = COL_MENU_OPTION_SELECTED;
	_frame = 1;
}
if _selectedAlone {
	//check if mouse is over the circle itself
	var _rad = sprite_get_width(_circleSpr)/2;
	if oInputManager.MouseHoverCircle(_circleX, _circleY, _rad) {
		_c = COL_MENU_OPTION_HOVER;
		_frame = 2;
	}
}

draw_sprite(sSliderCircle, _frame, _circleX, _circleY);

draw_set_font(asset_get_index(MENU_FONT));
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text_colour(x + sprite_width*1.2, y, $"{round(_circlePerc*100)}%", _c,_c,_c,_c, image_alpha);