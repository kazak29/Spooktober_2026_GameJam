function DrawDialogueBox ()
{
	if (array_length(currentLineSequence) == 0) { return; }
	
    var _lineEntry = currentLineSequence[currentLineIndex];
    var _guiW = VIEWPORT_WIDTH;
    var _guiH = VIEWPORT_HEIGHT;
    
    // Safety Fallbacks
    var _titleText = _lineEntry.lineTitle ?? "";
    var _bodyText  = _lineEntry.lineText ?? "";
    
	//replace title for macros
	_titleText = TitleMacrosCheck(_titleText);
	
    // ------------------------------------------------------------------
    // DIALOGUE TEXTBOX
    // ------------------------------------------------------------------
    var _boxW = sprite_get_width(sTextbox);
    var _boxH = sprite_get_height(sTextbox);
    
    // Position: Horizontal center, anchored to the bottom with 20px padding
    var _boxX = _guiW / 2;
    var _boxY = _guiH;

    // Draw main textbox (Bottom-Center origin)
	draw_set_alpha(textbox.alpha);
    draw_sprite(sTextbox, 0, _boxX, _boxY);
	draw_set_alpha(1);
    
    // Top-Left corner of the textbox calculated for title/body text alignments
    var _boxLeft = _boxX - (_boxW / 2);
    var _boxTop  = _boxY - _boxH;
    
    // ------------------------------------------------------------------
    // TITLE BOX
    // ------------------------------------------------------------------
    if (_titleText != "")
    {
        var _titleBoxW = 300;
        var _titleBoxH = 64;
        var _titleBoxX = (spookUp) ? _boxLeft + 300 : _boxLeft + 40;
        var _titleBoxY = _boxTop - (_titleBoxH / 2);
        
		draw_set_alpha(textbox.alpha);
        draw_sprite_stretched(sChoiceBox, 0, _titleBoxX, _titleBoxY, _titleBoxW, _titleBoxH);
		draw_set_alpha(1);
        
        scribble(_titleText)
            .starting_format(FONT_DIALOGUE_TEXT_TITLE, c_black)
            .align(fa_center, fa_middle)
			.blend(c_white,textbox.alpha)
            .draw(_titleBoxX + (_titleBoxW / 2), _titleBoxY + (_titleBoxH / 2));
    }
    
    // ------------------------------------------------------------------
    // DIALOGUE TEXT BODY
    // ------------------------------------------------------------------
    var _paddingX = (spookUp) ? 300 : 56;
    var _paddingY = 80;
    var _textX    = _boxLeft + _paddingX;
    var _textY    = _boxTop + _paddingY;
    var _maxTextW = _boxW - (_paddingX * 1.5);
    
    var _scribble = scribble(_bodyText)
        .starting_format(FONT_DIALOGUE_TEXT_BODY, c_black)
        .sdf_shadow(c_black, 0.5, 1,1)
        .wrap(_maxTextW)
		.blend(c_white,textbox.alpha)
        .draw(_textX, _textY, typist);
}



function DrawCharacterPortraits ()
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



function DrawMainCharacterPortrait ()
{
    var _guiH = VIEWPORT_HEIGHT;
    if (mainCharacter.alpha > 0 && sprite_exists(mainCharacter.sprite))
    {
        var _drawY = _guiH + mainCharacter.yOffset + SPOOK_PORTRAIT_Y_OFFSET;
        draw_sprite_ext(mainCharacter.sprite, mainCharacter.expressionFrame, 220, _drawY, 1, 1, 0, mainCharacter.blend, mainCharacter.alpha);
    }
}
