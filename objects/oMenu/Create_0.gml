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