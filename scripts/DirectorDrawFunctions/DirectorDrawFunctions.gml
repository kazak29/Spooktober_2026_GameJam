
function DrawDialogueBox()
{
    var _lineEntry = currentLineSequence[currentLineIndex];
    var _guiW = VIEWPORT_WIDTH;
    var _guiH = VIEWPORT_HEIGHT;
    
    // Safety Fallbacks
    var _titleText = _lineEntry.lineTitle ?? "";
    var _bodyText  = _lineEntry.lineText ?? "";
    
    // ------------------------------------------------------------------
    // DIALOGUE TEXTBOX
    // ------------------------------------------------------------------
    var _margin = 60;
    var _boxW   = _guiW - (_margin * 2);
    var _boxH   = 240;
    var _boxX   = _margin;
    var _boxY   = _guiH - _boxH - 60;

    draw_sprite_stretched(sTextbox, 0, _boxX, _boxY, _boxW, _boxH);
    
    // ------------------------------------------------------------------
    // TITLE BOX
    // ------------------------------------------------------------------
    if (_titleText != "")
    {
        var _titleBoxW = 320;
        var _titleBoxH = 64;
        var _titleBoxX = _boxX;
        var _titleBoxY = _boxY - _titleBoxH + 5;
        
        draw_sprite_stretched(sTextboxTitle, 0, _titleBoxX, _titleBoxY, _titleBoxW, _titleBoxH);
        
        scribble(_titleText)
            .starting_format(FONT_CONSOLE_16, c_white)
            .align(fa_center, fa_middle)
            .draw(_titleBoxX + (_titleBoxW / 2), _titleBoxY + (_titleBoxH / 2));
    }
    
    // ------------------------------------------------------------------
    // DIALOGUE TEXT BODY
    // ------------------------------------------------------------------
    var _paddingX = 32;
    var _paddingY = 28;
    var _textX    = _boxX + _paddingX;
    var _textY    = _boxY + _paddingY;
    var _maxTextW = _boxW - (_paddingX * 2);
    
    var _scribble = scribble(_bodyText)
        .starting_format(FONT_CONSOLE_16, c_white)
        .shadow(c_black, 1)
        .wrap(_maxTextW)
		.draw(_textX, _textY, typist);
}
