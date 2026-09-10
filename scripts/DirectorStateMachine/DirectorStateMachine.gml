
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
    if (delayTimer <= 0)
    {
        RunNode(currentNodeId);
    }
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
    var _slots = [CharacterSlot.LEFT, CharacterSlot.CENTER, CharacterSlot.RIGHT];
    var _isFinished = true;
    
    // Check stage slot alphas
    for (var _i = 0; _i < array_length(_slots); _i++)
    {
        var _slotData = activeCharacters[$ _slots[_i]];
        if (_slotData.alpha != _slotData.targetAlpha)
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
    RunNode(_activeScene.startNode);
}



function AdvanceNode()
{
    var _activeScene = screenPlay[$ currentSceneId];
    var _activeNode  = _activeScene.nodes[$ currentNodeId];
    
    if (_activeNode.nextNode != noone) { RunNode(_activeNode.nextNode); }
    else { directorState = DirectorStateIdle; }
}



function RunNode(_nodeId)
{
    var _scene = screenPlay[$ currentSceneId];
    var _node  = _scene.nodes[$ _nodeId];
    currentNodeId = _nodeId;
    
    // ------------------------------------------------------------------
    // NODE DELAY
    // ------------------------------------------------------------------
    var _defaultDelay = (_node.nodeType == NodeType.TRANSITION_IN) ? 0 : DEFAULT_NODE_DELAY;
    var _delaySeconds = struct_get(_node, "delay") ?? _defaultDelay;
    if (_delaySeconds > 0 && directorState != DirectorStateDelay)
    {
        delayTimer = _delaySeconds * game_get_speed(gamespeed_fps);
        directorState = DirectorStateDelay;
        return;
    }
    delayTimer = 0;
    
    // ------------------------------------------------------------------
    // NODE EXECUTION
    // ------------------------------------------------------------------
    switch (_node.nodeType)
    {
        case NodeType.TRANSITION_IN: {
            var _transitionSequence = _node.transitionSequence ?? sqFadeIn;
            SceneTransitionIn(_transitionSequence);
            directorState = DirectorStateTransitionIn;
            break;
        }
        
        case NodeType.LINE_SEQUENCE: {
            currentLineSequence = lineData[$ _node.sequenceId] ?? [];
            currentLineIndex = 0;
            typist.reset();
            directorState = DirectorStateLineSequence;
            break;
        }
        
        case NodeType.CHARACTER_IN: {
            var _list = _node.characters ?? [];
            for (var _i = 0; _i < array_length(_list); _i++)
            {
                var _entry = _list[_i];
                var _slotData = activeCharacters[$ _entry.slot];
                if (_slotData != undefined)
                {
                    _slotData.sprite = _entry.sprite;
                    _slotData.targetAlpha = MAX_ALPHA;
                }
            }
            directorState = DirectorStateCharacterFade;
            break;
        }
        
        case NodeType.CHARACTER_OUT: {
            var _list = _node.characters ?? [];
            for (var _i = 0; _i < array_length(_list); _i++)
            {
                var _entry = _list[_i];
                var _slotData = activeCharacters[$ _entry.slot];
                if (_slotData != undefined) { _slotData.targetAlpha = MIN_ALPHA; }
            }
            directorState = DirectorStateCharacterFade;
            break;
        }
        
        case NodeType.MAIN_CHARACTER_IN: {
            if (struct_exists(_node, SPRITE) && sprite_exists(_node.sprite)) 
            { 
                mainCharacter.sprite = _node.sprite; 
            }
            mainCharacter.targetAlpha = MAX_ALPHA;
            directorState = DirectorStateCharacterFade;
            break;
        }
        
        case NodeType.MAIN_CHARACTER_OUT: {
            mainCharacter.targetAlpha = MIN_ALPHA;
            directorState = DirectorStateCharacterFade;
            break;
        }
    }
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
                _slotData.alpha = min(_slotData.alpha + CHARACTER_FADE_SPEED, _slotData.targetAlpha);
            }
            else if (_slotData.alpha > _slotData.targetAlpha)
            {
                _slotData.alpha = max(_slotData.alpha - CHARACTER_FADE_SPEED, _slotData.targetAlpha);
                if (_slotData.alpha == MIN_ALPHA) { _slotData.sprite = noone; }
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
