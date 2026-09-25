event_inherited();
sprite_index = sSliderLine;
image_alpha = 1;

if !instance_exists(oMenu) exit;
var _type = oMenu.menuType;
switch _type {
	case MENU_TYPE_PAUSE: {
		image_xscale = 0.5;
		if !is_struct( oMenu.menuPages[$ oMenu.pageName].spr ) {
			image_yscale = 0.5;
		}
	} break;
}


//right most position
draw_set_font(asset_get_index(strFont));
percentShift = 64*image_xscale;

//hover zone
hoverShift = {
	left:	32*image_xscale,
	right:	32*image_xscale + percentShift + string_width($"-100%"),
	top:	24*image_yscale,
	bottom: 24*image_yscale,
};