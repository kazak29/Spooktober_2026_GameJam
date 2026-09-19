function MenuTransitionStart(_arg){
	var _al = array_length(_arg);
	if (_al < 3) show_debug_message("MENU TRANSITION DATA MISSING");
	
	AmbientFadeOutAll();
	TransitionStart(_arg[0], _arg[1], _arg[2]);
}

function MenuFullscreen(_arg){
	window_set_fullscreen(_arg);
}

function MenuLanguage(_arg){
	show_debug_message($"language set to: {_arg}");
}

function MenuVolMusic(_arg){
	global.volMusic = _arg;
	VolumeUpdateAmbient();
}
function MenuVolSound(_arg){
	global.volSound = _arg;
	VolumeUpdateAmbient();
	
	if menuType == MENU_TYPE_TITLE && !audio_is_playing(sfxTypewriterSpook) {
		SoundPlay(sfxTypewriterSpook, 50);
	}
}
function MenuVolTypeWriter(_arg){
	global.volTypeWriter = _arg;
	with oDirector TypewriterSoundPlay();
	
	if menuType == MENU_TYPE_TITLE && !audio_is_playing(sfxTypewriterSpook) {
		SoundPlay(sfxTypewriterSpook, 50, false, global.volTypeWriter);
	}
}

function MenuResume(_arg){
	with oMenu instance_destroy();
	with oMenuElement instance_destroy();
}

function MenuSettingsReset(_arg){
	window_set_fullscreen(false);
	
	global.volMusic			= 0.5;
	global.volSound			= 0.5;
	global.volTypeWriter	= 0.5;
	
	with oDirector TypewriterSoundPlay();
	VolumeUpdateAmbient();
	PageUpdate();
}