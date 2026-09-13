switch elemSubtype {
	
	case MENU_ELEMENT_SUBTYPE.TOGGLE_OFF: {
		scribId = scribble(global.uiData.menuOff).starting_format(FONT_CONSOLE_24, c_white).align(fa_left, fa_middle);
		
		strX = x;
		strY = y;
		MenuSubElementUpdateGeneralPosition(scribId, sprite_index);
	} break;
	case MENU_ELEMENT_SUBTYPE.TOGGLE_ON: {
		scribId = scribble(global.uiData.menuOn).starting_format(FONT_CONSOLE_24, c_white).align(fa_left, fa_middle);
		
		strX = x;
		strY = y;
		MenuSubElementUpdateGeneralPosition(scribId, sprite_index);
	} break;
	
}