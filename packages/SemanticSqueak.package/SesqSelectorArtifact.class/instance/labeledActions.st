accessing
labeledActions

	^ OrderedDictionary new
		at: 'Browse' put: #browse;
		at: 'Senders' put: #browseSenders;
		at: 'Explain' put: #explain;
		yourself