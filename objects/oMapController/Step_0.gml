
if (locationCount == 0) { exit; }

// Menu Navigation
if (oInputManager.pressed.up) {
    selectedIndex = (selectedIndex - 1 + locationCount) % locationCount;
}
if (oInputManager.pressed.down) {
    selectedIndex = (selectedIndex + 1) % locationCount;
}

var _currentLoc = locationInstances[selectedIndex];

var _mouseClicked = position_meeting(mouse_x, mouse_y, _currentLoc) && mouse_check_button_pressed(mb_left);
var _confirmed = oInputManager.pressed.confirm || _mouseClicked;

if (_confirmed) {
    if (!_currentLoc.isLocked) {
		// Textlog: Add location selected to the log
		AddToTextLog({ title: "Location Selected", text: _currentLoc.locationName });
		//show_debug_message(string(global.textLog));
        //show_debug_message("Loading scene: " + string(_currentLoc.activeScene) + " for " + _currentLoc.locationName);
        
		global.sceneToPlay = _currentLoc.activeScene;
		TransitionStart(rmStage, sqFadeOut, sqFadeIn);
    } else {
        show_debug_message(_currentLoc.locationName + " is locked!");
    }
}
