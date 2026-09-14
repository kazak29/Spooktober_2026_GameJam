if !instance_exists(oMenu) exit;
var _selected = (id == oMenu.elementSelectedSub);
var _selectedAlone = _selected && oMenu.mouseHoverSub;
var _elem = elementData;

draw_self();

//calculate current slider value as percentage between min and max values set in data
var _circlePos = ((_elem.arg - _elem.argClamp[0]) / (_elem.argClamp[1] - _elem.argClamp[0]));

var _c = COL_MENU_OPTION_DEFAULT;
var _frame = 0;
if _selected {
	_c = COL_MENU_OPTION_SELECTED;
	_frame = 1;
}
if _selectedAlone {
	_c = COL_MENU_OPTION_HOVER;
	_frame = 2;
}

draw_sprite(sSliderCircle, _frame, x+_circlePos*sprite_width, y);

draw_set_font(asset_get_index(MENU_FONT));
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text_colour(x + sprite_width*1.2, y, $"{round(_circlePos*100)}%", _c,_c,_c,_c, image_alpha);