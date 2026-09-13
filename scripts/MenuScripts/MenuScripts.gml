function MenuTransitionStart(_arg){
	var _al = array_length(_arg);
	if (_al < 3) show_debug_message("MENU TRANSITION DATA MISSING");
	
	TransitionStart(_arg[0], _arg[1], _arg[2]);
}

function MenuFullscreen(_arg){
	window_set_fullscreen(_arg);
}