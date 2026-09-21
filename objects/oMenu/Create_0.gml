depth = MENU_DEPTH;

menuPages = global.menuPages[$ menuType] ?? {};
elementNum = 0;

elementSelectedMain		= noone;
elementSelectedSub		= noone;
mouseClickLock			= false;
mouseHoverMain			= false;
mouseHoverSub			= false;

mouseHoverCdMax = 5;

bg = {
	active: false,
	col:	c_black,
	spr:	noone,
	imInd:	0,
	alpha:	1,
	offset: 16,
	
	x1: 0,
	x2: 0,
	y1: 0,
	y2: 0,
}


SettingsDataUpdate = function(_elemData){
	var _varName = struct_get(_elemData, "varName") ?? noone;
	if is_string(_varName) {
		if variable_global_exists(_varName) {
			
			_elemData.arg = variable_global_get(_varName);
			
		} else {
			
			//special variables
			switch _varName {
				default: {
					
					//nested struct variables
					var _varParts = string_split(_varName, ".");
					var _al = array_length(_varParts);
					if _al > 0 && variable_global_exists(_varParts[0]) {
						
						var _nestedArg = variable_global_get(_varParts[0]);
						for (var i = 1; i < _al; i++) {
							_nestedArg = _nestedArg[$ _varParts[i]];
						}
						
						_elemData.arg = _nestedArg;
						
					}
					
				} break;
				
				case "fullscreen": {
					_elemData.arg = window_get_fullscreen();
				} break;
			}
			
		}
	}
}

BackgroundPositionUpdate = function(_elemId){
	
	var _offset = bg.offset;
	
	//check if current positions are bigger than the previous positions
	var _posCheck = function(_x1,_x2,_y1,_y2){
		if (_x1	< bg.x1) bg.x1 = _x1;
		if (_x2	> bg.x2) bg.x2 = _x2;
		if (_y1	< bg.y1) bg.y1 = _y1;
		if (_y2	> bg.y2) bg.y2 = _y2;
	}
	
	var _x1,_x2,_y1,_y2;
	with _elemId {
		
		//sprite size check
		if sprite_exists(sprite_index) {
			_x1 = bbox_left		- _offset;
			_x2 = bbox_right	+ _offset;
			_y1 = bbox_top		- _offset;
			_y2 = bbox_bottom	+ _offset;
		
			//exceptions
			if object_index == oMenuElementSlider {
				_x2 = borderRight + _offset;
			}
			
			with other _posCheck(_x1,_x2,_y1,_y2);
		}
		
		//scribble text size check
		if variable_instance_exists(_elemId, "scribId") {
			var _bbox = _elemId.scribId.get_bbox(_elemId.strX, _elemId.strY);
			
			_x1 = _bbox.left	- _offset;
			_x2 = _bbox.right	+ _offset;
			_y1 = _bbox.top		- _offset;
			_y2 = _bbox.bottom	+ _offset;
			
			with other _posCheck(_x1,_x2,_y1,_y2);
		}
		
	}
	
}

