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
	
	confirm: [ vk_space,  gp_face1, mb_left ],		// A on XBox, X on Playstation
	cancel:  [ vk_escape, gp_face2, mb_right ],		// B on XBox, Circle on Playstation
	
	select: [ vk_enter, gp_select ],				// Select button
	pause: [ vk_escape, gp_start ],					// Start button
};
input_keys = variable_struct_get_names(input);

// Left analog stick
left_analog_x = 0;
left_analog_y = 0;



gamepad_id = GAMEPAD_DISCONNECTED;
gamepad_deadzone = DEFAULT_DEADZONE;
using_gamepad = false;


//mouse
mouseX = mouse_x;
mouseY = mouse_y;
using_mouse = false;

MouseHoverRectangle = function(_x1,_y1,_x2,_y2){
	if using_mouse && point_in_rectangle(mouseX,mouseY, _x1,_y1,_x2,_y2) {
		return true;
	}
	return false;
}
MouseHoverCircle = function(_x,_y,_rad){
	if using_mouse && point_in_circle(mouseX,mouseY, _x,_y,_rad) {
		return true;
	}
	return false;
}
MouseHoverObject = function(_id){
	if using_mouse && instance_position(mouseX,mouseY, _id) {
		return true;
	}
	return false;
}


// Input States (Updated every frame)
pressed  = {};
held     = {};
released = {};

//Reset input states
InputReset = function(){
	for (var _key = 0; _key < array_length(input_keys); _key++)
	{
	    var _key_name = input_keys[_key];
	    pressed[$ _key_name]	= false;
	    held[$ _key_name]		= false;
	    released[$ _key_name]	= false;
	}
}