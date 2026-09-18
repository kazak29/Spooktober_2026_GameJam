
if (currentSceneId != noone)
{
	DrawSceneBackground();
	
	DrawCharacterPortraits();
	
	if (directorState == DirectorStateLineSequence ||
    directorState == DirectorStateChoice)
	{ DrawDialogueBox(); }
	
	 DrawMainCharacterPortrait();
}
