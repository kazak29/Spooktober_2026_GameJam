event_inherited();
if !instance_exists(oMenu) exit;
var _page = oMenu.menuPages[$ oMenu.pageName];

var _elem = elementData;
scribId = scribble(_elem.title).starting_format(FONT_CONSOLE_24, c_white);

#region set parameters based on menu page layout and sprite
	
	var _elemsL	= array_length(_page.elements);
	
	var _bufferX = MENU_BUFFER_X;
	var _bufferY = MENU_BUFFER_Y;
	
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
	
	//fast creation
	var _createSubToggle = function(_x,_y, _side){
		var _id = instance_create_layer(_x,_y, "System", oMenuElementToggle, {
			mainId:			id,
			elementNum:		elementNum,
			elementData:	elementData,
			side:			_side,
		});
		array_push(subIds, _id);
	}
	var _createSubShift = function(_x,_y, _side){
		var _id = instance_create_layer(_x,_y, "System", oMenuElementShift, {
			mainId:			id,
			elementNum:		elementNum,
			elementData:	elementData,
			side:			_side,
		});
		array_push(subIds, _id);
	}
	
	var _type = _elem.elemType;
	switch _type {
		
		case MENU_ELEMENT_TYPE.TOGGLE: {
			var _x = _startX + _bufferX;
			var _y = _startY + elementNum*_bufferY;
			
			_createSubToggle(_x,				_y, false);
			_createSubToggle(_x + _bufferX*2,	_y, true);
		} break;
		case MENU_ELEMENT_TYPE.SHIFT: {
			var _x = _startX + _bufferX*1.5;
			var _y = _startY + elementNum*_bufferY;
			
			_createSubShift(_x,	_y, 0);
			_createSubShift(_x,	_y, 1);
			_createSubShift(_x,	_y, 2);
		} break;
		case MENU_ELEMENT_TYPE.SLIDER: {
			
		} break;
	
	}
	
#endregion
#region update sub elements
	
	//update shift elements
	UpdateShift = function(){
		if elementData.elemType != MENU_ELEMENT_TYPE.SHIFT exit;
		with subIds[1] TextUpdate();
		with subIds[0] PositionUpdate();
		with subIds[2] PositionUpdate();
	}
	UpdateShift();	//putting it here instead of inside element creation code for visual convinience
	
#endregion