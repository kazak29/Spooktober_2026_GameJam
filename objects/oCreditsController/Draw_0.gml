// 1. Draw Title
draw_set_font(fConsol24);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_yellow);
draw_text(drawX, drawStartY - 60, creditTitle);



// Draw Credit Entries
draw_set_font(fConsol16);

for (var _i = 0; _i < creditsLength; _i++)
{
    var _text = creditEntries[_i];
    if (_text == "") continue;
    
    var _drawY = drawStartY + (_i * ySpacing);
    var _isHeader = (_text == string_upper(_text)); 
    
    draw_set_color(_isHeader ? c_white : c_silver);
    draw_text(drawX, _drawY, _text);
}



// Draw Prompt to Exit
var _returnPrompt = "Press Confirm to Return to Title Screen";

draw_set_color(c_gray);
draw_text(drawX, VIEWPORT_HEIGHT - 60, _returnPrompt);



// Reset Draw State
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
