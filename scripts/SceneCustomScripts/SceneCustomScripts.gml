function ChapterProgress(){
	global.chapter++;
}

function Part1ClearCheck(){
	var _locs = global.dataMapLocations;
	var _names = struct_get_names(_locs);
	
	for (var i = 0; i < array_length(_names); i++) {
		if (_names[i] != "home" && !_locs[$ _names[i]].visited) {
			return false;
		}
	}
	return true;
}

function MapDataUpdatePart2(){
	var _locs = global.dataMapLocations;
	var _names = struct_get_names(_locs);
	
	for (var i = 0; i < array_length(_names); i++) {
		with _locs[$ _names[i]] {
			visited = false;
			locked = false;
		}
	}
	
	var _barScene = global.flags.candy_quest_complete ? "p2BarCandy1" : "p2BarNoCandy1";
	with _locs {
		home.scene		= "p2Home1";
		bar.scene		= _barScene;
		street.scene	= "testScene1";
		yard.scene		= "testScene1";
		front.scene		= "testScene1";
		lamp.scene		= "testScene1";
	}
}