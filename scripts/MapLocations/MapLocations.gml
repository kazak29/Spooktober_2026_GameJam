function MapDataCreate() {
	return {
		home: {
			title: global.uiData.mapHome,	//only for textlog
			scene: "shayHome_Day1_Visit1",
		
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
			scene: "sewerBar_Day1_Visit1",
		
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
			scene: "testScene1",
		
			visited:	false,
			locked:		false,
			sprHover:	{
				ind: sMapHoverStreet,
				imInd: 0,
				col: c_white,
				alpha: 1,
			},
		
			x1: 450,
			x2: 915,
			y1: 360,
			y2: 830,
		},
		houseAcrossYard: {
			title: global.uiData.mapHouseAcrossYard,
			scene: "testScene1",
		
			visited:	false,
			locked:		false,
			sprHover:	noone,
		
			x1: 400,
			x2: 650,
			y1: 100,
			y2: 350,
		},
		houseAcrossFront: {
			title: global.uiData.mapHouseAcrossFront,
			scene: "houseAcross_Day1_Visit1",
		
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
			scene: "lampPost_Day1_Visit1",
		
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

