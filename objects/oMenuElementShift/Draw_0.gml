if !instance_exists(oMenu) exit;
var _selectedAlone = (id == oMenu.elementSelectedSub);
var _selectedFull = (mainId == oMenu.elementSelectedMain);
var _elem = elementData;

var _c = COL_MENU_OPTION_DEFAULT;
var _frame = 0;
if _selectedFull {
	_c = COL_MENU_OPTION_SELECTED;
	_frame = 1;
}
if _selectedAlone {
	_c = COL_MENU_OPTION_HOVER;
	_frame = 1;
}

var _val = _elem.arg;
if sprite_exists(sprite_index) {
	_c				= COL_MENU_OPTION_DEFAULT;
	image_index		= _frame;
	draw_self();
}

scribId.blend(_c, 1).draw(strX, strY);