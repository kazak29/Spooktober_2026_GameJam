
// Enter key or Select button on controller
if (oInputManager.pressed.select) { instance_destroy(); }


// Scroll Up
if (oInputManager.held.up) { scrollOffset -= _scrollSpeed; }
if (mouse_wheel_up()) { scrollOffset -= scrollSpeed; }

// Scroll Down
if (oInputManager.held.down) { scrollOffset += _scrollSpeed; }
if (mouse_wheel_down()) { scrollOffset += scrollSpeed; }

scrollOffset = clamp(scrollOffset, 0, maxScrollLimit);
