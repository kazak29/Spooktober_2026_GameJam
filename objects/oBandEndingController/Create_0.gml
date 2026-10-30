AmbientChange(AMBIENT_MUSIC, bgmBand, DEFAULT_VOLUME_PERCENT, false, 0);

returnPrompt = $"Press {global.uiData.endingProceedInputs} to Continue";
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

cd = game_get_speed(gamespeed_fps) * 8;
state = StateWait;

drawX = VIEWPORT_WIDTH / 2;
drawY = VIEWPORT_HEIGHT - 60;

lyrics = [
	"Hal-lo-ween",
	"Trick or treat til sun is dawning",
	"Autumn leaves",
	"Fell the trees, the creeps go hauntin'",
	"Oh-oh",
	"Boo scare!",
	"Don't go in there!",
	"I sense a jumpscare!",
	"Don't go in there!",
	"The creeps go wandering, ghouls and beasts",
	"On Hal-lo-ween",
	"Critters go loose on streets",
	"On Hal-lo-ween",
	"At Foggy Hallow",
	"Spooky spree",
	"Stole the treats from rich dog princess",
	"Made friends",
	"Got the band all back together again",
	"Oh-oh",
	"Boo, scare!",
	"Don't go in there!",
	"The creeps go wandering, ghouls and beasts",
	"On Hal-lo-ween",
	"The band of critters",
	"Get loose on streets",
	"On Hal-lo-ween",
	"The creeps go wandering, ghouls and beasts",
	"On Hal-lo-ween",
	"The band of critters",
	"Get loose on streets",
	"On Hal-lo-ween",
	"Oh I don't care",
	"I'll just stay here",
	"With ghostly dreams",
	"Foggy Hallow",
	"...",
	"Thank you so much! Have a wonderful night!"
];

currentLine = 0;

songTypist = scribble_typist().in(TYPIST_SPEED, TYPIST_SMOOTHNESS);

// LINK THE TYPIST HERE USING .in(songTypist)
scribbleElement = scribble(lyrics[currentLine]);
scribbleElement.starting_format("fBandLyrics", c_white);
scribbleElement.align(fa_center, fa_top);

lyricsX = VIEWPORT_WIDTH / 2;
lyricsY = VIEWPORT_HEIGHT - 250;
