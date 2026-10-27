
if (returnPromptEnabled) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fConsol16);
	draw_set_color(c_ltgray);

	draw_text(drawX, drawY, returnPrompt);
}
