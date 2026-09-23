#region sound
	
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