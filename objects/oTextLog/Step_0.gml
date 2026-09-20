
if (oInputManager.pressed.select) { instance_destroy(); }



if (oInputManager.held.up) { scrollOffset -= _scrollSpeed; }
if (mouse_wheel_up()) { scrollOffset -= scrollSpeed; }


