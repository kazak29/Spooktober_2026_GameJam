
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
			var _list = struct_get(_node, CHARACTERS) ?? [];
			for (var _i = 0; _i < array_length(_list); _i++)
			{
				if (array_length(stageCharacters) >= MAX_STAGE_CHARACTERS) { break; }
				var _entry = _list[_i];
        

				array_push(stageCharacters, {
					sprite: _entry.sprite,
					alpha: MIN_ALPHA,
					targetAlpha: MAX_ALPHA,
					x: VIEWPORT_WIDTH / 2,
					targetX: VIEWPORT_WIDTH / 2
				});
			}
			directorState = DirectorStateCharacterFade;
			break;
		}
        
        case NodeType.CHARACTER_OUT:
		{
			var _list = struct_get(_node, CHARACTERS) ?? [];
			for (var _i = 0; _i < array_length(_list); _i++)
			{
				// Find character by sprite and set target alpha to 0 for exit fade
				var _entry = _list[_i];
				for (var _c = 0; _c < array_length(stageCharacters); _c++)
				{
					if (stageCharacters[_c].sprite == _entry.sprite)
					{
						stageCharacters[_c].targetAlpha = MIN_ALPHA;
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
