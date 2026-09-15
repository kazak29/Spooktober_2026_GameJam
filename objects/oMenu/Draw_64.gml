if menuType == MENU_TYPE_PAUSE {
	draw_set_alpha(0.5);
	draw_rectangle_color(0,0, VIEWPORT_WIDTH, VIEWPORT_HEIGHT, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}