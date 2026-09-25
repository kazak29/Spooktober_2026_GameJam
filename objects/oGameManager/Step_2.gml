#region ui buttons

	var _exceptionRoom = (
		room == rmInit || 
		room == rmTitleScreen || 
		room == rmCredits || 
		room == rmSplashScreen
	);
	var _exception = _exceptionRoom;
	
	
	if (!global.midTransition && !_exception) {
		
		with oButton active = true;
		if oInputManager.pressed.pause	{ uiSfxPlayClick(); uiButtonSettings(); }
		if oInputManager.pressed.select	{ uiSfxPlayClick(); uiButtonTextLog();	}
		
	} else {
		
		with oButton active = false;
		
	}

#endregion
