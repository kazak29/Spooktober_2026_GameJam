function uiButtonSettings(){
	with global.textLogInst instance_destroy();
	
	if instance_exists(oMenu) {
		global.gamePaused = false;
		with oDirector typist.unpause();
		
		with oMenu instance_destroy();
		with oMenuElement instance_destroy();
	} else {
		global.gamePaused = true;
		with oDirector typist.pause();
		
		instance_create_layer(0,0, SYSTEM_LAYER, oMenu, {menuType: MENU_TYPE_PAUSE});
	}
}

function uiButtonTextLog(){
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