if sprite_exists(bg.sprInd) {
	with bg {
		draw_sprite_ext(sprInd,imInd, 0,0, 1,1, 0,col,alpha);
	}
}

if (currentSceneName != noone)
{
	
	DrawCharacterPortraits();
	
	if (directorState == DirectorStateLineSequence ||
    directorState == DirectorStateChoice) && (textbox.alpha > 0)
	{ 
		DrawDialogueBox();
	}
	
	DrawMainCharacterPortrait();
}

with oChoice {
	var _selected = (num == other.choice.num);

	var _c = COL_MENU_OPTION_DEFAULT;
	var _frame = 0;
	if _selected {
		_c = COL_MENU_OPTION_SELECTED;
		_frame = 1;
	}

	if sprite_exists(sprite_index) {
	
		_c = COL_MENU_OPTION_DEFAULT;
		image_index = _frame;
		draw_self();
	
	}

	scribId.blend(_c, 1).draw(strX, strY);
}

with oSceneTransition {
	draw_set_color(c_black);
    draw_set_alpha(alpha);
    draw_rectangle(0, 0, VIEWPORT_WIDTH, VIEWPORT_HEIGHT, false);
    draw_set_alpha(MAX_ALPHA);
    draw_set_color(c_white);
}


if global.showDebugUI {
	draw_text(room_width/2, room_height/2, $"state: {directorState}");
}
