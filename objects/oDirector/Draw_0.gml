
if (currentSceneId != noone) { DrawSceneBackground(); }

DrawCharacterPortraits();

// Textbox for lines
if (directorState == DirectorStateLineSequence ||
    directorState == DirectorStateChoice)
	{ DrawDialogueBox(); }

// Main Character is drawn on the GUI
if (currentSceneId != noone) { DrawMainCharacterPortrait(); }
