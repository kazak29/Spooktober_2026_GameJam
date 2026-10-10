StateWait = function(){
	alpha = Approach(alpha,1,0.012);
	if alpha >= 1 {
		
		cd = Approach(cd, 0, 1);
		with oInputManager {
	
			if (mouse.pressed.any ||
				pressed.confirm ||
				pressed.cancel ||
				pressed.select ||
				pressed.pause)
			{ other.cd = 0; }
	
		}
		
		if cd <= 0 {
			TransitionStart(rmTitleScreen, sqFadeOut, sqFadeIn);
			state = StateLocked;
		}
		
	}
}

StateLocked = function(){
	//empty state
}

alpha = 0;
cd = game_get_speed(gamespeed_fps) * 3;
state = StateWait;