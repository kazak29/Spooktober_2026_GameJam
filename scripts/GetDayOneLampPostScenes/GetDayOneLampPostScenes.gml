
function GetDayOneLampPostScenes ()
{
	var _sceneData = {
		dayOneLampPostFirstVisit: {
			startNode: "dayOneLampPostFirstVisit_music1",
			nextScene: noone,
			background: sBackgroundGray,
			nodes: {
				dayOneLampPostFirstVisit_music1: {
					nodeType: NodeType.MUSIC,
					song: sndLompTheme,
					nextNode: "dayOneLampPostFirstVisit_spookIn1"
				},
				dayOneLampPostFirstVisit_spookIn1: {
					nodeType: NodeType.MAIN_CHARACTER_IN,
					expressionFrame: 0,
					nextNode: "dayOneLampPostFirstVisit_line1"
				},
				dayOneLampPostFirstVisit_line1: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "dayOneLampPostFirstVisit_line1",
					nextNode: "dayOneLampPostFirstVisit_mothIn1"
				},
				dayOneLampPostFirstVisit_mothIn1: {
					nodeType: NodeType.CHARACTER_IN,
					charId: MOTH,
					sprite: sMoth,
					expressionFrame: 0,
					nextNode: "dayOneLampPostFirstVisit_line2"
				},
				dayOneLampPostFirstVisit_line2: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "dayOneLampPostFirstVisit_line2",
					nextNode: "dayOneLampPostFirstVisit_choice1"
				},
				dayOneLampPostFirstVisit_choice1: {
					nodeType: NodeType.CHOICE,
					sequenceId: "dayOneLampPostFirstVisit_prompt1",
					choices: [
						{ key: "dayOneLampPostFirstVisit_prompt1_option1", nextNode: "dayOneLampPostFirstVisit_line3" },
						{ key: "dayOneLampPostFirstVisit_prompt1_option2", nextNode: "dayOneLampPostFirstVisit_choice2" }
					]
				},
				dayOneLampPostFirstVisit_line3: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "dayOneLampPostFirstVisit_line3",
					nextNode: "dayOneLampPostFirstVisit_music2"
				},
				dayOneLampPostFirstVisit_music2: {
					nodeType: NodeType.MUSIC,
					song: noone,
					nextNode: "dayOneLampPostFirstVisit_mothOut1"
				},
				dayOneLampPostFirstVisit_mothOut1: {
					nodeType: NodeType.CHARACTER_OUT,
					charId: MOTH,
					delay: 3,
					nextNode: "dayOneLampPostFirstVisit_mothIn2"
				},
				dayOneLampPostFirstVisit_mothIn2: {
					nodeType: NodeType.CHARACTER_IN,
					charId: MOTH,
					sprite: sMoth,
					expressionFrame: 1,
					delay: 3,
					nextNode: "dayOneLampPostFirstVisit_line4"
				},
				dayOneLampPostFirstVisit_line4: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "dayOneLampPostFirstVisit_line4",
					nextNode: "dayOneLampPostFirstVisit_mothOut2"
				},
				dayOneLampPostFirstVisit_mothOut2: {
					nodeType: NodeType.CHARACTER_OUT,
					charId: MOTH,
					delay: 3,
					nextNode: "dayOneLampPostFirstVisit_music3"
				},
				dayOneLampPostFirstVisit_music3: {
					nodeType: NodeType.MUSIC,
					song: sndLompTheme,
					nextNode: "dayOneLampPostFirstVisit_mothIn3"
				},
				dayOneLampPostFirstVisit_mothIn3: {
					nodeType: NodeType.CHARACTER_IN,
					charId: MOTH,
					sprite: sMoth,
					expressionFrame: 0,
					nextNode: "dayOneLampPostFirstVisit_line5"
				},
				dayOneLampPostFirstVisit_line5: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "dayOneLampPostFirstVisit_line5",
					nextNode: "dayOneLampPostFirstVisit_music4"
				},
				
				
				
				dayOneLampPostFirstVisit_choice2: {
					nodeType: NodeType.CHOICE,
					sequenceId: "dayOneLampPostFirstVisit_prompt2",
					choices: [
						{ key: "dayOneLampPostFirstVisit_prompt2_option1", nextNode: "dayOneLampPostFirstVisit_music5" },
						{ key: "dayOneLampPostFirstVisit_prompt2_option2", nextNode: "dayOneLampPostFirstVisit_music4" }
					]
				},
				dayOneLampPostFirstVisit_music5: {
					nodeType: NodeType.MUSIC,
					song: noone,
					nextNode: noone
				},
				
				
				
				
				
				
				
				
				
				
				dayOneLampPostFirstVisit_music4: {
					nodeType: NodeType.MUSIC,
					song: noone,
					nextNode: noone
				}
			}
		}, // dayOneLampPostFirstVisit
		dayOneLampPostSecondVisit: {
			startNode: "dayOneLampPostSecondVisit_music1",
			nextScene: noone,
			background: sBackgroundGray,
			nodes: {
				dayOneLampPostSecondVisit_music1: {
					nodeType: NodeType.MUSIC,
					song: sndLompTheme,
					nextNode: "dayOneLampPostSecondVisit_spookIn1"
				},
				dayOneLampPostSecondVisit_spookIn1: {
					nodeType: NodeType.MAIN_CHARACTER_IN,
					expressionFrame: 0,
					nextNode: "dayOneLampPostSecondVisit_mothIn1"
				},
				dayOneLampPostSecondVisit_mothIn1: {
					nodeType: NodeType.CHARACTER_IN,
					charId: MOTH,
					sprite: sMoth,
					expressionFrame: 0,
					nextNode: "dayOneLampPostSecondVisit_line1"
				},
				dayOneLampPostSecondVisit_line1: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "dayOneLampPostSecondVisit_line1",
					nextNode: "dayOneLampPostSecondVisit_music2"
				},
				dayOneLampPostSecondVisit_music2: {
					nodeType: NodeType.MUSIC,
					song: noone,
					nextNode: noone
				}
			}
		} // dayOneLampPostSecondVisit
	};
	return _sceneData;
}
