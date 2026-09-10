
function LoadScreenPlay ()
{
	var _sceneData = {
		scene1: {
			startNode: "scene1_dialogue1",
			nextScene: noone,
			background: sPlaceholderBackground1,
			nodes: {
				scene1_dialogue1: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "scene1_dialogue1",
					nextNode: "scene1_prompt1"
				},
				scene1_prompt1: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "scene1_prompt1",
					nextNode: noone
				}
			}
		}   // scene1
	};
	
	return _sceneData;
}
