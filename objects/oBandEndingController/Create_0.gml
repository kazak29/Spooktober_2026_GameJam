AmbientChange(AMBIENT_MUSIC, bgmBand, DEFAULT_VOLUME_PERCENT, false, 0);

returnPrompt = $"Press {global.uiData.endingProceedInputs} to Skip";
returnPromptEnabled = false;

StateWait = function(){
	cd = Approach(cd, 0, 1);
	if cd <= 0 {
		returnPromptEnabled = true;
		state = StateLocked;
	}
}

StateLocked = function(){
	//empty state
}

cd = game_get_speed(gamespeed_fps) * 10;
state = StateWait;

drawX = VIEWPORT_WIDTH / 2;
drawY = VIEWPORT_HEIGHT - 60;

lyrics = [
	"[delay,3200]Hal-[delay,1000]lo-[delay,500]ween![delay,3000]",
	"Trick or treat [delay,400]til [delay,300]sun [delay,300]is [delay,300]dawn[delay,400]ing[delay,7000]",
	"Au[delay,1000]tumn [delay,300]leaves[delay,2800]",
	"Fell the trees, [delay,400]the [delay,300]creeps [delay,300]go [delay,300]haunt[delay,300]in'[delay,5000]",
	"Oh-[delay,800]oh[delay,700]",
	"Boo [delay,800]scare![delay,2500]",
	"Don't [delay,700]go in [delay,700]there![delay,900]",
	"I sense [delay,200]a [delay,400]jump[delay,700]scare![delay,2400]",
	"Don't [delay,700]go in [delay,600]there![delay,400]",
	"The [delay,300]creeps [delay,300]go [delay,300]wandering, [delay,400]ghouls [delay,250]and [delay,250]beasts[delay,300]",
	"On [delay,300]Hal-[delay,300]lo-[delay,250]ween![delay,3600]",
	"Critters [delay,300]go [delay,250]loose [delay,250]on [delay,250]streets[delay,300]",
	"On [delay,300]Hal-[delay,300]lo-[delay,250]ween![delay,3000]",
	"At [delay,300]Fog[delay,600]gy [delay,600]Hal[delay,600]low[delay,1500]",
	"Spook-[delay,1000]y [delay,500]spree[delay,3000]",
	"Stole the treats from rich dog princess",
	//"Made friends",
	//"Got the band all back together again",
	//"Oh-oh",
	//"Boo, scare!",
	//"Don't go in there!",
	//"The creeps go wandering, ghouls and beasts",
	//"On Hal-lo-ween!",
	//"The band of critters",
	//"Get loose on streets",
	//"On Hal-lo-ween!",
	//"The creeps go wandering, ghouls and beasts",
	//"On Hal-lo-ween",
	//"The band of critters",
	//"Get loose on streets",
	//"On Hal-lo-ween!",
	//"Oh I don't care",
	//"I'll just stay here",
	//"With ghostly dreams",
	//"Foggy Hallow",
	//"...",
	//"Thank you so much! Have a wonderful night!"
];

currentLine = 0;

songTypist = scribble_typist().in(TYPIST_SPEED, TYPIST_SMOOTHNESS);

// LINK THE TYPIST HERE USING .in(songTypist)
scribbleElement = scribble(lyrics[currentLine]);
scribbleElement.starting_format("fBandLyrics", c_white);
scribbleElement.align(fa_center, fa_top);

lyricsX = VIEWPORT_WIDTH / 2;
lyricsY = VIEWPORT_HEIGHT - 250;
