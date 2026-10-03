function MapDataCreate() {
	return {
		home: {
			title: global.uiData.mapHome,	//only for textlog
			scene: "p1Home1",
		
			visited:	false,				//grays-out, but still able to visit
			locked:		false,				//skips location hovering entirely
			sprHover:	noone,				//does NOT remove blending from text, but also does NOT apply blending to itself
		
			//idk hardcoded collisions
			x1: 200,
			x2: 450,
			y1: 450,
			y2: 800,
		},
		bar: {
			title: global.uiData.mapBar,
			scene: "p1Bar1",
		
			visited:	false,
			locked:		false,
			sprHover:	noone,
		
			x1: 1050,
			x2: 1665,
			y1: 150,
			y2: 815,
		},
		street: {
			title: global.uiData.mapStreet,
			scene: "p1Street1",
		
			visited:	false,
			locked:		false,
			sprHover:	{
				ind: sMapHoverStreet,
				imInd: 0,
				col: c_white,
				alpha: 0.45,
			},
		
			x1: 450,
			x2: 915,
			y1: 360,
			y2: 830,
		},
		yard: {
			title: global.uiData.mapYard,
			scene: "p1Yard1",
		
			visited:	false,
			locked:		false,
			sprHover:	noone,
		
			x1: 400,
			x2: 650,
			y1: 100,
			y2: 350,
		},
		front: {
			title: global.uiData.mapFront,
			scene: "p1Front1",
		
			visited:	false,
			locked:		false,
			sprHover:	noone,
		
			x1: 660,
			x2: 800,
			y1: 100,
			y2: 350,
		},
		lamp: {
			title: global.uiData.mapLamp,
			scene: "p1Lamp1",
		
			visited:	false,
			locked:		false,
			sprHover:	noone,
		
			x1: 900,
			x2: 1100,
			y1: 100,
			y2: 450,
		},
	};
}

function MapDataUpdatePart2(){
	with global.dataMapLocations {
		home.scene				= "p2Home1";
		bar.scene				= "testScene1";
		street.scene			= "testScene1";
		yard.scene				= "testScene1";
		front.scene				= "testScene1";
		lamp.scene				= "testScene1";
		
		home.visited				= false;
		bar.visited					= false;
		street.visited				= false;
		yard.visited				= false;
		front.visited				= false;
		lamp.visited				= false;
		
		home.locked					= false;
		bar.locked					= true;
		street.locked				= true;
		yard.locked					= true;
		front.locked				= true;
		lamp.locked					= true;
	}
}

