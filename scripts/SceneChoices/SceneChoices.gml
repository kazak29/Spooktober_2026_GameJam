#region choice scripts
	
	//jsut progresses the scene (since choice goes back a line, go forward 2 lines)
	function ChoiceDummy(_args){
		with oDirector {
			LineProgress(2);
		}
	}
	
	function ChoiceSkipLines(_args){
		with oDirector {
			var _linesToSkip = _args[0];
			LineProgress(_linesToSkip);
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
		
			intro0: {
				title:		global.uiData.intro0,
				scr:		ChoiceSkipLines,
				arg:		[2],
			},
			intro1: {
				title:		global.uiData.intro1,
				scr:		ChoiceSkipLines,
				arg:		[2],
			},
			
			
			
			shayHome0: {
				title:		global.uiData.shayHome0,
				scr:		ChoiceSkipLines,
				arg:		[2],
			},
			shayHome1: {
				title:		global.uiData.shayHome1,
				scr:		ChoiceSkipLines,
				arg:		[3],
			},
			
			
			
			shayHome_Day1_Visit3_Bar1: {
				title:		global.uiData.shayHome_Day1_Visit3_Bar1,
				scr:		ChoiceSkipLines,
				arg:		[2],
			},
			shayHome_Day1_Visit3_Bar2: {
				title:		global.uiData.shayHome_Day1_Visit3_Bar2,
				scr:		ChoiceSkipLines,
				arg:		[3],
			},
			shayHome_Day1_Visit3_Bar3: {
				title:		global.uiData.shayHome_Day1_Visit3_Bar3,
				scr:		ChoiceSkipLines,
				arg:		[2],
			},
			shayHome_Day1_Visit3_Bar4: {
				title:		global.uiData.shayHome_Day1_Visit3_Bar4,
				scr:		ChoiceSkipLines,
				arg:		[3],
			},
			
			
			
			
			
			
			
			
			
			lampPost0: {
				title:		global.uiData.lampPost0,
				scr:		ChoiceSkipLines,
				arg:		[2],
			},
			lampPost1: {
				title:		global.uiData.lampPost1,
				scr:		ChoiceSkipLines,
				arg:		[3],
			},
			lampPost2: {
				title:		global.uiData.lampPost2,
				scr:		ChoiceSkipLines,
				arg:		[2],
			},
			lampPost3: {
				title:		global.uiData.lampPost3,
				scr:		ChoiceSkipLines,
				arg:		[3],
			},
			lampPost4: {
				title:		global.uiData.lampPost3,
				scr:		ChoiceSkipLines,
				arg:		[2],
			}
			
			
			
			
		}
	}
#endregion