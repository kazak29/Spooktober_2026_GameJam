
AmbientChange(AMBIENT_MUSIC, sndMapTheme);



marginRight = 10;
marginTop = 10;
boxWidth = 100;
boxHeight = 30;

selectedIndex = 0;

locations = LoadMapLocations();
locationCount = array_length(locations);

buttonX = VIEWPORT_WIDTH - 600;


for (var _i = 0; _i < locationCount; _i++)
{
    var _locationData = locations[_i];
    
    // Run script evaluation once at creation if a script exists
    //if (_inst.sceneSelectionScript != noone && script_exists(_inst.sceneSelectionScript))
    //{
    //    var _sceneIndex = script_execute(_inst.sceneSelectionScript);
        
        // Clamp bounds safety check
    //    if (_sceneIndex >= 0 && _sceneIndex < array_length(_inst.scenes)) {
    //        _inst.activeScene = _inst.scenes[_sceneIndex];
    //    } else {
    //        _inst.activeScene = _inst.scenes[0];
    //    }
    //}
    //else if (array_length(_inst.scenes) > 0)
    //{
    //    _inst.activeScene = _inst.scenes[0]; // Default fallback
    //}
    
}