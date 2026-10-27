hoverResetCd = Approach(hoverResetCd, 0, 1);
if hoverResetCd <= 0 {
	image_index = 0;
	titleCol = COL_UI_BUTTON_DEFAULT;
}


// Update the UI toggle button
if (instance_exists(oDirector)) {
	if scr == uiButtonToggleUI {
		title = (oDirector.uiToggled) ? $"{global.uiData.buttonHideUI}" : $"{global.uiData.buttonShowUI}";
		title = title+$"\n{global.uiData.toggleUiInputs}";
	}
}
scribId = scribble(title, "button").starting_format(titleFont, c_white).align(fa_center, fa_middle);
