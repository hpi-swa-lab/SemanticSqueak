printing
printOriginOn: aStream

	aStream nextPutAll:
		(self originStrategies
			ifNotEmpty: [:strategies |
				"(strategies
					collect: [:strategy |
						(strategy type allButLast
							findFeatures joinSeparatedBy: Character space) capitalized]
					as: Set)
						sortedSafely"
				{(strategies anyOne type allButLast
					findFeatures joinSeparatedBy: Character space) capitalized}
						, ((strategies
							gather: [:strategy | strategy type allButLast findFeatures])
								copyWithoutAll: strategies anyOne type allButLast findFeatures)
									withoutDuplicates
										joinSeparatedBy: '/']
			ifEmpty:
				[(self type
					findFeatures joinSeparatedBy: Character space) capitalized]).