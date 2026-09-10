
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
        AdvanceNode();
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
    
    for (var _i = 0; _i < array_length(_slots); _i++)
    {
        var _slotData = activeCharacters[$ _slots[_i]];
        if (_slotData.alpha != _slotData.targetAlpha)
        {
            _isFinished = false;
            break;
        }
    }
    
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
    
    switch (_node.nodeType)
    {
        case NodeType.TRANSITION_IN:
            var _transitionSequence = _node.transitionSequence ?? sqFadeIn;
            SceneTransitionIn(_transitionSequence);
            directorState = DirectorStateTransitionIn;
			break;

        case NodeType.DELAY:
            var _duration = _node.duration ?? 0;
            delayTimer = _duration * game_get_speed(gamespeed_fps);
            directorState = DirectorStateDelay;
			break;
		
        case NodeType.LINE_SEQUENCE:
            currentLineSequence = lineData[$ _node.sequenceId] ?? [];
            currentLineIndex = 0;
            typist.reset();
            directorState = DirectorStateLineSequence;
			break;

        case NodeType.CHARACTER_IN:
			var _list = _node.characters ?? [];
			for (var _i = 0; _i < array_length(_list); _i++)
			{
				var _entry = _list[_i];
				var _slotData = activeCharacters[$ _entry.slot];
				if (_slotData != undefined)
				{
					_slotData.sprite = _entry.sprite;
					_slotData.targetAlpha = 1;
				}
			}
			directorState = DirectorStateCharacterFade;
			break;

        case NodeType.CHARACTER_OUT:
			var _list = _node.characters ?? [];
			for (var _i = 0; _i < array_length(_list); _i++)
			{
				var _entry = _list[_i];
				var _slotData = activeCharacters[$ _entry.slot];
				if (_slotData != undefined)
				{
					_slotData.targetAlpha = 0;
				}
			}
			directorState = DirectorStateCharacterFade;
			break;
    }
}
