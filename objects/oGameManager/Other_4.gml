global.gamePaused = false;

var _buttonSettings = function() {
	instance_create_layer(
		VIEWPORT_WIDTH - 80,
		VIEWPORT_HEIGHT - 192,
		SYSTEM_LAYER,
		oButton,
		{	
			//sprite_index: noone,
			scr: noone,
			title: global.uiData.buttonHideUI
		}
	);
	instance_create_layer(
		VIEWPORT_WIDTH - 80,
		VIEWPORT_HEIGHT - 128,
		SYSTEM_LAYER,
		oButton,
		{	
			//sprite_index: noone,
			scr: uiButtonTextLog,
			title: global.uiData.buttonTextlog
		}
	);
	instance_create_layer(
		VIEWPORT_WIDTH - 80,
		VIEWPORT_HEIGHT - 64,
		SYSTEM_LAYER,
		oButton,
		{	
			//sprite_index: noone,
			scr: uiButtonPause,
			title: global.uiData.buttonMenu
		}
	);
}

switch room {
	case rmInit:		{	global.dataMenu = DataMenuSetup(); room_goto(rmTitleScreen /*TODO rmSplashScreen*/);							}	break;
	case rmStage:		{	_buttonSettings();	AmbientPlayAll();													}	break;
	case rmMap:			{	_buttonSettings();	AmbientPlayAll();													}	break;
	case rmTitleScreen:	{	if (os_type == os_gxgames) MenuCreate("titleMain"); else MenuCreate("titleMainWin");	}	break;
}