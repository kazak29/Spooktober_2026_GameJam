
function LoadMapLocations ()
{
	var _locations = [
		{
			locationName: "Home",
			scenes: ["dayOneShayHomeThirdVisit", "dayOneShayHomeFirstVisit","dayOneShayHomeSecondVisit"],
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
			scenes: ["emptyScene"],
			activeScene: 0,
			sceneSelectionScript: noone,
			isLocked: false
		},
		{
			locationName: "Light Post",
			scenes: ["lampPostDayOneVisitOne", ""],
			activeScene: 0,
			sceneSelectionScript: noone,
			isLocked: false
		}
	];
	return _locations;
}
