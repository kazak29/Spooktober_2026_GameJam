if global.midTransition || global.gamePaused exit;

switch state {
	case "Appear": {
		
		alpha = Approach(alpha, MAX_ALPHA, SCENE_FADE_SPEED);
	    if alpha >= MAX_ALPHA {
			
			with oDirector {
				
				//update background
				if variable_instance_exists(id, "bgTarget") && bgTarget.active {
					bg = variable_clone(bgTarget);
					bgTarget.active = false;
				}
				
				//clear scene
				if other.clear SceneClear();
				
				//start new scene
				if other.nextScene {
					SceneStart(sceneTarget);
					sceneTarget = "";
				} else {
					LineProgress();
				}
				
			}
			
			state = "Dissapear";
			
	    }
		
	} break;
	
	case "Dissapear": {
		
		alpha = Approach(alpha, MIN_ALPHA, SCENE_FADE_SPEED);
	    if alpha <= MIN_ALPHA instance_destroy();
		
	} break;
}