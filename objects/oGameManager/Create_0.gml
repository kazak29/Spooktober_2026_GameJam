#region load from files

	global.uiData = LoadUI();
	global.lineData = LoadLineData();
	
#endregion
#region debug
	
	//randomise();
	global.cheat = true;
	global.cheatcode = "bees";
	global.showDebugUI = false;

#endregion
#region sound
	
	//volume
	global.volMusic		 = 0.5;	  // Music
	global.volSound		 = 0.5;	  // Ambient and sound effects
	global.volTypeWriter = 0.5;   // Line typewriter
	
	// Struct for all ambient data (includes music)
	global.ambient = {};
	
#endregion
#region transition

	global.midTransition = false;
	global.roomTarget = noone;

#endregion
#region screenplay

	global.screenPlay = LoadScreenPlay();
	global.sceneToPlay = "introScene1";

#endregion
#region menu
	
	global.menuPages = MenuDataCreate();
	
#endregion

// Add all Scribble Events
ScribbleAddAllEvents();
