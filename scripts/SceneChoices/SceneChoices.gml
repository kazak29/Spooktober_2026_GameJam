#region choice scripts
	
	//jsut progresses the scene (since choice goes back a line, go forward 2 lines)
	function ChoiceDummy(_args){
		with oDirector {
			LineProgress(2);
		}
	}

	function ChoiceToScene(_args){
		with oDirector {
			var _sceneTarget	= _args[0];
			var _sprInd			= (array_length(_args) > 1) ? _args[1] : undefined;
			var _imInd			= (array_length(_args) > 2) ? _args[2] : 0;
			var _alpha			= (array_length(_args) > 3) ? _args[3] : 1;
			var _col			= (array_length(_args) > 4) ? _args[4] : c_white;
	
			SceneTransitionNext(_sceneTarget, _sprInd, _imInd, _alpha, _col);
		}
	}

	function ChoiceToBg(_args){
		with oDirector {
			var _sprInd			= (array_length(_args) > 0) ? _args[0] : undefined;
			var _imInd			= (array_length(_args) > 1) ? _args[1] : 0;
			var _alpha			= (array_length(_args) > 2) ? _args[2] : 1;
			var _col			= (array_length(_args) > 3) ? _args[3] : c_white;
	
			SceneTransitionBg(_sprInd, _imInd, _alpha, _col);
		}
	}
	
	function ChoiceToClear(_args){
		with oDirector {
			var _sprInd			= (array_length(_args) > 0) ? _args[0] : undefined;
			var _imInd			= (array_length(_args) > 1) ? _args[1] : 0;
			var _alpha			= (array_length(_args) > 2) ? _args[2] : 1;
			var _col			= (array_length(_args) > 3) ? _args[3] : c_white;
	
			SceneTransitionClear(_sprInd, _imInd, _alpha, _col);
		}
	}
#endregion

#region choice data
	function ChoiceDataCreate() {
		return {
		
			introSqueak0: {
				title:		global.uiData.introScene6_prompt1_option1,
				scr:		ChoiceDummy,
				arg:		noone,
			},
			introSqueak1: {
				title:		global.uiData.introScene6_prompt1_option2,
				scr:		ChoiceDummy,
				arg:		noone,
			},
		
		}
	}
#endregion