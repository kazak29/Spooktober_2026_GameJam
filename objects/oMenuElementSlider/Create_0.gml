event_inherited();
sprite_index = sSliderLine;
image_alpha = 1;

if !instance_exists(oMenu) exit;
var _page = oMenu.menuPages[$ oMenu.pageName];
switch _page.layout {
	case MENU_LAYOUT.PAUSE: {
		image_xscale = 0.5;
		image_yscale = 0.5;
	} break;
}