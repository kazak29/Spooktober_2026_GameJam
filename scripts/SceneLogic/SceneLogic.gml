#region reusable scene triggers
	
	function SceneClear(){
		with oDirector {
			lineSkip = false;
			stageCharacters = [];
    
		    // Reset main character
		    mainCharacter.alpha = MIN_ALPHA;
		    mainCharacter.targetAlpha = MIN_ALPHA;
		    mainCharacter.yOffset = 0;
		    mainCharacter.yVelocity = 0;
		    mainCharacter.blend = c_white;
	
			spookUp = false;
    
		    previousSpeaker = "";
		}
	}
	
	function SceneStart(_name){
		with oDirector {
			SceneClear();
			
			currentLineSequence = global.lineData[$ _name] ?? [];
	        currentLineIndex = 0;
	        LineSet();
		}
	}
	
	function SceneToMap(){
		with oDirector {
			global.lastLocationBackground = bg.sprInd;
	        currentSceneId = noone;
	        currentNodeId  = noone;
			directorState  = DirectorStateIdle;
			currentLineSequence = [];
			ClearStage();
			TransitionStart(rmMap, sqFadeOut, sqFadeIn);
		}
	}
	
	function SceneTransitionNext(_sceneTarget, _sprInd = undefined, _imInd = 0, _alpha = 1, _col = c_white){
		with oDirector {
			sceneTarget = _sceneTarget;
	        directorState = DirectorStateIdle;
			BackgroundSetTarget(_sprInd, _imInd, _alpha, _col);
			
			instance_create_layer(0,0, SYSTEM_LAYER, oSceneTransition, {transType: SCENE_TRANS_TYPE.NEXT});
		}
	}
	
	function SceneTransitionBg(_sprInd = undefined, _imInd = 0, _alpha = 1, _col = c_white){
		with oDirector {
	        directorState = DirectorStateIdle;
			BackgroundSetTarget(_sprInd, _imInd, _alpha, _col);
			
			instance_create_layer(0,0, SYSTEM_LAYER, oSceneTransition, {transType: SCENE_TRANS_TYPE.BACKGROUND});
		}
	}
	
	function SceneTransitionClear(_sprInd = undefined, _imInd = 0, _alpha = 1, _col = c_white){
		with oDirector {
	        directorState = DirectorStateIdle;
			BackgroundSetTarget(_sprInd, _imInd, _alpha, _col);
			
			instance_create_layer(0,0, SYSTEM_LAYER, oSceneTransition, {transType: SCENE_TRANS_TYPE.CLEAR});
		}
	}
	
	function ChoiceStart(_names){
		with oDirector {
			currentLineIndex--;
			directorState = DirectorStateChoice;
			
			choice.elements = [];
			choice.waitCd = 30;
			var _al = array_length(_names);
			
			//position constants
			var _bufferY = 64; //MENU_BUFFER_Y
			var _startX = VIEWPORT_WIDTH/2;
			var _startY = VIEWPORT_HEIGHT/2 - (_al/2)*_bufferY;
			
			//create every choice
			for (var i = 0; i < _al; i++) {
				var _choice = global.dataChoices[$ _names[i]];
				array_push(choice.elements, _choice);
					
				var _data = {
					num: i,
					strFont: FONT_CONSOLE_24,
					strAlignH: fa_center,
					strAlignV: fa_middle,
					scribId: scribble(_choice.title, "choice").starting_format(FONT_CONSOLE_24, c_white).align(fa_center,fa_middle),
			
					strX: _startX,
					strY: _startY + i*_bufferY,
				};
					
				var _id = instance_create_layer(0,0, CHOICES_LAYER, oChoice, _data);
				_choice.elemId = _id;
		
				//lock hover cd for first element as page is created
				if i <= 0 _id.hoverCd = choice.mouseHoverCdMax;
			}
			
			//update every choice position and sprite
			var _spr = choice.spr;
			if is_struct(_spr) {
			
				//find widest and heighest string
				var _strW = 0, _strH = 0;
				for (var i = 0; i < _al; i++) {
					var _id = choice.elements[i].elemId;
			
					var _scribW = _id.scribId.get_width();
					_strW = (_scribW > _strW) ? _scribW : _strW;
			
					var _scribH = _id.scribId.get_height();
					_strH = (_scribH > _strH) ? _scribH : _strH;
				}
				
				//update every element with sprite parameters
				for (var i = 0; i < _al; i++) {
					var _id = choice.elements[i].elemId;
					with _id {
						uiElementSpriteUpdate(_spr, _strW, _strH);
					
						//increase distance between elements
						_bufferY = _spr.bufferStrY + _spr.bufferElem;
						strY += _bufferY*i;
						
						uiElementPositionUpdate();
						
						//shift position when out of bounds
						var _shiftX = 0, _shiftY = 0;
						switch strAlignH {
							case fa_left:	_shiftX = strX - _spr.bufferStrX - bbox_left;	break;
							case fa_right:	_shiftX = strX + _spr.bufferStrX - bbox_right;	break;
						}
						switch strAlignV {
							case fa_top:	_shiftX = strY - _spr.bufferStrY - bbox_top;	break;
							case fa_bottom:	_shiftX = strY + _spr.bufferStrY - bbox_bottom;	break;
						}
						x += _shiftX;
						y += _shiftY;
						strX += _shiftX;
						strY += _shiftY;
						
					}
				}
				
			}
		}
	}
	
