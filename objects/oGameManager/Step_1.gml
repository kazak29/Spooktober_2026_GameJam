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
	
	if keyboard_check_pressed(ord("1")) global.flags.candy_quest_complete = false;
	if keyboard_check_pressed(ord("2")) global.flags.candy_quest_complete = true;
	if keyboard_check_pressed(ord("3")) global.flags.candy_quest_fail = false;
	if keyboard_check_pressed(ord("4")) global.flags.candy_quest_fail = true;
	
	if keyboard_check_pressed(ord("V")) {
		var _names = struct_get_names(global.dataMapLocations);
		for (var i = 0; i < array_length(_names); i++) {
			if _names[i] != "home" global.dataMapLocations[$ _names[i]].visited = true;
		}
	}
	
	if keyboard_check_pressed(ord("Q")) {
		global.dataMapLocations.home.scene = "p1HomeQuest";
		with oDirector { LineProgress(); }
	}
	
	if keyboard_check_pressed(ord("P")) {
		ChapterProgress();
		MapDataUpdatePart2();
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