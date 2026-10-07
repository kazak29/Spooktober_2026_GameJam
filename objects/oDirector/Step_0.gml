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

//zalgo animation
if sprite_exists(zalgo.sprInd) && zalgo.cdMax >= 0 {
	with zalgo {
		cd = Approach(cd,0,1);
		if cd <= 0 {
			for (var i = 0; i < array_length(frames); i++) {
				frames[i] = irandom(sprite_get_number(sprInd) - 1);
			}
			cd = cdMax;
		}
	}
}