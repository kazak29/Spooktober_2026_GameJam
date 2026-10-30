
state();

if returnPromptEnabled && (oInputManager.pressed.confirm || oInputManager.mouse.pressed.left)
{
	global.sceneToPlay = BEST_ENDING_CONTINUED;
	AmbientChange(AMBIENT_MUSIC, noone);
    TransitionStart(rmStage, sqFadeOut, sqFadeIn);
}
