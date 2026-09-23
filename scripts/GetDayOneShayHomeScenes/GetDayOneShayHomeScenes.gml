function GetDayOneShayHomeScenes ()
{
	var _sceneData = {
		dayOneShayHomeFirstVisit: {
			startNode: "dayOneShayHomeFirstVisit_music1",
			nextScene: noone,
			background: sBackgroundShayRoomNight,
			nodes: {
				dayOneShayHomeFirstVisit_music1: {
					nodeType: NodeType.MUSIC,
					song: sndShayHome,
					nextNode: "dayOneShayHomeFirstVisit_spookIn1"
				},
				dayOneShayHomeFirstVisit_spookIn1: {
					nodeType: NodeType.MAIN_CHARACTER_IN,
					expressionFrame: 0,
					nextNode: "dayOneShayHomeFirstVisit_line1"
				},
				dayOneShayHomeFirstVisit_line1: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "dayOneShayHomeFirstVisit_line1",
					nextNode: "dayOneShayHomeFirstVisit_screwdriverIn1"
				},
				dayOneShayHomeFirstVisit_screwdriverIn1: {
					nodeType: NodeType.CHARACTER_IN,
					charId: SCREWDRIVER,
					sprite: sScrewdriver,
					expressionFrame: 0,
					nextNode: "dayOneShayHomeFirstVisit_line2"
				},
				dayOneShayHomeFirstVisit_line2: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "dayOneShayHomeFirstVisit_line2",
					nextNode: "dayOneShayHomeFirstVisit_spookUpdate1"
				},
				dayOneShayHomeFirstVisit_spookUpdate1: {
					nodeType: NodeType.CHARACTER_UPDATE,
					charId: SPOOK,
					expressionFrame: 8,
					nextNode: "dayOneShayHomeFirstVisit_line3"
				},
				dayOneShayHomeFirstVisit_line3: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "dayOneShayHomeFirstVisit_line3",
					nextNode: "dayOneShayHomeFirstVisit_music2"
				},
				dayOneShayHomeFirstVisit_music2: {
					nodeType: NodeType.MUSIC,
					song: noone,
					nextNode: noone
				}
			}
		}, // dayOneShayHomeFirstVisit
		dayOneShayHomeSecondVisit: {
			startNode: "dayOneShayHomeSecondVisit_music1",
			nextScene: noone,
			background: sBackgroundShayRoomNight,
			nodes: {
				dayOneShayHomeSecondVisit_music1: {
					nodeType: NodeType.MUSIC,
					song: sndShayHome,
					nextNode: "dayOneShayHomeSecondVisit_spookIn1"
				},
				dayOneShayHomeSecondVisit_spookIn1: {
					nodeType: NodeType.MAIN_CHARACTER_IN,
					expressionFrame: 0,
					nextNode: "dayOneShayHomeSecondVisit_screwdriverIn1"
				},
				dayOneShayHomeSecondVisit_screwdriverIn1: {
					nodeType: NodeType.CHARACTER_IN,
					charId: SCREWDRIVER,
					sprite: sScrewdriver,
					expressionFrame: 2,
					nextNode: "dayOneShayHomeSecondVisit_line1"
				},
				dayOneShayHomeSecondVisit_line1: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "dayOneShayHomeSecondVisit_line1",
					nextNode: "dayOneShayHomeSecondVisit_screwdriverUpdate1"
				},
				dayOneShayHomeSecondVisit_screwdriverUpdate1: {
					nodeType: NodeType.CHARACTER_UPDATE,
					charId: SCREWDRIVER,
					expressionFrame: 0,
					nextNode: "dayOneShayHomeSecondVisit_line2"
				},
				dayOneShayHomeSecondVisit_line2: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "dayOneShayHomeSecondVisit_line2",
					nextNode: "dayOneShayHomeSecondVisit_music2"
				},
				dayOneShayHomeSecondVisit_music2: {
					nodeType: NodeType.MUSIC,
					song: noone,
					nextNode: noone
				}	
			}
		} // dayOneShayHomeSecondVisit
	};
	return _sceneData;
}
