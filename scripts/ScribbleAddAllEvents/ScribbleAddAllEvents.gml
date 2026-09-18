
function ScribbleAddAllEvents ()
{
	scribble_typists_add_event("play_sound", function(_element, _param_array)
	{
		var _snd_input = _param_array[0];
		var _snd = is_string(_snd_input) ? asset_get_index(_snd_input) : _snd_input;
		var _volPercent = (array_length(_param_array) > 1) ? real(_param_array[1]) : 100;
		var _looping = (array_length(_param_array) > 2) ? (_param_array[2] == "true" || _param_array[2] == "1") : false;
		SoundPlay(_snd, _volPercent, _looping);
	});
	
	
	// VOLUME IS % OF GLOBAL GAIN VARIABLE, from 0 to 500
	scribble_typists_add_event("typewriter_vol", function(_element, _param_array)
	{
		with oDirector {
			var _vol = _param_array[0];
			_vol = clamp(_vol, 0, 500);
		
			typewriterSound.vol = (global.volTypeWriter * _vol) / 100;
			TypewriterSoundPlay();
		}
		
	});
	
	//DEFAULT PITCH IS 1, BELOW IS SLOWER, ABOVE IS FASTER
	scribble_typists_add_event("typewriter_pitch", function(_element, _param_array)
	{
		with oDirector {
			typewriterSound.pitchMin = _param_array[0];
			typewriterSound.pitchMax = _param_array[1];
			TypewriterSoundPlay();
		}
		
	});
	
}
