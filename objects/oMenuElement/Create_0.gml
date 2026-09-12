image_speed = 0;
image_index = 0;

if !instance_exists(oMenu) exit;
var _page = oMenu.menuPages[$ oMenu.pageName];
var _elem = _page.elements[elementNum];

#region set position based on menu page layout
	
	var _elemsL = array_length(_page.elements);
	
	var _bufferX = 64;
	var _bufferY = 96;
	
	var _startX = VIEWPORT_WIDTH / 2;
	var _startY = (VIEWPORT_HEIGHT / 2) - ((_elemsL-1)/2)*_bufferY;
	
	switch _page.layout {
		
		case MENU_LAYOUT.MAIN: {
			x = _startX;
			y = _startY + elementNum*_bufferY;
		} break;
		
		case MENU_LAYOUT.SETTINGS: {
			x = _startX - _bufferX;
			y = _startY + elementNum*_bufferY;
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