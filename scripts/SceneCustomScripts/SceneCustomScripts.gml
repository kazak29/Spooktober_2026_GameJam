function SceneCustomScriptTest(){
	show_debug_message("it works!");
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
function Part1HouseAcrossFrontCheck(){
	if !global.dataMapLocations.houseAcrossFront.visited {
		global.dataMapLocations.houseAcrossFront.scene = "houseAcross_Day1_Visit1_Candy";
	}
}