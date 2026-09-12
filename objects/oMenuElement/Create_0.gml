image_speed = 0;
image_index = 0;

if !instance_exists(oMenu) exit;
var _page = oMenu.menuPages[$ oMenu.pageName];
var _elem = _page.elements[elementNum];

scribId = scribble(_elem.title).starting_format(FONT_CONSOLE_24, c_white);

#region set parameters based on menu page layout and sprite
	
	var _elemsL	= array_length(_page.elements);
	
	var _bufferX = 64;
	var _bufferY = 64+16;
	
	if sprite_exists(_page.elemSpr) {
	
		var _spr = _page.elemSpr;
		var _bbox = scribId.get_bbox(x,y);
	
		sprX = _bbox.left + _bbox.width/2;// - sprite_get_width(_spr)/2;
		sprY = _bbox.top + _bbox.height/2;// - sprite_get_height(_spr)/2;
		
		_bufferX += sprite_get_width(_spr)/2;
		_bufferY += sprite_get_height(_spr)/2;
		
	}
	
	var _startX	= VIEWPORT_WIDTH / 2;
	var _startY	= (VIEWPORT_HEIGHT / 2);// - ((_elemsL-1)/2)*_bufferY;
	
	switch _page.layout {
		
		case MENU_LAYOUT.MAIN: {
			x = _startX;
			y = _startY + elementNum*_bufferY;
			scribId.align(fa_center, fa_middle);
		} break;
		
		case MENU_LAYOUT.SETTINGS: {
			x = _startX - _bufferX;
			y = _startY + elementNum*_bufferY;
			scribId.align(fa_right, fa_middle);
		} break;
		
	}
	
#endregion

#region create sub elements
	
	var _type = _elem.elemType;
	switch _type {
	
		case MENU_ELEMENT_TYPE.SHIFT: {
			
		} break;
		case MENU_ELEMENT_TYPE.SLIDER: {
			
		} break;
		case MENU_ELEMENT_TYPE.TOGGLE: {
			
		} break;
	
	}
	
#endregion