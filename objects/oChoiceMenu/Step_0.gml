
if (optionCount <= 0) exit;

// Keyboard / Gamepad Navigation
if (oInputManager.pressed.up) {
    selectedIndex--;
    if (selectedIndex < 0) selectedIndex = optionCount - 1;
}

if (oInputManager.pressed.down) {
    selectedIndex++;
    if (selectedIndex >= optionCount) selectedIndex = 0;
}

// Mouse hover
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

for (var _i = 0; _i < optionCount; _i++) {
    var _bx1 = startX;
    var _by1 = startY + _i * (btnHeight + btnSpacing);
    var _bx2 = _bx1 + btnWidth;
    var _by2 = _by1 + btnHeight;
    
    if (_mx >= _bx1 && _mx <= _bx2 && _my >= _by1 && _my <= _by2) {
        selectedIndex = _i;
        break;
    }
}

// Confirm
var _mouseClicked = mouse_check_button_pressed(mb_left);
var _hoveredSelected = (_mx >= startX && _mx <= startX + btnWidth && 
                        _my >= startY + selectedIndex * (btnHeight + btnSpacing) && 
                        _my <= startY + selectedIndex * (btnHeight + btnSpacing) + btnHeight);

if (oInputManager.pressed.confirm || (_mouseClicked && _hoveredSelected)) {
    
    var _chosenOption = options[selectedIndex];
    
    // Execute callback script if assigned
    if (_chosenOption.scr != noone && script_exists(_chosenOption.scr)) {
        script_execute_ext(_chosenOption.scr, _chosenOption.args);
    }
    
    // Clean up menu and advance screenplay
    instance_destroy();
    DirectorSceneProgress();
}
