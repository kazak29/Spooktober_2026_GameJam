function uiButtonSettings(){
	
	var _menuPresent = false;
	with oMenu {
		_menuPresent = true;
		instance_destroy();
		with oMenuElement instance_destroy();
	}
	if !_menuPresent instance_create_layer(0,0, SYSTEM_LAYER, oMenu, {menuType: MENU_TYPE_PAUSE});
	
	//always close text log
	with global.textLogInst instance_destroy();
	
}

function uiButtonTextLog(){
	
	if (instance_exists(oTextLog)) { instance_destroy(global.textLogInst); }
	else { global.textLogInst = instance_create_layer(0, 0, SYSTEM_LAYER, oTextLog); }
	
}