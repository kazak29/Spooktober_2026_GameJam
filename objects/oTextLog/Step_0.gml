
// Scroll Up
if (oInputManager.held.up) { scrollOffset -= scrollSpeed; }
if (mouse_wheel_up()) { scrollOffset -= scrollSpeed; }

// Scroll Down
if (oInputManager.held.down) { scrollOffset += scrollSpeed; }
if (mouse_wheel_down()) { scrollOffset += scrollSpeed; }

scrollOffset = clamp(scrollOffset, 0, maxScrollLimit);


//exit menu if pressed on empty space
if (oInputManager.mouse.pressed.any &&
	!oInputManager.MouseHoverRectangle(windowX,windowY,windowX+windowWidth,windowY+windowHeight) &&
	room != rmTitleScreen)
{
	uiSfxPlayClick();
	uiButtonTextLog();
	with oInputManager InputReset();
	exit;
}