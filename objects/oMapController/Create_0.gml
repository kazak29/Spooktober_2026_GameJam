AmbientChange(AMBIENT_MUSIC, bgmMapTheme);
num = 0;
mouseHover = false;

locs = [];
with global.dataMapLocations {
	other.locs = [home, bar, street, houseAcrossYard, houseAcrossFront, lamp];
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