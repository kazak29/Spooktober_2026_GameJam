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
	
	var _offsetX = 0;
	var _offsetY = 0;
	
	var _spr = _page.elemSpr;
	if sprite_exists(_spr) {
		
		sprite_index = _spr;
		var _sprW = sprite_get_width(_spr);
		var _sprH = sprite_get_height(_spr);
		
		_offsetX = sprite_get_xoffset(_spr) - _sprW/2;
		_offsetY = sprite_get_yoffset(_spr) - _sprH/2;
		
		_bufferX += _sprW/2;
		_bufferY += _sprH/2;
		
	}
	
	var _startX	= VIEWPORT_WIDTH / 2;
	var _startY	= (VIEWPORT_HEIGHT / 2);// - ((_elemsL-1)/2)*_bufferY;
	
	switch _page.layout {
		
		case MENU_LAYOUT.MAIN: {
			strX = _startX;
			strY = _startY + elementNum*_bufferY;
			scribId.align(fa_center, fa_middle);
		} break;
		
		case MENU_LAYOUT.SETTINGS: {
			strX = _startX - _bufferX;
			strY = _startY + elementNum*_bufferY;
			scribId.align(fa_right, fa_middle);
		} break;
		
	}
	
	var _bbox = scribId.get_bbox(strX,strY);
	x = _bbox.left + _bbox.width/2 + _offsetX;
	y = _bbox.top + _bbox.height/2 + _offsetY;
	
#endregion

#region create sub elements
	
	var _type = _elem.elemType;
	switch _type {
	
		case MENU_ELEMENT_TYPE.SHIFT: {
			
		} break;
		case MENU_ELEMENT_TYPE.SLIDER: {
			
		} break;
		case MENU_ELEMENT_TYPE.TOGGLE: {
			var _x = _startX + _bufferX;
			var _y = _startY + elementNum*_bufferY;
			
			instance_create_layer(_x,_y, "System", oMenuElementSub, {
				elementNum: elementNum,
				elemSubtype: MENU_ELEMENT_SUBTYPE.TOGGLE_OFF,
			});
			
			instance_create_layer(_x + _bufferX*2,_y, "System", oMenuElementSub, {
				elementNum: elementNum,
				elemSubtype: MENU_ELEMENT_SUBTYPE.TOGGLE_ON,
			});
		} break;
	
	}
	
#endregion