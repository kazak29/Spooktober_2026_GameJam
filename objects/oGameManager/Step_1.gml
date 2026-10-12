///@desc all UI interactions must happen before director state machine

//input cheatcode
if (keyboard_lastchar == "b") keyboard_string = keyboard_lastchar;
if (keyboard_string == global.cheatcode) {
	global.cheat = !global.cheat;
	keyboard_string = "";
}

if global.cheat {
	
	if keyboard_check_pressed(vk_tab) {
		global.showDebugUI = !global.showDebugUI;
	}
	if keyboard_check_pressed(vk_lcontrol) {
		with global.textLogInst instance_destroy();
		with oMenu instance_destroy();
		with oMenuElement instance_destroy();
		
		if room == rmTitleScreen {
			if (os_type == os_gxgames) MenuCreate("titleMain"); else MenuCreate("titleMainWin");
		}
		
		if global.gamePaused {
			global.gamePaused = false;
			with oDirector typist.unpause();
		} else {
			global.gamePaused = true;
			with oDirector typist.pause();
		
			MenuCreate("cheat");
		}
	}
	
	if keyboard_check_pressed(ord("C")) global.crt.active = !global.crt.active;
	if keyboard_check_pressed(ord("M")) { global.volume.music = 0; VolumeUpdateAmbient(); }
	if keyboard_check_pressed(ord("R")) game_restart();
	
	if keyboard_check_pressed(ord("1")) MenuGameSave(["save0"]);
	if keyboard_check_pressed(ord("2")) MenuGameLoad(["save0", sqFadeOut, sqFadeIn]);
}

//ui buttons
var _but = noone;
with oButton {
	if active && uiMouseCollision(id) {
		_but = id;
		break;
	}
}

with _but {
	var _sfx = "none";
	if hoverResetCd <= 0 _sfx = "hover";
	
	image_index = 1;
	titleCol = COL_UI_BUTTON_HOVER;
	hoverResetCd = 5;
	
	if oInputManager.mouse.pressed.left {
		oInputManager.mouse.pressed.left = false;	//locks director from progressing with mouse
		
		if script_exists(scr) scr();
		_sfx = "click";
	}
	
	switch _sfx {
		case "hover": uiSfxPlayHover(); break;
		case "click": uiSfxPlayClick(); break;
	}
}