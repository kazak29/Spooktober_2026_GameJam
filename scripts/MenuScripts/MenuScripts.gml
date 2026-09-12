function MenuTransitionStart(_args){
	var _al = array_length(_args);
	if (_al < 3) show_debug_message("MENU TRANSITION DATA MISSING");
	
	TransitionStart(_args[0], _args[1], _args[2]);
}

function MenuFullscreen(){
	
}