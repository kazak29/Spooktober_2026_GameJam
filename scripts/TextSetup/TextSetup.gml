#region global text setup
	
	//locale setup if we ever wanna do translations
	enum LOCALE { EN }
	global.locale = LOCALE.EN;
	
	//load csv file data into a ds_grid
	global.csvLines = load_csv("lines.csv");

#endregion
#region setup scripts for individual lines

	//setup line with default params
	function DataLineSetup(_title, _text){
		var _line = {
			sprInd: noone,
			sfx: noone,
			title: {
				str: _title,
				col: c_white,
				alpha: 1,
				font: undefined,
			},
			line: {
				str: _text,
				col: c_white,
				alpha: 1,
				font: undefined,
			},
		};
	
		//push line into dummy array to copy from later
		array_push(global.dataLines.seqCopy, _line);
	}

	//change params of a line (general)
	function DataLineSetParamsGeneral(_num, _sprInd = noone, _sfx = noone){
		var _al = array_length(global.dataLines.seqCopy);
		if (_num < _al) {
		
			var _line = global.dataLines.seqCopy[_num];
			with _line {
				sprInd	= _sprInd;
				sfx		= _sfx;
			}
		
		}
	}

	//change params of a line (title)
	function DataLineSetParamsTitle(_num, _col = c_white, _alpha = 1, _font = undefined){
		var _al = array_length(global.dataLines.seqCopy);
		if (_num < _al) {
		
			var _line = global.dataLines.seqCopy[_num];
			with _line.title {
				col		= _col;
				alpha	= _alpha;
				font	= _font;
			}
		
		}
	}
	
	//change params of a line (text)
	function DataLineSetParamsText(_num, _col = c_white, _alpha = 1, _font = undefined){
		var _al = array_length(global.dataLines.seqCopy);
		if (_num < _al) {
		
			var _line = global.dataLines.seqCopy[_num];
			with _line.line {
				col		= _col;
				alpha	= _alpha;
				font	= _font;
			}
		
		}
	}
	
#endregion
#region setup scripts for line sequences
	
	//setup a line sequence from csv file
	function DataLineSeqSetup(_seq){
		var _hh = ds_grid_height(global.csvLines);
	    for (var i = 0; i < _hh; i++) {
			
			//get name of sequence as set in csv file
			var _key = global.csvLines[# 0, i];
			
			//compare to sequence name (must be identical)
			if _key == _seq {
				var _title	=	global.csvLines[# 1 + global.locale*2, i];
				var _text	=	global.csvLines[# 2 + global.locale*2, i];
				DataLineSetup(_title, _text);
			}
			
	    }
	}

	//commit sequence into global data
	function DataLineSeqCommit(_seq){
		global.dataLines[$ _seq] = variable_clone(global.dataLines.seqCopy);
		global.dataLines.seqCopy = [];
	}

	//setup all line data
	function DataSetupLines() {
		//initiate global data struct (a struct of arrays of structs)
		global.dataLines = {seqCopy: []};
	
		#region sequence test
			//setup sequence into dummy array, where all params are default except title and text strings
			DataLineSeqSetup(LINE_SEQ_TEST);
			
			//change any params of any line
			DataLineSetParamsGeneral(0, noone, noone);
			DataLineSetParamsText(2, c_yellow, 0.7);
			
			//commit by copying dummy array into actual sequence array
			DataLineSeqCommit(LINE_SEQ_TEST);
		#endregion
	}
	
#endregion

//setup all text data (with ability to change language)
function SetLocale(_locale) {
	global.locale = _locale;
	DataSetupLines();
}
SetLocale(LOCALE.EN);