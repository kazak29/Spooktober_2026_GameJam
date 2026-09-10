function LoadScreenPlay()
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
                    nextNode: "scene1_delay1"
                },
                scene1_delay1: {
                    nodeType: NodeType.DELAY,
                    duration: 0.5,
                    nextNode: "scene1_character_enter1"
                },
				scene1_character_enter1: {
					nodeType: NodeType.CHARACTER_IN,
					characters: [
						{ slot: CharacterSlot.CENTER, sprite: sPlaceholderCharacter1 }
					],
					nextNode: "scene1_dialogue1"
				},
                scene1_dialogue1: {
                    nodeType: NodeType.LINE_SEQUENCE,
                    sequenceId: "scene1_dialogue1",
                    nextNode: "scene1_character_exit1"
                },
				scene1_character_exit1: {
					nodeType: NodeType.CHARACTER_OUT,
					characters: [
						{ slot: CharacterSlot.CENTER }
					],
					nextNode: noone
				}
                //scene1_prompt1: {
                //    nodeType: NodeType.LINE_SEQUENCE,
                //    sequenceId: "scene1_prompt1",
                //    nextNode: noone
                //}
            }
        } // scene1
    };
    
    return _sceneData;
}