#endregion

#region csv logic
	
	//take a string out of csv and process it
	function SceneScriptExecute(_str){
		var _args = string_split(_str, ",");
		if array_length(_args) > 0 {
			var _script = _args[0];
			_script = global.dataSceneScripts[$ _script] ?? noone;
			
			if is_method(_script) {
				array_delete(_args, 0, 1);
				_script(_args);
				return true;
			} else return false;
		}
	}
	
#endregion

//scripts themselves (actually methods as they are bound to the struct)
global.dataSceneScripts = {};
with global.dataSceneScripts {
	
	#region QUICK CHANGES WITH NO DIRECTOR TRANSITIONS
	
		// SCENE NAME
		scene_set = function(_args){
			SceneStart(_args[0]);
		};
		
		// BACKGROUND SPRITE, FRAME, ALPHA, COLOR
		bg_set = function(_args){
			var _sprInd	= (array_length(_args) > 0) ? asset_get_index(_args[0]) : noone;
			var _imInd	= (array_length(_args) > 1) ? asset_get_index(_args[1]) : 0;
			var _alpha	= (array_length(_args) > 2) ? asset_get_index(_args[2]) : 1;
			var _col	= (array_length(_args) > 3) ? asset_get_index(_args[3]) : c_white;
			with oDirector {
				BackgroundSet(_sprInd, _imInd, _alpha, _col);
				LineProgress();
			}
		};
		
		// NO ARGUMENTS
		map = function(_args){
			SceneToMap();
		};
		
	#endregion
	
	#region TRANSITIONS
		
		// --- TRANSITION TO NEXT SCENE ---
		// SCENE NAME, BACKGROUND SPRITE, FRAME, ALPHA, COLOR
		trans_scene = function(_args){
			with oDirector {
				var _sceneTarget	= _args[0];
				var _sprInd			= (array_length(_args) > 1) ? asset_get_index(_args[1]) : undefined;
				var _imInd			= (array_length(_args) > 2) ? asset_get_index(_args[2]) : 0;
				var _alpha			= (array_length(_args) > 3) ? asset_get_index(_args[3]) : 1;
				var _col			= (array_length(_args) > 4) ? asset_get_index(_args[4]) : c_white;
			
				SceneTransitionNext(_sceneTarget, _sprInd, _imInd, _alpha, _col);
			}
		};
		
		// --- TRANSITION TO DIFFERENT BACKGROUND WITH NO SCENE CHANGES ---
		// BACKGROUND SPRITE, FRAME, ALPHA, COLOR
		trans_bg = function(_args){
			with oDirector {
				var _sprInd			= (array_length(_args) > 0) ? asset_get_index(_args[0]) : undefined;
				var _imInd			= (array_length(_args) > 1) ? asset_get_index(_args[1]) : 0;
				var _alpha			= (array_length(_args) > 2) ? asset_get_index(_args[2]) : 1;
				var _col			= (array_length(_args) > 3) ? asset_get_index(_args[3]) : c_white;
			
				SceneTransitionBg(_sprInd, _imInd, _alpha, _col);
			}
		};
		
		// --- TRANSITION TO DIFFERENT BACKGROUND + CLEARING STAGE ---
		// BACKGROUND SPRITE, FRAME, ALPHA, COLOR
		trans_clear = function(_args){
			with oDirector {
				var _sprInd			= (array_length(_args) > 0) ? asset_get_index(_args[0]) : undefined;
				var _imInd			= (array_length(_args) > 1) ? asset_get_index(_args[1]) : 0;
				var _alpha			= (array_length(_args) > 2) ? asset_get_index(_args[2]) : 1;
				var _col			= (array_length(_args) > 3) ? asset_get_index(_args[3]) : c_white;
			
				SceneTransitionClear(_sprInd, _imInd, _alpha, _col);
			}
		};
		
	#endregion
	
	
	
	// DELAY SECONDS
	delay = function(_args){
		var _delay = real(_args[0]);
		with oDirector {
			delayTimer = _delay * game_get_speed(gamespeed_fps);
            directorState = DirectorStateDelay;
		}
	};
	
	// CHARACTER NAME, SPRITE, FRAME
	char_in = function(_args){
		var _name	= _args[0];
		var _sprInd = asset_get_index(_args[1]);
		var _imInd	= (array_length(_args) > 2) ? int64(_args[2]) : 0;
		
		with oDirector {
			if (array_length(stageCharacters) < MAX_STAGE_CHARACTERS) {
	            var _newCount = array_length(stageCharacters) + 1;
	            var _spawnX   = VIEWPORT_WIDTH * (_newCount / (_newCount + 1));
				
	            array_push(stageCharacters, {
                    charId:				_name,
                    sprite:				_sprInd,
					expressionFrame:	_imInd,
                    alpha:				MIN_ALPHA,
                    targetAlpha:		MAX_ALPHA,
                    xPosition:			_spawnX,
                    targetX:			_spawnX,
                });
	        }
	        directorState = DirectorStateCharacterFade;
		}
	};
	
	// CHARACTER NAME, SPRITE
	char_out = function(_args){
		var _name	= _args[0];
		var _sprInd = (array_length(_args) > 1) ? asset_get_index(_args[1]) : noone;
		
		with oDirector {
	        for (var _i = 0; _i < array_length(stageCharacters); _i++) {
	            // Match by NAME (ID) first, fallback to sprite reference
	            if ((stageCharacters[_i].charId == _name) || 
	                (stageCharacters[_i].sprite == _sprInd)) 
				{
	                stageCharacters[_i].targetAlpha = MIN_ALPHA;
	                break;
	            }
	        }
	        directorState = DirectorStateCharacterFade;
		}
	};
	
	// FRAME
	main_char_in = function(_args){
		with oDirector {
			mainCharacter.expressionFrame = _args[0];
			spookUp = true;
	        mainCharacter.targetAlpha = MAX_ALPHA;
	        directorState = DirectorStateCharacterFade;
		}
	};
	
	// NO ARGUMENTS
	main_char_out = function(_args){
		with oDirector {
			spookUp = false;
            mainCharacter.targetAlpha = MIN_ALPHA;
            directorState = DirectorStateCharacterFade;
		}
	};
	
	// CHAR NAME, FRAME
	char_update = function(_args){
		with oDirector {
			var _name = _args[0];
			var _imInd = _args[1];
			
			// Main Character
		    if (mainCharacter.charId == _name) { mainCharacter.expressionFrame = _imInd; }
			
			// Other Characters
		    else
		    {
		        for (var _i = 0; _i < array_length(stageCharacters); _i++)
		        {
		            if (stageCharacters[_i].charId == _name)
		            {
		                stageCharacters[_i].expressionFrame = _imInd;
		                break;
		            }
		        }
		    }
			
		    LineProgress();
		}
	};
	
	// CHOICE NAMES AS SET IN global.dataChoices
	choice = function(_args){
		with oDirector {
			ChoiceStart(_args);
		}
	};
	
	// --- PROGRESSES LINE FURTHER ---
	// SCRIPT, ARGS
	custom_script_continue = function(_args){
		with oDirector {
			var _scr = asset_get_index(_args[0]);
			_args = array_delete(_args, 0, 1);
			_scr(_args);
			
			LineProgress();
		}
	};
	
	// --- STOPS AT THE CURRENT LINE ---
	// SCRIPT, ARGS
	custom_script_stop = function(_args){
		with oDirector {
			var _scr = asset_get_index(_args[0]);
			_args = array_delete(_args, 0, 1);
			_scr(_args);
		}
	};
	
	//SOUND NAME
	music = function(_args){
		with oDirector {
			var _song = asset_get_index(_args[0]);
			AmbientChange(AMBIENT_MUSIC, _song, DEFAULT_VOLUME_PERCENT);
			LineProgress();
		}
	};
	
}