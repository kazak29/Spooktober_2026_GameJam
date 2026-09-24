
function AddToTextLog (_dataToAdd = {})
{
	
	//check for title macros
	if struct_exists(_dataToAdd, "title") {
		_dataToAdd.title = TitleMacrosCheck(_dataToAdd.title);
	}
	
	array_push(global.textLog, _dataToAdd);
	if (array_length(global.textLog) > MAX_TEXTLOG_CAPACITY) { array_delete(global.textLog, 0, 1); }
}


function ClearTextLog()
{
	if (array_length(global.textLog) != 0) {
		array_delete(global.textLog, 0, MAX_TEXTLOG_CAPACITY);
	}
}
