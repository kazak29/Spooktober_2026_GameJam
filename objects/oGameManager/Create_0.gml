#region shader
	
	u_resolution	= shader_get_uniform(shdCRT, "u_resolution");
	u_time			= shader_get_uniform(shdCRT, "u_time");
	u_abberation	= shader_get_uniform(shdCRT, "u_abberation");
	u_noise			= shader_get_uniform(shdCRT, "u_noise");
	u_scanlines		= shader_get_uniform(shdCRT, "u_scanlines");
	u_mask			= shader_get_uniform(shdCRT, "u_mask");
	u_mask_scale	= shader_get_uniform(shdCRT, "u_mask_scale");
	
	global.crt = {
		active:		true,
		abberation: 0.0015,	//from -0.002 to 0.002,
		noise:		0.02,	//from 0 to 0.1,
		scanlines:	0.04,	//from 0 to 0.1,
		mask:		0,		//from 0 to 3,
		maskScale:	2,		//from 1 to 6,
		
	};
	
#endregion
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
	
	global.uiSfxActive = false;
	
#endregion
#region transition

	global.midTransition = false;
	global.roomTarget = noone;

#endregion
#region screenplay

	global.screenPlay = LoadScreenPlay();
	//global.sceneToPlay = "emptyScene";
	global.sceneToPlay = FIRST_SCENE;
	
	global.textLog = [];
	global.textLogInst = noone;

#endregion
#region menu
	
	global.menuPages = MenuDataCreate();
	
#endregion

// Add all Scribble Events
ScribbleAddAllEvents();
