x = 1515;
y = 560;

sprite_index = sHamilton;
image_xscale = 0.25;
image_yscale = 0.25;
image_index = 7;
image_speed = 0;
image_alpha = 0;


cd = 30;
cdWaitMin = 600;
cdWaitMax = 1200;
cdShowMin = 180;
cdShowMax = 600;
alphaSpd = 0.01;
alphaMax = 0.75;


StateWait = function(){
	image_alpha = Approach(image_alpha,0,alphaSpd);
	if image_alpha > 0 exit;
		
	cd = Approach(cd,0,1);
	if cd <= 0 {
		image_index = choose(7,8);
		image_alpha = 0;
			
		state = StateShow;
		cd = random_range(cdShowMin,cdShowMax);
	}
}
StateShow = function(){
	image_alpha = Approach(image_alpha,alphaMax,alphaSpd);
	if image_alpha < alphaMax exit;
		
	cd = Approach(cd,0,1);
	if cd <= 0 {
		state = StateWait;
		cd = random_range(cdWaitMin,cdWaitMax);
	}
}
StateDisappear = function(){
	image_alpha = Approach(image_alpha,0,0.05);
	if image_alpha <= 0 instance_destroy();
}

state = StateWait;