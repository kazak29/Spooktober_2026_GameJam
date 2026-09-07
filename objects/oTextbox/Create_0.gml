//set scale and alpha
image_xscale	= tbW/sprite_width;
image_yscale	= tbH/sprite_height;
image_alpha		= 0;
		
//calculate maximum string width for line
textW = floor((bbox_right - bbox_left) - 32);
		
//state machine
textboxState = TextboxStateFadeIn;
textboxPrev = noone;

//scribble typist
typist = scribble_typist();
typist.in(textSpd,textSmooth);

//setup font name for scribble
if !is_string(textFont) {
	textFont = font_get_name(textFont);
}