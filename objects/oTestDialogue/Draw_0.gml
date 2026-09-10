//setup position
var _x = x + 32, _y = y + 32;

//setup strings
var _title	= lineData[$ "title"]	?? "NO LINE TITLE SET";
var _line	= lineData[$ "line"]	?? "NO LINE TEXT SET";

//draw strings
DrawLine(_x,_y, _title, textW, fConsol16, c_white, image_alpha);
DrawLineTypist(_x,_y+32, _line, textW, fConsol16, c_white, image_alpha);
