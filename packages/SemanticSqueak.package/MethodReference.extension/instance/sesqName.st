*SemanticSqueak
sesqName

	^ String streamContents: [:stream |
		stream nextPutAll: self classSymbol.
		self classIsMeta ifTrue:
			[stream nextPutAll: ' class'].
		stream nextPutAll: '>>'.
		stream nextPutAll: self methodSymbol]