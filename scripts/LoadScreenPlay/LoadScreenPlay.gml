
// The ACTUAL screenplay whenever we are ready
function LoadScreenPlay ()
{
    var _sceneData = {
		introScene1: {
			startNode: "introScene1_music1",
			nextScene: "introScene2",
			background: sBackgroundBlack,
			nodes: {
				introScene1_music1: {
					nodeType: NodeType.MUSIC,
					song: sndSpookTheme,
					nextNode: "introScene1_line1"
				},
				introScene1_line1: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene1_line1",
					delay: 3,
					nextNode: noone
				}
			}
		}, // introScene1
		introScene2: {
			startNode: "introScene2_line1",
			nextScene: "introScene3",
			background: sBackgroundGray,
			nodes: {
				introScene2_line1: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene2_line1",
					delay: 2,
					nextNode: noone
				}
			}
		}, // introScene2
		introScene3: {
			startNode: "introScene3_spookIn1",
			nextScene: noone,
			background: sBackgroundShayHome,
			nodes: {
				introScene3_spookIn1: {
					nodeType: NodeType.MAIN_CHARACTER_IN,
					expressionFrame: 0,
					delay: 1,
					nextNode: "introScene3_shayIn1"
				},
				introScene3_shayIn1: {
					nodeType: NodeType.CHARACTER_IN,
					charId: SHAY,
					sprite: sShay,
					expressionFrame: 0,
					nextNode:"introScene3_line1"
				},
				introScene3_line1: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene3_line1",
					nextNode: noone
				}
			}
		} // introScene3
	};
	return _sceneData;
}
