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
	
	var _barScene = global.flags.questCandyComplete ? "p2BarCandy1" : "p2BarNoCandy1";
	with _locs {
		home.scene		= "p2Home1";
		bar.scene		= _barScene;
		street.scene	= "p2Street1";
		yard.scene		= "p2Yard1";
		front.scene		= "p2Front1";
		lamp.scene		= "p2Lamp1";
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

function EndingCheck(){
	var _scene = "endStay";
	var _candy = global.flags.questCandyComplete;
	var _princess = global.flags.questPrincessComplete;
					
	if !_candy	&& !_princess	_scene = "endPartyBad";
	if _candy	&& !_princess	_scene = "endPartyOkay";
	if _candy	&& _princess	_scene = "endPartyAmazing";
					
	SceneTransitionNext(_scene); 
}

function HamsterGhostCreate(){
	instance_destroy(oHamsterGhost);
	instance_create_layer(0,0, SYSTEM_LAYER, oHamsterGhost);
}
function HamsterGhostDestroy(){
	with oHamsterGhost state = StateDisappear;
}