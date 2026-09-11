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
            var _transitionSequence = _node.transitionSequence ?? sqFadeIn;
            SceneTransitionIn(_transitionSequence);
            directorState = DirectorStateTransitionIn;
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
		    var _list = _node.characters ?? [];
		    var _guiW = VIEWPORT_WIDTH;
    
		    for (var _i = 0; _i < array_length(_list); _i++)
		    {
		        if (array_length(stageCharacters) >= MAX_STAGE_CHARACTERS) { break; }
		        var _entry = _list[_i];
        
		        var _charId = struct_exists(_entry, CHARACTER_ID) ? _entry.charId : "";
		        var _sprite = struct_exists(_entry, SPRITE) ? _entry.sprite : noone;
        
		        var _newCount = array_length(stageCharacters) + 1;
		        var _spawnX = _guiW * (_newCount / (_newCount + 1));
        
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
		    var _list = _node.characters ?? [];
		    for (var _i = 0; _i < array_length(_list); _i++)
		    {
		        var _entry = _list[_i];
        
		        // Safely pull values without throwing a missing variable error
		        var _searchId = struct_exists(_entry, CHARACTER_ID) ? _entry.charId : noone;
		        var _searchSprite = struct_exists(_entry, SPRITE) ? _entry.sprite : noone;
        
		        for (var _j = 0; _j < array_length(stageCharacters); _j++)
		        {
		            if ((_searchId != noone && stageCharacters[_j].charId == _searchId) || 
		                (_searchSprite != noone && stageCharacters[_j].sprite == _searchSprite))
		            {
		                stageCharacters[_j].targetAlpha = MIN_ALPHA;
		                break;
		            }
		        }
		    }
		    directorState = DirectorStateCharacterFade;
		    break;
		}
		
        case NodeType.MAIN_CHARACTER_IN:
        {
            if (struct_exists(_node, SPRITE) && sprite_exists(_node.sprite)) { mainCharacter.sprite = _node.sprite; }
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