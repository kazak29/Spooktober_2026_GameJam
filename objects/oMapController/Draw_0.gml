var _margin_right = 10;
var _margin_top = 10;
var _box_width = 550;
var _box_height = 65;

// Use display_get_gui_width() instead of room_width if you are using the Draw GUI event
var _screenWidth = VIEWPORT_WIDTH; 

for (var _i = 0; _i < locationCount; _i++)
{
    var _currentLoc = locationInstances[_i];
    
    var _frame = (_i == selectedIndex) ? 1 : 0;
    
    // Position from the right edge
    var _boxX = _screenWidth - _margin_right - _box_width;
    var _boxY = _margin_top + (_box_height * _i);
    
    // Draw the stretched box
    draw_sprite_stretched(sChoiceBox, _frame, _boxX, _boxY, _box_width, _box_height);
    
    // Center the scribble text inside the box
    var _textX = _boxX + (_box_width / 2);
    var _textY = _boxY + (_box_height / 2);
    
    scribble(_currentLoc.locationName)
        .starting_format(FONT_DIALOGUE_TEXT_TITLE, c_black)
        .align(fa_center, fa_middle)
        .draw(_textX, _textY);
}