
if (locationCount == 0) { exit; }


//if (oInputManager.pressed.select && !instance_exists(oMenu))
//{
//	if (!instance_exists(oTextLog)) { global.textLogInst = instance_create_layer(0, 0, SYSTEM_LAYER, oTextLog); }
//	else { instance_destroy(global.textLogInst); }
//}

// Prevent navigation if the log or the menu are up
if (instance_exists(oTextLog) || instance_exists(oMenu)) { exit; }



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
