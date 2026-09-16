event_inherited();
sprite_index = sSliderLine;
image_alpha = 1;

if !instance_exists(oMenu) exit;
var _type = oMenu.menuType;
switch _type {
	case MENU_TYPE_PAUSE: {
		image_xscale = 0.5;
		image_yscale = 0.5;
	} break;
}


//right most position
draw_set_font(asset_get_index(strFont));
percentX = x + sprite_width*1.2;
borderRight = x + sprite_width*1.2 + string_width($"100%");// + 24*(image_xscale+image_yscale)/2;