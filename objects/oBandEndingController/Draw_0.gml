if (returnPromptEnabled) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fConsol16);
    draw_set_color(c_ltgray);
    draw_text(drawX, drawY, returnPrompt);
}

// Render active line if present
if (scribbleElement != undefined && currentLineIndex < array_length(lyricsData)) {
    var trackPos = audio_sound_get_track_position(audioHandle) - audioOffset;
    var currentLine = lyricsData[currentLineIndex];
    
    // Only draw line if audio has reached its start time
    if (trackPos >= currentLine.startTime) {
        scribbleElement.draw(lyricsX, lyricsY, songTypist);
    }
}
