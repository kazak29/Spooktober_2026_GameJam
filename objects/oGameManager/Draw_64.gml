// Setup font and alignment
draw_set_font(fConsol16);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

#region CRT Shader
	
	if global.crt.active {
		shader_set(shdCRT);
		shader_set_uniform_f(u_resolution, display_get_gui_width(), display_get_gui_height());
		shader_set_uniform_f(u_time, current_time / 1000);
		shader_set_uniform_f(u_abberation, global.crt.abberation);
		shader_set_uniform_f(u_noise, global.crt.noise);
		shader_set_uniform_f(u_scanlines, global.crt.scanlines);
		shader_set_uniform_f(u_scanlines_glow, global.crt.scanlinesGlow);
		shader_set_uniform_f(u_mask, global.crt.mask);
		shader_set_uniform_f(u_mask_scale, max(1, global.crt.maskScale));
		shader_set_uniform_f(u_glow, global.crt.glow);
		shader_set_uniform_f(u_bright, global.crt.bright);
		shader_set_uniform_f(u_flicker, global.crt.flicker);
		shader_set_uniform_f(u_roll, global.crt.roll);

		draw_surface_stretched(application_surface, 0, 0, display_get_gui_width(), display_get_gui_height());

		shader_reset();
	}
	
#endregion
#region debugging
	
	if (global.showDebugUI)
	{
		draw_set_colour(c_yellow);
		
		draw_set_halign(fa_left);
		draw_text(10,	96+15*1,	$"FPS: {fps}");
		draw_text(10,	96+15*2,	$"FPS REAL: {fps_real}");
		draw_text(10,	96+15*4,	$"Music Volume: {global.volMusic}");
		draw_text(10,	96+15*5,	$"Sound Volume: {global.volSound}");
		draw_text(10,	96+15*6,	$"Line Typewriter Volume: {global.volTypeWriter}");
	
		draw_set_halign(fa_right);
		draw_text(VIEWPORT_WIDTH,	96+15*1,	$"Chapter: {global.chapter} (P - skip to chapter 2)");
		
		draw_text(VIEWPORT_WIDTH,	96+15*3,	$"Candy Quest Start: {global.flags.questCandyStart} (1)");
		draw_text(VIEWPORT_WIDTH,	96+15*4,	$"Candy Quest Complete: {global.flags.questCandyComplete} (2)");
		draw_text(VIEWPORT_WIDTH,	96+15*5,	$"Candy Quest Fail: {global.flags.questCandyFail} (3)");
		draw_text(VIEWPORT_WIDTH,	96+15*7,	$"Princess Quest Start: {global.flags.questPrincessStart} (4)");
		draw_text(VIEWPORT_WIDTH,	96+15*8,	$"Princess Quest Complete: {global.flags.questPrincessComplete} (5)");
		draw_text(VIEWPORT_WIDTH,	96+15*9,	$"Princess Quest Fail: {global.flags.questPrincessFail} (6)");
		
		draw_text(VIEWPORT_WIDTH,	96+15*11,	$"Met Hamster: {global.flags.metHamster} (7)");
		draw_text(VIEWPORT_WIDTH,	96+15*12,	$"Met Princess: {global.flags.metPrincess} (8)");
		draw_text(VIEWPORT_WIDTH,	96+15*13,	$"Got Knight: {global.flags.gotKnight} (9)");
		draw_text(VIEWPORT_WIDTH,	96+15*14,	$"Know Limes: {global.flags.knowLimes} (0)");
		draw_set_halign(fa_left);
		
		draw_set_colour(c_white);
	}
	
	//draw reminder
	if (global.cheat)
	{	
		draw_set_colour(c_yellow);
		draw_set_halign(fa_left);
		draw_text(16,	VIEWPORT_HEIGHT - 32,	$"CHEATS ARE ACTIVE");
		draw_set_colour(c_white);
	}
	
#endregion