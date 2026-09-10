function DirectorStateIdle()
{
    // Do Nothing
}

function DirectorStateTransitionIn()
{
    if (!global.midTransition) { AdvanceNode(); }
}

function DirectorStateDelay()
{
    delayTimer--;
    if (delayTimer <= 0)
    {
        typist.reset();
        directorState = DirectorStateLineSequence;
    }
}

function DirectorStateLineSequence()
{
    if (oInputManager.pressed.confirm)
    {
        // Autofill text if typewriter is still revealing text
        if (typist.get_state() < 1) { 
            typist.skip(); 
        }
        else {
            currentLineIndex++;
            if (currentLineIndex >= array_length(currentLineSequence)) {
                AdvanceNode();
            } else {
                // Reset typewriter effect for the new line
                typist.reset();
            }
        }
    }
}


// Helper Functions ***************************************************************************

// Start the scene with the given scene ID
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

// Run the next node
function AdvanceNode()
{
    var _activeScene = screenPlay[$ currentSceneId];
    var _activeNode  = _activeScene.nodes[$ currentNodeId];
    
    if (_activeNode.nextNode != noone)
    {
        RunNode(_activeNode.nextNode);
    }
    else
    {
        directorState = DirectorStateIdle;
    }
}

// Process the node with the given node ID
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
		
        case NodeType.LINE_SEQUENCE:
            currentLineSequence = lineData[$ _node.sequenceId] ?? [];
            currentLineIndex    = 0;
            
            var _delay = _node.delay ?? 0;
            if (_delay > 0)
            {
                delayTimer    = _delay * game_get_speed(gamespeed_fps);
                directorState = DirectorStateDelay;
            }
            else
            {
                typist.reset();
                directorState = DirectorStateLineSequence;
            }
        break;
    }
}
