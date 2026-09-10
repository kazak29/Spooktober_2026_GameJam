/*
function LineSequenceProgress(){
	
	var _dataSeq = global.dataLines[$ global.lineSeq] ?? [];
    var _sqL = array_length(_dataSeq);
    
    // Check if the current line sequence has completed
    if (global.lineSeqPos >= _sqL) {
        
        global.lineSeq = "";
        global.lineSeqPos = 0;
        
        // If the current scene node is a CHOICE, spawn the choices menu
        if (global.sceneNodeData.nodeType == NODE_TYPE.CHOICE) {
            var _options = global.sceneNodeData.options;
            if (array_length(_options) > 0) {
                instance_create_layer(0, 0, CHOICES_LAYER, oChoiceMenu, {
                    options: _options
                });
                exit;
            }
        }
		
		//move to next scene node
		DirectorSceneProgress();
		exit;
		
	}
	
	
	//setup line data and its textbox style
	var _dataLine = _dataSeq[global.lineSeqPos];
	var _dataTbStyle = _dataLine.tbStyle;
	
	//check currently present textbox (true = same style, false = different style or no current textbox exists)
	if !TextboxCompare(_dataTbStyle) {
		
		//destroy previous textbox (need replacement with animations later)
		with global.tbId textboxState = TextboxStateDestroy;
		
		//create a new textbox
		TextboxCreate(_dataTbStyle);
		
	}
	
	//setup line for textbox
	with global.tbId {
		
		//line string
		textStr = _dataLine[$ "line"] ?? "NO LINE TEXT SET";
		
		//title
		var _title = _dataLine[$ "title"] ?? "NO LINE TITLE SET";
		TextboxTitleSet(_title);
		
		//typewriter sfx
		
		
	}
	
	//progress sequence position
	global.lineSeqPos++;
	
}

function LineSequenceStart(_seq){
	
	//setup sequence
	global.lineSeq = _seq;
	global.lineSeqPos = 0;
	
	//get sequence data and check if it exists
	var _dataSeq = global.dataLines[$ global.lineSeq] ?? [];
	if (array_length(_dataSeq) <= 0) {
		show_debug_message($"{_seq}: LINE SEQUENCE DATA MISSING, SKIPPING NODE");
		DirectorSceneProgress();
		exit;
	}
	
	//trigger first line
	LineSequenceProgress();
	
}
*/