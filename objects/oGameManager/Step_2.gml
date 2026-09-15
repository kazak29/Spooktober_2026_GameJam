if oInputManager.pressed.pause {
	
	//exceptions
	var _exceptionRoom = (
		room == rmInit || 
		room == rmTitleScreen || 
		room == rmCredits || 
		room == rmSplashScreen
	);
	
	//exceptions check
	if (!global.midTransition && !_exceptionRoom) {
		
		if !global.gamePaused PauseActivate(); else PauseDeactivate();
		
	}
	
}