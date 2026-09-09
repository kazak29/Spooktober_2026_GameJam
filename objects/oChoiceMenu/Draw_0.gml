for (var _i = 0; _i < optionCount; _i++) {
    
    var _opt = options[_i];
    var _text = global.dataTextUI[$ _opt.key] ?? _opt.key;
    
    var _bx1 = startX;
    var _by1 = startY + _i * (btnHeight + btnSpacing);
    var _bx2 = _bx1 + btnWidth;
    var _by2 = _by1 + btnHeight;
    
    var _isSelected = (_i == selectedIndex);
    
    // Draw button background frame
    draw_set_color(_isSelected ? c_yellow : c_dkgray);
    draw_rectangle(_bx1, _by1, _bx2, _by2, false);
    
    draw_set_color(c_white);
    draw_rectangle(_bx1, _by1, _bx2, _by2, true);
    
    // Draw option text with Scribble
    var _col = _isSelected ? c_black : c_white;
    scribble(_text)
        .starting_format("fConsol", _col)
        .align(fa_center, fa_middle)
        .draw(_bx1 + (btnWidth / 2), _by1 + (btnHeight / 2));
}