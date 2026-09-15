function PauseActivate(){
	global.gamePaused = true;
	audio_pause_all();
	with all {
		//pause animattions just in case?
		gamePausedImageSpeed = image_speed;
		image_speed = 0;
	}
	
	with oDirector {
		directorStatePrev = directorState;
		directorState = DirectorStateIdle;
	}
	
	instance_create_layer(0,0, SYSTEM_LAYER, oMenu, {menuType: MENU_TYPE_PAUSE});
}

function PauseDeactivate(){
	global.gamePaused = false;
	audio_resume_all();
	with all {
		//resume all animation
		if variable_instance_exists(id,"gamePausedImageSpeed")	image_speed = gamePausedImageSpeed;
	}
	
	with oDirector {
		directorState = directorStatePrev;
	}
	
	with oMenu instance_destroy();
	with oMenuElement instance_destroy();
}