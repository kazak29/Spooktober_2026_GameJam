
draw_sprite(global.lastLocationBackground, 0, 0, 0);




// Use display_get_gui_width() instead of room_width if you are using the Draw GUI event
var _screenWidth = VIEWPORT_WIDTH; 

for (var _i = 0; _i < locationCount; _i++)
{
    var _currentLoc = locationInstances[_i];
    
    var _frame = (_i == selectedIndex) ? 1 : 0;
    
    // Position from the right edge
    var _boxX = _screenWidth - marginRight - boxWidth;
    var _boxY = marginTop + (boxHeight * _i);
    
    // Draw the stretched box
    draw_sprite_stretched(sChoiceBox, _frame, _boxX, _boxY, boxWidth, boxHeight);
    
    // Center the scribble text inside the box
    var _textX = _boxX + (boxWidth / 2);
    var _textY = _boxY + (boxHeight / 2);
    
    scribble(_currentLoc.locationName)
        .starting_format(FONT_DIALOGUE_TEXT_TITLE, c_black)
        .align(fa_center, fa_middle)
        .draw(_textX, _textY);
}

if (instance_exists(oTextLog)) { DrawTextlog(); }
