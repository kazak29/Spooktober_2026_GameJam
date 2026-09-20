
// Scroll Up
if (oInputManager.held.up) { scrollOffset -= scrollSpeed; }
if (mouse_wheel_up()) { scrollOffset -= scrollSpeed; }

// Scroll Down
if (oInputManager.held.down) { scrollOffset += scrollSpeed; }
if (mouse_wheel_down()) { scrollOffset += scrollSpeed; }

scrollOffset = clamp(scrollOffset, 0, maxScrollLimit);
