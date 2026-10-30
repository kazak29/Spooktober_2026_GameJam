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

// Global audio offset calibration (e.g., 0.05 = -50ms offset if audio lags slightly)
audioOffset = 0.0; 

currentLineIndex = 0;

// Structured timestamps in SECONDS
lyricsData = [
    { text: "Hal-lo-ween!", startTime: 3, duration: 4.5, endTime: 8 },
    //{ text: "Trick or treat til sun is dawning", startTime: 5.8, duration: 3.5, endTime: 12.8 },
    //{ text: "Autumn leaves", startTime: 13.0, duration: 4.1, endTime: 17.5 },
    //{ text: "Fell the trees, the creeps go hauntin'", startTime: 18.0, duration: 3.5, endTime: 23.0 },
    //{ text: "Oh-oh", startTime: 23.5, duration: 1.5, endTime: 25.5 },
    //{ text: "Boo scare!", startTime: 26.0, duration: 3.3, endTime: 29.5 },
    //{ text: "Don't go in there!", startTime: 30.0, duration: 2.3, endTime: 32.5 },
    //{ text: "I sense a jumpscare!", startTime: 33.0, duration: 2.0, endTime: 35.5 },
    //{ text: "Don't go in there!", startTime: 36.0, duration: 1.7, endTime: 38.0 },
    //{ text: "The creeps go wandering, ghouls and beasts", startTime: 38.5, duration: 3.0, endTime: 42.0 },
    //{ text: "On Hal-lo-ween!", startTime: 42.5, duration: 1.5, endTime: 46.5 }
];

// Initialize Scribble without an automatic speed typist
songTypist = scribble_typist();

// Helper to rebuild Scribble element on line change
function LoadLyricLine(index) {
    if (index < array_length(lyricsData)) {
        var line = lyricsData[index];
        scribbleElement = scribble(line.text);
        scribbleElement.starting_format("fBandLyrics", c_white);
        scribbleElement.align(fa_center, fa_top);
    } else {
        scribbleElement = undefined;
    }
}

LoadLyricLine(currentLineIndex);
