
function LoadLineData ()
{
	var _filename = LINES_CSV;
	var _lineData = {};
	
	// Load CSV to Grid
	var _grid = load_csv(_filename);
	if (_grid == FILE_ERROR)
	{
		show_debug_message("ERROR: Could not load "+string(_filename));
		return _lineData;
	}
	
	// Convert the grid to a struct
	var _gridWidth  = ds_grid_width(_grid);
	var _gridHeight = ds_grid_height(_grid);
	for (var _row = 1; _row < _gridHeight; _row++)
	{
		// NOTE: Check the CSV file for which column is which field
		var _sequenceId = _grid[# 0, _row];
        var _lineTitle = _grid[# 1, _row];
        var _lineText  = _grid[# 2, _row];
		
		if (_sequenceId == "") continue;   // Skip empty lines
		
		// If the sequence ID does not yet exist in the struct, add it
		if (!struct_exists(_lineData, _sequenceId)) {
			_lineData[$ _sequenceId] = [];
        }
		
		var _lineEntry = {
			lineTitle: _lineTitle,
			lineText:  _lineText
		};
		array_push(_lineData[$ _sequenceId], _lineEntry);
	}
	
	ds_grid_destroy(_grid);
	return _lineData;
}
