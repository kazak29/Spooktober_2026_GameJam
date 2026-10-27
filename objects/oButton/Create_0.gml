depth = UI_BUTTON_DEPTH;

image_index = 0;
image_speed = 0;
hoverResetCd = 0;

switch scr {
	case uiButtonTextLog: {
		title = $"{title}\n{global.uiData.logInputs}";
	} break;
	case uiButtonPause: {
		title = $"{title}\n{global.uiData.menuInputs}";
	} break;
}
if (instance_exists(oDirector)) {
	if scr == uiButtonToggleUI {
		title = $"{global.uiData.buttonHideUI}\n{global.uiData.toggleUiInputs}";
	}
}

scribId = scribble(title, "button").starting_format(titleFont, c_white).align(fa_center, fa_middle);

strX = x;
strY = y;
if sprite_exists(sprite_index) && scaleToText {
	var _bbox = scribId.get_bbox(strX,strY);
	image_xscale = (_bbox.width + 8)/sprite_get_width(sprite_index);
	image_yscale = (_bbox.height + 8)/sprite_get_height(sprite_index);
}
if posToText {
	uiElementPositionUpdate();
}