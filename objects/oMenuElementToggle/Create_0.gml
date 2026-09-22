event_inherited();

//setup distance multiplier
if !instance_exists(oMenu) exit;
var _type = oMenu.menuType;
var _spr = oMenu.menuPages[$ oMenu.pageName].spr;
switch _type {
	
	case MENU_TYPE_TITLE: {
		distMult = is_struct(_spr) ? 2 : 1.8;
	} break;
	case MENU_TYPE_PAUSE: {
		distMult = is_struct(_spr) ? 1.8 : 1.8;
	} break;
}

var _text = global.uiData.menuOff;
if side _text = global.uiData.menuOn;
scribId = scribble(_text, "toggle").starting_format(strFont, c_white).align(fa_left, fa_middle);
strX = x;
strY = y;

//move from first toggle if no sprite
if !is_struct(_spr) && side {
		
	var _shift = scribble(global.uiData.menuOff, "toggle").get_width()*distMult;
	x += _shift;
	strX += _shift;
		
}