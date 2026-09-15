if oInputManager.pressed.pause {
	
	var _exceptionRoom = (
		room == rmInit || 
		room == rmTitleScreen || 
		room == rmCredits || 
		room == rmSplashScreen
	);
	var _exceptionMenu = instance_exists(oMenu);		//menu destroys itself when unpausing from there
	var _exception = _exceptionRoom || _exceptionMenu;
	
	
	if (!global.midTransition && !_exception) {
		
		if !global.gamePaused PauseActivate(); else PauseDeactivate();
		
	}
	
}