///@desc save element - surface saving and appearance update

//from menu element
if is_struct(saveElemUpdating) {
	var _data = saveElemUpdating;
	var _fileName = SaveSurfGetName(_data.arg[0]);
	
	SaveSurface(_fileName);
	MenuUpdateSave(_data);
	
	saveElemUpdating = undefined;
}

//from autosave
if is_real(saveElemUpdating) {
	SaveSurface(SaveSurfGetName(saveElemUpdating));
	saveElemUpdating = undefined;
}