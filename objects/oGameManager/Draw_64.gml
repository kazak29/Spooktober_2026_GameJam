// Setup font and alignment
draw_set_font(fConsol16);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

#region CRT Shader
	
	if global.crtActive {
		shader_set(shdCRT);
		shader_set_uniform_f(u_resolution, display_get_gui_width(), display_get_gui_height());
		shader_set_uniform_f(u_time, current_time / 1000);

		draw_surface_stretched(application_surface, 0, 0, display_get_gui_width(), display_get_gui_height());

		shader_reset();
	}
	
#endregion
#region debugging
	
	if (global.showDebugUI)
	{
		draw_set_halign(fa_left);
		draw_text(10,	96+15*1,	$"FPS: {fps}");
		draw_text(10,	96+15*2,	$"FPS REAL: {fps_real}");
		draw_text(10,	96+15*4,	$"Music Volume: {global.volMusic}");
		draw_text(10,	96+15*5,	$"Sound Volume: {global.volSound}");
		draw_text(10,	96+15*6,	$"Line Typewriter Volume: {global.volTypeWriter}");
	
		draw_set_halign(fa_right);
		draw_text(VIEWPORT_WIDTH,	96+15*1,	$"CRT: {global.crtActive}");
		draw_set_halign(fa_left);
	}
	
	//draw reminder
	if (global.cheat)
	{	
		draw_set_colour(c_yellow);
		draw_set_halign(fa_left);
		draw_text(16,	VIEWPORT_HEIGHT - 32,	$"CHEATS ARE ACTIVE");	
	}
	
#endregion