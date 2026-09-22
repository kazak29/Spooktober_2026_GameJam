
function GetIntroScenes ()
{
	var _sceneData = {
		introScene1: {
			startNode: "introScene1_music1",
			nextScene: "introScene2",
			background: sBackgroundShayHome,
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
			nextScene: "introScene4",
			background: sBackgroundBlack,
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
		}, // introScene3
		introScene4: {
			startNode: "introScene4_line1",
			nextScene: "introScene5",
			background: sBackgroundBlack,
			nodes: {
				introScene4_line1: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene4_line1",
					nextNode: noone
				}
			}
		}, // introScene4
		introScene5: {
			startNode: "introScene5_line1",
			nextScene: "introScene6",
			background: sBackgroundGray,
			nodes: {
				introScene5_line1: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene5_line1",
					nextNode: noone
				}
			}
		}, // introScene5
		introScene6: {
			startNode: "introScene6_line1",
			nextScene: "introScene7",
			background: sBackgroundShayRoomDay,
			nodes: {
				introScene6_line1: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene6_line1",
					nextNode: "introScene6_spookIn1"
				},
				introScene6_spookIn1: {
					nodeType: NodeType.MAIN_CHARACTER_IN,
					expressionFrame: 6,
					nextNode: "introScene6_line2"
				},
				introScene6_line2: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene6_line2",
					nextNode: "introScene6_shayIn1"
				},
				introScene6_shayIn1: {
					nodeType: NodeType.CHARACTER_IN,
					charId: SHAY,
					sprite: sShay,
					expressionFrame: 2,
					nextNode: "introScene6_spookUpdate1"
				},
				introScene6_spookUpdate1: {
					nodeType: NodeType.CHARACTER_UPDATE,
					charId: SPOOK,
					expressionFrame: 0,
					nextNode: "introScene6_line3"
				},
				introScene6_line3: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene6_line3",
					nextNode: "introScene6_choice1"
				},
				introScene6_choice1: {
					nodeType: NodeType.CHOICE,
					sequenceId: "introScene6_prompt1",
					choices: [
						{ key: "introScene6_prompt1_option1", nextNode: "introScene6_shayUpdate1" },
						{ key: "introScene6_prompt1_option2", nextNode: "introScene6_shayUpdate1" }
					]
				},
				introScene6_shayUpdate1: {
					nodeType: NodeType.CHARACTER_UPDATE,
					charId: SHAY,
					expressionFrame: 0,
					nextNode: "introScene6_line4"
				},
				introScene6_line4: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene6_line4",
					nextNode: "introScene6_music1"
				},
				introScene6_music1: {
					nodeType: NodeType.MUSIC,
					song: noone,
					nextNode: noone
				}
			}
		}, // introScene6
		introScene7: {
			startNode: "introScene7_line1",
			nextScene: noone,
			background: sBackgroundShayRoomNight,
			nodes: {
				introScene7_line1: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene7_line1",
					nextNode: "introScene7_music1"
				},
				introScene7_music1: {
					nodeType: NodeType.MUSIC,
					song: sndSuspense,
					nextNode: "introScene7_spookIn1"
				},
				introScene7_spookIn1: {
					nodeType: NodeType.MAIN_CHARACTER_IN,
					expressionFrame: 6,
					nextNode: "introScene7_line2"
				},
				introScene7_line2: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene7_line2",
					nextNode: "introScene7_spookUpdate1"
				},
				introScene7_spookUpdate1: {
					nodeType: NodeType.CHARACTER_UPDATE,
					charId: SPOOK,
					expressionFrame: 1,
					nextNode: "introScene7_line3"
				},
				introScene7_line3: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene7_line3",
					nextNode: "introScene7_screwdriverIn1"
				},
				introScene7_screwdriverIn1: {
					nodeType: NodeType.CHARACTER_IN,
					 charId: UNKNOWN,
					 sprite: sScrewdriver,
					 expressionFrame: 4,
					 nextNode: "introScene7_line4"
				},
				introScene7_line4: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene7_line4",
					nextNode: "introScene7_spookUpdate2"
				},
				introScene7_spookUpdate2: {
					nodeType: NodeType.CHARACTER_UPDATE,
					charId: SPOOK,
					expressionFrame: 2,
					nextNode: "introScene7_line5"
				},
				introScene7_line5: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene7_line5",
					nextNode: "introScene7_screwdriverUpdate1"
				},
				introScene7_screwdriverUpdate1: {
					nodeType: NodeType.CHARACTER_UPDATE,
					charId: UNKNOWN,
					expressionFrame: 6,
					nextNode: "introScene7_line6"
				},
				introScene7_line6: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene7_line6",
					nextNode: "introScene7_spookUpdate3"
				},
				introScene7_spookUpdate3: {
					nodeType: NodeType.CHARACTER_UPDATE,
					charId: SPOOK,
					expressionFrame: 1,
					nextNode: "introScene7_line7"
				},
				introScene7_line7: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene7_line7",
					nextNode: "introScene7_screwdriverUpdate2"
				},
				introScene7_screwdriverUpdate2: {
					nodeType: NodeType.CHARACTER_UPDATE,
					charId: UNKNOWN,
					expressionFrame: 5,
					nextNode: "introScene7_line8"
				},
				introScene7_line8: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene7_line8",
					nextNode: "introScene7_screwdriverUpdate3"
				},
				introScene7_screwdriverUpdate3: {
					nodeType: NodeType.CHARACTER_UPDATE,
					charId: UNKNOWN,
					expressionFrame: 4,
					nextNode: "introScene7_line9"
				},
				introScene7_line9: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene7_line9",
					nextNode: "introScene7_spookUpdate4"
				},
				introScene7_spookUpdate4: {
					nodeType: NodeType.CHARACTER_UPDATE,
					charId: SPOOK,
					expressionFrame: 2,
					nextNode: "introScene7_line10"
				},
				introScene7_line10: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene7_line10",
					nextNode: "introScene7_spookUpdate5"
				},
				introScene7_spookUpdate5: {
					nodeType: NodeType.CHARACTER_UPDATE,
					charId: SPOOK,
					expressionFrame: 1,
					nextNode: "introScene7_line11"
				},
				introScene7_line11: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene7_line11",
					nextNode: "introScene7_screwdriverUpdate4"
				},
				introScene7_screwdriverUpdate4: {
					nodeType: NodeType.CHARACTER_UPDATE,
					charId: UNKNOWN,
					expressionFrame: 6,
					nextNode: "introScene7_line12"
				},
				introScene7_line12: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene7_line12",
					nextNode: "introScene7_spookUpdate6"
				},
				introScene7_spookUpdate6: {
					nodeType: NodeType.CHARACTER_UPDATE,
					charId: SPOOK,
					expressionFrame: 6,
					nextNode: "introScene7_line13"
				},
				introScene7_line13: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene7_line13",
					nextNode: "introScene7_spookUpdate7"
				},
				introScene7_spookUpdate7: {
					nodeType: NodeType.CHARACTER_UPDATE,
					charId: SPOOK,
					expressionFrame: 5,
					nextNode: "introScene7_line14"
				},
				introScene7_line14: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene7_line14",
					nextNode: "introScene7_spookUpdate8"
				},
				introScene7_spookUpdate8: {
					nodeType: NodeType.CHARACTER_UPDATE,
					charId: SPOOK,
					expressionFrame: 0,
					nextNode: "introScene7_line15"
				},
				introScene7_line15: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene7_line15",
					nextNode: "introScene7_screwdriverOut1"
				},
				introScene7_screwdriverOut1: {
					nodeType: NodeType.CHARACTER_OUT,
					charId: UNKNOWN,
					nextNode: "introScene7_line16"
				},
				introScene7_line16: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene7_line16",
					nextNode: "introScene7_music2"
				},
				introScene7_music2: {
					nodeType: NodeType.MUSIC,
					song: sndStrayRatStrut,
					nextNode: "introScene7_screwdriverIn2"
				},
				introScene7_screwdriverIn2: {
					nodeType: NodeType.CHARACTER_IN,
					charId: SCREWDRIVER,
					sprite: sScrewdriver,
					expressionFrame: 2,
					delay: 3,
					nextNode: "introScene7_line17"
				},
				introScene7_line17: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene7_line17",
					nextNode: "introScene7_screwdriverUpdate5"
				},
				introScene7_screwdriverUpdate5: {
					nodeType: NodeType.CHARACTER_UPDATE,
					charId: SCREWDRIVER,
					expressionFrame: 1,
					nextNode: "introScene7_line18"
				},
				introScene7_line18: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene7_line18",
					nextNode: "introScene7_screwdriverUpdate6"
				},
				introScene7_screwdriverUpdate6: {
					nodeType: NodeType.CHARACTER_UPDATE,
					charId: SCREWDRIVER,
					expressionFrame: 0,
					nextNode: "introScene7_line19"
				},
				introScene7_line19: {
					nodeType: NodeType.LINE_SEQUENCE,
					sequenceId: "introScene7_line19",
					nextNode: noone
				}
			}
		} // introScene7
		
		
		
		
		
		
		
		
	};
	return _sceneData;
}
