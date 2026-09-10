
function LoadScreenPlay ()
{
	var _sceneData = {
		scene1: {
			startNode: "scene1_transition_in",
			nextScene: noone,
			background: sPlaceholderBackground1,
			nodes: {
				scene1_transition_in: {
					nodeType: NodeType.TRANSITION_IN,
					transitionSequence: sqFadeIn,
					nextNode: "scene1_dialogue1"
				},
				scene1_dialogue1: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "scene1_dialogue1",
					delay: 1.0,
					nextNode: "scene1_prompt1"
				},
				scene1_prompt1: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "scene1_prompt1",
					delay: 0,
					nextNode: noone
				}
			}
		}   // scene1
	};
	
	return _sceneData;
}
