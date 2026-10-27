function uiButtonPause(){
	if (instance_exists(oDirector) && !oDirector.uiToggled) exit;
	
	with global.textLogInst instance_destroy();
	with oMenu instance_destroy();
	with oMenuElement instance_destroy();
		
	if global.gamePaused {
		global.gamePaused = false;
		with oDirector typist.unpause();
	} else {
		global.gamePaused = true;
		with oDirector typist.pause();
		
		MenuCreate("pauseMain");
	}
}

function uiButtonTextLog(){
	if (instance_exists(oDirector) && !oDirector.uiToggled) exit;
	
	with oMenu instance_destroy();
	with oMenuElement instance_destroy();
	
	if instance_exists(oTextLog) {
		global.gamePaused = false;
		with oDirector typist.unpause();
		
		instance_destroy(global.textLogInst);
	} else {
		global.gamePaused = true;
		with oDirector typist.pause();
		
		global.textLogInst = instance_create_layer(0, 0, SYSTEM_LAYER, oTextLog);
	}
	
}

function uiButtonToggleUI(){
	if (instance_exists(oTextLog) || instance_exists(oMenu)) exit;
	if (! oDirector.uiToggled) {
		oDirector.uiToggled = true;
		global.gamePaused = false;
		with oDirector typist.unpause();
		//show_debug_message("UI is showing");
	}
	else {
		oDirector.uiToggled = false;
		global.gamePaused = true;
		with oDirector typist.pause();
		with oDirector typist.unpause();
		//show_debug_message("UI is hidden");
	}
}


