function DataMenuElementsCreate(){
	return {
		back: {
			title:			"menuBack",
			elemType:		MENU_ELEMENT_TYPE.BACK,
		},
		
		#region cheats
			restart: {
				title:			"Game Restart (R)",
				elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:			game_restart,
				arg:			0,
			},
			muteMusic: {
				title:			"Mute Music (M)",
				elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:			function() { global.volume.music = 0; VolumeUpdateAmbient(); },
				arg:			0,
			},
			cheatCrt: {
				title:			"Toggle CRT (C)",
				elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:			function() { global.crt.active = !global.crt.active; },
				arg:			0,
			},
			
			
			mapVisited: {
				title:			"Set All Locations As Visited",
				elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:			function() {
									var _names = struct_get_names(global.dataMapLocations);
									for (var i = 0; i < array_length(_names); i++) {
										global.dataMapLocations[$ _names[i]].visited = true;
									}
								},
				arg:			0,
			},
			homeQuest: {
				title:			"Set Home to Start Candy Quest",
				elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:			function() { global.dataMapLocations.home.scene = "p1HomeQuest"; },
				arg:			0,
			},
			map: {
				title:			"Go to Map (From Stage)",
				elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:			function() { SceneToMap(); },
				arg:			0,
			},
			mapP1: {
				title:			"Go to Map (Start of Part 1)",
				elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:			function() {
									global.chapter = 0;
									Part1MapDataUpdate();
									TransitionStart(rmMap, sqFadeOut, sqFadeIn);
								},
				arg:			0,
			},
			mapP2: {
				title:			"Go to Map (Start of Part 2)",
				elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:			function() {
									ChapterProgress();
									Part2MapDataUpdate();
									TransitionStart(rmMap, sqFadeOut, sqFadeIn);
								},
				arg:			0,
			},
			introP1: {
				title:			"Go to Intro (Part 1)",
				elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:			function() {
									AmbientChange(AMBIENT_MUSIC, noone);
									Part1MapDataUpdate();
									global.sceneToPlay = "intro";
									TransitionStart(rmStage, sqFadeOut, sqFadeIn);
								},
				arg:			0,
			},
			introP2: {
				title:			"Go to Intro (Part 2)",
				elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:			function() {
									AmbientChange(AMBIENT_MUSIC, noone);
									Part2MapDataUpdate();
									global.sceneToPlay = "p2Intro";
									TransitionStart(rmStage, sqFadeOut, sqFadeIn);
								},
				arg:			0,
			},
			endP1: {
				title:			"Go to End (Part 1)",
				elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:			function() {
									AmbientChange(AMBIENT_MUSIC, noone);
									global.sceneToPlay = "p1EndIntro";
									TransitionStart(rmStage, sqFadeOut, sqFadeIn);
								},
				arg:			0,
			},
			endP2: {
				title:			"Go to End (Part 2)",
				elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:			function() {
									AmbientChange(AMBIENT_MUSIC, noone);
									global.sceneToPlay = "p2EndIntro";
									TransitionStart(rmStage, sqFadeOut, sqFadeIn);
								},
				arg:			0,
			},
			
			
			candyStart: {
				title:			"Candy Quest Start",
				elemType:		MENU_ELEMENT_TYPE.TOGGLE,
				varName:		"flags.questCandyStart",
			},
			candyComplete: {
				title:			"Candy Quest Complete",
				elemType:		MENU_ELEMENT_TYPE.TOGGLE,
				varName:		"flags.questCandyComplete",
			},
			candyFail: {
				title:			"Candy Quest Fail",
				elemType:		MENU_ELEMENT_TYPE.TOGGLE,
				varName:		"flags.questCandyFail",
			},
			princessStart: {
				title:			"Princess Quest Start",
				elemType:		MENU_ELEMENT_TYPE.TOGGLE,
				varName:		"flags.questPrincessStart",
			},
			princessComplete: {
				title:			"Princess Quest Complete",
				elemType:		MENU_ELEMENT_TYPE.TOGGLE,
				varName:		"flags.questPrincessComplete",
			},
			princessFail: {
				title:			"Princess Quest Fail",
				elemType:		MENU_ELEMENT_TYPE.TOGGLE,
				varName:		"flags.questPrincessFail",
			},
			metHamster: {
				title:			"Met Hamster",
				elemType:		MENU_ELEMENT_TYPE.TOGGLE,
				varName:		"flags.metHamster",
			},
			metPrincess: {
				title:			"Met Princess",
				elemType:		MENU_ELEMENT_TYPE.TOGGLE,
				varName:		"flags.metPrincess",
			},
			gotKnight: {
				title:			"Got Knight",
				elemType:		MENU_ELEMENT_TYPE.TOGGLE,
				varName:		"flags.gotKnight",
			},
			knowLimes: {
				title:			"Know Limes",
				elemType:		MENU_ELEMENT_TYPE.TOGGLE,
				varName:		"flags.knowLimes",
			},
		#endregion
		#region main
			gameStart: {
				title:			"menuStart",
				elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:			MenuGameStart,
				arg:			[sqFadeOut, sqFadeIn],
			},
			credits: {
				title:			"menuCredits",
				elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:			MenuTransitionStart,
				arg:			[rmCredits, sqFadeOut, sqFadeIn],
			},
			gameEnd: {
				title:			"menuEnd",
				elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:			game_end,
				arg:			0,
			},
		#endregion
		#region settings
			pageSettings: {
				title:			"menuSettings",
				elemType:		MENU_ELEMENT_TYPE.PAGE_TRANSFER,
				menuName:		"settings",
			},
			fullscreen: {
				title:			"menuFullscreen",
				elemType:		MENU_ELEMENT_TYPE.TOGGLE,
				varName:		"fullscreen",
			},
			volMusic: {
				title:			"menuVolMusic",
				elemType:		MENU_ELEMENT_TYPE.SLIDER,
				varName:		"volume.music",
				argClamp:		[0,1],
				whole:			false,
				style:			MENU_SLIDER_STYLE.PERC_BAR,
			},
			volSound: {
				title:			"menuVolSound",
				elemType:		MENU_ELEMENT_TYPE.SLIDER,
				varName:		"volume.sound",
				argClamp:		[0,1],
				whole:			false,
				style:			MENU_SLIDER_STYLE.PERC_BAR,
			},
			volWriter: {
				title:			"menuVolWriter",
				elemType:		MENU_ELEMENT_TYPE.SLIDER,
				varName:		"volume.writer",
				argClamp:		[0,1],
				whole:			false,
				style:			MENU_SLIDER_STYLE.PERC_BAR,
			},
			volUI: {
				title:			"menuVolUI",
				elemType:		MENU_ELEMENT_TYPE.SLIDER,
				varName:		"volume.ui",
				argClamp:		[0,1],
				whole:			false,
				style:			MENU_SLIDER_STYLE.PERC_BAR,
			},
			crtActive: {
				title:			"menuCrtActive",
				elemType:		MENU_ELEMENT_TYPE.TOGGLE,
				varName:		"crt.active",
			},
			settingsReset: {
				title:			"menuReset",
				elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:			MenuSettingsReset,
			},
		#endregion
		#region crt
			pageCrt: {
				title:			"menuCrt",
				elemType:		MENU_ELEMENT_TYPE.PAGE_TRANSFER,
				menuName:		"crt",
			},
			crtAbberation: {
				title:			"menuCrtAbberation",
				elemType:		MENU_ELEMENT_TYPE.SLIDER,
				varName:		"crt.abberation",
				argClamp:		[-0.002, 0.002],
				whole:			false,
				style:			MENU_SLIDER_STYLE.PERC_SCALE_HUNDRED,
			},
			crtNoise: {
				title:			"menuCrtNoise",
				elemType:		MENU_ELEMENT_TYPE.SLIDER,
				varName:		"crt.noise",
				argClamp:		[0, 0.1],
				whole:			false,
				style:			MENU_SLIDER_STYLE.PERC_BAR,
			},
			crtScanlines: {
				title:			"menuCrtScanlines",
				elemType:		MENU_ELEMENT_TYPE.SLIDER,
				varName:		"crt.scanlines",
				argClamp:		[0, 0.1],
				whole:			false,
				style:			MENU_SLIDER_STYLE.PERC_BAR,
			},
			crtScanlinesGlow: {
				title:			"menuCrtScanlinesGlow",
				elemType:		MENU_ELEMENT_TYPE.TOGGLE,
				varName:		"crt.scanlinesGlow",
			},
			crtMask: {
				title:			"menuCrtMask",
				elemType:		MENU_ELEMENT_TYPE.SHIFT,
				varName:		"crt.mask",
				argTitles:		["menuOff", "menuCrtMaskGrille", "menuCrtMaskDots", "menuCrtMaskSlot"],
			},
			crtMaskScale: {
				title:			"menuCrtMaskScale",
				elemType:		MENU_ELEMENT_TYPE.SLIDER,
				varName:		"crt.maskScale",
				argClamp:		[1, 4],
				whole:			true,
				style:			MENU_SLIDER_STYLE.UNMODIFIED,
			},
			crtGlow: {
				title:			"menuCrtGlow",
				elemType:		MENU_ELEMENT_TYPE.SLIDER,
				varName:		"crt.glow",
				argClamp:		[0, 0.5],
				whole:			false,
				style:			MENU_SLIDER_STYLE.PERC_BAR,
			},
			crtBright: {
				title:			"menuCrtBright",
				elemType:		MENU_ELEMENT_TYPE.SLIDER,
				varName:		"crt.bright",
				argClamp:		[0.5, 1.5],
				whole:			false,
				style:			MENU_SLIDER_STYLE.PERC_SCALE_ROUNDED,
			},
			crtFlicker: {
				title:			"menuCrtFlicker",
				elemType:		MENU_ELEMENT_TYPE.SLIDER,
				varName:		"crt.flicker",
				argClamp:		[0, 0.03],
				whole:			false,
				style:			MENU_SLIDER_STYLE.PERC_BAR,
			},
			crtRoll: {
				title:			"menuCrtRoll",
				elemType:		MENU_ELEMENT_TYPE.SLIDER,
				varName:		"crt.roll",
				argClamp:		[0, 0.1],
				whole:			false,
				style:			MENU_SLIDER_STYLE.PERC_BAR,
			},
		#endregion
		#region pause
			gameResume: {
				title:		"menuResume",
				elemType:	MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:		uiButtonPause,
				arg:		0,
			},
			gameToMain: {
				title:		"menuToMain",
				elemType:	MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:		MenuTransitionStart,
				arg:		[rmTitleScreen, sqFadeOut, sqFadeIn],
			},
		#endregion
		#region save
			pageSave: {
				title:			"menuSave",
				elemType:		MENU_ELEMENT_TYPE.PAGE_TRANSFER,
				menuName:		"save",
			},
			saveDummy: {
				title: global.uiData.menuSaveDummy,
				elemType:	MENU_ELEMENT_TYPE.DUMMY,
			},
			save0: {	//<--- AUTOSAVE
				title:		"",
				elemType:	MENU_ELEMENT_TYPE.SAVE_FILE,
				scr:		MenuGameSave,
				arg:		[0],
				surfSpr:	noone,
			},
			save1: {
				title:		"",
				elemType:	MENU_ELEMENT_TYPE.SAVE_FILE,
				scr:		MenuGameSave,
				arg:		[1],
				surfSpr:	noone,
			},
			save2: {
				title:		"",
				elemType:	MENU_ELEMENT_TYPE.SAVE_FILE,
				scr:		MenuGameSave,
				arg:		[2],
				surfSpr:	noone,
			},
			save3: {
				title:		"",
				elemType:	MENU_ELEMENT_TYPE.SAVE_FILE,
				scr:		MenuGameSave,
				arg:		[3],
				surfSpr:	noone,
			},
			save4: {
				title:		"",
				elemType:	MENU_ELEMENT_TYPE.SAVE_FILE,
				scr:		MenuGameSave,
				arg:		[4],
				surfSpr:	noone,
			},
			save5: {
				title:		"",
				elemType:	MENU_ELEMENT_TYPE.SAVE_FILE,
				scr:		MenuGameSave,
				arg:		[5],
				surfSpr:	noone,
			},
		#endregion
		#region load
			pageLoad: {
				title:			"menuLoad",
				elemType:		MENU_ELEMENT_TYPE.PAGE_TRANSFER,
				menuName:		"load",
			},
			loadDummy: {
				title: global.uiData.menuLoadDummy,
				elemType:	MENU_ELEMENT_TYPE.DUMMY,
			},
			load0: {
				title:		"",
				elemType:	MENU_ELEMENT_TYPE.SAVE_FILE,
				scr:		MenuGameLoad,
				arg:		[0, sqFadeOut, sqFadeIn],
				surfSpr:	noone,
			},
			load1: {
				title:		"",
				elemType:	MENU_ELEMENT_TYPE.SAVE_FILE,
				scr:		MenuGameLoad,
				arg:		[1, sqFadeOut, sqFadeIn],
				surfSpr:	noone,
			},
			load2: {
				title:		"",
				elemType:	MENU_ELEMENT_TYPE.SAVE_FILE,
				scr:		MenuGameLoad,
				arg:		[2, sqFadeOut, sqFadeIn],
				surfSpr:	noone,
			},
			load3: {
				title:		"",
				elemType:	MENU_ELEMENT_TYPE.SAVE_FILE,
				scr:		MenuGameLoad,
				arg:		[3, sqFadeOut, sqFadeIn],
				surfSpr:	noone,
			},
			load4: {
				title:		"",
				elemType:	MENU_ELEMENT_TYPE.SAVE_FILE,
				scr:		MenuGameLoad,
				arg:		[4, sqFadeOut, sqFadeIn],
				surfSpr:	noone,
			},
			load5: {
				title:		"",
				elemType:	MENU_ELEMENT_TYPE.SAVE_FILE,
				scr:		MenuGameLoad,
				arg:		[5, sqFadeOut, sqFadeIn],
				surfSpr:	noone,
			},
		#endregion
		#region confirm
			confirmSaveDummy: {
				title:			"menuConfirmSaveDummy",
				elemType:		MENU_ELEMENT_TYPE.DUMMY,
			},
			confirmLoadDummy: {
				title:			"menuConfirmLoadDummy",
				elemType:		MENU_ELEMENT_TYPE.DUMMY,
			},
			confirmYes: {
				title:			"menuYes",
				elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:			MenuConfirmYes,
				arg:			[0],
			},
			confirmNo: {
				title:			"menuNo",
				elemType:		MENU_ELEMENT_TYPE.BACK,
			},
		#endregion
	};
}
function DataMenuSetup(){
	
	var _spriteGet = function(_from){
		return {
			sprite_index:	_from.sprite_index,
			image_index:	_from.image_index,
			image_speed:	_from.image_speed,
			image_xscale:	_from.image_xscale,
			image_yscale:	_from.image_yscale,
			image_alpha:	_from.image_alpha,
		}
	}
	
	var _strGet = function(_from){
		//save shift separately
		var _shiftX = _from.strX;
		var _shiftY = _from.strY;
		
		//string position shift relative to button
		switch _from.alignH {
			case fa_left:	_from.strX += _from.bbox_left - _from.x;										break;
			case fa_center: _from.strX += (_from.bbox_right - _from.bbox_left)/2 - _from.sprite_xoffset;	break;
			case fa_right:	_from.strX += _from.bbox_right - _from.x;										break;
		}
		switch _from.alignV {
			case fa_top:	_from.strY += _from.bbox_top - _from.y;											break;
			case fa_middle: _from.strY += (_from.bbox_bottom - _from.bbox_top)/2 - _from.sprite_yoffset;	break;
			case fa_bottom:	_from.strY += _from.bbox_bottom - _from.y;										break;
		}
		
		return {
			font:	(is_string(_from.font) && font_exists(asset_get_index(_from.font)) ? _from.font : FONT_DIALOGUE_TEXT_TITLE),
			alignH: _from.alignH,
			alignV: _from.alignV,
			x:		_from.strX,
			y:		_from.strY,
			shiftX: _shiftX,
			shiftY: _shiftY,
			scale:	_from.strScale,
		};
	}
	
	var _data = {};
	with oMenuBlueprint {
		_data[$ menuName] = {
			x: x,
			y: y,
			spr: _spriteGet(self),
			
			fade:			fade,
			elements:		[],
			dummies:		[],
		};
	}
	
	with oMenuBlueprintElementMain {
		//search sub elements
		var _elemSubs = {};
		switch global.menuElements[$ elemName].elemType {
			case MENU_ELEMENT_TYPE.TOGGLE: {
				
				with oMenuBlueprintElementToggle {
					if depth == other.depth && elemName == other.elemName {
						
						var _name = "off";
						var _title = "menuOff";
						if side {
							_name = "on";
							_title = "menuOn";
						}
						
						_elemSubs[$ _name] = {
							x: x,
							y: y,
							spr: _spriteGet(self),
							str: _strGet(self),
							title: _title,
							side: side,
						};
						
					}
				}
				
			} break;
			case MENU_ELEMENT_TYPE.SLIDER: {
				
				with oMenuBlueprintElementSlider {
					if depth == other.depth && elemName == other.elemName {
						
						var _name = "slider";
						if percent _name = "percent";
						
						_elemSubs[$ _name] = {
							x: x,
							y: y,
							spr: _spriteGet(self),
							str: _strGet(self),
							percent:		percent,
							bufferX:		bufferX,
							bufferY:		bufferY,
							sprSlider:		sprSlider,
							sprCircle:		sprCircle,
							sprCircleScale: sprCircleScale,
						};
						
					}
				}
				
			} break;
			case MENU_ELEMENT_TYPE.SHIFT: {
				
				with oMenuBlueprintElementShift {
					if depth == other.depth && elemName == other.elemName {
						
						var _name = "center";
						var _title = "";
						switch side {
							case 0: {_name = "left";	_title = "<<";	} break;
							case 2: {_name = "right";	_title = ">>";	} break;
						}
						
						_elemSubs[$ _name] = {
							x: x,
							y: y,
							spr: _spriteGet(self),
							str: _strGet(self),
							title: _title,
							side: side,
						};
						
					}
				}
				
			} break;
		}
		
		//search menu
		var _menu = noone;
		with oMenuBlueprint {if depth == other.depth _menu = id;}
		
		//add all parameters into global menu data
		array_push(
			_data[$ _menu.menuName].elements,
			variable_clone(global.menuElements[$ elemName])
		);
		with array_last(_data[$ _menu.menuName].elements) {
			elemSubs = _elemSubs;
			x = other.x;
			y = other.y;
			spr = _spriteGet(other);
			str = _strGet(other);
			position = other.position;
		}
	}
	
	//sort arrays by element positions
	with oMenuBlueprint {
		array_sort(_data[$ menuName].elements,function(_prev,_next) {
			var _h = sign(_prev.x - _next.x);
			var _v = sign(_prev.y - _next.y);
			var _p = sign(_prev.position - _next.position);
			
			if _p != 0 return _p;
			if _h != 0 return _h;
			if _v != 0 return _v;
			return 0;
		});
	}
	
	with oMenuBlueprintElementDummy {
		//search menu
		var _menu = noone;
		with oMenuBlueprint {if depth == other.depth _menu = id;}
		
		//add all parameters into global menu data
		array_push(
			_data[$ _menu.menuName].dummies,
			variable_clone(global.menuElements[$ elemName])
		);
		with array_last(_data[$ _menu.menuName].dummies) {
			x = other.x;
			y = other.y;
			spr = _spriteGet(other);
			str = _strGet(other);
		}
	}
	
	return _data;
}
function MenuCreate(_name){
	//lock mouse from hovering when switching menus
	with oInputManager mouse.active = false;
	
	instance_destroy(oMenu);
	instance_destroy(oMenuElement);
	array_push(global.menuParameters.layers, _name);
	
	with global.dataMenu[$ _name] {
		//save instance id to menu data struct
		menuId = instance_create_layer(x,y,SYSTEM_LAYER,oMenu);
		with menuId {
			menuName = _name;
			MenuSetSprite(other.spr);
		}
		
		//setup fade
		if !global.menuParameters.fade global.menuParameters.fade = fade;
		
		//create elements
		for (var i = 0; i < array_length(elements); i++) {
			with elements[i] {
				MenuSettingGet(self);
				MenuUpdateSave(self);
				
				//save instance id to element data struct
				elemId = instance_create_layer(x,y,SYSTEM_LAYER, oMenuElementMain);
				with elemId {
					num	= i;
					
					MenuSetSprite(other.spr);
					MenuSetStr(other,"menuElemMain");
				}
				
				var _names = struct_get_names(elemSubs);
				for (var j = 0; j < array_length(_names); j++) {
					with elemSubs[$ _names[j]] {
						
						//save instance id to sub element data struct
						elemId = instance_create_layer(x,y,SYSTEM_LAYER,oMenuElementSub);
						switch other.elemType {
							
							case MENU_ELEMENT_TYPE.TOGGLE: {
								with elemId {
									num		= i;
									side	= other.side;
								
									MenuSetSprite(other.spr);
									MenuSetStr(other,"menuElemToggle");
								}
							} break;
							case MENU_ELEMENT_TYPE.SLIDER: {
								with elemId {
									num				= i;
									percent			= other.percent;
									bufferX			= other.bufferX;
									bufferY			= other.bufferY;
									sprSlider		= other.sprSlider;
									sprCircle		= other.sprCircle;
									sprCircleScale	= other.sprCircleScale;
								
									MenuSetSprite(other.spr);
									str = variable_clone(other.str);
								}
							} break;
							case MENU_ELEMENT_TYPE.SHIFT: {
								with elemId {
									num		= i;
									side	= other.side;
								
									MenuSetSprite(other.spr);
									MenuSetStr(other,"menuElemShift");
									str	= variable_clone(other.str);
								}
								
								if side == 1 MenuUpdateShift(other);
							} break;
							
						}
						
					}
				}
			}
		}
		
		//set menu to highlight first (unlocked) element on frame 1
		with menuId {
			while CheckLocked(other.elements[num]) DiscretProgress(1);
			main.elemId = struct_get(other.elements[num], "elemId") ?? noone;
		}
		
		//create dummies
		for (var i = 0; i < array_length(dummies); i++) {
			with dummies[i] {
				//save instance id to dummy data struct
				elemId = instance_create_layer(x,y,SYSTEM_LAYER, oMenuElementDummy);
				with elemId {
					MenuSetSprite(other.spr);
					
					//quick script to load data
					var _loadConfirm = function(_elemData){
						if !is_struct(_elemData) return undefined;
						var _fileName = SaveFileGetName(_elemData.arg[0]);
						return Load(_fileName);
					}
					
					//change title for save file related dummies
					switch other.title {
						case "menuConfirmSaveDummy": {
							var _elemData = global.menuParameters.confirmElemData;
							var _data = _loadConfirm(_elemData);
							if is_struct(_data) {
								other.title = "menuConfirmSaveOverrideDummy";
								saveFileStr = {};
								with saveFileStr MenuSetStr(_elemData, "menuElemDummy");
							}
						} break;
						case "menuConfirmSaveOverrideDummy": {
							var _elemData = global.menuParameters.confirmElemData;
							var _data = _loadConfirm(_elemData);
							if is_struct(_data) {
								saveFileStr = {};
								with saveFileStr MenuSetStr(_elemData, "menuElemDummy");
							} else other.title = "menuConfirmSaveDummy";
						} break;
						case "menuConfirmLoadDummy": {
							var _elemData = global.menuParameters.confirmElemData;
							var _data = _loadConfirm(_elemData);
							if is_struct(_data) {
								saveFileStr = {};
								with saveFileStr MenuSetStr(_elemData, "menuElemDummy");
							}
						} break;
					}
					MenuSetStr(other,"menuElemDummy");
				}
			}
		}
	}
}

