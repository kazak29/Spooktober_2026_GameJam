/**
 * README: To detect inputs, use the input map. They are all booleans.
 * 
 * EX: oInputManager.pressed.up
 */

input = {
	// WASD, gamepad directional buttons
	up:    [ W_KEY, gp_padu ],
	down:  [ S_KEY, gp_padd ],
	left:  [ A_KEY, gp_padl ],
	right: [ D_KEY, gp_padr ],
	
	confirm: [ vk_space,  gp_face1 ],  // A on XBox, X on Playstation
	cancel:  [ vk_escape, gp_face2 ],  // B on XBox, Circle on Playstation
	
	select: [ vk_enter, gp_select ],   // Select button
	pause: [ vk_escape, gp_start ],    // Start button
};
input_keys = variable_struct_get_names(input);

// Left analog stick
left_analog_x = 0;
left_analog_y = 0;



gamepad_id = GAMEPAD_DISCONNECTED;
gamepad_deadzone = DEFAULT_DEADZONE;
using_gamepad = false;



// Input States (Updated every frame)
pressed  = {};
held     = {};
released = {};

for (var _key = 0; _key < array_length(input_keys); _key++)
{
    var _name = input_keys[_key];
    pressed[$ _name]  = false;
    held[$ _name]     = false;
    released[$ _name] = false;
}
