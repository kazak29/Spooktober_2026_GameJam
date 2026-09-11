
function DirectorStateIdle()
{
    // Do Nothing
}


function DirectorStateTransition()
{
    if (!global.midTransition)
    {
        AdvanceNode();
    }
}


function DirectorStateDelay()
{
    delayTimer--;
    if (delayTimer <= 0) { ProcessNode(currentNodeId); }
}


function DirectorStateLineSequence()
{
    if (oInputManager.pressed.confirm)
    {
        if (typist.get_state() < 1)
        { 
            typist.skip(); 
        }
        else
        {
            currentLineIndex++;
            if (currentLineIndex >= array_length(currentLineSequence))
            {
                AdvanceNode();
            }
            else
            {
                typist.reset();
            }
        }
    }
}


function DirectorStateCharacterFade()
{
    var _isFinished = true;
    
    // Check if any stage character is still fading
    for (var _i = 0; _i < array_length(stageCharacters); _i++)
    {
        var _char = stageCharacters[_i];
        if (abs(_char.alpha - _char.targetAlpha) > 0.01)
        {
            _isFinished = false;
            break;
        }
    }
    
    // Check main character
    if (abs(mainCharacter.alpha - mainCharacter.targetAlpha) > 0.01) 
    { 
        _isFinished = false; 
    }

    if (_isFinished) 
    { 
        // Snap final values to prevent small floating-point offsets
        for (var _i = 0; _i < array_length(stageCharacters); _i++) {
            stageCharacters[_i].alpha = stageCharacters[_i].targetAlpha;
        }
        mainCharacter.alpha = mainCharacter.targetAlpha;
        
        AdvanceNode(); 
    }
}





// ------------------------------------------------------------------
// HELPER FUNCTIONS
// ------------------------------------------------------------------

function StartScene(_sceneId)
{
    if (_sceneId == noone || !struct_exists(screenPlay, _sceneId))
    {
        currentSceneId = noone;
        currentNodeId  = noone;
        directorState  = DirectorStateIdle;
        return;
    }
    
    currentSceneId = _sceneId;
    var _activeScene = screenPlay[$ currentSceneId];
    ProcessNode(_activeScene.startNode);
}



function AdvanceNode()
{
    var _activeScene = screenPlay[$ currentSceneId];
    var _activeNode  = _activeScene.nodes[$ currentNodeId];
    
    if (_activeNode.nextNode != noone) { ProcessNode(_activeNode.nextNode); }
    else { directorState = DirectorStateIdle; }
}



function UpdateCharacterPortraits()
{
    // Resolve current speaker once for all update logic
    var _currentSpeaker = "";
    if (directorState == DirectorStateLineSequence && currentLineIndex < array_length(currentLineSequence))
    {
        var _lineEntry = currentLineSequence[currentLineIndex];
        _currentSpeaker = _lineEntry.lineTitle ?? "";
    }

    var _speakerJustChanged = (_currentSpeaker != previousSpeaker);
    previousSpeaker = _currentSpeaker;

    // Delegate updates
    UpdateStageCharacterPortraits(_currentSpeaker, _speakerJustChanged);
    UpdateMainCharacterPortrait(_currentSpeaker, _speakerJustChanged);
}



// Called in UpdateCharacterPortraits above
function UpdateStageCharacterPortraits(_currentSpeaker, _speakerJustChanged)
{
    var _guiW = VIEWPORT_WIDTH;
    var _count = array_length(stageCharacters);
	
    for (var _i = _count - 1; _i >= 0; _i--)
    {
        var _char = stageCharacters[_i];
        
        // Equal spacing
        _char.targetX = _guiW * ((_i + 1) / (_count + 1));
        _char.xPosition = lerp(_char.xPosition, _char.targetX, 0.15);
        
        // Dimming / Color Lerp
        var _isSpeaking = (_currentSpeaker != "" && _currentSpeaker == _char.charId);
        var _targetColor = (directorState == DirectorStateLineSequence && !_isSpeaking) ? c_dkgray : c_white;
        if (!struct_exists(_char, "blend")) { _char.blend = c_white; }
        _char.blend = merge_color(_char.blend, _targetColor, 0.15);
        
        // Bounce Animation
        if (!struct_exists(_char, "yOffset")) { _char.yOffset = 0; }
        if (!struct_exists(_char, "yVelocity")) { _char.yVelocity = 0; }
        
        if (_speakerJustChanged && _isSpeaking) { _char.yVelocity = CHARACTER_BOUNCE_HEIGHT; }
        
        _char.yVelocity += CHARACTER_BOUNCE_SPEED;
        _char.yOffset += _char.yVelocity;
        
        if (_char.yOffset >= 0)
        {
            _char.yOffset = 0;
            _char.yVelocity = 0;
        }
        
        // Alpha Transitions
        if (_char.alpha < _char.targetAlpha) 
        { 
            _char.alpha = min(_char.alpha + CHARACTER_FADE_SPEED, _char.targetAlpha); 
        }
        else if (_char.alpha > _char.targetAlpha)
        {
            _char.alpha = max(_char.alpha - CHARACTER_FADE_SPEED, _char.targetAlpha);
        }
    }

    // Delete characters that have completely faded out
    for (var _i = array_length(stageCharacters) - 1; _i >= 0; _i--)
    {
        if (stageCharacters[_i].alpha <= MIN_ALPHA && stageCharacters[_i].targetAlpha == MIN_ALPHA)
        {
            array_delete(stageCharacters, _i, 1);
        }
    }
}



// Called in UpdateCharacterPortraits above
function UpdateMainCharacterPortrait(_currentSpeaker, _speakerJustChanged)
{
    var _mainIsSpeaking = (_currentSpeaker != "" && _currentSpeaker == mainCharacter.charId);
    var _mainTargetColor = (directorState == DirectorStateLineSequence && !_mainIsSpeaking) ? c_dkgray : c_white;
    
    // Dimming / Color Lerp
    if (!struct_exists(mainCharacter, "blend")) { mainCharacter.blend = c_white; }
    mainCharacter.blend = merge_color(mainCharacter.blend, _mainTargetColor, 0.15);
    
    // Bounce Animation
    if (!struct_exists(mainCharacter, "yOffset")) { mainCharacter.yOffset = 0; }
    if (!struct_exists(mainCharacter, "yVelocity")) { mainCharacter.yVelocity = 0; }
    
    // Reduced jump height
    if (_speakerJustChanged && _mainIsSpeaking) { mainCharacter.yVelocity = CHARACTER_BOUNCE_HEIGHT; }
    
    // Slower gravity/float
    mainCharacter.yVelocity += CHARACTER_BOUNCE_SPEED;
    mainCharacter.yOffset += mainCharacter.yVelocity;
    
    if (mainCharacter.yOffset >= 0)
    {
        mainCharacter.yOffset = 0;
        mainCharacter.yVelocity = 0;
    }
    
    // Alpha Transitions
    if (mainCharacter.alpha < mainCharacter.targetAlpha)
    {
        mainCharacter.alpha = min(mainCharacter.alpha + CHARACTER_FADE_SPEED, mainCharacter.targetAlpha);
    }
    else if (mainCharacter.alpha > mainCharacter.targetAlpha)
    {
        mainCharacter.alpha = max(mainCharacter.alpha - CHARACTER_FADE_SPEED, mainCharacter.targetAlpha);
    }
}
