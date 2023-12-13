running
relatedNamesFor: methodsAndRanks

	| selectorsAndRanks |
	selectorsAndRanks := Dictionary new.
	methodsAndRanks
		collect: [:methodAndRank |
			methodAndRank key isValid ifTrue:
				[| selectors |
				selectors := methodAndRank key compiledMethod sesqAllSelectorLiterals asBag.
				(selectors valuesAndCounts / selectors size) * methodAndRank value]]
		thenDo: [:selectorsAndCounts |
			selectorsAndCounts ifNotNil:
				[selectorsAndCounts keysAndValuesDo: [:sel :count |
					selectorsAndRanks at: sel put:
						((selectorsAndRanks at: sel ifAbsentPut: [0.0]) + count)]]].
	
	selectorsAndRanks := selectorsAndRanks / methodsAndRanks size.
	
	^ (selectorsAndRanks withValuesSorted: #yourself descending)
		take: self number