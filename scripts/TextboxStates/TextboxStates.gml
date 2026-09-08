function TextboxStateAnimation(){
	
	//forget it for now
	
}

function TextboxStateDestroy(){
	
	//just remove textbox
	instance_destroy();
	
}

function TextboxStateDialogue(){

	//check player input
	if keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_any) {
		
		//check if all text is visible
		if typist.get_state() >= 1 {
		
			//progress sequence
			LineSequenceProgress();
			
			//play sfx
			//SoundPlay(sfxTextBlip);
			
		} else {
		
			//skip typewriter (not on first frame)
			if (typist.get_position() > 2) typist.skip();
	
		}
				
	}
	
}