function MenuDestroy(){
	instance_destroy(oMenu);
	instance_destroy(oMenuElement);
	
	global.menuParameters = {
		fade: false,
		layers: [],
		confirmElemData: noone,
	};
}
function MenuCreateFirst(_name){
	MenuDestroy();
	MenuCreate(_name);
}
function MenuGoBack(){
	if !is_array(global.menuParameters.layers) || (array_length(global.menuParameters.layers) <= 1) return false;
	
	array_pop(global.menuParameters.layers);
	var _menuPrev = array_pop(global.menuParameters.layers);
	MenuCreate(_menuPrev);
	return true;
}

function MenuSetSprite(_from){
	sprite_index	= _from.sprite_index;
	image_index		= _from.image_index;
	image_speed		= _from.image_speed;
	image_xscale	= _from.image_xscale;
	image_yscale	= _from.image_yscale;
	image_alpha		= _from.image_alpha;
}
function MenuSetStr(_from,_uniqueId){
	var _title = global.uiData[$ _from.title] ?? _from.title;
	
	scribId = scribble(_title, _uniqueId)
			.starting_format(_from.str.font, c_white)
			.align(_from.str.alignH,_from.str.alignV)
			.scale(_from.str.scale);
			
	strX = _from.str.x;
	strY = _from.str.y;
	shiftX = _from.str.shiftX;
	shiftY = _from.str.shiftY;
}

