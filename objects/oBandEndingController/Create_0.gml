AmbientChange(AMBIENT_MUSIC, bgmBand, DEFAULT_VOLUME_PERCENT, false, 0);

returnPrompt = $"Press {global.uiData.endingProceedInputs} to Continue";
returnPromptEnabled = false;

StateWait = function(){
	cd = Approach(cd, 0, 1);
	if cd <= 0 {
		returnPromptEnabled = true;
		state = StateLocked;
	}
}

StateLocked = function(){
	//empty state
}

cd = game_get_speed(gamespeed_fps) * 8;
state = StateWait;


drawX = VIEWPORT_WIDTH / 2;
drawY = VIEWPORT_HEIGHT - 60;
