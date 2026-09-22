event_inherited();
if !instance_exists(oMenu) exit;
var _page = oMenu.menuPages[$ oMenu.pageName];

strFont = _page.font;
if !is_string(strFont) || !font_exists(asset_get_index(strFont)) strFont = FONT_CONSOLE_24;

var _elem = elementData;
scribId = scribble(_elem.title, "menuElemMain").starting_format(strFont, c_white);
var _charH = scribble(" ").starting_format(strFont, c_white).get_height();

#region set parameters based on menu page layout
	
	startX = 0;
	startY = 0;
	bufferX = MENU_BUFFER_X;
	bufferY = MENU_BUFFER_Y;
	
	switch _page.layout {
		
		case MENU_LAYOUT.TITLE_MAIN: {
			startX	= VIEWPORT_WIDTH / 2;
			startY	= VIEWPORT_HEIGHT / 2;
			
			strX = startX;
			strY = startY + elementNum*bufferY;
			
			strAlignH = fa_center;
			strAlignV = fa_middle;
			scribId.align(strAlignH, strAlignV);
		} break;
		case MENU_LAYOUT.TITLE_SETTINGS: {
			var _elemsL	= array_length(_page.elements);
			startX	= VIEWPORT_WIDTH / 2;
			startY	= VIEWPORT_HEIGHT / 2 - (_elemsL/2)*bufferY;
			
			strX = startX - bufferX;
			strY = startY + elementNum*bufferY;
			
			strAlignH = fa_right;
			strAlignV = fa_middle;
			scribId.align(strAlignH, strAlignV);
		} break;
		
		
		case MENU_LAYOUT.PAUSE_TOP: {
			var _elemsL	= array_length(_page.elements);
			if !is_struct(_page.spr) bufferX /= 4; else bufferX /= 2;
			if !is_struct(_page.spr) bufferY /= 2; else bufferY /= 1;
			
			with oButton {
				if scr == uiButtonSettings {
					var _x = strX;
					var _y = strY;
					if variable_instance_exists(id, "scribId") _y = scribId.get_bbox(strX,strY).bottom;
					if sprite_exists(sprite_index) _y = bbox_bottom;
					if oMenu.bg.active _y += oMenu.bg.offset;
					
					other.startX = _x;
					other.startY = _y + _charH/2;
					break;
				}
			}
			
			strX = startX - bufferX;
			strY = startY + elementNum*bufferY;
			
			strAlignH = fa_right;
			strAlignV = fa_middle;
			scribId.align(strAlignH, strAlignV);
		} break;
		case MENU_LAYOUT.PAUSE_MIDDLE: {
			var _elemsL	= array_length(_page.elements);
			if !is_struct(_page.spr) bufferX /= 4; else bufferX /= 2;
			if !is_struct(_page.spr) bufferY /= 2; else bufferY /= 1;
			
			with oButton {
				if scr == uiButtonSettings {
					other.startX = strX;
					other.startY = strY - ((_elemsL-1)/2)*other.bufferY;
					break;
				}
			}
			
			strX = startX - bufferX;
			strY = startY + elementNum*bufferY;
			
			strAlignH = fa_right;
			strAlignV = fa_middle;
			scribId.align(strAlignH, strAlignV);
		} break;
		case MENU_LAYOUT.PAUSE_BOTTOM: {
			var _elemsL	= array_length(_page.elements);
			if !is_struct(_page.spr) bufferX /= 4; else bufferX /= 2;
			if !is_struct(_page.spr) bufferY /= 2; else bufferY /= 1;
			
			with oButton {
				if scr == uiButtonSettings {
					var _x = strX;
					var _y = strY;
					if variable_instance_exists(id, "scribId") _y = scribId.get_bbox(strX, strY).top;
					if sprite_exists(sprite_index) _y = bbox_top;
					if oMenu.bg.active _y -= oMenu.bg.offset;
					
					other.startX = _x;
					other.startY = _y - _charH/2 - ((_elemsL-1))*other.bufferY;
					break;
				}
			}
			
			strX = startX - bufferX;
			strY = startY + elementNum*bufferY;
			
			strAlignH = fa_right;
			strAlignV = fa_middle;
			scribId.align(strAlignH, strAlignV);
		} break;
		
	}
	
	//uiElementPositionUpdate();
	
#endregion

#region update sub elements
	
	UpdateShift = function(){
		if elementData.elemType != MENU_ELEMENT_TYPE.SHIFT exit;
		with subIds[1] TextUpdate();
		//with subIds[0] PositionUpdate();
		//with subIds[2] PositionUpdate();
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
			var _x = startX + bufferX;
			var _y = startY + elementNum*bufferY;
			
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
			
			var _y = startY + elementNum*bufferY;
			var _x = startX + bufferX;
			_createSub(_x, _y, oMenuElementShift, {side: 0});
			
			_x += bufferX/2 + scribble("<<").starting_format(strFont, c_white).get_width() + _strW/2;
			_createSub(_x, _y, oMenuElementShift, {side: 1});
			
			_x += bufferX/2 + _strW/2;
			_createSub(_x, _y, oMenuElementShift, {side: 2});
			
			UpdateShift();
		} break;
		
		case MENU_ELEMENT_TYPE.SLIDER: {
			var _x = startX + bufferX;
			var _y = startY + elementNum*bufferY;
			
			_createSub(_x, _y, oMenuElementSlider);
		} break;
	
	}
	
#endregion