construction
addDocumentFor: aMethodReference

	^ self addDocument:
		(self documentClass method: aMethodReference)