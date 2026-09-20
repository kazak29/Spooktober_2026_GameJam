event_inherited();
if !instance_exists(oMenu) exit;
var _page = oMenu.menuPages[$ oMenu.pageName];

strFont = _page.font;
if !is_string(strFont) || !font_exists(asset_get_index(strFont)) strFont = FONT_CONSOLE_24;

var _elem = elementData;
scribId = scribble(_elem.title).starting_format(strFont, c_white);
var _charH = scribble(" ").starting_format(strFont, c_white).get_height();

#region set parameters based on menu page layout and sprite
	
	var _startX = 0;
	var _startY = 0;
	var _bufferX = MENU_BUFFER_X;
	var _bufferY = MENU_BUFFER_Y;
	
	var _spr = _page.elemSpr;
	if sprite_exists(_spr) {
		sprite_index = _spr;
		
		_bufferX += sprite_get_width(_spr)/2;
		_bufferY += sprite_get_height(_spr)/2;
	}
	
	switch _page.layout {
		
		case MENU_LAYOUT.TITLE_MAIN: {
			_startX	= VIEWPORT_WIDTH / 2;
			_startY	= VIEWPORT_HEIGHT / 2;
			
			strX = _startX;
			strY = _startY + elementNum*_bufferY;
			scribId.align(fa_center, fa_middle);
		} break;
		case MENU_LAYOUT.TITLE_SETTINGS: {
			var _elemsL	= array_length(_page.elements);
			_startX	= VIEWPORT_WIDTH / 2;
			_startY	= VIEWPORT_HEIGHT / 2 - ((_elemsL-1)/6)*_bufferY;
			
			strX = _startX - _bufferX;
			strY = _startY + elementNum*_bufferY;
			scribId.align(fa_right, fa_middle);
		} break;
		
		
		case MENU_LAYOUT.PAUSE_TOP: {
			var _elemsL	= array_length(_page.elements);
			_bufferX /= 4;
			_bufferY /= 2;
			
			with oButton {
				if scr == uiButtonSettings {
					var _x = strX;
					var _y = strY;
					if variable_instance_exists(id, "scribId") _y = scribId.get_bbox(strX,strY).bottom;
					if sprite_exists(sprite_index) _y = bbox_bottom;
					if oMenu.bg.active _y += oMenu.bg.offset;
					
					_startX = _x;
					_startY = _y + _charH/2;
					break;
				}
			}
			
			strX = _startX - _bufferX;
			strY = _startY + elementNum*_bufferY;
			scribId.align(fa_right, fa_middle);
		} break;
		case MENU_LAYOUT.PAUSE_MIDDLE: {
			var _elemsL	= array_length(_page.elements);
			_bufferX /= 4;
			_bufferY /= 2;
			
			with oButton {
				if scr == uiButtonSettings {
					_startX = strX;
					_startY = strY - ((_elemsL-1)/2)*_bufferY;
					break;
				}
			}
			
			strX = _startX - _bufferX;
			strY = _startY + elementNum*_bufferY;
			scribId.align(fa_right, fa_middle);
		} break;
		case MENU_LAYOUT.PAUSE_BOTTOM: {
			var _elemsL	= array_length(_page.elements);
			_bufferX /= 4;
			_bufferY /= 2;
			
			with oButton {
				if scr == uiButtonSettings {
					var _x = strX;
					var _y = strY;
					if variable_instance_exists(id, "scribId") _y = scribId.get_bbox(strX, strY).top;
					if sprite_exists(sprite_index) _y = bbox_top;
					if oMenu.bg.active _y -= oMenu.bg.offset;
					
					_startX = _x;
					_startY = _y - _charH/2 - ((_elemsL-1))*_bufferY;
					break;
				}
			}
			
			strX = _startX - _bufferX;
			strY = _startY + elementNum*_bufferY;
			scribId.align(fa_right, fa_middle);
		} break;
		
	}
	
	uiElementPositionUpdate();
	
#endregion

#region update sub elements
	
	UpdateShift = function(){
		if elementData.elemType != MENU_ELEMENT_TYPE.SHIFT exit;
		with subIds[1] TextUpdate();
		with subIds[0] PositionUpdate();
		with subIds[2] PositionUpdate();
	}
	
#endregion
#region create sub elements
	
	//fast creation (unique data provided as last argument)
	var _createSub = function(_x,_y, _obj, _data = {}){
		with _data {
			mainId		=	other.id;
			elementNum	=	other.elementNum;
			elementData	=	other.elementData;
			strFont		=	other.strFont;
		}
		
		var _id = instance_create_layer(_x,_y, "System", _obj, _data);
		array_push(subIds, _id);
	}
	
	var _type = _elem.elemType;
	switch _type {
		
		case MENU_ELEMENT_TYPE.TOGGLE: {
			var _x = _startX + _bufferX;
			var _y = _startY + elementNum*_bufferY;
			
			_createSub(_x, _y, oMenuElementToggle, {side: false});
			_createSub(_x, _y, oMenuElementToggle, {side: true });
		} break;
		
		case MENU_ELEMENT_TYPE.SHIFT: {
			
			//check which text is the widest
			var _strW = 0;
			for (var i = 0; i < array_length(_elem.argTitles); i++) {
				var _scribId = scribble(_elem.argTitles[i]).starting_format(strFont, c_white);
				var _scribW = _scribId.get_width();
				_strW = (_scribW > _strW) ? _scribW : _strW;
			}
			
			var _x = _startX + _bufferX + _strW/2 + MENU_BUFFER_X;
			var _y = _startY + elementNum*_bufferY;
			
			_createSub(_x, _y, oMenuElementShift, {side: 0});
			_createSub(_x, _y, oMenuElementShift, {side: 1});
			_createSub(_x, _y, oMenuElementShift, {side: 2});
			
			UpdateShift();
		} break;
		
		case MENU_ELEMENT_TYPE.SLIDER: {
			var _x = _startX + _bufferX;
			var _y = _startY + elementNum*_bufferY;
			
			_createSub(_x, _y, oMenuElementSlider);
		} break;
	
	}
	
#endregion