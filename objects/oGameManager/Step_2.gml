if oInputManager.pressed.pause {
	
	var _exceptionRoom = (
		room == rmInit || 
		room == rmTitleScreen || 
		room == rmCredits || 
		room == rmSplashScreen
	);
	var _exception = _exceptionRoom;
	
	
	if (!global.midTransition && !_exception) {
		
		//check if specifically the pause menu is present
		var _menuPresent = false;
		with oMenu {
			if (menuType == MENU_TYPE_PAUSE) {
				_menuPresent = true;
				instance_destroy();
			}
		}
		if !_menuPresent instance_create_layer(0,0, SYSTEM_LAYER, oMenu, {menuType: MENU_TYPE_PAUSE});
		
	}
	
}