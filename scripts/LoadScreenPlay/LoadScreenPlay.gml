
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
			nextScene: noone,
			background: sBackgroundGray,
			nodes: {
				introScene2_line1: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene2_line1",
					delay: 2,
					nextNode: noone
				}
			}
		} // introScene2
	};
	return _sceneData;
}
