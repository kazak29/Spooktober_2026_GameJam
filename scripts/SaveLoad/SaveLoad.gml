function SaveSettings(){
	
	var _saveData = {
		
		//volume.music:		global.volume.music,
		//volume.sound:		global.volume.sound,	
		//volume.writer:	global.volume.writer,
		
	}

	// turn data into JSON string and save it via buffer
	var _string = json_stringify(_saveData);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, "settings.save");
	buffer_delete(_buffer);

	show_debug_message("Settings saved!" + _string);
	
}

function LoadSettings(){
	
	if (file_exists("settings.save")) {
		
		var _buffer = buffer_load("settings.save");
		if (_buffer != -1) {
			
			try {
				
				var _string = buffer_read(_buffer, buffer_string);
				var _loadData = json_parse(_string);
				
				//SetVolumeMusic(_loadData.musicVolume);
				//SetVolumeSound(_loadData.soundVolume);
				
				show_debug_message("Settings loaded!" + _string);
				
			} catch(_exception) {
				
				//create a save file
				SaveSettings();
				
				//show messages
				show_debug_message(_exception.message);
				show_debug_message(_exception.longMessage);
				
			}
		
		} else show_debug_message("Buffer load fail (returns -1)");
		buffer_delete(_buffer);
		
	} else show_debug_message("Settings file not found bruhnius momentius.");
	
}