function MenuSettingGet(_elemData){
	var _varName = _elemData[$"varName"];
	if !is_string(_varName) exit;	//is not a setting element
	
	if variable_global_exists(_varName) {
		
		//straight global
		_elemData.arg = variable_global_get(_varName);
			
	} else {
		
		//special variables
		switch _varName {
			default: {
					
				//nested struct variables
				var _varParts = string_split(_varName, ".");
				var _al = array_length(_varParts);
				if _al > 0 && variable_global_exists(_varParts[0]) {
						
					var _nestedArg = variable_global_get(_varParts[0]);
					for (var i = 1; i < _al; i++) {
						_nestedArg = _nestedArg[$ _varParts[i]];
					}
						
					_elemData.arg = _nestedArg;
						
				}
					
			} break;
				
			case "fullscreen": {
				_elemData.arg = window_get_fullscreen();
			} break;
		}
			
	}
}
function MenuSettingSet(_elemData){
	var _argPrev	= undefined;
	var _arg		= _elemData[$"arg"];
	var _varName	= _elemData[$"varName"];
	
	if !is_string(_varName) {
		show_debug_message("settings variable name is not set properly YOU FOOL");
		exit;
	}
	
	if variable_global_exists(_varName) {
		
		//straight global
		_argPrev = variable_global_get(_varName);
		variable_global_set(_varName, _arg);
		
	} else {
			
		//nested struct variables
		var _varParts = string_split(_varName, ".");
		var _al = array_length(_varParts)
		if _al > 0 && variable_global_exists(_varParts[0]) {
						
			var _nestedArg = variable_global_get(_varParts[0]);
			for (var i = 1; i < _al - 1; i++) {
				_nestedArg = _nestedArg[$ _varParts[i]];
			}
			
			_argPrev = _nestedArg[$ _varParts[_al - 1]];
			_nestedArg[$ _varParts[_al - 1]] = _arg;
						
		}
			
	}
	
	//additional triggers
	switch _varName {
		case "fullscreen": {
			window_set_fullscreen(_arg);
		} break;
			
		case "volume.music": {
			VolumeUpdateAmbient();
		} break;
				
		case "volume.sound": {
			VolumeUpdateAmbient();
					
			if !audio_is_playing(sfxUI)
			{ SoundPlay(sfxUI, 50); }
		} break;
				
		case "volume.writer": {
			//VolumeUpdateAmbient();
			with oDirector TypewriterSoundPlay();
					
			if !audio_is_playing(sfxTypewriterSpook)
			{ SoundPlay(sfxTypewriterSpook, 50, false, global.volume.writer); }
		} break;
		
		case "volume.ui": {
			//VolumeUpdateAmbient();
					
			if !audio_is_playing(sfxUI)
			{ uiSfxPlayHover(); }
		} break;
	}
	
	//I'm something of a save myself, you know
	if _arg != _argPrev SaveSettings();
}
function MenuUpdateShift(_elemData){
	with _elemData.elemSubs.center.elemId {
		title = _elemData.argTitles[_elemData.arg];
		MenuSetStr(self,"menuElemShift");
	}
}

