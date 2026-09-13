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
	_c1				= _val ? COL_MENU_OPTION_DISABLED : COL_MENU_OPTION_DEFAULT;
	sprite_index	= _val ? 2 : _frame;
	draw_self();
}

scribId.blend(_c1, 1).draw(strX, strY);