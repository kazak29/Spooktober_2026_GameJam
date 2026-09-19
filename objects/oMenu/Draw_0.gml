with bg {
	if active {
		if sprite_exists(spr) {
			draw_sprite_pos(spr, imInd, x1,y1, x2,y1, x1,y2, x2,y2, alpha)
		} else {
			draw_set_alpha(alpha);
			draw_rectangle_color(x1,y1,x2,y2, col, col, col, col, false);
			draw_set_alpha(1);
		}
	}
}