
function DirectorStateIdle()
{
    // Do Nothing
}


function DirectorStateTransitionIn()
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
    
    // Check stage characters alpha status
    for (var _i = 0; _i < array_length(stageCharacters); _i++)
    {
        var _char = stageCharacters[_i];
        if (_char.alpha != _char.targetAlpha)
        {
            _isFinished = false;
            break;
        }
    }
    
    // Check main character alpha
    if (mainCharacter.alpha != mainCharacter.targetAlpha) { _isFinished = false; }
    if (_isFinished) { AdvanceNode(); }
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
    var _guiW = VIEWPORT_WIDTH;
    var _count = array_length(stageCharacters);
    
    // Get current speaker for dimming
    var _currentSpeaker = "";
    if (directorState == DirectorStateLineSequence && currentLineIndex < array_length(currentLineSequence))
    {
        var _lineEntry = currentLineSequence[currentLineIndex];
        _currentSpeaker = _lineEntry.lineTitle ?? "";
    }

    // ------------------------------------------------------------------
    // DYNAMIC EQUAL SPACING CALCULATION
    // 1 Char  -> 1/2 (50%)
    // 2 Chars -> 1/3 (33.3%), 2/3 (66.6%)
    // 3 Chars -> 1/4 (25%), 2/4 (50%), 3/4 (75%)
    // ------------------------------------------------------------------
    for (var _i = _count - 1; _i >= 0; _i--)
    {
        var _char = stageCharacters[_i];
        
        _char.targetX = _guiW * ((_i + 1) / (_count + 1));
        _char.xPosition = lerp(_char.xPosition, _char.targetX, 0.15);
        
        // If there is dialogue and speaker doesn't match, target dark grey. Otherwise normal white
        var _isSpeaking = (_currentSpeaker != "" && _currentSpeaker == _char.charId);
        var _targetColor = (directorState == DirectorStateLineSequence && !_isSpeaking) ? c_dkgray : c_white;
        
        // Initialize image_blend if it doesn't exist yet
        if (!struct_exists(_char, "blend")) { _char.blend = c_white; }
        _char.blend = merge_color(_char.blend, _targetColor, 0.15);
        
        // Active Speaker Scale Lerp
        var _targetScale = _isSpeaking ? 1.03 : 1.0;
        if (!struct_exists(_char, "scale")) { _char.scale = 1.0; }
        _char.scale = lerp(_char.scale, _targetScale, 0.15);
        
        // Fade In / Fade Out logic
        if (_char.alpha < _char.targetAlpha) { _char.alpha = min(_char.alpha + CHARACTER_FADE_SPEED, _char.targetAlpha); }
        else if (_char.alpha > _char.targetAlpha)
        {
            _char.alpha = max(_char.alpha - CHARACTER_FADE_SPEED, _char.targetAlpha);
            if (_char.alpha == MIN_ALPHA) { array_delete(stageCharacters, _i, 1); }
        }
    }
    
    //// ------------------------------------------------------------------
    // MAIN CHARACTER DIMMING & SCALE
    // ------------------------------------------------------------------
    var _mainIsSpeaking = (_currentSpeaker != "" && _currentSpeaker == mainCharacter.charId);
    var _mainTargetColor = (directorState == DirectorStateLineSequence && !_mainIsSpeaking) ? c_dkgray : c_white;
    
    if (!struct_exists(mainCharacter, "blend")) { mainCharacter.blend = c_white; }
    mainCharacter.blend = merge_color(mainCharacter.blend, _mainTargetColor, 0.15);
    
    var _mainTargetScale = _mainIsSpeaking ? 1.03 : 1.0;
    if (!struct_exists(mainCharacter, "scale")) { mainCharacter.scale = 1.0; }
    mainCharacter.scale = lerp(mainCharacter.scale, _mainTargetScale, 0.15);
    
    // Step Main Character Alpha
    if (mainCharacter.alpha < mainCharacter.targetAlpha)
    {
        mainCharacter.alpha = min(mainCharacter.alpha + CHARACTER_FADE_SPEED, mainCharacter.targetAlpha);
    }
    else if (mainCharacter.alpha > mainCharacter.targetAlpha)
    {
        mainCharacter.alpha = max(mainCharacter.alpha - CHARACTER_FADE_SPEED, mainCharacter.targetAlpha);
    }
}
