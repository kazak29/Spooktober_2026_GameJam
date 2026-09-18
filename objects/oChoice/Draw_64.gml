
draw_sprite_stretched(sChoiceBox, image_index, drawX, drawY, width, height);

draw_set_font(fDialogueTextBody);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_text(textX, textY, buttonText);
