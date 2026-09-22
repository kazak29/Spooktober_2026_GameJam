function uiMouseCollision(_id){
	with _id {
		if sprite_exists(sprite_index) {
			return oInputManager.MouseHoverObjectId(id);
		} else {
			if !variable_instance_exists(id, "scribId") return noone;
			
			var _bbox = scribId.get_bbox(strX,strY);
			if oInputManager.MouseHoverRectangle(_bbox.x0, _bbox.y0, _bbox.x3, _bbox.y3) return id;
		}
		return noone;
	}
}

//make object position centered in the center of its string
function uiElementPositionUpdate(){
	var _offsetX = 0;
	var _offsetY = 0;
	
	var _spr = sprite_index;
	if sprite_exists(sprite_index) {
	
		_offsetX = sprite_xoffset - sprite_width/2;
		_offsetY = sprite_yoffset - sprite_height/2;
	
	}

	var _bbox = scribId.get_bbox(strX,strY);
	x = _bbox.left + _bbox.width/2 + _offsetX;
	y = _bbox.top + _bbox.height/2 + _offsetY;
}

//apply sprite to a menu element
function uiElementSpriteUpdate(_sprStruct, _strW, _strH){
	var _spr = _sprStruct;
	
	//add buffer between sprite and string borders
	_strW += _spr.bufferStrX*2;
	_strH += _spr.bufferStrY*2;
	
	//limit scaling so nineslice don't crop sprite when size too small
	var _nine = sprite_get_nineslice(_spr.ind);
	if _nine.enabled {
		_strW = max(_strW, _nine.left + _nine.right + 1);
		_strH = max(_strH, _nine.top + _nine.bottom + 1);
	}
			
	//setup scale
	var _scaleX = _strW/sprite_get_width(_spr.ind);
	var _scaleY = _strH/sprite_get_height(_spr.ind);
	
	//update params
	sprite_index = _spr.ind;
	image_xscale = _scaleX;
	image_yscale = _scaleY;
	
}

//play ui sfx (why did I even bother)
function uiSfxPlayHover(){
	
	if global.uiSfxActive audio_sound_pitch(SoundPlay(sfxUI, 15), 1);
	
}
function uiSfxPlayClick(){
	
	if global.uiSfxActive audio_sound_pitch(SoundPlay(sfxUI, 15), 0.5);
	
}