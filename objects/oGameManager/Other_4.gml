var _buttonSettings = function() {
	var _x = VIEWPORT_WIDTH - 96;
	var _y = VIEWPORT_HEIGHT - 64;
	
	instance_create_layer(
		_x,
		_y,
		SYSTEM_LAYER,
		oButton,
		{	
			sprite_index: sPlaceholderButton,
			scr: uiButtonSettings,
			title: global.uiData.buttonSettings
		}
	);
}

switch room {
	case rmStage:	_buttonSettings();	break;
	case rmMap:		_buttonSettings();	break;
}