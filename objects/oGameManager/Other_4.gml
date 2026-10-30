global.gamePaused = false;

var _buttonSettings = function() {
	if instance_exists(oDirector) {
		instance_create_layer(
			VIEWPORT_WIDTH - 80,
			VIEWPORT_HEIGHT - 192,
			SYSTEM_LAYER,
			oButton,
			{	
				//sprite_index: noone,
				scr: uiButtonToggleUI,
				title: global.uiData.buttonHideUI,
				toggled: false   // This button is toggleable
			}
		);
	}
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
	case rmInit:		{	global.dataMenu = DataMenuSetup(); /*TODO*/ /*room_goto(rmBandEnding);*/ /*room_goto(rmTitleScreen);*/ room_goto(rmSplashScreen);	}	break;
	case rmStage:		{	_buttonSettings();	AmbientPlayAll();															}	break;
	case rmMap:			{	_buttonSettings();	AmbientPlayAll();															}	break;
	case rmTitleScreen:	{	if (os_type == os_gxgames) MenuCreateFirst("titleMain"); else MenuCreateFirst("titleMainWin");	}	break;
}