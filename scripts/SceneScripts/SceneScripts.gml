#region logic
	
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
	
	sc_start = function(_args){
		SceneStart(_args[0]);
	};
	
	sc_bg = function(_args){
		var _sprInd	= (array_length(_args) > 0) ? asset_get_index(_args[0]) : noone;
		var _imInd	= (array_length(_args) > 1) ? asset_get_index(_args[1]) : 0;
		var _alpha	= (array_length(_args) > 2) ? asset_get_index(_args[2]) : 1;
		var _col	= (array_length(_args) > 3) ? asset_get_index(_args[3]) : c_white;
		with oDirector {
			BackgroundReset();
			with bg {
				sprInd	= _sprInd;
				imInd	= _imInd;
				alpha	= _alpha;
				col		= _col;
			}
			LineProgress();
		}
	};
	
	sc_char_in = function(_args){
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
	
	sc_char_out = function(_args){
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
}