//create every main element on a page as object on screen
PageUpdate = function(){
	with oMenuElement instance_destroy();
	
	var _page = menuPages[$ pageName];
	var _elems = _page.elements;
	var _elemsL = array_length(_elems);
	
	#region create every menu element w/o sprite
	
		for (var i = 0; i < _elemsL; i++) {	
			SettingsDataUpdate(_elems[i]);
		
			var _data = {
				elementNum: i,
				elementData: _elems[i],
			};
		
			var _id = instance_create_layer(0,0, SYSTEM_LAYER, oMenuElementMain, _data);
			_elems[i].elemId = _id;
		
			//lock hover cd for first element as page is created
			if i <= 0 _id.hoverCd = mouseHoverCdMax;
		
		}
		
	#endregion
	
	#region update every element position
		
		//update element if has a sprite
		var _spr		= _page.elemSpr;
		var _strBuffer	= _page.elemSprBuffer;
		if sprite_exists(_spr) {
			//find widest and heighest string
			var _strW = 0, _strH = 0;
			for (var i = 0; i < _elemsL; i++) {
				var _id = _elems[i].elemId;
			
				var _scribW = _id.scribId.get_width();
				_strW = (_scribW > _strW) ? _scribW : _strW;
			
				var _scribH = _id.scribId.get_height();
				_strH = (_scribH > _strH) ? _scribH : _strH;
			}
		
			//update every element if has a sprite
			for (var i = 0; i < _elemsL; i++) {
				var _id = _elems[i].elemId;
			
				with _id {
					sprite_index = _spr;
					image_xscale = (_strW + _strBuffer*2)/sprite_get_width(_spr);
					image_yscale = (_strH + _strBuffer*2)/sprite_get_height(_spr);
				
					//just in case theres ever a horizontal layout? idk
					var _bufferX = 0, _bufferY = 0;
					switch _page.layout {
						case MENU_LAYOUT.TITLE_MAIN:		_bufferY = _strBuffer;	break;
						case MENU_LAYOUT.TITLE_SETTINGS:	_bufferY = _strBuffer;	break;
						case MENU_LAYOUT.PAUSE_TOP:			_bufferY = _strBuffer;	break;
						case MENU_LAYOUT.PAUSE_MIDDLE:		_bufferY = _strBuffer;	break;
						case MENU_LAYOUT.PAUSE_BOTTOM:		_bufferY = _strBuffer;	break;
					}
				
					strX += _bufferX*i;
					strY += _bufferY*i;
				}
			}
		}
		
		//update every element position
		for (var i = 0; i < _elemsL; i++) {
			var _id = _elems[i].elemId;
			with _id uiElementPositionUpdate();
		}
		
	#endregion
	
	#region bg update + out of bounds check
		
		var _bg = _page.bg;
		if is_struct(_bg) {
			with bg {
				active	= struct_get(_bg, "active") ?? false;
				col		= struct_get(_bg, "col")	?? c_black;
		
				spr		= struct_get(_bg, "spr")	?? noone;
				imInd	= struct_get(_bg, "imInd")	?? 0;
				alpha	= struct_get(_bg, "alpha")	?? 1;
				offset	= struct_get(_bg, "offset")	?? 16;
			}
		}
		
		//update bg position
		for (var i = 0; i < _elemsL; i++) {
			var _id = _elems[i].elemId;
			
			//set first bg position
			if i <= 0 {
				bg.x1 = _id.x;
				bg.x2 = _id.x;
				bg.y1 = _id.y;
				bg.y2 = _id.y;
			}
		
			//update bg position for element bboxes
			var _al = array_length(_id.subIds);
			for (var j = 0; j < _al; j++) {
				BackgroundPositionUpdate(_id.subIds[j]);
			}
			BackgroundPositionUpdate(_id);
		}
		
		//shift bg when out of bounds
		var _shiftX = 0;
		var _shiftY = 0;
		with bg {
			if x1 < 0				_shiftX = -x1;
			if x2 > VIEWPORT_WIDTH	_shiftX = VIEWPORT_WIDTH - x2;
			if y1 < 0				_shiftY = -y1;
			if y2 > VIEWPORT_HEIGHT	_shiftY = VIEWPORT_HEIGHT - y2;
		
			x1 += _shiftX;
			x2 += _shiftX;
			y1 += _shiftY;
			y2 += _shiftY;
		}
		
		//shift every element with bg
		for (var i = 0; i < _elemsL; i++) {
			var _id = _elems[i].elemId;
			with _id {
				
				//main element position itself
				x += _shiftX;
				y += _shiftY;
				strX += _shiftX;
				strY += _shiftY;
				
				//every sub element position
				var _al = array_length(_id.subIds);
				for (var j = 0; j < _al; j++) {
					with _id.subIds[j] {
						x += _shiftX;
						y += _shiftY;
						strX += _shiftX;
						strY += _shiftY;
					}
				}
			
			}
		}
		
	#endregion
}
PageUpdate();