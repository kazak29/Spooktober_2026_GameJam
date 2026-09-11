
function DrawSceneBackground ()
{
	if (!struct_exists(screenPlay, currentSceneId)) { return; }
	
	var _activeScene = screenPlay[$ currentSceneId];
	var _background  = _activeScene.background ?? noone;
	if (sprite_exists(_background)) { draw_sprite(_background, 0, 0, 0); }
}



function DrawDialogueBox ()
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
    // Smaller width, offset to the right side of the screen
    var _boxW   = 1200;
    var _boxH   = 220;
    var _boxX   = _guiW - _boxW - 280;
    var _boxY   = _guiH - _boxH - 60;

    draw_sprite_stretched(sTextbox, 0, _boxX, _boxY, _boxW, _boxH);
    
    // ------------------------------------------------------------------
    // TITLE BOX
    // ------------------------------------------------------------------
    if (_titleText != "")
    {
        var _titleBoxW = 280;
        var _titleBoxH = 56;
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



function DrawCharacterPortraits()
{
    var _guiH = VIEWPORT_HEIGHT;
    
    var _count = array_length(stageCharacters);
    if (_count == 0) { return; }

    for (var _i = 0; _i < _count; _i++)
    {
        var _char = stageCharacters[_i];
        if (_char.alpha > 0 && sprite_exists(_char.sprite))
        {
            var _drawY = _guiH + _char.yOffset;
            draw_sprite_ext(_char.sprite, _char.expressionFrame, _char.xPosition, _drawY, 1, 1, 0, _char.blend, _char.alpha);
        }
    }
}



function DrawMainCharacterPortrait()
{
    var _guiH = VIEWPORT_HEIGHT;
    if (mainCharacter.alpha > 0 && sprite_exists(mainCharacter.sprite))
    {
        var _drawY = _guiH + (sprite_get_height(mainCharacter.sprite) / 3) + mainCharacter.yOffset;
        draw_sprite_ext(mainCharacter.sprite, mainCharacter.expressionFrame, 220, _drawY, 1, 1, 0, mainCharacter.blend, mainCharacter.alpha);
    }
}
