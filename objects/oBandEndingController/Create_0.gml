returnPrompt = $"Press {global.uiData.endingProceedInputs} to Skip";
returnPromptEnabled = false;

StateWait = function(){
	cd = Approach(cd, 0, 1);
	if cd <= 0 {
		returnPromptEnabled = true;
		state = StateLocked;
	}
}

StateLocked = function(){
	//empty state
}

cd = game_get_speed(gamespeed_fps) * 10;
state = StateWait;

drawX = VIEWPORT_WIDTH / 2;
drawY = VIEWPORT_HEIGHT - 60;

lyricsX = VIEWPORT_WIDTH / 2;
lyricsY = VIEWPORT_HEIGHT - 250;

audioHandle = AmbientChange(AMBIENT_MUSIC, bgmBand, DEFAULT_VOLUME_PERCENT, false, 0);
audioOffset = 0.0; 
currentLineIndex = 0;

// Simple timestamp triggers: Just the text and the exact second it should appear
lyricsData = [
    { 
        endTime: 15.0,
        chunks: [
            { text: "Hal-",  time: 3.5 },
            { text: "lo-",   time: 4.6 },
            { text: "ween!", time: 5.2 }
        ]
    },
    {
		endTime: 20.0,
		chunks: [
			{ text: "Trick or treat", time: 0.0 },
			{ text: "'til ", time: 0.0 },
			{ text: "", time: 0.0 },
			{ text: "", time: 0.0 },
			{ text: "", time: 0.0 },
			{ text: "", time: 0.0 },
		]
	}
];

// Keep track of the currently built string to avoid unnecessary re-creation
builtText = "";
lastActiveChunkCount = -1;
scribbleElement = undefined;

function LoadLyricLine(index) {
    if (index < array_length(lyricsData)) {
        builtText = "";
        lastActiveChunkCount = -1;
    } else {
        scribbleElement = undefined;
    }
}

LoadLyricLine(currentLineIndex);
