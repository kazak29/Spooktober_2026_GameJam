
function LoadUI ()
{
	var _filename = UI_CSV;
	var _uiData = {};
	
	var _grid = load_csv(_filename);
    if (_grid == FILE_ERROR)
    {
        show_debug_message("ERROR: Could not load " + string(_filename));
        return _uiData;
    }
	
	// Convert the grid to a struct
    var _gridHeight = ds_grid_height(_grid);
    for (var _row = 1; _row < _gridHeight; _row++)
    {
        var _key  = _grid[# 0, _row];
        var _text = _grid[# 1, _row];
        if (_key == "") continue;
        _uiData[$ _key] = _text;
    }
    
    ds_grid_destroy(_grid);
	return _uiData;
}
