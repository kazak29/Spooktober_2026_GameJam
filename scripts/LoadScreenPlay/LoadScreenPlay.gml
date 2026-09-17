
// The ACTUAL screenplay whenever we are ready
function LoadScreenPlay ()
{
    var _sceneData = {
		introScene1: {
			startNode: "introScene1_music1",
			nextScene: noone,
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
					nextNode: noone
				}
			}
		}, // introScene1
	};
	return _sceneData;
}
