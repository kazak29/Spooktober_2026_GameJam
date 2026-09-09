var _optCount = array_length(options);
if (_optCount == 0) exit;

var _guiMouseX = device_mouse_x_to_gui(0);
var _guiMouseY = device_mouse_y_to_gui(0);

// Mouse hover detection
for (var _i = 0; _i < _optCount; _i++) {
    var _itemY = y + (_i * spacing);
    
    var _left   = x - (itemWidth / 2);
    var _right  = x + (itemWidth / 2);
    var _top    = _itemY - (itemHeight / 2);
    var _bottom = _itemY + (itemHeight / 2);
    
    if (_guiMouseX >= _left && _guiMouseX <= _right && _guiMouseY >= _top && _guiMouseY <= _bottom) {
        if (_guiMouseX != prevMouseX || _guiMouseY != prevMouseY) {
            selectedIndex = _i;
        }
    }
}

prevMouseX = _guiMouseX;
prevMouseY = _guiMouseY;


// Keyboard input
var _upPressed = instance_exoInputManager.pressed.up;
var _downPressed = instance_exists(oInputManager) ? oInputManager.pressed.down : keyboard_check_pressed(vk_down);

if (_upPressed)   selectedIndex = (selectedIndex - 1 + _optCount) % _optCount;
if (_downPressed) selectedIndex = (selectedIndex + 1) % _optCount;

// Option confirmation
var _keyboardConfirm = instance_exists(oInputManager) ? oInputManager.pressed.confirm : keyboard_check_pressed(vk_space);
var _mouseConfirm    = mouse_check_button_pressed(mb_left);

var _selectedY = y + (selectedIndex * spacing);
var _hoveredSelected = (_guiMouseX >= x - (itemWidth / 2) &&
                        _guiMouseX <= x + (itemWidth / 2) &&
                        _guiMouseY >= _selectedY - (itemHeight / 2) &&
                        _guiMouseY <= _selectedY + (itemHeight / 2));

if (_keyboardConfirm || (_mouseConfirm && _hoveredSelected)) {
    var _selected = options[selectedIndex];
    
    if (variable_struct_exists(_selected, "scr") && script_exists(_selected.scr)) {
        var _args = _selected[$ "args"] ?? [];
        script_execute_ext(_selected.scr, _args);
    }
    
    if (instance_exists(global.tbId)) {
        with (global.tbId) textboxState = TextboxStateDestroy;
    }
    
    DirectorSceneProgress();
    instance_destroy();
}