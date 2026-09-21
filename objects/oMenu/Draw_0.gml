//hardcoded fade
if menuType == MENU_TYPE_PAUSE {
    draw_set_alpha(0.75);
    draw_rectangle_colour(0, 0, VIEWPORT_WIDTH, VIEWPORT_HEIGHT, c_black,c_black,c_black,c_black, false);
    draw_set_alpha(1);
}

with bg {
	if active {
		if sprite_exists(spr.ind) {
			with spr { draw_sprite_ext(ind, imInd, x,y, scaleX, scaleY, 0, other.col, other.alpha); }
		} else {
			draw_set_alpha(alpha);
			draw_rectangle_color(x1,y1,x2,y2, col, col, col, col, false);
			draw_set_alpha(1);
		}
	}
}