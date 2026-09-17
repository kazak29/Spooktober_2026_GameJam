
// Hovering with mouse updates controller index
if (position_meeting(mouse_x, mouse_y, id)) {
    oMapController.selectedIndex = myIndex;
}

// Frame State Control: Frame 2 = Locked, Frame 1 = Selected, Frame 0 = Unselected
if (isLocked) {
    image_index = 2;
} else if (oMapController.selectedIndex == myIndex) {
    image_index = 1;
} else {
    image_index = 0;
}
