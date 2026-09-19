depth = MENU_DEPTH;

menuPages = global.menuPages[$ menuType] ?? {};
elementNum = 0;

elementSelectedMain		= noone;
elementSelectedMainPrev	= noone;
elementSelectedSub		= noone;
elementSelectedSubPrev	= noone;
mouseClickLock			= false;
mouseHoverMain			= false;
mouseHoverSub			= false;

bg = {
	active: false,
	col:	c_black,
	spr:	noone,
	imInd:	0,
	alpha:	1,
	
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
		
		x1		= struct_get(_bg, "x1")		?? 0;
		x2		= struct_get(_bg, "x2")		?? 0;
		y1		= struct_get(_bg, "y1")		?? 0;
		y2		= struct_get(_bg, "y2")		?? 0;
	}
}

SettingsDataUpdate = function(_elemData){
	var _scr = struct_get(_elemData, "scr");
	switch _scr {
		case MenuFullscreen:		_elemData.arg = window_get_fullscreen();	break;
		case MenuLanguage:			_elemData.arg = _elemData.arg;				break;	//add locale variable here
		case MenuVolMusic:			_elemData.arg = global.volMusic;			break;
		case MenuVolSound:			_elemData.arg = global.volSound;			break;
		case MenuVolTypeWriter:		_elemData.arg = global.volTypeWriter;		break;
	}
}

BackgroundPositionUpdate = function(_elemId){
	
	var _offset = 16;
	
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
		
		if bg.active {
			var _al = array_length(_id.subIds);
			for (var j = 0; j < _al; j++) {
				BackgroundPositionUpdate(_id.subIds[j]);
			}
			BackgroundPositionUpdate(_id);
		}
	}
}
PageUpdate();