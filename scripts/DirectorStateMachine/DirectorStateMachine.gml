function DirectorStateIdle()
{
    // Do Nothing
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
                AdvanceNode(); // Corrected function name capitalization
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
    // End of scenes
    if (_sceneId == noone || !struct_exists(screenPlay, _sceneId))
    {
        currentSceneId = noone;
        currentNodeId = noone;
        directorState = DirectorStateIdle;
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
    RunNode(_activeNode.nextNode);
}


// Process the node with the given node ID
function RunNode(_nodeId)
{
    var _activeScene = screenPlay[$ currentSceneId];
    
    // If node ID is noone, this scene is finished, go to the next scene
    if (_nodeId == noone || !struct_exists(_activeScene.nodes, _nodeId))
    {
        StartScene(_activeScene.nextScene);
        return;
    }
    
    currentNodeId = _nodeId;
    var _activeNode = _activeScene.nodes[$ currentNodeId];
	
	// Process the node differently depending on the type
    var _nodeType = _activeNode.nodeType;
    switch (_nodeType)
    {
        case NodeType.LINE_SEQUENCE:
            if (struct_exists(lineData, _activeNode.sequenceId))
            {
                currentLineSequence = lineData[$ _activeNode.sequenceId];
                currentLineIndex = 0;
                
                typist.reset();
                directorState = DirectorStateLineSequence;
            }
            else { 
				AdvanceNode(); // Sequence ID is missing, skip safely
            } 
            break;
    }
}
