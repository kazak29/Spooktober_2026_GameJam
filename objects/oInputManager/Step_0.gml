
// Handle controller connect/connect
if (gamepad_id == GAMEPAD_DISCONNECTED)
{
    for (var _slot = SLOT_1; _slot <= SLOT_11; _slot++)
    {
        if (gamepad_is_connected(_slot))
        {
            gamepad_id = _slot;
            //show_debug_message("Gamepad Connected on slot "+string(_slot)+": "+gamepad_get_description(_slot));
            break;
        }
    }
}
else if (!gamepad_is_connected(gamepad_id))
{
    //show_debug_message("Gamepad Disconnected from slot "+string(gamepad_id));
    gamepad_id = GAMEPAD_DISCONNECTED;
    using_gamepad = false;   // Fall back to keyboard if disconnected
}

// Reset input states every frame
for (var _key = 0; _key < array_length(input_keys); _key++)
{
    var _key_name = input_keys[_key];
    pressed[$ _key_name]  = false;
    held[$ _key_name]     = false;
    released[$ _key_name] = false;
}

// Keyboard Input Checks
for (var _key = 0; _key < array_length(input_keys); _key++)
{
    var _key_name = input_keys[_key];
    var _keybinds = input[$ _key_name];
    
    // Index 0 is always your keyboard key in the struct setup
    var _bind = _keybinds[0]; 
    
    if (keyboard_check(_bind))          { held[$ _key_name] = true; }
    if (keyboard_check_pressed(_bind))  { pressed[$ _key_name] = true; using_gamepad = false; } // Switched to keyboard
    if (keyboard_check_released(_bind)) { released[$ _key_name] = true; }
}

// Gamepad Checks
if (gamepad_id >= SLOT_1)
{
    for (var _key = 0; _key < array_length(input_keys); _key++)
    {
        var _key_name = input_keys[_key];
        var _keybinds = input[$ _key_name];
        
        // Index 1 is always the gamepad button in the struct setup
        var _bind = _keybinds[1]; 
        
        if (gamepad_button_check(gamepad_id, _bind))          { held[$ _key_name] = true; }
        if (gamepad_button_check_pressed(gamepad_id, _bind))  { pressed[$ _key_name] = true; using_gamepad = true; } // Switched to gamepad!
        if (gamepad_button_check_released(gamepad_id, _bind)) { released[$ _key_name] = true; }
    }
    
    left_analog_x = gamepad_axis_value(gamepad_id, gp_axislh);
    left_analog_y = gamepad_axis_value(gamepad_id, gp_axislv);
    
    // If the player pushes the analog stick past the deadzone, switch to gamepad prompts
    if (abs(left_analog_x) > gamepad_deadzone || abs(left_analog_y) > gamepad_deadzone) 
    {
        using_gamepad = true;
    }
}
