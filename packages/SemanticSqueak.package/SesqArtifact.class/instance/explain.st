actions
explain

	^ ([self originPath] ifError: [^ self explore])
		exploreWithLabel: 'origin path to artifact'