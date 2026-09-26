AmbientChange(AMBIENT_MUSIC, bgmMapTheme, 100, true, 2500, 1500);
num = 0;
mouseHover = false;

locs = [];
with global.dataMapLocations {
	other.locs = [home, houseAcrossYard, houseAcrossFront, lamp, bar, street];
}

locCheck = function(_num){
	if is_string(locs[_num].scene) && !locs[_num].locked return true;
	return false;
}

numProgress = function(_amount){
	num += _amount;
	if (num > array_length(locs) - 1)	{ num = 0;						}
	if (num < 0)						{ num = array_length(locs) - 1;	}
}