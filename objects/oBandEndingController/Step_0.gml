state();

if returnPromptEnabled && (oInputManager.pressed.confirm || oInputManager.mouse.pressed.left)
{
	global.sceneToPlay = BEST_ENDING_CONTINUED;
	AmbientChange(AMBIENT_MUSIC, noone);
    TransitionStart(rmStage, sqFadeOut, sqFadeIn);
}

// Check if the current line is finished typing out
if (songTypist.get_state() >= 1.0) {
    
    // Move to the next line if available
    if (currentLine < array_length(lyrics) - 1) {
        currentLine++;
        
        // Create the new scribble element normally (do NOT use .in() here)
        scribbleElement = scribble(lyrics[currentLine]);
        scribbleElement.starting_format("fBandLyrics", c_white);
        scribbleElement.align(fa_center, fa_top);
        
        // Reset typist state back to 0
        songTypist.reset();
    }
}