function MenuUpdateSave(_elemData){
	var _scr = _elemData[$ "scr"];
	if (_scr != MenuGameSave && _scr != MenuGameLoad) exit;
	
	var _fileName = SaveFileGetName(_elemData.arg[0]);
	var _data = Load(_fileName);
	
	//update element scribble data
	var _setStr = function(_elemData){
		if instance_exists(_elemData[$ "elemId"]) {
			with _elemData[$ "elemId"] { MenuSetStr(_elemData, "menuElemMain"); }
		}
	}
	
	//reset locked state
	_elemData.locked = false;
	
	//setup title
	var _title = "";
	if _elemData.arg[0] == 0 {
		_title = string_concat(global.uiData.menuAuto, "\n");
		if (_scr == MenuGameSave) _elemData.locked = true;
	}
	
	//reset title if no save file
	if !is_struct(_data) {
		if (_scr == MenuGameLoad) _elemData.locked = true;
		
		_elemData.title = _title;
		_setStr(_elemData);
		
		exit;
	}
	
	//apply proper title
	_elemData.title = string_concat(_title, _data.dateTime, "\n", global.uiData.menuChapter, $" {_data.chapter+1}", "\n", _data.title);
	_setStr(_elemData);
	
	//apply surface
	if sprite_exists(_elemData.surfSpr) sprite_delete(_elemData.surfSpr);	//delete current surface sprite to prevent memory leaking
	_elemData.surfSpr = LoadSurface(SaveSurfGetName(_elemData.arg[0]));
}