state();

if (returnPromptEnabled && (oInputManager.pressed.confirm || oInputManager.mouse.pressed.left)) {
    global.sceneToPlay = BEST_ENDING_CONTINUED;
    AmbientChange(AMBIENT_MUSIC, noone);
    TransitionStart(rmStage, sqFadeOut, sqFadeIn);
}

// Drive lyrics if audio is valid and playing
if (audio_is_playing(audioHandle) && currentLineIndex < array_length(lyricsData)) {
    
    var trackPos = audio_sound_get_track_position(audioHandle) - audioOffset;
    var currentLine = lyricsData[currentLineIndex];
    
    // Check if it's time to advance to the next line
    if (trackPos >= currentLine.endTime) {
        array_push(global.textLog, { title: POGO + " (Singing)", text: currentLine.text });
        currentLineIndex++;
        LoadLyricLine(currentLineIndex);
        exit;
    }
    
    // Calculate typing position (0.0 to 1.0) strictly based on audio clock
    if (trackPos >= currentLine.startTime) {
        var progress = (trackPos - currentLine.startTime) / currentLine.duration;
        progress = clamp(progress, 0.0, 1.0);
        
        // Explicitly set the typewriter position via audio time ratio
        songTypist.in(progress, 0); 
    } else {
        // Line hasn't started yet
        songTypist.in(0, 0);
    }
}
