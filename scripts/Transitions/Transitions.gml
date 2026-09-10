
function TransitionPlaceSequence (_type)
{
	if (layer_exists(TRANSITION_LAYER)) { layer_destroy(TRANSITION_LAYER); }
	var _layer = layer_create(MAX_LAYER_DEPTH, TRANSITION_LAYER);
	layer_sequence_create(_layer, 0, 0, _type);
}

function TransitionStart (_roomTarget, _typeOut, _typeIn)
{
	if (!global.midTransition)
	{
		global.midTransition = true;
		global.roomTarget = _roomTarget;
		TransitionPlaceSequence(_typeOut);
		layer_set_target_room(_roomTarget);
		TransitionPlaceSequence(_typeIn);
		layer_reset_target_room();
		return true;
	}
	return false;
}

function TransitionChangeRoom ()
{
	room_goto(global.roomTarget);
}

function TransitionFinished ()
{
	layer_sequence_destroy(self.elementID);
	global.midTransition = false;
}



// SCENE TRANSITION *************************************************************************************

function SceneTransitionIn (_typeIn)
{
	if (layer_exists(TRANSITION_LAYER)) { layer_destroy(TRANSITION_LAYER); }
    
    var _layer = layer_create(MAX_LAYER_DEPTH, TRANSITION_LAYER);
    global.midTransition = true;
    
    layer_sequence_create(_layer, 0, 0, _typeIn);
}



