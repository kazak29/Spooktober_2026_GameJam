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
                    nextNode: "scene1_main_character_enter"
                },
                
                scene1_main_character_enter: {
                    nodeType: NodeType.MAIN_CHARACTER_IN,
                    nextNode: "scene1_character_enter1"
                },
                
                scene1_character_enter1: {
                    nodeType: NodeType.CHARACTER_IN,
                    characters: [
                        { charId: "char1", sprite: sPlaceholderCharacter1 }
                    ],
                    nextNode: "scene1_character_enter2"
                },
                
                scene1_character_enter2: {
                    nodeType: NodeType.CHARACTER_IN,
                    characters: [
                        { charId: "char2", sprite: sPlaceholderCharacter2 }
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
                        { charId: "char1" }
                    ],
                    nextNode: "scene1_main_character_exit"
                },
                
                scene1_main_character_exit: {
                    nodeType: NodeType.MAIN_CHARACTER_OUT,
                    nextNode: noone
                }
            }
        } // scene1
    };
    
    return _sceneData;
}