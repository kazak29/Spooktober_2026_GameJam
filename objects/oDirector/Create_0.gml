#region debug
	
	//randomise();
	global.cheat = true;
	global.cheatcode = "bees";
	global.showDebugUI = false;

#endregion
#region sound
	
	//volume
	global.volMusic		= 0.5;	//music
	global.volSound		= 0.5;	//ambient and sound effects
	global.volLineTW	= 0.5;	//line typewriter
	
	//struct for all ambient data (includes music)
	global.ambient = {};
	
#endregion
#region gamedata
	
	global.screenShakeActive = true;
	
#endregion
#region state machine

	global.gamePaused = false;
	global.midTransition = false;
	
	global.directorState = DirectorStateDefault;
	global.directorStatePrev = DirectorStateDefault;
	
#endregion
#region screenplay
	
	//scene vars
	global.sceneCurrent = SCENE_TEST;
	global.sceneNodePos = 0;
	global.sceneNodeData = {};
	
	//line sequence vars
	global.lineSeq = "";
	global.lineSeqPos = 0;
	
#endregion