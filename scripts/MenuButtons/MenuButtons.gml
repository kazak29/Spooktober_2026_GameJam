function MenuGameStart(_args){
	var _al = array_length(_args);
	if (_al < 3) show_debug_message("MENU TRANSITION DATA MISSING");
	
	var _targetRoom = _args[0];
	if (_targetRoom != rmCredits) { AmbientFadeOutAll(); }
	if menuType == MENU_TYPE_PAUSE {
		instance_destroy();
		with oMenuElement instance_destroy();
	}
	
	ClearTextLog();
	if (instance_exists(oTextLog)) { instance_destroy(global.textLogInst); }
	
	ScreenPlayReset();
	
	//global.sceneToPlay = FIRST_SCENE;
	global.sceneToPlay = "testScene";
	//global.sceneToPlay = "rocketTestScene";
	
	TransitionStart(_args[0], _args[1], _args[2]);
}

function MenuTransitionStart(_args){
	var _targetRoom = _args[0];
	if (_targetRoom != rmCredits) { AmbientFadeOutAll(); }
	//if menuType == MENU_TYPE_PAUSE {
	//	instance_destroy();
	//	with oMenuElement instance_destroy();
	//}
	
	ClearTextLog();
	if (instance_exists(oTextLog)) { instance_destroy(global.textLogInst); }
	
	TransitionStart(_args[0], _args[1], _args[2]);
}

function MenuSettingsReset(){
	window_set_fullscreen(false);
	
	global.volMusic			= 0.5;
	global.volSound			= 0.5;
	global.volTypeWriter	= 0.5;
	
	global.uiSfxActive		= false;
	global.crt.active		= true;
	
	global.crt = {
		active:			true,
		abberation:		0.0015,
		noise:			0.02,
		scanlines:		0.04,
		scanlinesGlow:	0,	
		mask:			0,	
		maskScale:		2,	
		glow:			0,	
		bright:			1,	
		flicker:		0.025,
		roll:			0.05,
	};
	
	with oDirector TypewriterSoundPlay();
	VolumeUpdateAmbient();
	PageUpdate();
}
