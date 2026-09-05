if keyboard_check_pressed(vk_space) {
	
	//check if all text is visible
	if typist.get_state() >= 1 {
		
		//progress sequence
		DialogueProgress();
		
		//reset sequence when finished
		if lineSeq == "" {
			lineSeq = LINE_SEQ_TEST;
			DialogueProgress();
		}
		
	} else {
		
		//skip typewriter (not on first frame)
		if typist.get_position() > 2 typist.skip();
	
	}
	
}