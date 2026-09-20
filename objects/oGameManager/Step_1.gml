///@desc all UI interactions must happen before director state machine

//input cheatcode
if (keyboard_lastchar == "b") keyboard_string = keyboard_lastchar;
if (keyboard_string == global.cheatcode) {
	global.cheat = !global.cheat;
	keyboard_string = "";
}

if global.cheat {
	
	if keyboard_check_pressed(vk_tab) global.showDebugUI = !global.showDebugUI;
	if keyboard_check_pressed(ord("C")) global.crtActive = !global.crtActive;
	
}

//ui buttons
var _but = noone;
with oButton {
	var _exceptionMenu = instance_exists(oMenu) && scr != uiButtonSettings;
	
	if active && uiMouseCollision(id) && !_exceptionMenu {
		_but = id;
		break;
	}
}

with _but {
	var _sfxData = [noone, 0];
	if hoverResetCd <= 0 _sfxData = [sfxUIClick, 100];
	
	image_index = 1;
	titleCol = COL_UI_BUTTON_HOVER;
	hoverResetCd = 5;
	
	if oInputManager.mouse.pressed.left {
		oInputManager.mouse.pressed.left = false;	//locks director from progressing with mouse
		
		if script_exists(scr) scr();
		_sfxData = [sfxUIClick, 100];
	}
	if audio_exists(_sfxData[0]) SoundPlay(_sfxData[0], _sfxData[1]);
}