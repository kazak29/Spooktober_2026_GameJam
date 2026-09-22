function MenuTransitionStart(_arg){
	var _al = array_length(_arg);
	if (_al < 3) show_debug_message("MENU TRANSITION DATA MISSING");
	
	AmbientFadeOutAll();
	if menuType == MENU_TYPE_PAUSE {
		instance_destroy();
		with oMenuElement instance_destroy();
	}
	
	// Reset game to the beginning and clear the textlog
	//global.sceneToPlay = FIRST_SCENE;
	//global.sceneToPlay = "introScene8";
	global.sceneToPlay = "emptyScene";
	ClearTextLog();
	if (instance_exists(oTextLog)) { instance_destroy(global.textLogInst); }
	
	TransitionStart(_arg[0], _arg[1], _arg[2]);
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