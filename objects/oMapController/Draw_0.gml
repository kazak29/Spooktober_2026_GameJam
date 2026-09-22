
draw_sprite(global.lastLocationBackground, 0, 0, 0);
draw_sprite(sMap, selectedIndex, 0 ,0);




for (var _i = 0; _i < locationCount; _i++)
{
	var _location = locations[_i];
	
    var _frame = (_i == selectedIndex) ? 1 : 0;
    var _boxX = VIEWPORT_WIDTH - marginRight - boxWidth;
    var _boxY = marginTop + (boxHeight * _i);
    draw_sprite_stretched(sChoiceBox, _frame, _boxX, _boxY, boxWidth, boxHeight);
    var _textX = _boxX + (boxWidth / 2);
    var _textY = _boxY + (boxHeight / 2);
    scribble(_location.locationName)
        .starting_format(fMapLocation, c_black)
        .align(fa_center, fa_middle)
        .draw(_textX, _textY);
}

//if (instance_exists(oTextLog)) { DrawTextlog(); }
