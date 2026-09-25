
function LoadMapLocations ()
{
	var _locations = [
		{
			locationName: "Home",
			scenes: ["shayHome_Day1_Visit3", "shayHome_Day1_Visit1", "shayHome_Day1_Visit2"],
			activeScene: 0,
			sceneSelectionScript: noone,
			isLocked: false
		},
		{
			locationName: "Sewer Bar",
			scenes: ["emptyScene"],
			activeScene: 0,
			sceneSelectionScript: noone,
			isLocked: false
		},
		{
			locationName: "Main Street",
			scenes: ["emptyScene"],
			activeScene: 0,
			sceneSelectionScript: noone,
			isLocked: false
		},
		{
			locationName: "House Across (Back)",
			scenes: ["emptyScene"],
			activeScene: 0,
			sceneSelectionScript: noone,
			isLocked: false
		},
		{
			locationName: "House Across (Front)",
			scenes: ["houseAcross_Day1_Visit2", "houseAcross_Day1_Visit1"],
			activeScene: 0,
			sceneSelectionScript: noone,
			isLocked: false
		},
		{
			locationName: "Light Post",
			scenes: ["lampPost_Day1_Visit2", "lampPost_Day1_Visit1"],
			activeScene: 0,
			sceneSelectionScript: noone,
			isLocked: false
		}
	];
	return _locations;
}
