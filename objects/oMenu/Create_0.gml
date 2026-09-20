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

var _bg = menuPages[$ pageName].bg;
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

SettingsDataUpdate = function(_elemData){
	var _varName = struct_get(_elemData, "varName") ?? noone;
	if is_string(_varName) {
		if variable_global_exists(_varName) {
			
			_elemData.arg = variable_global_get(_varName);
			
		} else {
			
			//special vars
			switch _varName {
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
	
	var _elems = menuPages[$ pageName].elements;
	var _elemsL = array_length(_elems);
	for (var i = 0; i < _elemsL; i++) {	
		SettingsDataUpdate(_elems[i]);
		
		var _data = {
			elementNum: i,
			elementData: _elems[i],
		};
		
		var _id = instance_create_layer(0,0, SYSTEM_LAYER, oMenuElementMain, _data);
		_elems[i].elemId = _id;
		
		if i <= 0 {
			//set first bg position
			bg.x1 = _id.x;
			bg.x2 = _id.x;
			bg.y1 = _id.y;
			bg.y2 = _id.y;
				
			//lock hover cd
			_id.hoverCd = mouseHoverCdMax;
		}
		
		// background borders set
		var _al = array_length(_id.subIds);
		for (var j = 0; j < _al; j++) {
			BackgroundPositionUpdate(_id.subIds[j]);
		}
		BackgroundPositionUpdate(_id);
	}
	
	#region position correction in case menu is out of bounds
		
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