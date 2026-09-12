image_speed = 0;
image_index = 0;

#region create sub elements

	if !instance_exists(oMenu) exit;
	var _page = oMenu.menuPages[$ oMenu.pageName];
	var _elem = _page.elements[elementNum];
	var _type = _elem.elemType;

	switch _type {
	
		case MENU_ELEMENT_TYPE.SHIFT: {
			
		} break;
		case MENU_ELEMENT_TYPE.SLIDER: {
			
		} break;
		case MENU_ELEMENT_TYPE.TOGGLE: {
			
		} break;
	
	}
	
#endregion