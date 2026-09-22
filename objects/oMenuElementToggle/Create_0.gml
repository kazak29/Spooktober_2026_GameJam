event_inherited();

var _text = global.uiData.menuOff;
if side _text = global.uiData.menuOn;
scribId = scribble(_text, "toggle").starting_format(strFont, c_white).align(fa_left, fa_middle);
strX = x;
strY = y;

//move from first toggle if no sprite
if instance_exists(oMenu) {
	var _spr = oMenu.menuPages[$ oMenu.pageName].spr;
	if !is_struct(_spr) && side {
		
		var _shift = scribble(global.uiData.menuOff, "toggle").get_width()*1.8;
		x += _shift;
		strX += _shift;
		
	}
}