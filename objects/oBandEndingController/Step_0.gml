state();

if (returnPromptEnabled && (oInputManager.pressed.confirm || oInputManager.mouse.pressed.left)) {
    global.sceneToPlay = BEST_ENDING_CONTINUED;
    AmbientChange(AMBIENT_MUSIC, noone);
    TransitionStart(rmStage, sqFadeOut, sqFadeIn);
}

if (audio_is_playing(audioHandle) && currentLineIndex < array_length(lyricsData)) {
    
    var trackPos = audio_sound_get_track_position(audioHandle) - audioOffset;
	
	if (global.cheat) {
	    var _mins = floor(trackPos / 60);
	    var _secs = floor(trackPos) % 60;
	    var _ms   = floor((trackPos - floor(trackPos)) * 1000);
		// Pad with leading zeros
	    var _mStr = (_mins < 10) ? $"0{_mins}" : string(_mins);
	    var _sStr = (_secs < 10) ? $"0{_secs}" : string(_secs);
    
	    var _msStr = string(_ms);
	    if (_ms < 100) _msStr = "0" + _msStr;
	    if (_ms < 10)  _msStr = "0" + _msStr;
    
	    audioTimeString = $"{_mStr}:{_sStr}:{_msStr}";
	}
	
    var currentLine = lyricsData[currentLineIndex];
    
    // Check if it's time to clear the line and move to the next one
    if (trackPos >= currentLine.endTime) {
        array_push(global.textLog, { title: POGO + " (Singing)", text: builtText });
        currentLineIndex++;
        LoadLyricLine(currentLineIndex);
        exit;
    }
    
    // Count how many chunks should be visible right now based on audio time
    var activeChunksCount = 0;
    var tempText = "";
    var chunks = currentLine.chunks;
    
    for (var i = 0; i < array_length(chunks); i++) {
        if (trackPos >= chunks[i].time) {
            tempText += chunks[i].text;
            activeChunksCount++;
        }
    }
    
    // Only rebuild the scribble element if a new chunk just popped up
    if (activeChunksCount != lastActiveChunkCount) {
        builtText = tempText;
        lastActiveChunkCount = activeChunksCount;
        
        if (builtText != "") {
            scribbleElement = scribble(builtText);
            scribbleElement.starting_format("fBandLyrics", c_white);
            scribbleElement.align(fa_center, fa_top);
        } else {
            scribbleElement = undefined;
        }
    }
}
