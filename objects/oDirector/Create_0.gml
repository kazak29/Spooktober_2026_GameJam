
lineData = LoadLineData();
screenPlay = LoadScreenPlay();


currentSceneId = "scene1";
currentNodeId  = noone;


directorState = DirectorStateIdle;


typist = scribble_typist();
typist.in(0.5, 0);


currentLineSequence = [];
currentLineIndex = 0;



// Start the first Scene
StartScene(currentSceneId);
