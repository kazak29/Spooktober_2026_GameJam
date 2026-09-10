/*
function TextboxStateAnimation(){
	//forget it for now	
}



function TextboxStateDestroy(){
	//just remove textbox
	instance_destroy();
}



function TextboxStateDialogue(){
    
    // Block dialogue advance if choices are currently active
    if (instance_exists(oChoiceMenu)) exit;

    if (oInputManager.pressed.confirm || mouse_check_button_pressed(mb_left)) {
        
        if (typist.get_state() >= 1) { LineSequenceProgress(); }
		else {
            if (typist.get_position() > 2) typist.skip();
        }
    }
}
*/