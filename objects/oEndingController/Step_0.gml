
state();

if returnPromptEnabled && (oInputManager.pressed.confirm || oInputManager.mouse.pressed.left)
{
    TransitionStart(rmCredits, sqFadeOut, sqFadeIn);
}
