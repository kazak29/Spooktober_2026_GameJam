var _buttonSettings = function() {
	instance_create_layer(
		VIEWPORT_WIDTH - 80,
		VIEWPORT_HEIGHT - 64,
		SYSTEM_LAYER,
		oButton,
		{	
			//sprite_index: sPlaceholderButton,
			scr: uiButtonSettings,
			title: global.uiData.buttonSettings
		}
	);
	instance_create_layer(
		VIEWPORT_WIDTH - 80,
		VIEWPORT_HEIGHT - 128,
		SYSTEM_LAYER,
		oButton,
		{	
			//sprite_index: sPlaceholderButton,
			scr: uiButtonTextLog,
			title: global.uiData.buttonTextlog
		}
	);
}

switch room {
	case rmStage:	_buttonSettings();	break;
	case rmMap:		_buttonSettings();	break;
}