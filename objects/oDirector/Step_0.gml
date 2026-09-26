if global.gamePaused || global.midTransition || instance_exists(oSceneTransition) exit;
UpdateCharacterPortraits();
directorState();

//reveal textbox
if (directorState == DirectorStateLineSequence ||
	directorState == DirectorStateChoice)
{
	textbox.alpha = Approach(textbox.alpha, 1, textbox.alphaSpd);
	if typist.get_paused() && textbox.alpha >= 1 typist.unpause();
}