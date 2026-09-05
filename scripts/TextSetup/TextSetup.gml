#region global text setup
	
	//locale setup if we ever wanna do translations
	enum LOCALE { EN }
	global.locale = LOCALE.EN;
	
	//structs to get assets from, using variable names as strings in csv
	global.lineSfx = {
		sansundertale		: noone,
		papyrusundertale	: noone,
	};
	global.lineTbStyles = {
		basic		: sPixel,
		special		: sPlaceholderCharacter1,
		character1	: sPixel,
		whatever	: sPixel,
	};
	
#endregion
#region line sequences setup
	
	//setup individual line data
	function DataLineSetup(_seq, _sfx, _tbStyle, _title, _text){
		var _line = {
			sfx		:	_sfx,
			tbStyle	:	_tbStyle,
			title	:	_title,
			line	:	_text,
		};
		
		//setup a new array for set sequence if not set before
		if !struct_exists(global.dataLines, _seq) global.dataLines[$ _seq] = [];
		
		//push line into array
		array_push(global.dataLines[$ _seq], _line);
	}
	
	//setup line sequence data from a grid from csv file (as a struct of arrays of structs)
	function DataLineSeqSetup(){
		global.dataLines = {};
		
		//load csv file data into a ds_grid
		var _csvGrid = load_csv("lines.csv");
		
		//loop through every row in the grid
		var _hh = ds_grid_height(_csvGrid);
	    for (var i = 1; i < _hh; i++) {
			
			//get name of sequence as set in csv file (and check that its not empty)
			var _seq = _csvGrid[# 0, i];
			if (_seq != "") {
				
				//sfx setup
				var _sfxName = _csvGrid[# 1, i];
				var _sfx = global.lineSfx[$ _sfxName] ?? noone;
				
				//tb setup
				var _tbName = _csvGrid[# 2, i];
				var _tbStyle = global.lineTbStyles[$ _tbName] ?? global.lineTbStyles.basic;
				
				//strings setup
				var _title	=	_csvGrid[# 3 + global.locale*2, i];
				var _text	=	_csvGrid[# 4 + global.locale*2, i];
				
				//combine all and push into line sequence array
				DataLineSetup(_seq, _sfx, _tbStyle, _title, _text);
				
			}
			
	    }
		
		//delete ds grid
		ds_grid_destroy(_csvGrid);
	}
	
#endregion

//setup all text data (with ability to change language)
function SetLocale(_locale) {
	global.locale = _locale;
	DataLineSeqSetup();
}
SetLocale(LOCALE.EN);