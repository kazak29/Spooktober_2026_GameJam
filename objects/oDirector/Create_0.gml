
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

SceneStart(currentSceneId);

LineProgress = function(){
	// Textlog: Put the line in the log before moving on
	var _curLineData = currentLineSequence[currentLineIndex];
	AddToTextLog({ title: _curLineData.lineTitle, text: _curLineData.lineText });
	//show_debug_message(string(global.textLog));
			
	currentLineIndex++;
	TypewriterSoundSet();
}