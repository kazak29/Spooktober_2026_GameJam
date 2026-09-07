function TextboxStateFadeIn(){
	
	//increase alpha by speed set in textbox style struct
	image_alpha = Approach(image_alpha, alphaMax, alphaSpd);
	
	//check player input
	if keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_any) {
		image_alpha = alphaMax;
	}
	
	//when faded in progress line
	if image_alpha >= alphaMax {
		textboxState = TextboxStateDialogue;
	}
	
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

function TextboxStateFadeOut(){
	
	//reduce alpha
	image_alpha = Approach(image_alpha, 0, alphaSpd);
	
	//check player input
	if keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_any) {
		image_alpha = 0;
	}
	
	//check alpha
	if image_alpha <= 0 instance_destroy();
	
}