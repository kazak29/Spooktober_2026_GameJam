
// The ACTUAL screenplay whenever we are ready
function LoadScreenPlay ()
{
    var _screenPlay = {};
	
	var _chunks = [
		GetEmptyScene(),
		GetIntroScenes()
		// Locations
		// Ending
	];
	
	var _chunkCount = array_length(_chunks);
    for (var _i = 0; _i < _chunkCount; _i++)
    {
        var _chunk = _chunks[_i];
        var _keys = struct_get_names(_chunk);
        var _keyCount = array_length(_keys);
        
        for (var _key = 0; _key < _keyCount; _key++)
        {
            var _sceneKey = _keys[_key];
            _screenPlay[$ _sceneKey] = _chunk[$ _sceneKey];
        }
    }
	
	return _screenPlay;
}
