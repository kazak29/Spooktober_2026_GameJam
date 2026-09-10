// Load all data
lineData = LoadLineData();
screenPlay = LoadScreenPlay();



directorState = DirectorStateIdle;



// Line Sequence
typist = scribble_typist();
typist.in(TYPIST_SPEED, TYPIST_SMOOTHNESS);
currentLineSequence = [];
currentLineIndex = 0;



// Characters
activeCharacters = {};
activeCharacters[$ CharacterSlot.LEFT]   = { sprite: noone, alpha: 0, targetAlpha: 0 };
activeCharacters[$ CharacterSlot.CENTER] = { sprite: noone, alpha: 0, targetAlpha: 0 };
activeCharacters[$ CharacterSlot.RIGHT]  = { sprite: noone, alpha: 0, targetAlpha: 0 };

mainCharacter = {
    name: "Rocket",
    sprite: sPlaceholderMainCharacter,
    alpha: 0,
    targetAlpha: 0
};



// Start the first Scene
currentSceneId = "scene1";
currentNodeId  = noone;
StartScene(currentSceneId);
