function DialogueProgress(){
	
	//get sequence and line data
	var _sqData = global.dataLines[$ lineSeq] ?? [];
	
	//stop if sequence finished (or not set at all)
	var _sqL = array_length(_sqData);
	if (lineNum >= _sqL) {
				
		//stop dialogue
		lineSeq = "";
		lineNum = 0;
		exit;
		
	}
	
	//setup line data
	lineData = _sqData[lineNum];
	
	//progress dialogue
	lineNum++;
	
}