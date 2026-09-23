depth = MENU_DEPTH;

menuPages = global.menuPages[$ menuType] ?? {};
elementNum = 0;

elementSelectedMain		= noone;
elementSelectedSub		= noone;
mouseClickLock			= false;
mouseHoverMain			= false;
mouseHoverSub			= false;

mouseHoverCdMax = 5;


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
BackgroundReset = function(){
	bg = {
		active: false,
		col:	c_white,
		alpha:	1,
		offset: 0,
	
		x1: 0,
		x2: 0,
		y1: 0,
		y2: 0,
	
		spr:	{
			ind: noone,
			imInd: 0,
			x: 0,
			y: 0,
			scaleX: 1,
			scaleY: 1,
		},
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
				_x1 -= hoverShift.left;
				_x2 += hoverShift.right;
				_y1 -= hoverShift.top;
				_y2 += hoverShift.bottom;
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
	BackgroundReset();
	
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
	
	#region update every element if using a sprite
		
		var _spr = _page.spr;
		if is_struct(_spr) {
			
			//find widest and heighest string
			var _strW = 0, _strH = 0;
			for (var i = 0; i < _elemsL; i++) {
				var _id = _elems[i].elemId;
			
				var _scribW = _id.scribId.get_width();
				_strW = (_scribW > _strW) ? _scribW : _strW;
			
				var _scribH = _id.scribId.get_height();
				_strH = (_scribH > _strH) ? _scribH : _strH;
			}
			
			//update every element with sprite parameters
			for (var i = 0; i < _elemsL; i++) {
				var _id = _elems[i].elemId;
				with _id {
					uiElementSpriteUpdate(_spr, _strW, _strH);
					
					//setup buffers between elements (switch just in case of future horizontal menu layouts)
					var _bufferX = 0, _bufferY = 0;
					switch _page.layout {
						case MENU_LAYOUT.TITLE_MAIN:		{ _bufferY = _spr.bufferStrY + _spr.bufferElem;		} break;
						case MENU_LAYOUT.TITLE_SETTINGS:	{ _bufferY = _spr.bufferStrY + _spr.bufferElem; 	} break;
						case MENU_LAYOUT.PAUSE_TOP:			{ _bufferY = _spr.bufferStrY + _spr.bufferElem; 	} break;
						case MENU_LAYOUT.PAUSE_MIDDLE:		{ _bufferY = _spr.bufferStrY + _spr.bufferElem; 	} break;
						case MENU_LAYOUT.PAUSE_BOTTOM:		{ _bufferY = _spr.bufferStrY + _spr.bufferElem; 	} break;
					}
					strX += _bufferX*i;
					strY += _bufferY*i;
					uiElementPositionUpdate();
					
					//shift position when out of bounds relative to each other
					var _shiftX = 0, _shiftY = 0;
					switch strAlignH {
						case fa_left:	_shiftX = strX - _spr.bufferStrX - bbox_left;	break;
						case fa_right:	_shiftX = strX + _spr.bufferStrX - bbox_right;	break;
					}
					switch strAlignV {
						case fa_top:	_shiftX = strY - _spr.bufferStrY - bbox_top;	break;
						case fa_bottom:	_shiftX = strY + _spr.bufferStrY - bbox_bottom;	break;
					}
					x += _shiftX;
					y += _shiftY;
					strX += _shiftX;
					strY += _shiftY;
					
					//update sub elements
					var _al = array_length(_id.subIds);
					for (var j = 0; j < _al; j++) {
						with _id.subIds[j] {
							
							//apply changes based on element type
							switch _elems[i].elemType {
								
								case MENU_ELEMENT_TYPE.TOGGLE: {
									
									//move second toggle away from first (if no sprite object does it by itself in create event)
									if (j > 0) {
										var _shift = _id.subIds[0].sprite_width*distMult;
										x += _shift;
										strX += _shift;
									}
									
									//apply sprite
									var _subStrW = scribble(global.uiData.menuOff, "toggle").get_width();
									var _subStrH = scribble(global.uiData.menuOff, "toggle").get_height();
									uiElementSpriteUpdate(_spr, _subStrW, _subStrH);
									
									//move element with buffer
									strX += _bufferX*i;
									strY += _bufferY*i;
									uiElementPositionUpdate();
								} break;
								
								case MENU_ELEMENT_TYPE.SHIFT: {
									strX += _bufferX*i;
									strY += _bufferY*i;
									x = strX;
									y = strY;
								} break;
								
								case MENU_ELEMENT_TYPE.SLIDER: {
									x += _bufferX*i;
									y += _bufferY*i;
									
									spr = {};
									spr.ind = _spr.ind;
									
									var _scaleW = (bbox_right - bbox_left + hoverShift.left + hoverShift.right);
									var _scaleH = (bbox_bottom - bbox_top + hoverShift.top + hoverShift.bottom);
									
									//limit scaling so nineslice don't crop sprite when size too small
									var _nine = sprite_get_nineslice(spr.ind);
									if _nine.enabled {
										_scaleW = max(_scaleW, _nine.left + _nine.right + 1);
										_scaleH = max(_scaleH, _nine.top + _nine.bottom + 1);
									}
									
									spr.scaleX = _scaleW/sprite_get_width(spr.ind);
									spr.scaleY = _scaleH/sprite_get_height(spr.ind);
									
									spr.x = bbox_left - hoverShift.left + sprite_get_xoffset(spr.ind)*spr.scaleX;
									spr.y = bbox_top - hoverShift.top + sprite_get_yoffset(spr.ind)*spr.scaleY;
								} break;
								
							}
							
							//calculate an out of bounds for sub elements too??? idk
							
						}
					}
					
					//apply post-postition changes based on element type
					switch _elems[i].elemType {
						case MENU_ELEMENT_TYPE.SHIFT: {
							
							var _id0 = _id.subIds[0];
							var _id1 = _id.subIds[1];
							var _id2 = _id.subIds[2];
							
							//select the last shift
							with _id2 {
										
								spr = {};
								spr.ind = _spr.ind;
										
								var _left = _id0.scribId.get_bbox(_id0.strX, _id0.strY).left - _spr.bufferStrX;
								var _right = _id2.scribId.get_bbox(_id2.strX, _id2.strY).right + _spr.bufferStrX;
								var _scaleW = _right - _left;
								var _scaleH = _id1.scribId.get_height() + _spr.bufferStrY*2;
										
								//limit scaling so nineslice don't crop sprite when size too small
								var _nine = sprite_get_nineslice(spr.ind);
								if _nine.enabled {
									_scaleW = max(_scaleW, _nine.left + _nine.right + 1);
									_scaleH = max(_scaleH, _nine.top + _nine.bottom + 1);
								}
										
								spr.scaleX = _scaleW/sprite_get_width(spr.ind);
								spr.scaleY = _scaleH/sprite_get_height(spr.ind);
										
								spr.x = _left + sprite_get_xoffset(spr.ind)*spr.scaleX;
								spr.y = scribId.get_bbox(strX, strY).top - _spr.bufferStrY + sprite_get_yoffset(spr.ind)*spr.scaleY;
								
							}
							
						} break;
					}
					
					
				}
			}
			
		}
		
	#endregion
	
	#region bg update + out of bounds check (also through bg)
		
		if is_struct(_page.bg) {
			with bg {
				active		= struct_get(_page.bg, "active")	?? active;
				col			= struct_get(_page.bg, "col")		?? col;
				alpha		= struct_get(_page.bg, "alpha")		?? alpha;
				offset		= struct_get(_page.bg, "offset")	?? offset;
				spr.ind		= struct_get(_page.bg, "sprInd")	?? spr.ind;
				spr.imInd	= struct_get(_page.bg, "imInd")		?? spr.imInd;
			}
		}
		
		//update bg position
		for (var i = 0; i < _elemsL; i++) {
			var _id = _elems[i].elemId;
			
			//set first bg position
			if i <= 0 {
				bg.x1 = _id.strX;
				bg.x2 = _id.strX;
				bg.y1 = _id.strY;
				bg.y2 = _id.strY;
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
						
						if variable_instance_exists(id, "spr") && is_struct(spr) {
							spr.x += _shiftX;
							spr.y += _shiftY;
						}
					}
				}
			
			}
		}
		
		//bg sprite params
		if sprite_exists(bg.spr.ind) {
			with bg {
				spr.scaleX = (x2 - x1)/sprite_get_width(spr.ind);
				spr.scaleY = (y2 - y1)/sprite_get_height(spr.ind);
				spr.x = x1 + sprite_get_xoffset(spr.ind)*spr.scaleX;
				spr.y = y1 + sprite_get_yoffset(spr.ind)*spr.scaleY;
			}
		}
		
	#endregion
}
PageUpdate();