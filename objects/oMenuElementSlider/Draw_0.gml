if !instance_exists(oMenu) exit;
var _selected = (id == oMenu.elementSelectedSub);
var _selectedAlone = _selected && oMenu.mouseHoverSub;
var _elem = elementData;

var _c = COL_MENU_OPTION_DEFAULT;
var _cText = COL_MENU_OPTION_DEFAULT;
var _frame = 0;
if _selected {
	_c = COL_MENU_OPTION_SELECTED;
	_cText = COL_MENU_OPTION_SELECTED;
	_frame = 1;
}

//sprite used as bg for slider
if is_struct(spr) {
	with spr { draw_sprite_ext(ind, _frame, x,y, scaleX, scaleY, 0, c_white, other.image_alpha); }
}

var _circleSpr = sSliderCircle;
draw_self();

//calculate current slider value as percentage between min and max values set in data
var _circlePerc = ((_elem.arg - _elem.argClamp[0]) / (_elem.argClamp[1] - _elem.argClamp[0]));
var _circleX = x+_circlePerc*sprite_width;
var _circleY = y;

if _selectedAlone {
	//check if mouse is over the circle itself
	var _scale = (image_xscale+image_yscale)/2;
	var _rad = sprite_get_width(_circleSpr)*_scale/2;
	if oInputManager.MouseHoverCircle(_circleX, _circleY, _rad) && !oMenu.mouseClickLock {
		_c = COL_MENU_OPTION_HOVER;
		_frame = 2;
	}
}

draw_sprite_ext(sSliderCircle, _frame, _circleX, _circleY, image_xscale,image_yscale, 0,c_white,image_alpha);

//calculate how to represent the value
var _num = $"{_circlePerc}";
switch _elem.style {
	case MENU_SLIDER_STYLE.PERC_BAR:			_num = $"{round(_circlePerc*100)}%";	break;
	case MENU_SLIDER_STYLE.UNMODIFIED:			_num = $"{_elem.arg}";					break;
	case MENU_SLIDER_STYLE.PERC_SCALE:			_num = $"{_elem.arg*100}%";				break;
	case MENU_SLIDER_STYLE.PERC_SCALE_ROUNDED:	_num = $"{round(_elem.arg*100)}%";		break;
	case MENU_SLIDER_STYLE.PERC_SCALE_HUNDRED:	_num = $"{_elem.arg*100*100}%";			break;
}

draw_set_font(asset_get_index(strFont));
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text_colour(bbox_right + percentShift, y, _num, _cText,_cText,_cText,_cText, image_alpha);