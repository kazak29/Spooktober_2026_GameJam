
state();

if returnPromptEnabled && (oInputManager.pressed.confirm || oInputManager.mouse.pressed.left)
{
	global.sceneToPlay = BEST_ENDING_CONTINUED;
    TransitionStart(rmStage, sqFadeOut, sqFadeIn);
}
