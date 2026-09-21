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

//play ui sfx (why did I even bother)
function uiSfxPlayHover(){
	
	if global.uiSfxActive audio_sound_pitch(SoundPlay(sfxUI, 15), 1);
	
}
function uiSfxPlayClick(){
	
	if global.uiSfxActive audio_sound_pitch(SoundPlay(sfxUI, 15), 0.5);
	
}