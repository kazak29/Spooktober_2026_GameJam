
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
	
	
	
	
	
	
	
}
