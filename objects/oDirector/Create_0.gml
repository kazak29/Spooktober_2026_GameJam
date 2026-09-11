
// Load all data
lineData = LoadLineData();
screenPlay = LoadScreenPlay_Demo();   // TODO: Switch this out for the actual screenplay



// State machine
directorState = DirectorStateIdle;
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

// Speaker tracking for bounce animations
previousSpeaker = "";



// Auto-managed Character Stage (Max 3)
stageCharacters = [];
mainCharacter = {
    charId: "Rocket",
    sprite: sPlaceholderMainCharacter,
    alpha: MIN_ALPHA,
    targetAlpha: MIN_ALPHA
};



// Start the scene that was set as a global
currentSceneId = global.sceneToPlay;
currentNodeId  = noone;
StartScene(currentSceneId);
