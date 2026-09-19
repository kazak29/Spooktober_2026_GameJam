
function GetEmptyScene ()
{
	var _sceneData = {
		emptyScene: {
			startNode: "emptyScene_line",
			nextScene: noone,
			background: sBackgroundGray,
			nodes: {
				emptyScene_line: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "emptyScene_line",
					nextNode: noone
				}
			}
		}
	};
	
	return _sceneData;
}
