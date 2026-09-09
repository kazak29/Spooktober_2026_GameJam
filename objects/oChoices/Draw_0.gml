
var _startX = VIEWPORT_WIDTH / 2;
var _startY = VIEWPORT_HEIGHT - 500;
var _spacing = 32;

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fConsol);

for (var _i = 0; _i < array_length(options); _i++) {
    var _opt = options[_i];
    var _text = global.dataTextUI[$ _opt.key] ?? _opt.key;
    var _drawY = _startY + (_i * _spacing);
    
    if (_i == selectedIndex) {
        draw_set_color(c_yellow);
        _text = "> " + _text + " <";
    } else {
        draw_set_color(c_white);
    }
    
    draw_text(_startX, _drawY, _text);
}
