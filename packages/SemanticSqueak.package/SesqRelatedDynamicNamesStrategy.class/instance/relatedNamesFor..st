running
relatedNamesFor: methodsAndRanks

	| namesAndRanks |
	namesAndRanks := Dictionary new.
	methodsAndRanks
		collect: [:methodAndRank |
			methodAndRank key isValid ifTrue:
				[| names |
				names := (methodAndRank key compiledMethod sesqFindAllExecutedMethodsWithin: self timeoutPerMethod) asBag.
				(names valuesAndCounts / names size) * methodAndRank value]]
		thenDo: [:namesAndCounts |
			namesAndCounts ifNotNil:
				[namesAndCounts keysAndValuesDo: [:name :count |
					namesAndRanks at: name put:
						((namesAndRanks at: name ifAbsentPut: [0.0]) + count)]]].
	
	namesAndRanks := namesAndRanks / methodsAndRanks size.
	
	self nonGrataMethods do: [:method |
		namesAndRanks removeKey: method ifAbsent: []].
	
	^ (namesAndRanks withValuesSorted: #yourself descending)
		take: self number