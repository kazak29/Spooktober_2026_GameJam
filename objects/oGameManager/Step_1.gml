///@desc all UI interactions must happen before director state machine

//input cheatcode
if (keyboard_lastchar == "b") keyboard_string = keyboard_lastchar;
if (keyboard_string == global.cheatcode) {
	global.cheat = !global.cheat;
	keyboard_string = "";
}

if global.cheat {
	
	if keyboard_check_pressed(vk_tab) global.showDebugUI = !global.showDebugUI;
	if keyboard_check_pressed(ord("C")) global.crt.active = !global.crt.active;
	if keyboard_check_pressed(ord("M")) { global.volMusic = 0; VolumeUpdateAmbient(); }
	if keyboard_check_pressed(ord("R")) game_restart();
	
	if keyboard_check_pressed(ord("1")) global.flags.questCandyStart = !global.flags.questCandyStart;
	if keyboard_check_pressed(ord("2")) global.flags.questCandyComplete = !global.flags.questCandyComplete;
	if keyboard_check_pressed(ord("3")) global.flags.questCandyFail = !global.flags.questCandyFail;
	if keyboard_check_pressed(ord("4")) global.flags.questPrincessStart = !global.flags.questPrincessStart;
	if keyboard_check_pressed(ord("5")) global.flags.questPrincessComplete = !global.flags.questPrincessComplete;
	if keyboard_check_pressed(ord("6")) global.flags.questPrincessFail = !global.flags.questPrincessFail;
	if keyboard_check_pressed(ord("7")) global.flags.metHamster = !global.flags.metHamster;
	if keyboard_check_pressed(ord("8")) global.flags.metPrincess = !global.flags.metPrincess;
	if keyboard_check_pressed(ord("9")) global.flags.gotKnight = !global.flags.gotKnight;
	if keyboard_check_pressed(ord("0")) global.flags.knowLimes = !global.flags.knowLimes;
	
	if keyboard_check_pressed(ord("V")) {
		var _names = struct_get_names(global.dataMapLocations);
		for (var i = 0; i < array_length(_names); i++) {
			if _names[i] != "home" global.dataMapLocations[$ _names[i]].visited = true;
		}
	}
	
	if keyboard_check_pressed(ord("Q")) {
		global.dataMapLocations.home.scene = "p1HomeQuest";
	}
	
	if keyboard_check_pressed(ord("P")) {
		ChapterProgress();
		Part2MapDataUpdate();
		SceneToMap();
	}
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