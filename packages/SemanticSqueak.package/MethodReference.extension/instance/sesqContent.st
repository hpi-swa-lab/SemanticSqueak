*SemanticSqueak
sesqContent

	self flag: #forLater. "include category (and handle relevant notifier events)?"
	^ String streamContents: [:stream |
		stream nextPutAll: self classSymbol.
		self classIsMeta ifTrue:
			[stream nextPutAll: ' class'].
		stream
			nextPutAll: '>>';
			nextPutAll: (self sourceString truncateWithElipsisTo: SesqMethodDocument maximumSourceSize)]