//struct of arrays of structs
menuPages = {
	main: [
		{
			title:		global.uiData.menuButtonStart,
			elemType:	MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
			scr:		MenuTransitionStart,
			args:		[rmStage, sqFadeOut, sqFadeIn],
		},
		//settings page
		{
			title:		global.uiData.menuButtonSettings,
			elemType:	MENU_ELEMENT_TYPE.PAGE_TRANSFER,
			pageName:	"settings",
		},
		//credits
		{
			title:		global.uiData.menuButtonCredits,
			elemType:	MENU_ELEMENT_TYPE.SCRIPT_RUNNER,
			scr:		MenuTransitionStart,
			args:		[rmCredits, sqFadeOut, sqFadeIn],
		},
	],
	//settings page
	settings: [
		//back to main page
		{
			title:		global.uiData.menuButtonBack,
			elemType:	MENU_ELEMENT_TYPE.PAGE_TRANSFER,
			pageName:	"main",
		},
	],
};
pageName = "main";
pageOption = 0;			// <--- button being hovered
inputting = false;


drawX = VIEWPORT_WIDTH / 2;
drawStartY = VIEWPORT_HEIGHT / 2;
ySpacing = 120;
