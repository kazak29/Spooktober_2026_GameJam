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

function Part2MapDataUpdate(){
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
		street.scene	= "p2Street1";
		yard.scene		= "testScene1";
		front.scene		= "p2Front1";
		lamp.scene		= "testScene1";
	}
}

function Part2Street1ChoiceCheck(){
	
	var _scene = "";
	var _a = global.flags.streetQuestionAnimal;
	var _d = global.flags.streetQuestionDoing;
	var _s = global.flags.streetQuestionStray;
	
	if !_a && !_d && !_s	_scene = "p2Street1ChoiceFull";
	if !_a && !_d && _s		_scene = "p2Street1ChoiceAD";
	if !_a && _d && !_s		_scene = "p2Street1ChoiceAS";
	if _a && !_d && !_s		_scene = "p2Street1ChoiceDS";
	
	if _a && _d && !_s		_scene = "p2Street1StrayIntro";
	if _a && !_d && _s		_scene = "p2Street1DoingIntro";
	if !_a && _d && _s		_scene = "p2Street1AnimalIntro";
	
	if _a && _d && _s		_scene = "p2Street1Party";
	
	SceneStart(_scene);
	
}