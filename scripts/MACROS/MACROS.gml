#region Included Files

	#macro LINES_CSV "lines.csv"

	#macro FILE_ERROR -1

#endregion

#region Room

	#macro VIEWPORT_WIDTH  1920
	#macro VIEWPORT_HEIGHT 1080

	#macro MAX_LAYER_DEPTH -9999

	#macro SYSTEM_LAYER     "System"
	#macro BACKGROUND_LAYER "Background"
	#macro TRANSITION_LAYER "Transition"

#endregion

#region Input Manager

	#macro W_KEY ord("W")
	#macro A_KEY ord("A")
	#macro S_KEY ord("S")
	#macro D_KEY ord("D")

	#macro GAMEPAD_DISCONNECTED -1
	#macro SLOT_1                0
	#macro SLOT_11              11
	#macro ASYNC_LOAD_TYPE      async_load[? "type"]
	#macro ASYNC_LOAD_PAD       async_load[? "pad_index"]
	#macro GAMEPAD_DISCOVERED   "gamepad discovered"
	#macro GAMEPAD_LOST         "gamepad lost"
	#macro DEFAULT_DEADZONE     0.2

#endregion

#region Typist
	
	#macro TYPIST_SPEED      0.5
	#macro TYPIST_SMOOTHNESS 0
	
	#macro FONT_CONSOLE_16 "fConsol16"

#endregion

#region Screen Play

	#macro CHARACTER_FADE_SPEED 0.05

#endregion
