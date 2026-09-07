function LineSequenceProgress(){
	
	//get sequence and line data
	var _dataSeq = global.dataLines[$ global.lineSeq] ?? [];
	
	//stop if sequence finished (or not set at all)
	var _sqL = array_length(_dataSeq);
	if (global.lineSeqPos >= _sqL) {
		
		//reset globals
		global.lineSeq = "";
		global.lineSeqPos = 0;
		
		//fadeout textboxes
		with oTextbox textboxState = TextboxStateFadeOut;
		
		//skip all shit below
		exit;
		
	}
	
	
	//setup line data and its textbox
	var _dataLine = _dataSeq[global.lineSeqPos];
	var _tbId = id;
	
	//check if prev line had different textbox
	if (global.lineSeqPos > 0) {
		
		var _textboxPrev = _dataSeq[global.lineSeqPos - 1].tbStyle;
		var _textboxNext = _dataSeq[global.lineSeqPos	 ].tbStyle;
		if (_textboxNext != _textboxPrev) {
			
			//make this textbox dissapear
			typist.pause();
			textboxState = TextboxStateFadeOut;
			
			//get new textbox data
			var _dataTbStyle = _dataLine.tbStyle;
	
			//setup textbox position
			var _x = _dataTbStyle.x;
			var _y = _dataTbStyle.y;
			
			//create a new textbox
			_tbId = instance_create_layer(_x,_y, "Textbox", oTextbox, _dataTbStyle);
			
		}
		
	}
	
	
	//setup text string for textbox
	with _tbId {
		textStr = _dataLine[$ "line"]	?? "NO LINE TEXT SET";
	}
	
	//progress sequence position
	global.lineSeqPos++;
	
}

function LineSequenceStart(_seq){
	
	//clear any textboxes just in case
	//with oTextbox instance_destroy();
	//with oTextboxName instance_destroy();
	
	//setup sequence
	global.lineSeq = _seq;
	global.lineSeqPos = 0;
	
	//get sequence data
	var _dataSeq = global.dataLines[$ global.lineSeq] ?? [];
	if (array_length(_dataSeq) <= 0) exit;
	
	//get textbox data for first line
	var _dataLine		= _dataSeq[0];
	var _dataTbStyle	= _dataLine.tbStyle;
	
	//setup textbox position
	var _x = _dataTbStyle.x;
	var _y = _dataTbStyle.y;
	
	//create a first textbox (first state is fade-in)
	var _tb = instance_create_layer(_x,_y, "Textbox", oTextbox, _dataTbStyle);
	with _tb LineSequenceProgress();
	
}