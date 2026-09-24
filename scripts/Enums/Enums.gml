#region scenes

	enum SCENE_TRANS_TYPE {
		BACKGROUND,		//background change
		CLEAR,			//background change + clear
		NEXT,			//background change + clear + scene change
	}
	
#endregion

#region menu

	enum MENU_ELEMENT_TYPE {
		SCRIPT_RUNNER,
		PAGE_TRANSFER,
		SLIDER,
		SHIFT,
		TOGGLE,
	
		HEIGHT
	}

	enum MENU_LAYOUT {
		TITLE_MAIN,
		TITLE_SETTINGS,
	
		PAUSE_TOP,
		PAUSE_MIDDLE,
		PAUSE_BOTTOM,
	
		CHOICE,
	
		HEIGHT
	}

	enum MENU_SLIDER_STYLE {
		UNMODIFIED,
		PERC_BAR,
		PERC_SCALE,
		PERC_SCALE_TEN,
		PERC_SCALE_HUNDRED,
		PERC_SCALE_ROUNDED,
	
		HEIGHT
	}
	
#endregion