if !instance_exists(oMenu) exit;
var _selected = (id == oMenu.elementSelectedSub);
var _elem = elementData;

var _c = COL_MENU_OPTION_DEFAULT;
var _frame = 0;
if _selected {
	_c = COL_MENU_OPTION_SELECTED;
	_frame = 1;
}

var _val = _elem.arg;
var _c1 = (_val && !_selected) ? COL_MENU_OPTION_DISABLED : _c;
if side _c1 = (_val || _selected) ? _c : COL_MENU_OPTION_DISABLED;

if sprite_exists(sprite_index) {
	_c1				= (_val == side || _selected) ? COL_MENU_OPTION_DEFAULT : COL_MENU_OPTION_DISABLED;
	image_index		= (_val == side || _selected) ? _frame : 2;
	draw_self();
}

scribId.blend(_c1, 1).draw(strX, strY);