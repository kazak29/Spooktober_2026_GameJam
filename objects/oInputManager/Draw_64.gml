if global.showDebugUI {
	draw_set_colour(c_yellow);
	draw_text(15,15, $"input: gamepad active: {using_gamepad}");
	draw_text(15,15*2, $"input: mouse active: {mouse.active}");
	draw_set_colour(c_white);
}