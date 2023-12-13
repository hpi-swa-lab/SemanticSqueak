actions
chooseStrategies

	| currentStrategies allStrategies newStrategies |
	currentStrategies := self board strategies.
	allStrategies := self board allStrategies sortedSafely.
	"prolong lifecycle for selection"
	allStrategies := allStrategies collect: [:strategy |
			currentStrategies
				detect: [:current | current asString = strategy asString]
				ifNone: [strategy]].
	
	newStrategies := Project uiManager
		tdbChooseMultipleFrom: allStrategies
		title: 'Choose strategies'
		initialSelection: currentStrategies.
	newStrategies ifNil: [^ self].
	
	self refreshBoardAround:
		[self board strategies: newStrategies].