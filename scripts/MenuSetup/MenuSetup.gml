function DataMenuElementsCreate(){
	return {
		back: {
			title:			"menuBack",
			elemType:		MENU_ELEMENT_TYPE.BACK,
		},
		
		#region main
			gameStart: {
				title:			"menuStart",
				elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:			MenuGameStart,
				arg:			[rmStage, sqFadeOut, sqFadeIn],
			},
			pageSettings: {
				title:			"menuSettings",
				elemType:		MENU_ELEMENT_TYPE.PAGE_TRANSFER,
				menuName:		"titleSettings",
			},
			credits: {
				title:			"menuCredits",
				elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:			MenuTransitionStart,
				arg:			[rmCredits, sqFadeOut, sqFadeIn],
			},
			pageCrtTitle: {
				title:			"menuCrt",
				elemType:		MENU_ELEMENT_TYPE.PAGE_TRANSFER,
				menuName:		"titleCrt",
			},
			
			pageSettingsWin: {
				title:			"menuSettings",
				elemType:		MENU_ELEMENT_TYPE.PAGE_TRANSFER,
				menuName:		"titleSettingsWin",
			},
			pageCrtTitleWin: {
				title:			"menuCrt",
				elemType:		MENU_ELEMENT_TYPE.PAGE_TRANSFER,
				menuName:		"titleCrtWin",
			},
			gameEnd: {
				title:			"menuEnd",
				elemType:		MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:			game_end,
				arg:			0,
			},
		#endregion
		#region settings
			fullscreen: {
				title:			"menuFullscreen",
				elemType:		MENU_ELEMENT_TYPE.TOGGLE,
				varName:		"fullscreen",
			},
			volMusic: {
				title:			"menuVolMusic",
				elemType:		MENU_ELEMENT_TYPE.SLIDER,
				varName:		"volMusic",
				argClamp:		[0,1],
				whole:			false,
				style:			MENU_SLIDER_STYLE.PERC_BAR,
			},
			volSound: {
				title:			"menuVolSound",
				elemType:		MENU_ELEMENT_TYPE.SLIDER,
				varName:		"volSound",
				argClamp:		[0,1],
				whole:			false,
				style:			MENU_SLIDER_STYLE.PERC_BAR,
			},
			volTW: {			//typewriter sfx
				title:			"menuVolTypeWriter",
				elemType:		MENU_ELEMENT_TYPE.SLIDER,
				varName:		"volTypeWriter",
				argClamp:		[0,1],
				whole:			false,
				style:			MENU_SLIDER_STYLE.PERC_BAR,
			},
			uiSfx: {
				title:			"menuSfxUI",
				elemType:		MENU_ELEMENT_TYPE.TOGGLE,
				varName:		"uiSfxActive",
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
				title:		"",
				elemType:	MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:		uiButtonSettings,
				arg:		0,
			},
			gameToMain: {
				title:		"menuToMain",
				elemType:	MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
				scr:		MenuTransitionStart,
				arg:		[rmTitleScreen, sqFadeOut, sqFadeIn],
			},
			pageCrtPause: {
				title:			"menuCrt",
				elemType:		MENU_ELEMENT_TYPE.PAGE_TRANSFER,
				menuName:		"pauseCrt",
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
		};
	}
	
	var _data = {};
	with oMenuBlueprint {
		_data[$ menuName] = {
			x: x,
			y: y,
			spr: _spriteGet(self),
			
			menuNamePrev: menuNamePrev,
			elements: [],
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
		}
	}
	
	//sort arrays by element y position
	with oMenuBlueprint {
		array_sort(_data[$ menuName].elements,function(_prev,_next) {
			return sign(_prev.y - _next.y);
		});
	}
	
	return _data;
}
function MenuCreate(_name){
	instance_destroy(oMenu);
	instance_destroy(oMenuElement);
	
	with global.dataMenu[$ _name] {
		menuId = instance_create_layer(x,y,SYSTEM_LAYER,oMenu);
		with menuId {
			menuName = _name;
			menuNamePrev = other.menuNamePrev;
			
			MenuSetSprite(other.spr);
		}
		
		for (var i = 0; i < array_length(elements); i++) {
			with elements[i] {
				MenuSettingGet(self);
				
				elemId = instance_create_layer(x,y,SYSTEM_LAYER, oMenuElementMain);
				with elemId {
					num	= i;
					
					MenuSetSprite(other.spr);
					MenuSetStr(other,"menuElemMain")
				}
				
				var _names = struct_get_names(elemSubs);
				for (var j = 0; j < array_length(_names); j++) {
					with elemSubs[$ _names[j]] {
						
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
									sprCircleScale	= other.sprCircleScale
								
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
		
		//set menu to highlight first element on frame 1
		menuId.main.elemId = struct_get(elements[0], "elemId") ?? noone;
	}
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
	scribId = scribble(_title, _uniqueId).starting_format(_from.str.font, c_white).align(_from.str.alignH,_from.str.alignV);
	strX = _from.str.x;
	strY = _from.str.y;
}

function MenuSettingGet(_elemData){
	var _varName = struct_get(_elemData, "varName") ?? noone;
	if is_string(_varName) {
		if variable_global_exists(_varName) {
			
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
}
function MenuSettingSet(_elemData){
	var _arg		= _elemData[$"arg"];
	var _varName	= _elemData[$"varName"];
		
	if !is_string(_varName) {
		show_debug_message("settings variable name is not set properly YOU FOOL");
		exit;
	}
		
	if variable_global_exists(_varName) {
		variable_global_set(_varName, _arg);
			
		//additional triggers
		switch _varName {
			case "volMusic": {
				VolumeUpdateAmbient();
			} break;
				
			case "volSound": {
				VolumeUpdateAmbient();
					
				if !audio_is_playing(sfxUI)
				{ SoundPlay(sfxUI, 50); }
			} break;
				
			case "volTypeWriter": {
				VolumeUpdateAmbient();
				with oDirector TypewriterSoundPlay();
					
				if !audio_is_playing(sfxTypewriterSpook)
				{ SoundPlay(sfxTypewriterSpook, 50, false, global.volTypeWriter); }
			} break;
				
		}
			
	} else {
			
		//special vars
		switch _varName {
			default: {
					
				//nested struct variables
				var _varParts = string_split(_varName, ".");
				var _al = array_length(_varParts)
				if _al > 0 && variable_global_exists(_varParts[0]) {
						
					var _nestedArg = variable_global_get(_varParts[0]);
					for (var i = 1; i < _al - 1; i++) {
						_nestedArg = _nestedArg[$ _varParts[i]];
					}
						
					_nestedArg[$ _varParts[_al - 1]] = _arg;
						
				}
					
			} break;
				
			case "fullscreen": {
				window_set_fullscreen(_arg);
			} break;
		}
			
	}
}
function MenuUpdateShift(_elemData){
	with _elemData.elemSubs.center.elemId {
		title = _elemData.argTitles[_elemData.arg];
		MenuSetStr(self,"menuElemShift");
	}
}
