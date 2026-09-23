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
					song: bgmShayHome,
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
					song: bgmShayHome,
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
		}, // dayOneShayHomeSecondVisit
		dayOneShayHomeThirdVisit: {
 			startNode: "dayOneShayHomeThirdVisit_music1",
 			nextScene: noone,
 			background: sBackgroundShayRoomNight,
			nodes: {
				dayOneShayHomeThirdVisit_music1: {
					nodeType: NodeType.MUSIC,
					song: bgmShayHome,
					nextNode: "dayOneShayHomeThirdVisit_spookIn1"
				},
				dayOneShayHomeThirdVisit_spookIn1: {
					nodeType: NodeType.MAIN_CHARACTER_IN,
					expressionFrame: 0,
					nextNode: "dayOneShayHomeThirdVisit_screwdriverIn1"
				},
				dayOneShayHomeThirdVisit_screwdriverIn1: {
					nodeType: NodeType.CHARACTER_IN,
					charId: SCREWDRIVER,
					sprite: sScrewdriver,
					expressionFrame: 0,
					nextNode: "dayOneShayHomeThirdVisit_line1"
				},
				dayOneShayHomeThirdVisit_line1: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "dayOneShayHomeThirdVisit_line1",
					nextNode: "dayOneShayHomeThirdVisit_choice1"
				},
				dayOneShayHomeThirdVisit_choice1: {
					nodeType: NodeType.CHOICE,
					sequenceId: "dayOneShayHomeThirdVisit_prompt1",
					choices: [
					{ key: "dayOneShayHomeThirdVisit_prompt1_option1", nextNode: "dayOneShayHomeThirdVisit_line2" },
					{ key: "dayOneShayHomeThirdVisit_prompt1_option2", nextNode: "dayOneShayHomeThirdVisit_setNextScene1" }
					]
				},
				
				
				dayOneShayHomeThirdVisit_line2: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "dayOneShayHomeThirdVisit_line2",
					nextNode: noone
				},

				
				
				
				
				
				
				
				
				
				
				dayOneShayHomeThirdVisit_setNextScene1: {
					nodeType: NodeType.SET_NEXT_SCENE,
					newNextScene: noone,
					nextNode: "dayOneShayHomeThirdVisit_music2"
				},
				dayOneShayHomeThirdVisit_music2: {
					nodeType: NodeType.MUSIC,
					song: noone,
					nextNode: noone
				}
			}
		}
	};
	return _sceneData;
}
