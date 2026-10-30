
state();

if returnPromptEnabled && (oInputManager.pressed.confirm || oInputManager.mouse.pressed.left)
{
	if (room == rmStayInEnding) { TransitionStart(rmCredits, sqFadeOut, sqFadeIn); }
	else { TransitionStart(rmCiko, sqFadeOut, sqFadeIn); }
}
