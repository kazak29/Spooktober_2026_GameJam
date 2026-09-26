if sprite_exists(global.lastLocationBackground) draw_sprite(global.lastLocationBackground, 0, 0, 0);
draw_sprite(sMap, 0, 0,0);

for (var i = 0; i < array_length(locs); i++) {
	with locs[i] {
		var _c = COL_MAP_DEFAULT;
		if visited	_c = COL_MAP_VISITED;
		if locked	_c = COL_MAP_LOCKED;
		
		if other.num == i {
			_c = COL_MAP_HOVER;
			if is_struct(sprHover) with sprHover { draw_sprite_ext(ind,imInd, 0,0, 1,1,0, col, alpha); }
		}
		
		draw_sprite_ext(sMapLocations,i, 0,0,1,1,0, _c,other.image_alpha);
		
		if global.showDebugUI {
			draw_sprite_stretched(sBorder,0, x1,y1, (x2-x1), (y2-y1));
		}
	}
}





//for (var _i = 0; _i < locationCount; _i++)
//{
//	var _location = locations[_i];
//	
//    var _frame = (_i == selectedIndex) ? 1 : 0;
//    var _boxX = VIEWPORT_WIDTH - marginRight - boxWidth;
//    var _boxY = marginTop + (boxHeight * _i);
//    draw_sprite_stretched(sChoiceBox, _frame, _boxX, _boxY, boxWidth, boxHeight);
//    var _textX = _boxX + (boxWidth / 2);
//    var _textY = _boxY + (boxHeight / 2);
//    scribble(_location.locationName)
//        .starting_format(FONT_MAP_LOCATION, c_black)
//        .align(fa_center, fa_middle)
//        .draw(_textX, _textY);
//}
