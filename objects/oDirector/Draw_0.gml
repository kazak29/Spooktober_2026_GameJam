
if (currentSceneId != noone)
{
	DrawSceneBackground();
	
	DrawCharacterPortraits();
	
	if (directorState == DirectorStateLineSequence ||
    directorState == DirectorStateChoice)
	{ DrawDialogueBox(); }
	
	DrawMainCharacterPortrait();
}
if (directorState == DirectorStateChoice) { DrawChoices(); }


if (instance_exists(oTextLog))
{
	DrawTextlog();
}


// Fade between scenes
if (fadeAlpha > MIN_ALPHA)
{
    draw_set_color(c_black);
    draw_set_alpha(fadeAlpha);
    draw_rectangle(0, 0, VIEWPORT_WIDTH, VIEWPORT_HEIGHT, false);
    draw_set_alpha(MAX_ALPHA);
    draw_set_color(c_white);
}


if global.showDebugUI {
	draw_text(room_width/2, room_height/2, $"state: {directorState}");
}
