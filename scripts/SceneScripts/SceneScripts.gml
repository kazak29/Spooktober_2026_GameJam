#region reusable scene triggers
	
	function SceneClear(){
		with oDirector {
			lineSkip = false;
			BackgroundSet();
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
	
	// SCENE NAME
	scene_set = function(_args){
		SceneStart(_args[0]);
	};
	
	// SCENE NAME, BACKGROUND SPRITE, FRAME, ALPHA, COLOR
	scene_trans = function(_args){
		with oDirector {
			sceneTarget = _args[0];
	        directorState = DirectorStateIdle;
			
			instance_create_layer(0,0, SYSTEM_LAYER, oSceneTransition);
			
			var _sprInd	= (array_length(_args) > 1) ? asset_get_index(_args[1]) : noone;
			var _imInd	= (array_length(_args) > 2) ? asset_get_index(_args[2]) : 0;
			var _alpha	= (array_length(_args) > 3) ? asset_get_index(_args[3]) : 1;
			var _col	= (array_length(_args) > 4) ? asset_get_index(_args[4]) : c_white;
			BackgroundSetTarget(_sprInd, _imInd, _alpha, _col);
		}
	};
	
	// DELAY SECONDS
	delay = function(_args){
		var _delay = real(_args[0]);
		with oDirector {
			delayTimer = _delay * game_get_speed(gamespeed_fps);
            directorState = DirectorStateDelay;
		}
	};
	
	// BACKGROUND SPRITE, FRAME, ALPHA, COLOR
	bg = function(_args){
		var _sprInd	= (array_length(_args) > 0) ? asset_get_index(_args[0]) : noone;
		var _imInd	= (array_length(_args) > 1) ? asset_get_index(_args[1]) : 0;
		var _alpha	= (array_length(_args) > 2) ? asset_get_index(_args[2]) : 1;
		var _col	= (array_length(_args) > 3) ? asset_get_index(_args[3]) : c_white;
		with oDirector {
			BackgroundSet(_sprInd, _imInd, _alpha, _col);
			LineProgress();
		}
	};
	
	// CHARACTER NAME, SPRITE, FRAME
	char_in = function(_args){
		var _name	= _args[0];
		var _sprInd = asset_get_index(_args[1]);
		var _imInd	= int64(_args[2]);
		
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
	
	main_char_in = function(_args){
		
	};
	
	main_char_out = function(_args){
		
	};
	
	char_update = function(_args){
		
	};
	
	choice = function(_args){
		
	};
	
	condition = function(_args){
		
	};
	
	music = function(_args){
		
	};
	
}