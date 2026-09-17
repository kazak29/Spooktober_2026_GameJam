
if (locationCount == 0) { exit; }

// Menu Navigation (W and S)
if (oInputManager.pressed.up) {
    selectedIndex = (selectedIndex - 1 + locationCount) % locationCount;
}
if (oInputManager.pressed.down) {
    selectedIndex = (selectedIndex + 1) % locationCount;
}

var _currentLoc = locationInstances[selectedIndex];
var _mouseClicked = position_meeting(mouse_x, mouse_y, _currentLoc) && mouse_check_button_pressed(mb_left);

if (_mouseClicked) {
    if (!_currentLoc.isLocked) {
        show_debug_message("Loading scene: " + string(_currentLoc.activeScene) + " for " + _currentLoc.locationName);
        // Add room change or scene transition here
    } else {
        show_debug_message(_currentLoc.locationName + " is locked!");
    }
}



