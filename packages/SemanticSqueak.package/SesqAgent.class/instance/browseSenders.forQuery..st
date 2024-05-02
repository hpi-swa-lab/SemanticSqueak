functions
browseSenders: selectorString forQuery: query
	"get a list of methods in the system that use this selector (i.e., call a method with that name). useful to find examples that teach you how you can invoke a method."
	<function: browseSenders(
		selector: string,
		query?: string "Optional brief description in a few words in natural language of what the selector should be used for. Useful to rank the results based on the relevance for a given context."
	)>

	| longSize detailSize selector senders detailSample sample |
	longSize := 20.
	detailSize := 10.
	
	selector := selectorString.
	(selector beginsWith: '#') ifTrue: [selector := selector allButFirst].
	selector := selector asSymbol.
	
	senders := self systemNavigation allCallsOn: selector.
	sample := self rankSenders: senders forQuery: query take: longSize.
	
	detailSample := sample take: detailSize.
	sample := sample allButFirst: detailSample size.
	
	^ OrderedJsonObject new
		sampleSenders:
			(detailSample collect: [:method | self sourceForClass: method actualClass selector: method selector]);
		moreSampleSenders:
			(sample collect: [:method | method sesqName]);
		yourself