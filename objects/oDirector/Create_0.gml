
// State machine
directorState = DirectorStateIdle;
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

//typewriter sound
TypewriterSoundParamsReset = function(){
	typewriterSound = {
		ids:		[],
		vol:		global.volTypeWriter,
		overlap:	30,
		pitchMin:	1,
		pitchMax:	1
	}
}
TypewriterSoundParamsReset();

TypewriterSoundPlay = function(){
	typist.sound(
		typewriterSound.ids, 
		typewriterSound.overlap, 
		typewriterSound.pitchMin, 
		typewriterSound.pitchMax, 
		typewriterSound.vol
	);
}
TypewriterSoundSet = function(){
	var _sounds = global.typewriterSfxNames;
	var _soundName = currentLineSequence[currentLineIndex].lineSfx;
	var _ids = struct_get(_sounds, _soundName) ?? [];
	if !is_array(_ids) _ids = [];
	
	TypewriterSoundParamsReset();
	typewriterSound.ids = _ids;
	
	TypewriterSoundPlay();
}


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
StartScene(currentSceneId);
