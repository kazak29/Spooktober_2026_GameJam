function uiButtonSettings(){
	
	var _menuPresent = false;
	with oMenu {
		_menuPresent = true;
		instance_destroy();
		with oMenuElement instance_destroy();
	}
	if !_menuPresent instance_create_layer(0,0, SYSTEM_LAYER, oMenu, {menuType: MENU_TYPE_PAUSE});
	
}