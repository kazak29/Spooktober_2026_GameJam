//compare new style to currently present textbox
function TextboxCompare(_styleNew){
	
	//true = same, false = different
	var _result = false;
	
	//check if previous textbox present
	if !instance_exists(global.tbId) return _result;
	
	//check if styles match
	var _styleOld = global.tbId.tbStyle;
	if (_styleOld == _styleNew) _result = true;
	
	//return bool
	return _result;
	
}

//create a new textbox (replaces current textbox id)
function TextboxCreate(_dataTbStyle){
	
	//setup textbox position
	var _x = _dataTbStyle.x;
	var _y = _dataTbStyle.y;
	
	//create a textbox
	var _tb = instance_create_layer(_x,_y, "Textbox", oTextbox, _dataTbStyle);
	with _tb {
		
		//save style struct (to compare to later)
		tbStyle = _dataTbStyle;
		
		//create a title object
		
		
	}
	
	//save textbox id
	global.tbId = _tb;
	
}