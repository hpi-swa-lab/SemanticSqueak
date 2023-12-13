running - private
tick

	pendingStrategies ifEmpty:
		[self future triggerEvent: #completed.
		^ self].
	
	pendingStrategies copy do: [:strategy |
		strategy hasRun
			ifTrue: [pendingStrategies remove: strategy]
			ifFalse:
				[(strategy requirements allSatisfy: [:ea | ea hasRun])
					ifTrue:
						[pendingStrategies remove: strategy.
						self run: strategy]]].