if !instance_exists(oMenu) exit;

var _page = oMenu.menuPages[$ oMenu.pageName];
var _elem = _page.elements[elementNum];

var _c = COL_MENU_OPTION_DEFAULT;
var _frame = 0;
if (oMenu.elementNum == elementNum) {
	_c = COL_MENU_OPTION_SELECTED;
	_frame = 1;
}

if sprite_exists(sprite_index) {
	
	_c = COL_MENU_OPTION_DEFAULT;
	image_index = _frame;
	draw_self();
	
}

scribId.blend(_c, 1).draw(strX, strY);