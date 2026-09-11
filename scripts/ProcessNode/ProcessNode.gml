function ProcessNode(_nodeId)
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
        case NodeType.TRANSITION_IN:
        {
            var _transitionSequence = _node.transitionSequence ?? sqSceneFadeIn;
            SceneTransition(_transitionSequence);
            directorState = DirectorStateTransition;
            break;
        }
        
        case NodeType.TRANSITION_OUT:
        {
            var _transitionSequence = _node.transitionSequence ?? sqSceneFadeOut;
            SceneTransition(_transitionSequence);
            directorState = DirectorStateTransition;
            break;
        }
        
        case NodeType.LINE_SEQUENCE:
        {
            currentLineSequence = lineData[$ _node.sequenceId] ?? [];
            currentLineIndex = 0;
            typist.reset();
            directorState = DirectorStateLineSequence;
            break;
        }
        
        case NodeType.CHARACTER_IN:
        {
            if (array_length(stageCharacters) < MAX_STAGE_CHARACTERS)
            {
                var _charId = struct_exists(_node, CHARACTER_ID) ? _node.charId : "";
                var _sprite = struct_exists(_node, SPRITE) ? _node.sprite : noone;
                var _guiW   = VIEWPORT_WIDTH;
        
                var _newCount = array_length(stageCharacters) + 1;
                var _spawnX   = _guiW * (_newCount / (_newCount + 1));
        
                array_push(stageCharacters, {
                    charId: _charId,
                    sprite: _sprite,
                    alpha: MIN_ALPHA,
                    targetAlpha: MAX_ALPHA,
                    xPosition: _spawnX,
                    targetX: _spawnX
                });
            }
            directorState = DirectorStateCharacterFade;
            break;
        }
        
        case NodeType.CHARACTER_OUT:
        {
            var _searchId     = struct_exists(_node, CHARACTER_ID) ? _node.charId : noone;
            var _searchSprite = struct_exists(_node, SPRITE) ? _node.sprite : noone;
    
            for (var _i = 0; _i < array_length(stageCharacters); _i++)
            {
                // Match by ID first, fallback to sprite reference
                if ((_searchId != noone && stageCharacters[_i].charId == _searchId) || 
                    (_searchSprite != noone && stageCharacters[_i].sprite == _searchSprite))
                {
                    stageCharacters[_i].targetAlpha = MIN_ALPHA;
                    break;
                }
            }
            directorState = DirectorStateCharacterFade;
            break;
        }
        
        case NodeType.MAIN_CHARACTER_IN:
        {
            if (struct_exists(_node, SPRITE) && sprite_exists(_node.sprite)) 
            { 
                mainCharacter.sprite = _node.sprite; 
            }
            mainCharacter.targetAlpha = MAX_ALPHA;
            directorState = DirectorStateCharacterFade;
            break;
        }
        
        case NodeType.MAIN_CHARACTER_OUT:
        {
            mainCharacter.targetAlpha = MIN_ALPHA;
            directorState = DirectorStateCharacterFade;
            break;
        }
		
    }
}
