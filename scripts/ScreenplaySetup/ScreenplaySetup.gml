#region globals used only here
	
	//last created scene
	global.gameDataSetupLastScene = [];
	
	//last created node
	global.gameDataSetupLastNode = {};
	
#endregion
#region misc
	
	//push node into screenplay's last created scene, then save it as last created node
	function DataNodeAdd(_node){
		
		//push node into currently set scene
		var _scene = global.gameDataSetupLastScene;
		array_push(_scene, _node);
		
		//set this node as last created
		global.gameDataSetupLastNode = _node;
		
	}
	
#endregion
#region indivdual node scripts
	
	//transition node (NEEDS MORE PARAMETERS)
	function DataNodeSetupTransition(_sceneNext = SCENE_TRANS_STAY) {
		var _node = {
			nodeType	: NODE_TYPE.TRANSITION,
			sceneNext	:	_sceneNext,
		};
		DataNodeAdd(_node);
	}
	
	//dialogue node
	function DataNodeSetupDialogue(_lineSeq) {
		var _node = {
			nodeType	:	NODE_TYPE.DIALOGUE,
			lineSeq		:	_lineSeq,
		};
		DataNodeAdd(_node);
	}
	
	//choice node
	function DataNodeSetupChoice(_lineSeq) {
		var _node = {
			nodeType	:	NODE_TYPE.CHOICE,
			lineSeq     :   _lineSeq,
			options		:	[],
		};
		DataNodeAdd(_node);
	}
	
	//add options for last created choice node
	function DataNodeChoiceOptionAdd(_textKey, _script, _arguments = []) {
		var _node = global.gameDataSetupLastNode;
		if (_node.nodeType != NODE_TYPE.CHOICE) exit;
		
		var _option = {
			key	: _textKey,
			scr	: _script,
			args: _arguments,
		};
		array_push(_node.options, _option);
	}
	
#endregion
#region creating the scenes
	
	//create a new array in screenplay struct
	function DataSceneCreate(_name){
		
		//add a new scene array into screenplay
		global.dataScreenplay[$ _name] = [];
		
		//save scene array as last created
		global.gameDataSetupLastScene = global.dataScreenplay[$ _name];
		
	}
	
	//setup screenplay data (as a struct of arrays of structs)
	function DataSceneScreenplaySetup(){
		global.dataScreenplay = {};
		
		#region scene test
			DataSceneCreate(SCENE_TEST);
			
			DataNodeSetupDialogue(LINE_SEQ_TEST);
			
			DataNodeSetupChoice(LINE_SEQ_PROMPT1);
			DataNodeChoiceOptionAdd(UIKEY_TEST1, noone);
			DataNodeChoiceOptionAdd(UIKEY_TEST1, noone);
			
			//move to next scene
			//DataNodeSetupTransition(SCENE_TEST1);
		#endregion
		#region scene test 1
			//create scene
			//DataSceneCreate(SCENE_TEST1);
			
			//dialogue
			//DataNodeSetupDialogue(LINE_SEQ_TEST1);
			
			//move to next scene
			//DataNodeSetupTransition();
		#endregion
	}
	DataSceneScreenplaySetup();
	
#endregion