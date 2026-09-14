event_inherited();
sprite_index = sSliderLine;
image_alpha = 1;

//change length
if sliderLength > 0 {
	image_xscale = sliderLength/sprite_get_width(sprite_index);
	image_yscale = 1;
}