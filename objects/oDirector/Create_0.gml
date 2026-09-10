
lineData = LoadLineData();
screenPlay = LoadScreenPlay();


currentSceneId = "scene1";   // Set this to whatever the first scene is
currentNodeId  = noone;


directorState = DirectorStateIdle;


typist = scribble_typist();
typist.in(TYPIST_SPEED, TYPIST_SMOOTHNESS);


currentLineSequence = [];
currentLineIndex = 0;



// Start the first Scene
StartScene(currentSceneId);
