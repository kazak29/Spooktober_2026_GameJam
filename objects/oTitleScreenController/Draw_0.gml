if instance_exists(oMenu) && (oMenu.menuName != "titleMain" && oMenu.menuName != "titleMainWin") exit;

scribble("[wheel]SPOOK'S SPOOKY\nHALLOWEEN PARTY![/wheel]")
	.starting_format("fTitle",#E48034)
	.align(fa_left,fa_top)
	.sdf_shadow(c_black,0.75,8,0)
	.bezier(
		0,50,
		500,-50,
		750,150,
		1000,0,
	)
	//.draw(0,0);
	.draw(room_width/2 - 390,140);