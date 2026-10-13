function MenuGameStart(_args){
	AmbientFadeOutAll();
	ScreenPlayReset();
	
	//global.sceneToPlay = FIRST_SCENE;
	global.sceneToPlay = "kazakTestScene";
	//global.sceneToPlay = "rocketTestScene";
	
	TransitionStart(rmStage, _args[0], _args[1]);
}
function MenuGameLoad(_args){
	AmbientFadeOutAll();
	ScreenPlayReset();
	
	var _fileName = SaveFileGetName(_args[0]);
	var _data = Load(_fileName);
	
	if !is_struct(_data) {
		show_debug_message("Save file error!");
		exit;
	}
	
	if (_data.room == rmStage) global.saveDirectorData = _data;
	with _data {
		global.ambient					=	ambient;
		global.lastLocationBackground	=	lastLocationBackground;
		global.textLog					=	textLog;
		global.dataMapLocations			=	dataMapLocations;
		global.flags					=	flags;
		global.chapter					=	chapter;
	}
	
	TransitionStart(_data.room, _args[1], _args[2]);
}
function MenuGameSave(_args){
	var _fileName = SaveFileGetName(_args[0]);
	SaveGame(_fileName);
	
	var _data = Load(_fileName);
	if !is_struct(_data) {
		show_debug_message("Save file error!");
		exit;
	}
}

function MenuTransitionStart(_args){
	var _targetRoom = _args[0];
	if (_targetRoom != rmCredits) { AmbientFadeOutAll(); }
	
	ClearTextLog();
	if (instance_exists(oTextLog)) { instance_destroy(global.textLogInst); }
	
	TransitionStart(_args[0], _args[1], _args[2]);
}
function MenuSettingsReset(){
	window_set_fullscreen(false);
	
	global.volume.music		= 0.5;
	global.volume.sound		= 0.5;
	global.volume.writer	= 0.5;
	global.volume.ui		= 0;
	
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
	
	var _elems = global.dataMenu[$ menuName].elements;
	for (var i = 0; i < array_length(_elems); i++) {
		MenuSettingGet(_elems[i]);
	}
	
	SaveSettings();
}
