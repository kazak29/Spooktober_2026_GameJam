
// State machine
directorState = DirectorStateLineSequence;
directorStatePrev = directorState;
delayTimer = 0;


// Scene Transition
fadeAlpha = 0;
fadeTarget = 0;
nextSceneId = noone;



// Line Sequence
typist = scribble_typist();
typist.in(TYPIST_SPEED, TYPIST_SMOOTHNESS);
currentLineSequence = [];
currentLineIndex = 0;

#region typewriter sound
	TypewriterSoundPlay = function(){
		typist.sound(
			typewriterSound.ids, 
			typewriterSound.overlap, 
			typewriterSound.pitchMin, 
			typewriterSound.pitchMax, 
			(global.volTypeWriter * typewriterSound.vol) / 100
		);
	}
	TypewriterSoundReset = function(){
		typewriterSound = struct_get(global.dataTypewriterSfx, "none");
		TypewriterSoundPlay(); //stop typewriter sound by overriding it with empty array
	}
	TypewriterSoundSet = function(){
		var _sounds = global.dataTypewriterSfx;
		var _soundName = currentLineSequence[currentLineIndex].lineTitle;
		var _ids = struct_get(_sounds, _soundName) ?? struct_get(_sounds, "none");
		
		typewriterSound = variable_clone(_ids);
		TypewriterSoundPlay();
	}
	
	TypewriterSoundReset();
#endregion

// Speaker tracking for bounce animations
previousSpeaker = "";



// Choices
currentChoice = 0;
choices = [];
prevMouseX = 0;
prevMouseY = 0;



// Auto-managed Character Stage (Max 3)
stageCharacters = [];
mainCharacter = {
    charId: SPOOK,
    sprite: sSpookPortrait,
	expressionFrame: 0,
    alpha: MIN_ALPHA,
    targetAlpha: MIN_ALPHA
};
spookUp = false;


// Start the scene that was set as a global
currentSceneId = global.sceneToPlay;
currentNodeId  = noone;
//StartScene(currentSceneId);


#region new code
	
	choice = {
		spr:	{
			ind:		sChoiceBox,
			bufferStrX:	32,
			bufferStrY: 32,
			bufferElem: 16,
		},
		num:	0,
		
		mouseHoverCdMax: 5,
		mouseHover: false,
		elements: [],
	};
	
	sceneTarget = "";
	bg = {
		sprInd: noone,
		imInd:	0,
		alpha:	1,
		col:	c_white,
	}
	
	BackgroundSet = function(_spr = noone, _imInd = 0, _alpha = 1, _col = c_white){
		bg = {
			sprInd: _spr,
			imInd:	_imInd,
			alpha:	_alpha,
			col:	_col,
		}
	}
	BackgroundSetTarget = function(_spr = undefined, _imInd = undefined, _alpha = undefined, _col = undefined){
		bgTarget = {
			active: (_spr != undefined ? true : false),
			sprInd: _spr	?? noone,
			imInd:	_imInd	?? 0,
			alpha:	_alpha	?? 1,
			col:	_col	?? c_white,
		}
	}
	LineSet = function(){
		var _curLineData = currentLineSequence[currentLineIndex];
		var _lineTitle = _curLineData.lineTitle;
		var _lineText = _curLineData.lineText;
		
		//check for commands
		if _lineTitle == "" {
			var _result = SceneScriptExecute(_lineText);
			if !_result LineProgress();
		} else {
			directorState = DirectorStateLineSequence;
			TypewriterSoundSet();
		}
	}
	LineProgress = function(){
		// Textlog: Put the line in the log before moving on
		var _curLineData = currentLineSequence[currentLineIndex];
		var _lineTitle = _curLineData.lineTitle;
		if _lineTitle != "" {
			AddToTextLog({ title: _curLineData.lineTitle, text: _curLineData.lineText });
			//show_debug_message(string(global.textLog));
		}
			
		currentLineIndex++;
		LineSet();
	}

	SceneStart(currentSceneId);

#endregion