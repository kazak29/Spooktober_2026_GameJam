#region scene
	
	function SceneClear(){
		with oDirector {
			lineSkip = false;
			BackgroundReset();
			stageCharacters = [];
    
		    // Reset main character
		    mainCharacter.alpha = MIN_ALPHA;
		    mainCharacter.targetAlpha = MIN_ALPHA;
		    mainCharacter.yOffset = 0;
		    mainCharacter.yVelocity = 0;
		    mainCharacter.blend = c_white;
	
			spookUp = false;
    
		    previousSpeaker = "";
		}
	}
	
	function SceneStart(_name){
		with oDirector {
			SceneClear();
			
			currentLineSequence = global.lineData[$ _name] ?? [];
	        currentLineIndex = 0;
	        LineSet();
		}
	}
	
	// START A SCENE (SET IN LINES TO JUMP TO NEXT SCENE)
	scribble_typists_add_event("sc_start", function(_element, _param_array, _character_index) {
		SceneStart(_param_array[0]);
	});
	
	// START A SCENE + TRANSITION ANIMATION
	scribble_typists_add_event("sc_start_trans", function(_element, _param_array, _character_index) {
		
	});
	
	// SKIP A LINE ON COMMAND
	scribble_typists_add_event("sc_line_skip", function(_element, _param_array, _character_index) {
		with oDirector LineProgress();
	});
	
	// DELAY (SECONDS)
	scribble_typists_add_event("sc_delay", function(_element, _param_array, _character_index)
	{
		var _delay = real(_param_array[0]);
		with oDirector {
			delayTimer = _delay * game_get_speed(gamespeed_fps);
            directorState = DirectorStateDelay;
		}
	});
	
	// SPRITE, FRAME, ALPHA, COLOUR
	scribble_typists_add_event("sc_bg", function(_element, _param_array, _character_index)
	{
		
	});
	
	// CHAR NAME, SPRITE, FRAME
	scribble_typists_add_event("sc_char_in", function(_element, _param_array, _character_index) {
		
	});
	
	// CHAR NAME, SPRITE
	scribble_typists_add_event("sc_char_out", function(_element, _param_array, _character_index)
	{
		
	});
	
	scribble_typists_add_event("sc_main_char_in", function(_element, _param_array, _character_index)
	{
		
	});
	
	scribble_typists_add_event("sc_main_char_out", function(_element, _param_array, _character_index)
	{
		
	});
	
	scribble_typists_add_event("sc_char_update", function(_element, _param_array, _character_index)
	{
		
	});
	
	scribble_typists_add_event("sc_choice", function(_element, _param_array, _character_index)
	{
		
	});
	
	scribble_typists_add_event("sc_condition", function(_element, _param_array, _character_index)
	{
		
	});
	
	scribble_typists_add_event("sc_music", function(_element, _param_array, _character_index)
	{
		
	});
	
#endregion

#region sound
	
	// MUSIC, VOLUME
	scribble_typists_add_event("music", function(_element, _param_array, _character_index)
	{
		
	});
	
	// SOUND, VOLUME, LOOP
	scribble_typists_add_event("sound", function(_element, _param_array, _character_index)
	{
		var _snd_input = _param_array[0];
		var _snd = is_string(_snd_input) ? asset_get_index(_snd_input) : _snd_input;
		var _volPercent = (array_length(_param_array) > 1) ? real(_param_array[1]) : 100;
		var _looping = (array_length(_param_array) > 2) ? (_param_array[2] == "true" || _param_array[2] == "1") : false;
		SoundPlay(_snd, _volPercent, _looping);
	});
	
	
	// VOLUME - IS A % OF GLOBAL GAIN VARIABLE, FROM 0 TO 500, APPLIED ON PLAY
	scribble_typists_add_event("tw_sfx_vol", function(_element, _param_array)
	{
		with oDirector {
			var _vol = clamp(real(_param_array[0]), 0, 500);
		
			typewriterSound.vol = _vol;
			TypewriterSoundPlay();
		}
	});
	
	// PITCH MIN, PITCH MAX, - DEFAULT PITCH IS 1, BELOW IS SLOWER, ABOVE IS FASTER
	scribble_typists_add_event("tw_sfx_pitch", function(_element, _param_array)
	{
		with oDirector {
			typewriterSound.pitchMin = real(_param_array[0]);
			typewriterSound.pitchMax = real(_param_array[1]);
			TypewriterSoundPlay();
		}
	});
	
	//OVERLAP - DEFAULT IS 15-30ms
	scribble_typists_add_event("tw_sfx_overlap", function(_element, _param_array)
	{
		with oDirector {
			typewriterSound.overlap = real(_param_array[0]);
			TypewriterSoundPlay();
		}
	});

#endregion