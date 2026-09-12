#region Included Files

	#macro LINES_CSV "lines.csv"
	#macro UI_CSV    "ui.csv"
	#macro FILE_ERROR -1

#endregion
#region General

	#macro MIN_ALPHA 0
	#macro MAX_ALPHA 1
	
#endregion
#region Music / SFX

	#macro AMBIENT_MUSIC "ambientMusic"
	
	#macro DEFAULT_VOLUME_PERCENT 60

#endregion
#region Room

	#macro VIEWPORT_WIDTH  1920
	#macro VIEWPORT_HEIGHT 1080

	#macro MAX_LAYER_DEPTH -9999

	#macro SYSTEM_LAYER     "System"
	#macro BACKGROUND_LAYER "Background"
	#macro TRANSITION_LAYER "Transition"
	#macro CHOICES_LAYER    "Choices"

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
	#macro FONT_CONSOLE_24 "fConsol24"

#endregion
#region Screen Play
	
	#macro SCENE_FADE_SPEED 0.03
	
	#macro CHARACTER_FADE_SPEED    0.05
	#macro CHARACTER_BOUNCE_HEIGHT   -6
	#macro CHARACTER_BOUNCE_SPEED   0.5
	
	#macro DEFAULT_NODE_DELAY 0.5
	
	#macro MAX_STAGE_CHARACTERS 3
	
	#macro CHOICE_Y_SPACING 100
	
	#macro DELAY        "delay"
	#macro SPRITE       "sprite"
	#macro CHARACTERS   "characters"
	#macro CHARACTER_ID "charId"
	
#endregion

#region colors
	
	#macro COL_MENU_OPTION_DEFAULT	c_white
	#macro COL_MENU_OPTION_SELECTED c_yellow
	#macro COL_MENU_OPTION_DISABLED c_dkgray
	
#endregion