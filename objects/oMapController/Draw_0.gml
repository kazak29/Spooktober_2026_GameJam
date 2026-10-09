var _bg = global.lastLocationBackground;
if is_struct(_bg) && sprite_exists(_bg.sprInd) {
	with _bg {
		draw_sprite_ext(sprInd,imInd, 0,0, 1,1, 0,col,alpha);
	}
}

draw_sprite(sMap, 0, 0,0);

var _visitedAll = true;
for (var i = 0; i < array_length(locs); i++) {
	with locs[i] {
		var _c = COL_MAP_DEFAULT;
		if visited	_c = COL_MAP_VISITED;
		if locked	_c = COL_MAP_LOCKED;
		
		if other.num == i {
			_c = COL_MAP_HOVER;
			if other.mouseHover _c = COL_MAP_HOVER_MOUSE;
			if is_struct(sprHover) with sprHover { draw_sprite_ext(ind,imInd, 0,0, 1,1,0, col, alpha); }
		}
		
		draw_sprite_ext(sMapLocations,i, 0,0,1,1,0, _c,other.image_alpha);
		
		if global.showDebugUI {
			draw_sprite_stretched(sBorder,0, x1,y1, (x2-x1), (y2-y1));
		}
		
		if !visited && !locked _visitedAll = false;
	}
}


//reminder to finish quest
if _visitedAll && !global.midTransition {
	var _reminder = noone;
	switch global.chapter {
		case 0: {
			if !(global.flags.questCandyComplete ||
				 global.flags.questCandyFail) 
			{ _reminder = global.uiData.mapReminder1; }
		} break;
		case 1: {
			if !(global.flags.questPrincessComplete ||
				 global.flags.questPrincessFail) 
			{ _reminder = global.uiData.mapReminder2; }
		} break;
	}
	
	if is_string(_reminder) {
		scribble(_reminder)
			.starting_format(FONT_DIALOGUE_TEXT_TITLE, c_yellow)
			.align(fa_right, fa_top)
			.draw(VIEWPORT_WIDTH,0);
	}
}