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
	
	//choice node (with first option)
	function DataNodeSetupChoice(_textKey, _script, _arguments = []) {
		var _node = {
			nodeType	:	NODE_TYPE.CHOICE,
			options		:	[
				{
					key	: _textKey,
					scr	: _script,
					args: _arguments,
				},
			],
		};
		DataNodeAdd(_node);
	}
	
	//additional options for last created choice node
	function DataNodeChoiceOptionAdd(_textKey, _script, _arguments = []) {
		var _node = global.gameDataSetupLastNode;
		if (_node.nodeType != NODE_TYPE.CHOICE) exit;
		
		//create a choice option
		var _option = {
			key	: _textKey,
			scr	: _script,
			args: _arguments,
		};
		
		//push option into array
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
			
			DataNodeSetupChoice(UIKEY_TEST, ChoiceTest);
			DataNodeChoiceOptionAdd(UIKEY_TEST1, ChoiceTest);
			DataNodeChoiceOptionAdd(UIKEY_TEST1, ChoiceTest);
			
			DataNodeSetupTransition(SCENE_TEST1);
		#endregion
		#region scene test 1
			DataSceneCreate(SCENE_TEST1);
			DataNodeSetupDialogue(LINE_SEQ_TEST1);
			
			DataNodeSetupTransition();
		#endregion
	}
	DataSceneScreenplaySetup();
	
#endregion