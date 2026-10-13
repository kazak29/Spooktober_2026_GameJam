function Save(_data, _fileName){
	var _string = json_stringify(_data);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _fileName);
	buffer_delete(_buffer);

	show_debug_message("Data saved! " + _string);
}

function Load(_fileName){
	var _data = undefined;
	
	if !file_exists(_fileName) {
		show_debug_message("Buffer file not found bruhnius momentius");
		return _data;
	}
	
	var _buffer = buffer_load(_fileName);
	if (_buffer < 0) {
		show_debug_message($"Buffer load fail (returns {_buffer})");
		buffer_delete(_buffer);
		return _data;
	}
	
	//old HTML bug disables file_exists, causing buffer_load to return 0 regardless if file actually exists
	//idk if gx.games has same bug or if they fixed it yet or what, playing it safe just in case
	try {
		
		var _string = buffer_read(_buffer, buffer_string);
		_data = json_parse(_string);
		
		show_debug_message("Data loaded! " + _string);
		
	} catch(_exception) {
		
		_data = undefined;
		show_debug_message(_exception.message);
		show_debug_message(_exception.longMessage);
		
	}
	
	buffer_delete(_buffer);
	return _data;
}

//should be run in draw event before menu drawing
function SaveSurface(_fileName, _w = SURF_SAVE_W, _h = SURF_SAVE_H){
	var _surface = surface_create(_w,_h);
	
	surface_set_target(_surface);
	draw_clear_alpha(c_white,0);
	draw_surface_stretched(application_surface, 0,0, _w,_h);
	surface_reset_target();
	
    var _buffer = buffer_create(_w*_h*4,buffer_fixed,1);
	buffer_get_surface(_buffer, _surface, 0);
	buffer_save(_buffer, _fileName);
	surface_free(_surface);
    buffer_delete(_buffer);
	
	show_debug_message("Surface saved!");
}
//retuns a sprite from surface
function LoadSurface(_fileName, _w = SURF_SAVE_W, _h = SURF_SAVE_H){
	var _data = undefined;
	var _surface = surface_create(_w,_h);
	
	if !file_exists(_fileName) {
		show_debug_message("Buffer file not found bruhnius momentius");
		return _data;
	}
	
	var _buffer = buffer_load(_fileName);
	if (_buffer < 0) {
		show_debug_message($"Buffer load fail (returns {_buffer})");
		buffer_delete(_buffer);
		return _data;
	}
	
	try {
		
		buffer_set_surface(_buffer, _surface, 0);
		_data = sprite_create_from_surface(_surface, 0,0, _w,_h, false,false, 0,0);
		
		show_debug_message("Surface loaded!");
		
	} catch(_exception) {
		
		_data = undefined;
		show_debug_message(_exception.message);
		show_debug_message(_exception.longMessage);
		
	}
	
	surface_free(_surface);
	buffer_delete(_buffer);
	return _data;
}

function SaveSettings(){
	var _data = {
		vol:	global.volume,
		crt:	global.crt,
	};
	
	Save(_data, "settings.save");
}
function LoadSettings(){
	var _data = Load("settings.save");
	if !is_struct(_data) {
		SaveSettings();
		exit;
	}
	
	global.volume = _data.vol;
	global.crt = _data.crt;
}

function SaveGame(_fileName){
	var _data = {
		dateTime:	$"{current_day}.{current_month}.{current_year} - {current_hour}:{current_minute}:{current_second}",
		title:		global.uiData.saveMap,
		room:		room,
		
		ambient:				global.ambient,
		lastLocationBackground: global.lastLocationBackground,
		textLog:				global.textLog,
		dataMapLocations:		global.dataMapLocations,
		flags:					global.flags,
		chapter:				global.chapter,
	};
	
	with oDirector {
		
		#region make title for save/load button
		
			//empty line
			var _line = { title: "", text: ""};
			
			//pull last entry from text log
			if is_array(_data.textLog) && (array_length(_data.textLog) > 0) {
				_line = array_last(_data.textLog);
			}
			
			//pull current line if not a command
			var _curLineData = currentLineSequence[currentLineIndex];
			if _curLineData.lineTitle != "" {
				_line = { title: _curLineData.lineTitle, text: _curLineData.lineText };
				_line.title = TitleMacrosCheck(_line.title);
			}
			
			//combine title and text
			_data.title = string_concat(
				(_line.title == "") ? "" : $"{_line.title}: ",
				_line.text
			);
			
		#endregion
		
		_data.currentSceneName		=	currentSceneName;
		_data.sceneTarget			=	sceneTarget;
			
		_data.currentLineSequence	=	currentLineSequence;
		_data.currentLineIndex		=	currentLineIndex;
			
		_data.previousSpeaker		=	previousSpeaker;
		_data.stageCharacters		=	stageCharacters;
		_data.mainCharacter			=	mainCharacter;
		_data.spookUp				=	spookUp;
			
		_data.choice				=	choice;
		_data.bg					=	bg;
		_data.bgTarget				=	bgTarget;
		
	}
	
	Save(_data, _fileName);
}