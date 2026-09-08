function LineSequenceProgress(){
	
	//get sequence and line data
	var _dataSeq = global.dataLines[$ global.lineSeq] ?? [];
	
	//stop if sequence finished (or not set at all)
	var _sqL = array_length(_dataSeq);
	if (global.lineSeqPos >= _sqL) {
		
		//reset globals
		global.lineSeq = "";
		global.lineSeqPos = 0;
		
		//move to next scene node
		DirectorSceneProgress();
		
		//skip all shit below
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
		textStr = _dataLine[$ "line"]	?? "NO LINE TEXT SET";
		
		//typewriter sfx
		
		
		//title string
		
		
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