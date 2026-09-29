depth = MENU_DEPTH;

num = 0;
mouseClickLock = false;
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