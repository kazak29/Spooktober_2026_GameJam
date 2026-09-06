#region debug
	
	//randomise();
	global.cheat = true;
	global.cheatcode = "bees";
	global.showDebugUI = false;

#endregion
#region sound
	
	global.volMusic		= 0.5;
	global.volSound		= 0.5;
	global.volDialogue	= 0.5;
	
	global.ambient = {};
	
#endregion
#region gamedata
	
	global.screenShakeActive = true;
	
#endregion
#region state machine

	global.gamePaused = false;
	global.midTransition = false;
	
	global.gameState = GameStateDefault;
	global.gameStatePrev = GameStateDefault;
	
#endregion
#region screenplay
	
	global.sceneCurrent = "";
	global.sceneNodeNum = 0;
	
#endregion