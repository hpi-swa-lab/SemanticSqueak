*SemanticSqueak
sesqSimilarSendingMethodsWithRanks

	| sends total numberOfMethods inverseFrequencies similarSends |
	Processor yield.
	self isValid ifFalse: [^ Dictionary new].
	
	sends := self compiledMethod sesqAllSelectorLiterals
		collect: [:lit | lit -> (BytecodeEncoder canBeSpecialLiteral: lit)]
		as: Dictionary.
	
	numberOfMethods := (self systemNavigation allMethodsSelect: [:ea | true]) size.
	inverseFrequencies := sends keys
		collect: [:lit |
			| calls |
			Processor yield.
			calls := (self systemNavigation allCallsOn: lit) size.
			lit -> (calls > 0 ifTrue: [(numberOfMethods / calls) log] ifFalse: [Float infinity])]
		as: Dictionary.
	inverseFrequencies := inverseFrequencies raisedTo: 4. "not fine-tuned"
	
	total := sends keys detectSum: [:lit | inverseFrequencies at: lit].
	
	similarSends := Dictionary new.
	self systemNavigation allSelectorsAndMethodsDo: [:behavior :selector :method |
		(behavior = self actualClass and: [selector = self selector]) ifFalse:
			[| count |
			Processor yield.
			count := sends associations detectSum: [:litAndCount | (method hasLiteral: litAndCount key scanForSpecial: litAndCount value) asBit * (inverseFrequencies at: litAndCount key)].
			count > 0 ifTrue:
				[similarSends at: method methodReference put: count / total]]].
	
	^ similarSends withValuesSorted: #yourself descending