if global.midTransition || global.gamePaused exit;
mouseHover = false;
var _locsL = array_length(locs);
var _sfx = "";


var _numUpdate = function(_amount){
	numProgress(_amount);
	while !locCheck(num) numProgress(_amount);
}

//discreet navigation
var _pressV = oInputManager.pressed.down - oInputManager.pressed.up;
var _pressH = oInputManager.pressed.right - oInputManager.pressed.left;
if _pressV != 0 || _pressH != 0 {
	_numUpdate(_pressV);
	_numUpdate(_pressH);
	_sfx = "hover";
}

//mouse hover
for (var i = 0; i < _locsL; i++) {
	with locs[i] {
		if other.locCheck(i) && oInputManager.MouseHoverRectangle(x1,y1,x2,y2) {
			if (other.num != i) _sfx = "hover";
			other.num = i;
			other.mouseHover = true;
		}
	}
	if mouseHover break;
}

//inputs
var _pressed = oInputManager.pressed.confirm  || (oInputManager.mouse.pressed.left && mouseHover);
if _pressed {
	
	var _scene = locs[num].scene;
	//_scene = string_split(_scene,","); add choices here maybe probably someday later
	
	AddToTextLog({ title: "Location Selected", text: locs[num].title });
	AmbientChange(AMBIENT_MUSIC, noone);
	
	global.sceneToPlay = _scene;
	TransitionStart(rmStage, sqFadeOut, sqFadeIn);
	
	//auto visited flag update (do we need it?)
	locs[num].visited = true;
	
	_sfx = "click";
}
		
switch _sfx {
	case "hover": uiSfxPlayHover(); break;
	case "click": uiSfxPlayClick(); break;
}
