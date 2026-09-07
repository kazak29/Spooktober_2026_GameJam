#region functions to run within text
	
	function GuyMove(_scribbleElement, _paramArray, _characterIndex){
	
		var _x = 0, _y = 0;
		if (array_length(_paramArray) > 0) _x = _paramArray[0];
		if (array_length(_paramArray) > 1) _y = _paramArray[1];
	
		with oGuy {
			x = _x;
			y = _y;
			image_xscale = -image_xscale;
		}
	
	}
	
#endregion

#region add all functions into scribble
	scribble_typists_add_event("GuyMove", GuyMove);
	
#endregion