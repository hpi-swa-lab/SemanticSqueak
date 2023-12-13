accessing
allStrategies

	^ (self subclasses gather: [:subclass | subclass allStrategies])
		asSet