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
				
				//perform specific tasks
				switch other.transType {
					default:						{ LineProgress();											} break;
					case SCENE_TRANS_TYPE.CLEAR:	{ SceneClear();	LineProgress();								} break;
					case SCENE_TRANS_TYPE.NEXT:		{ SceneClear(); SceneStart(sceneTarget); sceneTarget = "";	} break;
				}
				
			}
			
			state = "Dissapear";
			
	    }
		
	} break;
	
	case "Dissapear": {
		
		alpha = Approach(alpha, MIN_ALPHA, SCENE_FADE_SPEED);
	    if alpha <= MIN_ALPHA {
			
			instance_destroy();
		}
		
	} break;
}