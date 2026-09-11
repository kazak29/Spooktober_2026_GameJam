
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

    // ------------------------------------------------------------------
    // DYNAMIC EQUAL SPACING CALCULATION
    // 1 Char  -> 1/2 (50%)
    // 2 Chars -> 1/3 (33.3%), 2/3 (66.6%)
    // 3 Chars -> 1/4 (25%), 2/4 (50%), 3/4 (75%)
    // ------------------------------------------------------------------
    for (var _i = _count - 1; _i >= 0; _i--)
    {
        var _char = stageCharacters[_i];
        
        // Target slot X formula
        _char.targetX = _guiW * ((_i + 1) / (_count + 1));
        
        // Smooth slide to target position
        _char.xPosition = lerp(_char.xPosition, _char.targetX, 0.15);
        
        // Fade In / Fade Out logic
        if (_char.alpha < _char.targetAlpha) 
        { 
            _char.alpha = min(_char.alpha + CHARACTER_FADE_SPEED, _char.targetAlpha); 
        }
        else if (_char.alpha > _char.targetAlpha)
        {
            _char.alpha = max(_char.alpha - CHARACTER_FADE_SPEED, _char.targetAlpha);
            if (_char.alpha == MIN_ALPHA) 
            { 
                array_delete(stageCharacters, _i, 1); 
            }
        }
    }
    
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
