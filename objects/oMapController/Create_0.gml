
selectedIndex = 0;

locations = LoadMapLocations();
locationCount = array_length(locations);

// Array to hold the created instance references
locationInstances = [];

buttonX = VIEWPORT_WIDTH - 600;


for (var _i = 0; _i < locationCount; _i++)
{
    var _locationData = locations[_i];
    
    // Spawn instance at specified coordinates
    var _inst = instance_create_layer(_locationData.mapX, _locationData.mapY, LOCATIONS_LAYER, oMapLocation);
    
    // Pass properties from struct to instance
    _inst.locationName = _locationData.locationName;
    _inst.scenes = _locationData.scenes;
    _inst.sceneSelectionScript = _locationData.sceneSelectionScript;
    _inst.isLocked = _locationData.isLocked;
    _inst.myIndex = _i;
    
    // Run script evaluation once at creation if a script exists
    if (_inst.sceneSelectionScript != noone && script_exists(_inst.sceneSelectionScript))
    {
        var _sceneIndex = script_execute(_inst.sceneSelectionScript);
        
        // Clamp bounds safety check
        if (_sceneIndex >= 0 && _sceneIndex < array_length(_inst.scenes)) {
            _inst.activeScene = _inst.scenes[_sceneIndex];
        } else {
            _inst.activeScene = _inst.scenes[0];
        }
    }
    else if (array_length(_inst.scenes) > 0)
    {
        _inst.activeScene = _inst.scenes[0]; // Default fallback
    }
    
    array_push(locationInstances, _inst);
}