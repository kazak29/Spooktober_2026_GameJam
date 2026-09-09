//setup font and alignment
draw_set_font(fConsol);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

//debug ui
if global.showDebugUI {
	
	draw_set_halign(fa_left);
	draw_text(10,	96+15*1,	$"FPS: {fps}");
	draw_text(10,	96+15*2,	$"FPS REAL: {fps_real}");
	draw_text(10,	96+15*4,	$"Music Volume: {global.volMusic}");
	draw_text(10,	96+15*5,	$"Sound Volume: {global.volSound}");
	draw_text(10,	96+15*6,	$"Line Typewriter Volume: {global.volLineTW}");
	
	draw_set_halign(fa_right);
	//other bs
	draw_set_halign(fa_left);
	
}

//draw reminder
if global.cheat {
	
	draw_set_colour(c_yellow);
	draw_set_halign(fa_left);
	draw_text(16,	VIEWPORT_HEIGHT - 32,	$"CHEATS ARE ACTIVE");
	
}
