*SemanticSqueak
sesqSignature: includeComment

	self flag: #forLater. "include category (and handle relevant notifier events)?"
	^ String streamContents: [:stream |
		stream nextPutAll: self classSymbol.
		self classIsMeta ifTrue:
			[stream nextPutAll: ' class'].
		stream
			nextPutAll: '>>';
			nextPutAll: (self actualClass methodHeaderFor: self selector).
		
		includeComment ifTrue:
			[(self actualClass firstPrecodeCommentFor: self selector) ifNotNil: [:comment |
				stream
					cr;
					tab;
					nextPut: $";
					nextPutAll: comment;
					nextPut: $"]]]