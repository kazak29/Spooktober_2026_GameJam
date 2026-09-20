
function DrawTextlog()
{
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
        
        // Scribble handles [b] natively for bolding
        var _formattedText = "[b]" + string(_entry.title) + ":[/b] " + string(_entry.text);
        
        // Build the scribble element with font, color, and wrapping
        var _element = scribble(_formattedText)
            .starting_format(FONT_DIALOGUE_TEXT_BODY, c_black)
            .wrap(global.textLogInst.windowWidth - 80);
            
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

    // Restore normal GPU state
    gpu_pop_state();
}
