if !instance_exists(oMenu) exit;

var _page = oMenu.menuPages[$ oMenu.pageName];
var _elem = _page.elements[elementNum];

var _c = COL_MENU_OPTION_DEFAULT;
var _frame = 0;
if (oMenu.elementNum == elementNum) && oMenu.inputting {
	_c = COL_MENU_OPTION_SELECTED;
	_frame = 1;
}

switch elemSubtype {
	
	case MENU_ELEMENT_SUBTYPE.TOGGLE_OFF: {
		var _val = _elem.arg;
		var _c1 = _val ? COL_MENU_OPTION_DISABLED : _c;
		
		if sprite_exists(sprite_index) {
			_c1				= _val ? COL_MENU_OPTION_DISABLED : COL_MENU_OPTION_DEFAULT;
			sprite_index	= _val ? 2 : _frame;
			draw_self();
		}
		
		scribId.blend(_c1, 1).draw(strX, strY);
	} break;
	case MENU_ELEMENT_SUBTYPE.TOGGLE_ON: {
		var _val = _elem.arg;
		var _c1 = _val ? _c : COL_MENU_OPTION_DISABLED;
		
		if sprite_exists(sprite_index) {
			_c1				= _val ? COL_MENU_OPTION_DISABLED : COL_MENU_OPTION_DEFAULT;
			sprite_index	= _val ? 2 : _frame;
			draw_self();
		}
		
		scribId.blend(_c1, 1).draw(strX, strY);
	} break;
	
}