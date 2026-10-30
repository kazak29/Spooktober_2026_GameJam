
if (global.cheat) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fConsol24);
	draw_set_color(c_yellow);
	draw_text(lyricsX, lyricsY - 40, audioTimeString);
}


if (returnPromptEnabled) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fConsol16);
    draw_set_color(c_ltgray);
    draw_text(drawX, drawY, returnPrompt);
}

// Render active line if it has started drawing
if (scribbleElement != undefined && currentLineIndex < array_length(lyricsData)) {
    scribbleElement.draw(lyricsX, lyricsY);
}
