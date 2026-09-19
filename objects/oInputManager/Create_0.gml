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
	
	confirm: [ vk_space,  gp_face1],				// A on XBox, X on Playstation
	cancel:  [ vk_escape, gp_face2],				// B on XBox, Circle on Playstation
	
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


#region mouse
	mouseKeys = {
		mbL: mb_left,
		mbR: mb_right,
		mbM: mb_middle,
		mbA: mb_any,
	};
	mouseKeyNames = struct_get_names(mouseKeys);
	
	mouse = {
		active: false,
		x: mouse_x,
		y: mouse_y,
		pressed:	{},
		held:		{},
		released:	{},
	};

	MouseHoverRectangle = function(_x1,_y1,_x2,_y2, _fresh = true){
		if _fresh && !mouse.active return false;
		return point_in_rectangle(mouse.x,mouse.y, _x1,_y1,_x2,_y2);
	}
	MouseHoverCircle = function(_x,_y,_rad, _fresh = true){
		if _fresh && !mouse.active return false;
		return point_in_circle(mouse.x,mouse.y, _x,_y,_rad);
	}
	MouseHoverObjectBool = function(_id, _fresh = true){
		if _fresh && !mouse.active return false;
		return position_meeting(mouse.x,mouse.y, _id);
	}
	MouseHoverObjectId = function(_id, _fresh = true){
		if _fresh && !mouse.active return noone;
		return instance_position(mouse.x,mouse.y, _id);
	}
#endregion

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
	for (var i = 0; i < array_length(mouseKeyNames); i++) {
		var _keyName = mouseKeyNames[i];
		mouse.pressed[$ _keyName]	= false;
		mouse.held[$ _keyName]		= false;
		mouse.released[$ _keyName]	= false;
	}
}