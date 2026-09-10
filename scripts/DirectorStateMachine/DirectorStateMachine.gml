
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
    // UPDATE TARGET X POSITIONS BASED ON CHARACTER COUNT
    // ------------------------------------------------------------------
    var _targetPositions = [];
    switch (_count)
    {
        case 1: 
            _targetPositions = [_guiW / 2]; 
            break;
        case 2: 
            _targetPositions = [380, _guiW / 2]; 
            break;
        case MAX_STAGE_CHARACTERS: 
            _targetPositions = [380, _guiW / 2, _guiW - 380]; 
            break;
    }

    // ------------------------------------------------------------------
    // CHARACTER ALPHAS AND POSITIONS
    // ------------------------------------------------------------------
    for (var _i = _count - 1; _i >= 0; _i--)
    {
        var _char = stageCharacters[_i];
        
        // Smoothly slide X position toward targetX
        if (_i < array_length(_targetPositions)) { _char.targetX = _targetPositions[_i]; }
        _char.x = lerp(_char.x, _char.targetX, 0.15);
        
        // Handle Fade In / Fade Out
        if (_char.alpha < _char.targetAlpha) 
        { 
            _char.alpha = min(_char.alpha + CHARACTER_FADE_SPEED, _char.targetAlpha); 
        }
        else if (_char.alpha > _char.targetAlpha)
        {
            _char.alpha = max(_char.alpha - CHARACTER_FADE_SPEED, _char.targetAlpha);
            if (_char.alpha == MIN_ALPHA) { array_delete(stageCharacters, _i, 1); }
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
