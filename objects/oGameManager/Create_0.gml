#region debug
	
	//randomise();
	global.cheat = true;
	global.cheatcode = "bees";
	global.showDebugUI = false;

#endregion
#region shader
	
	u_resolution		= shader_get_uniform(shdCRT, "u_resolution");
	u_time				= shader_get_uniform(shdCRT, "u_time");
	u_abberation		= shader_get_uniform(shdCRT, "u_abberation");
	u_noise				= shader_get_uniform(shdCRT, "u_noise");
	u_scanlines			= shader_get_uniform(shdCRT, "u_scanlines");
	u_scanlines_glow	= shader_get_uniform(shdCRT, "u_scanlines_glow");
	u_mask				= shader_get_uniform(shdCRT, "u_mask");
	u_mask_scale		= shader_get_uniform(shdCRT, "u_mask_scale");
	u_glow				= shader_get_uniform(shdCRT, "u_glow");
	u_bright			= shader_get_uniform(shdCRT, "u_bright");
	u_flicker			= shader_get_uniform(shdCRT, "u_flicker");
	u_roll				= shader_get_uniform(shdCRT, "u_roll");
	
	global.crt = {
		active:			true,
		abberation:		0.0012,	//slider, from -0.002 to 0.002
		noise:			0.02,	//slider, from 0 to 0.1
		scanlines:		0.04,	//slider, from 0 to 0.1
		scanlinesGlow:	0,		//toggle, from 0 to 1
		mask:			0,		//shift,  from 0 to 3, 0 off, 1 grille, 2 dots, 3 slot
		maskScale:		1,		//slider, from 1 to 4
		glow:			0.05,	//slider, from 0 to 0.5
		bright:			1,		//slider, from 0.5 to 1.5
		flicker:		0.02,	//slider, from 0 to 0.03
		roll:			0.05,	//slider, from 0 to 0.1
	};
	
#endregion
#region load from files

	global.uiData = LoadUI();
	global.lineData = LoadLineData();
	
#endregion
#region general
	
	global.gamePaused = false;
	global.menuPages = MenuDataCreate();
	
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

	global.sceneToPlay = noone; //= FIRST_SCENE;      // <--- Now gets set when the player presses start
	global.lastLocationBackground = sBackgroundBlack;
	
	global.textLog = [];
	global.textLogInst = noone;

#endregion