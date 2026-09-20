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

	#macro MAX_LAYER_DEPTH		-9999
	#macro MENU_ELEMENT_DEPTH	-9998
	#macro MENU_DEPTH			-9997
	#macro UI_BUTTON_DEPTH		-9996

	#macro SYSTEM_LAYER     "System"
	#macro BACKGROUND_LAYER "Background"
	#macro TRANSITION_LAYER "Transition"
	#macro CHOICES_LAYER    "Choices"
	#macro LOCATIONS_LAYER  "Locations"

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
	
	#macro FONT_DIALOGUE_TEXT_TITLE "fDialogueTextTitle"
	#macro FONT_DIALOGUE_TEXT_BODY  "fDialogueTextBody"
	
#endregion
#region Characters
	
	#macro SPOOK       "Spook"
	#macro SHAY        "Shay"
	#macro UNKNOWN     "???"
	#macro SCREWDRIVER "Screwdriver"
	
#endregion
#region Screen Play
	
	#macro FIRST_SCENE "introScene1"
	
	#macro MAX_TEXTLOG_CAPACITY 100
	
	#macro SPOOK_PORTRAIT_Y_OFFSET 35
	
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
	
	#macro COL_MENU_OPTION_DEFAULT		c_white
	#macro COL_MENU_OPTION_SELECTED		c_yellow
	#macro COL_MENU_OPTION_HOVER		c_orange
	#macro COL_MENU_OPTION_DISABLED		c_dkgray
	
	#macro COL_UI_BUTTON_DEFAULT		c_white
	#macro COL_UI_BUTTON_HOVER			c_orange
	
#endregion
#region menu
	
	#macro MENU_TYPE_TITLE	"menuTitle"
	#macro MENU_TYPE_PAUSE	"menuPause"
	
	#macro MENU_BUFFER_X	64
	#macro MENU_BUFFER_Y	80
	
	#macro MENU_PAUSE_X	1536
	#macro MENU_PAUSE_Y	864
	
#endregion