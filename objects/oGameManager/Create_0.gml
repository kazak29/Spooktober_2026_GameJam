#region load ui text

	global.uiData = LoadUI();

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

