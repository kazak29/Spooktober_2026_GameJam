
// The screenplay for TESTING
function LoadScreenPlay_Demo()
{
    var _sceneData = {
        scene1: {
            startNode: "scene1_main_character_enter",
            nextScene: "scene2",
            background: sPlaceholderBackground1,
            nodes: {
                scene1_main_character_enter: {
                    nodeType: NodeType.MAIN_CHARACTER_IN,
					expressionFrame: 0,
                    nextNode: "scene1_character_enter1"
                },
                
                scene1_character_enter1: {
                    nodeType: NodeType.CHARACTER_IN,
                    charId: "Kazak",
					sprite: sPlaceholderCharacter1,
					expressionFrame: 0,
                    nextNode: "scene1_character_enter2"
                },
				
				scene1_character_enter2: {
                    nodeType: NodeType.CHARACTER_IN,
                    charId: "Extonjunior",
					sprite: sPlaceholderCharacter2,
					expressionFrame: 0,
                    nextNode: "scene1_character_enter3"
                },
				
				scene1_character_enter3: {
                    nodeType: NodeType.CHARACTER_IN,
                    charId: "Atlas",
					sprite: sPlaceholderCharacter3,
					expressionFrame: 0,
                    nextNode: "scene1_dialogue1"
                },
				
                scene1_dialogue1: {
                    nodeType: NodeType.LINE_SEQUENCE,
                    sequenceId: "scene1_dialogue1",
					nextNode: "scene1_choice1"
                },
				
				scene1_choice1: {
					nodeType: NodeType.CHOICE,
					promptId: "scene1_prompt1",
					choices: [
						{ key: "choice_comfort", nextNode: "scene1_character_exit3" },
						{ key: "choice_ignore", nextNode: "scene1_change_main_exp" },
					],
				},
                
				scene1_change_main_exp: {
					nodeType: NodeType.CHARACTER_UPDATE,
					charId: "Extonjunior",
					expressionFrame: 1,
					nextNode: "scene1_character_exit1"
				},
				
                scene1_character_exit1: {
                    nodeType: NodeType.CHARACTER_OUT,
                    charId: "Kazak",
                    nextNode: "scene1_character_exit2"
                },
				
				scene1_character_exit2: {
                    nodeType: NodeType.CHARACTER_OUT,
                    charId: "Atlas",
                    nextNode: "scene1_character_exit3"
                },
				
				scene1_character_exit3: {
                    nodeType: NodeType.CHARACTER_OUT,
                    charId: "Extonjunior",
                    nextNode: "scene1_main_character_exit"
                },
				
                scene1_main_character_exit: {
                    nodeType: NodeType.MAIN_CHARACTER_OUT,
                    nextNode: noone
                },
				
            }
        }, // scene1
		scene2: {
			startNode: "scene2_main_character_enter",
            nextScene: noone,
            background: sPlaceholderBackground2,
            nodes: {
				scene2_main_character_enter: {
                    nodeType: NodeType.MAIN_CHARACTER_IN,
					expressionFrame: 0,
                    nextNode: "scene2_main_character_exit"
                },
				scene2_main_character_exit: {
                    nodeType: NodeType.MAIN_CHARACTER_OUT,
                    nextNode: noone
                }
			}
		} // scene2
    };
    
    return _sceneData;
}
