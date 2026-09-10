
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
    var _boxX   = _guiW - _boxW - 240;
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



function UpdateCharacterPortraits ()
{
    var _slots = [CharacterSlot.LEFT, CharacterSlot.CENTER, CharacterSlot.RIGHT];
    for (var _i = 0; _i < array_length(_slots); _i++)
    {
        var _slotData = activeCharacters[$ _slots[_i]];
        if (_slotData != undefined)
        {
            if (_slotData.alpha < _slotData.targetAlpha)
            {
                _slotData.alpha = min(_slotData.alpha + characterFadeSpeed, _slotData.targetAlpha);
            }
            else if (_slotData.alpha > _slotData.targetAlpha)
            {
                _slotData.alpha = max(_slotData.alpha - characterFadeSpeed, _slotData.targetAlpha);
                if (_slotData.alpha == 0) { _slotData.sprite = noone; }
            }
        }
    }
}



function DrawCharacterPortraits ()
{
    var _guiW = VIEWPORT_WIDTH;
    var _guiH = VIEWPORT_HEIGHT;
    
    UpdateCharacterPortraits();

    // Map enum slots directly to screen positions
    var _coords = {};
    _coords[$ CharacterSlot.LEFT]   = 380;
    _coords[$ CharacterSlot.CENTER] = _guiW / 2;
    _coords[$ CharacterSlot.RIGHT]  = _guiW - 380;

    var _slots = [CharacterSlot.LEFT, CharacterSlot.CENTER, CharacterSlot.RIGHT];
    for (var _i = 0; _i < array_length(_slots); _i++)
    {
        var _key = _slots[_i];
        var _slotData = activeCharacters[$ _key];
        
        if (_slotData.alpha > 0 && sprite_exists(_slotData.sprite))
        {
            draw_sprite_ext(_slotData.sprite, 0, _coords[$ _key], _guiH, 1, 1, 0, c_white, _slotData.alpha);
        }
    }
    
    // Main Character
    if (directorState == DirectorStateLineSequence && array_length(currentLineSequence) > 0)
	{
		var _lineEntry = currentLineSequence[currentLineIndex];
		var _titleText = _lineEntry.lineTitle ?? "";
    
		if (_titleText == mainCharacterName && sprite_exists(mainCharacterSprite))
		{
			draw_sprite(mainCharacterSprite, 0, 120, _guiH);
		}
	}
}
