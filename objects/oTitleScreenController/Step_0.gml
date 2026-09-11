
if (oInputManager.pressed.up)
{
	menuIndex--;
    if (menuIndex < 0) { menuIndex = menuLength - 1; }
}

if (oInputManager.pressed.down)
{
	menuIndex++;
    if (menuIndex >= menuLength) { menuIndex = 0; }
}

if (oInputManager.pressed.confirm)
{
	switch (menuIndex)
	{
		case 0:   // Start Button
			show_debug_message("Start Selected");
			break;
			
		case 1:   // Credits Button
			show_debug_message("Credits Selected");
			break;
			
		default: break;
	}
}
