
state();

if returnPromptEnabled && (oInputManager.pressed.pause || oInputManager.mouse.pressed.left)
{
    TransitionStart(rmCredits, sqFadeOut, sqFadeIn);
}
