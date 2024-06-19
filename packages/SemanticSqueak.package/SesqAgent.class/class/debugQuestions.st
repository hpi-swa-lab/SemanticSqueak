preferences
debugQuestions
	<preference: 'Debug semantic questions' category: 'Semantic Squeak' description: 'If enabled, every message send of #? and #! will open the internal conversation of the agent in an editor.' type: #Boolean>

	^ DebugQuestions ifNil: [false]