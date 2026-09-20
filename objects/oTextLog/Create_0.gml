
scrollOffset = 0;
maxScrollLimit = 0;
scrollSpeed = 32;

windowWidth = 1600;
windowHeight = 600;

windowX = (VIEWPORT_WIDTH - windowWidth) / 2;
windowY = (VIEWPORT_HEIGHT - windowHeight) / 5;

isFirstFrame = true;



// Pre-calculate the total height of all log entries upon creation
var _tempHeight = 0;
var _globalLog = global.textLog; 

for (var _i = 0; _i < array_length(_globalLog); _i++)
{
    var _entry = _globalLog[_i];
    var _formattedText = ""; 
    if (string(_entry.title) == "") { 
        _formattedText = string(_entry.text); 
    } else { 
        _formattedText = string(_entry.title) + ": " + string(_entry.text); 
    }
    
    var _element = scribble(_formattedText)
        .starting_format(FONT_DIALOGUE_TEXT_BODY, c_black)
        .wrap(windowWidth - 80);
        
    _tempHeight += _element.get_height() + 24;
}

maxScrollLimit = max(0, _tempHeight - windowHeight + 60);
scrollOffset = maxScrollLimit;
