
if (currentSceneId != noone) { DrawMainCharacterPortrait(); }

if (directorState == DirectorStateLineSequence) { DrawDialogueBox(); }

if (fadeAlpha > MIN_ALPHA)
{
    draw_set_color(c_black);
    draw_set_alpha(fadeAlpha);
    draw_rectangle(0, 0, VIEWPORT_WIDTH, VIEWPORT_HEIGHT, false);
    draw_set_alpha(MAX_ALPHA);
    draw_set_color(c_white);
}
