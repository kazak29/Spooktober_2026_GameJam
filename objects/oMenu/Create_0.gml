depth = MENU_DEPTH;
saveElemUpdating = noone;

num = 0;
mouseClickLock = oInputManager.mouse.held.any;

ElemSelectReset = function(){
	
	main = {
		elemId: noone,
		hover: false,
	};
	
	sub = {
		elemId: noone,
		hover: false,
		hoverCdMax: 5,
	};
	
}
ElemSelectReset();

//checking for being locked
CheckLocked = function(_elemData){
	if (struct_exists(_elemData,"locked") && _elemData.locked) return true;
	return false;
}
	
//progressing via discret input
DiscretProgress = function(_amount){
	var _elemsL = array_length(global.dataMenu[$ menuName].elements);
	
	num += _amount;
	if (num > _elemsL-1)	{ num = 0;			}
	if (num < 0)			{ num = _elemsL-1;	}
}