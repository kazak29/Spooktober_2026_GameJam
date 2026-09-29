//hardcoded fade
if menuName == "pauseSettings" || menuName == "pauseCrt" {
    draw_set_alpha(0.75);
    draw_rectangle_colour(0, 0, VIEWPORT_WIDTH, VIEWPORT_HEIGHT, c_black,c_black,c_black,c_black, false);
    draw_set_alpha(1);
}


if sprite_index != sBorder || global.showDebugUI draw_self();

var _elems = global.dataMenu[$ menuName].elements;
for (var i = 0; i < array_length(_elems); i++) {
	
	with _elems[i].elemId {
		var _selected = other.main.elemId == id;

		var _c = COL_MENU_OPTION_DEFAULT;
		var _frame = 0;
		if _selected {
			_c = COL_MENU_OPTION_SELECTED;
			_frame = 1;
		}

		if sprite_exists(sprite_index) && (sprite_index != sBorder || global.showDebugUI) {
	
			_c = COL_MENU_OPTION_DEFAULT;
			image_index = _frame;
			draw_self();
	
		}

		scribId.blend(_c, 1).draw(x + strX, y + strY);
	}
	
	var _elemSubs = _elems[i].elemSubs;
	var _names = struct_get_names(_elemSubs);
	for (var j = 0; j < array_length(_names); j++) {
		
		with _elemSubs[$ _names[j]].elemId {
			switch _elems[i].elemType {
				
				case MENU_ELEMENT_TYPE.TOGGLE: {
					var _selectedAlone = (id == other.sub.elemId);
					var _selectedFull = (_elems[i].elemId == other.main.elemId);
					
					var _c = COL_MENU_OPTION_DEFAULT, _frame = 0;
					if (_elems[i].arg != side)						{ _c = COL_MENU_OPTION_DISABLED;	_frame = 2; }
					if _selectedFull								{ _c = COL_MENU_OPTION_SELECTED;	_frame = 1; }
					if _selectedFull	&& (_elems[i].arg != side)	{ _c = COL_MENU_OPTION_DISABLED;	_frame = 2; }
					if _selectedAlone								{ _c = COL_MENU_OPTION_HOVER;		_frame = 3; }
					if _selectedAlone	&& (_elems[i].arg != side)	{ _c = COL_MENU_OPTION_HOVER;		_frame = 3; }
					
					
					if sprite_exists(sprite_index) && (sprite_index != sBorder || global.showDebugUI) {
						
						_c = COL_MENU_OPTION_DEFAULT;
						image_index = _frame;
						draw_self();
						
					}
					
					scribId.blend(_c, 1).draw(x + strX, y + strY);
				} break;
				
				case MENU_ELEMENT_TYPE.SLIDER: {
					var _selected = (id == other.sub.elemId) || (other.main.elemId == _elems[i].elemId);
					var _selectedAlone = _selected && other.sub.hover;

					var _c = COL_MENU_OPTION_DEFAULT;
					var _frame = 0;
					if _selected {
						_c = COL_MENU_OPTION_SELECTED;
						_frame = 1;
					}
					
					if sprite_exists(sprite_index) && (sprite_index != sBorder || global.showDebugUI) {
						
						image_index = _frame;
						draw_self();
						
					}
					
					
					//calculate current slider value as percentage between min and max values set in data
					var _circlePerc = ((_elems[i].arg - _elems[i].argClamp[0]) / (_elems[i].argClamp[1] - _elems[i].argClamp[0]));
					
					if percent {
						var _cText = COL_MENU_OPTION_DEFAULT;
						if (other.main.elemId == _elems[i].elemId) _cText = COL_MENU_OPTION_SELECTED;
						
						//calculate how to represent the value
						var _num = $"{_circlePerc}";
						switch _elems[i].style {
							case MENU_SLIDER_STYLE.PERC_BAR:			_num = $"{round(_circlePerc*100)}%";		break;
							case MENU_SLIDER_STYLE.UNMODIFIED:			_num = $"{_elems[i].arg}";					break;
							case MENU_SLIDER_STYLE.PERC_SCALE:			_num = $"{_elems[i].arg*100}%";				break;
							case MENU_SLIDER_STYLE.PERC_SCALE_ROUNDED:	_num = $"{round(_elems[i].arg*100)}%";		break;
							case MENU_SLIDER_STYLE.PERC_SCALE_HUNDRED:	_num = $"{_elems[i].arg*100*100}%";			break;
						}

						draw_set_font(asset_get_index(str.font));
						draw_set_halign(str.alignH);
						draw_set_valign(str.alignV);
						draw_text_colour(x + str.x, y + str.y, _num, _cText,_cText,_cText,_cText, 1);
						
						break;
					}

					//slider itself
					var _x = bbox_left + bufferX;
					var _y = bbox_top + bufferY;
					var _w = sprite_width - bufferX*2;
					var _h = sprite_height - bufferY*2;
					draw_sprite_stretched(sprSlider,0, _x,_y, _w,_h);

					//circle
					var _circleX = _x+_circlePerc*_w;
					var _circleY = bbox_top + sprite_height/2;
					
					//check if mouse is over the circle itself
					if _selectedAlone {
						
						var _rad = sprite_get_width(sprCircle)*sprCircleScale/2;
						if oInputManager.MouseHoverCircle(_circleX, _circleY, _rad) && !other.mouseClickLock {
							_c = COL_MENU_OPTION_HOVER;
							_frame = 2;
						}
						
					}
					
					draw_sprite_ext(sprCircle, _frame, _circleX, _circleY, sprCircleScale,sprCircleScale, 0,c_white,image_alpha);
				} break;
				
				
				case MENU_ELEMENT_TYPE.SHIFT: {
					var _selectedAlone = (id == other.sub.elemId);
					var _selectedFull = (_elems[i].elemId == other.main.elemId);

					var _c = COL_MENU_OPTION_DEFAULT;
					var _frame = 0;
					if _selectedFull {
						_c = COL_MENU_OPTION_SELECTED;
						_frame = 1;
					}
					if _selectedAlone {
						_c = COL_MENU_OPTION_HOVER;
						_frame = 1;
					}
					
					if sprite_exists(sprite_index) && (sprite_index != sBorder || global.showDebugUI) {
						
						_c				= COL_MENU_OPTION_DEFAULT;
						image_index		= _frame;
						draw_self();
						
					}

					scribId.blend(_c, 1).draw(x + strX, y + strY);
				}
			}
		}
		
	}
	
}