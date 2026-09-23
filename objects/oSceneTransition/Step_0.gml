switch state {
	case "Appear": {
		
		alpha = Approach(alpha, MAX_ALPHA, SCENE_FADE_SPEED);
	    if alpha >= MAX_ALPHA {
			
			with oDirector {
				
				SceneClear();
				if variable_instance_exists(id, "bgTarget") && bgTarget.active {
					bg = variable_clone(bgTarget);
					bgTarget.active = false;
				}
				
			}
			
			state = "Dissapear";
			
	    }
		
	} break;
	
	case "Dissapear": {
		
		alpha = Approach(alpha, MIN_ALPHA, SCENE_FADE_SPEED);
	    if alpha <= MIN_ALPHA {
			with oDirector {
				SceneStart(sceneTarget);
				sceneTarget = "";
			}
			
			instance_destroy();
		}
		
	} break;
}