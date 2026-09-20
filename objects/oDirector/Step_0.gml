
UpdateCharacterPortraits();

directorState();

//if (oInputManager.pressed.select && !instance_exists(oMenu))
//{
//	if (instance_exists(oTextLog)) { instance_destroy(global.textLogInst); }
//	else { global.textLogInst = instance_create_layer(0, 0, SYSTEM_LAYER, oTextLog); }
//}


if global.cheat {
	if keyboard_check_pressed(vk_f1) AdvanceNode();
}