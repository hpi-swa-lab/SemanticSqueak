printing
printOriginOn: aStream

	aStream nextPutAll:
		((self originStrategy
			ifNotNil: [:strategy | strategy type allButLast]
			ifNil: [self type])
				findFeatures joinSeparatedBy: Character space) capitalized.