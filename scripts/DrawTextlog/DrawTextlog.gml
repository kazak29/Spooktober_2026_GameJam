
function DrawTextlog()
{
	draw_set_color(c_black);
    draw_set_alpha(0.75);
    draw_rectangle(0, 0, VIEWPORT_WIDTH, VIEWPORT_HEIGHT, false);
    draw_set_alpha(MAX_ALPHA);
	
    draw_sprite_stretched(sChoiceBox, 0, global.textLogInst.windowX, global.textLogInst.windowY, global.textLogInst.windowWidth, global.textLogInst.windowHeight);

    // Enable scissor test to clip text rendering strictly inside the window bounds
    gpu_push_state();
    gpu_set_scissor(global.textLogInst.windowX, global.textLogInst.windowY, global.textLogInst.windowWidth, global.textLogInst.windowHeight);

    var _curY = global.textLogInst.windowY + 30 - global.textLogInst.scrollOffset;
    var _totalHeight = 0;
    var _globalLog = global.textLog; 

    for (var _i = 0; _i < array_length(_globalLog); _i++)
    {
        var _entry = _globalLog[_i];
        
        var _formattedText = ""; 
        if (string(_entry.title) == "") { _formattedText = string(_entry.text); }
        else { _formattedText = string(_entry.title)+": " + string(_entry.text); }
        
        // Build the scribble element with font, color, and wrapping
        var _element = scribble(_formattedText)
            .starting_format(FONT_DIALOGUE_TEXT_BODY, c_black)
            .wrap(global.textLogInst.windowWidth - 110);
            
        var _elementHeight = _element.get_height();
        
        // Only draw elements that fall within the visible vertical window area
        if (_curY + _elementHeight > global.textLogInst.windowY && _curY < global.textLogInst.windowY + global.textLogInst.windowHeight) {
            _element.draw(global.textLogInst.windowX + 40, _curY);
        }
        
        _curY += _elementHeight + 24; // Spacing between log entries
        _totalHeight += _elementHeight + 24;
    }

    // Update max scroll limit dynamically based on total text height versus box size
    global.textLogInst.maxScrollLimit = max(0, _totalHeight - global.textLogInst.windowHeight + 60);

    // Force snap to the bottom on the very first frame to catch any final line offset mismatches
    if (global.textLogInst.isFirstFrame) {
        global.textLogInst.scrollOffset = global.textLogInst.maxScrollLimit;
        global.textLogInst.isFirstFrame = false;
    }

    // Restore normal GPU state
    gpu_pop_state();
	
	//gpu_set_scissor is bugged and does not reset with gpu_pop
	gpu_set_scissor(0, 0, surface_get_width(application_surface), surface_get_height(application_surface));
	
    // ==========================================
    // SCROLLBAR
    // ==========================================
    if (global.textLogInst.maxScrollLimit > 0)
    {
        var _barWidth = sprite_get_width(sScrollWheel); 
        var _barX = global.textLogInst.windowX + global.textLogInst.windowWidth - _barWidth - 15;
        var _barY = global.textLogInst.windowY + 20;
        var _barHeight = global.textLogInst.windowHeight - 40;
		
        // Draw the background track for the scrollbar
        draw_set_color(c_dkgray);
        draw_set_alpha(0.5);
        draw_roundrect_ext(_barX + 4, _barY, _barX + _barWidth - 4, _barY + _barHeight, 4, 4, false);
        draw_set_alpha(1.0);
		
        // Calculate handle size and position based on scroll progress
        var _scrollRatio = global.textLogInst.windowHeight / _totalHeight;
        var _handleHeight = max(sprite_get_width(sScrollWheel), _barHeight * _scrollRatio);
        
        var _scrollProgress = global.textLogInst.scrollOffset / global.textLogInst.maxScrollLimit;
        var _handleY = _barY + (_barHeight - _handleHeight) * _scrollProgress;
		
        draw_sprite_stretched(sScrollWheel, 0, _barX, _handleY, _barWidth, _handleHeight);
    }
	
	//reset drawing parameters
	draw_set_color(c_white);
    draw_set_alpha(1);
}
