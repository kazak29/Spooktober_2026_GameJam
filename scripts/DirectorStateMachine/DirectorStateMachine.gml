#region triggers
	
	//check node type and do things depending on that
	function DirectorSceneNodeSet(){
		
		//get scene node data
		var _node = global.sceneNodeData;
		
		//giant ass switch statement?
		switch _node.nodeType {
			
			case NODE_TYPE.TRANSITION: {
				
			} break;
			
			case NODE_TYPE.DIALOGUE: {
				LineSequenceStart(_node.lineSeq);
			} break;
			
			case NODE_TYPE.CHOICE: {
				LineSequenceStart(_node.lineSeq);
			} break;
			
			case NODE_TYPE.MINIGAME: {
				
			} break;
			
		}
		
	}
	
	//make scene progress to next node, similar to line sequence progression
	function DirectorSceneProgress(){
		
		//get scene data
		var _sceneData = global.dataScreenplay[$ global.sceneCurrent] ?? [];
	
		//stop if scene finished (or not set at all) - SHOULD WE ADD DEFAULT TRANSITION HERE IF NO TRANSITION SET AS FINAL NODE?
		var _sceneL = array_length(_sceneData);
		if (global.sceneNodePos >= _sceneL) {
			global.sceneCurrent = "";
			global.sceneNodePos = 0;
			exit;
		}
	
		//setup node
		global.sceneNodeData = _sceneData[global.sceneNodePos];
		DirectorSceneNodeSet();
		
		//progress node
		global.sceneNodePos++;
		
	}
	
#endregion
#region states
	
	function DirectorStateDefault(){
	
		
	
	}
	
#endregion