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
	if (_buffer == -1) {
		show_debug_message("Buffer load fail (returns -1)");
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
		room: room,
		
		ambient:				global.ambient,
		
		lastLocationBackground: global.lastLocationBackground,
		textLog:				global.textLog,
		
		dataMapLocations:		global.dataMapLocations,
		flags:					global.flags,
		
		chapter:				global.chapter,
	};
	
	with oDirector {
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
	
	with _data {
		dateTime = $"{current_day}.{current_month}.{current_year} - {current_hour}:{current_minute}";
		logLast = noone;
		if is_array(textLog) && (array_length(textLog) > 0) {
			logLast = array_last(textLog);
		}
	}
	
	Save(_data, _fileName);
}