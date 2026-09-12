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

/*
#region right side
	
		_x = _startX + _bufferX;
		_y = _startY;
		
		for (var i = 0; i < _elemsL; i++) {
			_y = _startY + i*_bufferY;
			
			switch _elems[i].elemType {
				
				case MENU_ELEMENT_TYPE.SHIFT: {
					
				} break;
				case MENU_ELEMENT_TYPE.SLIDER: {
					
				} break;
				case MENU_ELEMENT_TYPE.TOGGLE: {
					
					var _val = _elems[i].arg;
					
					var _c = COL_MENU_OPTION_DEFAULT;
					if (inputting && i == elementNum) _c = COL_MENU_OPTION_SELECTED;
					var _c1,_c2;
					
					if (!_val)	{ _c1 = _c;							_c2 = COL_MENU_OPTION_DISABLED; }
					else		{ _c1 = COL_MENU_OPTION_DISABLED;	_c2 = _c;						}
					
					scribble(global.uiData.menuOff)
						.starting_format(FONT_CONSOLE_24, c_white)
						.blend(_c1, 1)
						.align(fa_left, fa_middle)
						.draw(_x, _y);
						
					scribble(global.uiData.menuOn)
						.starting_format(FONT_CONSOLE_24, c_white)
						.blend(_c2, 1)
						.align(fa_left, fa_middle)
						.draw(_x + _bufferX*2, _y);
					
				} break;
				
			}
		}
		
	#endregion
*/