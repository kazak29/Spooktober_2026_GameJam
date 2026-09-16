depth = MENU_DEPTH;

//set menu page data
menuPages = global.menuPages[$ menuType] ?? {};
elementNum = 0;

elementSelectedMain = noone;
elementSelectedSub = noone;
mouseHoverMain = false;
mouseHoverSub = false;
mouseClickLock = false;

//update current values for settings elements
SettingsDataUpdate = function(_elemData) {
	var _scr = struct_get(_elemData, "scr");
	switch _scr {
		case MenuFullscreen:		_elemData.arg = window_get_fullscreen();	break;
		case MenuLanguage:			_elemData.arg = _elemData.arg;				break;	//add locale variable here
		case MenuVolMusic:			_elemData.arg = global.volMusic;			break;
		case MenuVolSound:			_elemData.arg = global.volSound;			break;
		case MenuVolTypeWriter:		_elemData.arg = global.volTypeWriter;		break;
	}
}

//create every main element on a page as object on screen
PageUpdate = function(){
	with oMenuElement instance_destroy();
	
	var _elems = menuPages[$ pageName].elements;
	var _elemsL = array_length(_elems);
	for (var i = 0; i < _elemsL; i++) {	
		SettingsDataUpdate(_elems[i]);
		
		var _data = {
			elementNum: i,
			elementData: _elems[i],
		};
		
		var _id = instance_create_layer(0,0, SYSTEM_LAYER, oMenuElementMain, _data);
		_elems[i].elemId = _id;
	}
}
PageUpdate();