function MenuTransitionStart(_arg){
	var _al = array_length(_arg);
	if (_al < 3) show_debug_message("MENU TRANSITION DATA MISSING");
	
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
}
function MenuVolSound(_arg){
	global.volSound = _arg;
}
function MenuVolTypeWriter(_arg){
	global.volTypeWriter = _arg;
}

function MenuResume(_arg){
	with oMenu instance_destroy();
	with oMenuElement instance_destroy();
}