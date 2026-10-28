#region debug
	
	randomise();
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
	global.saveDirectorData = noone;
	
#endregion
#region general
	
	global.gamePaused = false;
	global.menuElements = DataMenuElementsCreate();
	global.menuParameters = {
		fade: false,
		layers: [],
	};
	
#endregion
#region sound
	
	global.volume = {
		music:		0.3,
		sound:		0.5,
		writer:		0.5,
		ui:			0,
	};
	
	// Struct for all ambient data (includes music)
	global.ambient = {};
	
#endregion
#region transition

	global.midTransition = false;
	global.roomTarget = noone;

#endregion
#region screenplay

	global.sceneToPlay = noone;
	global.lastLocationBackground = noone;
	
	global.textLog = [];
	global.textLogInst = noone;
	
	global.dataMapLocations = MapDataCreate();
	global.flags = FlagsCreate();
	global.chapter = 0;
	
#endregion

LoadSettings();