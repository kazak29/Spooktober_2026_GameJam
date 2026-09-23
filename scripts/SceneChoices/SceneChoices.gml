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

function ChoiceDataCreate() {
	return {
		
		test: {
			title:		global.uiData.introScene6_prompt1_option1,
			scr:		ChoiceToScene,
			arg:		["test1", sBackgroundBlack],
		},
		test1: {
			title:		global.uiData.introScene6_prompt1_option2,
			scr:		ChoiceToScene,
			arg:		["test", sBackgroundShayHome],
		},
		
	}
}