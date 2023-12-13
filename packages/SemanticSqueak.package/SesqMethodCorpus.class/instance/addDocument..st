construction
addDocument: aDocument

	| result |
	result := super addDocument: aDocument.
	
	embeddingCache ifNotNil:
		[result embedding ifNil:
			[embeddingCache sesqPeekAt: result methodHash ifPresent: [:embedding |
				result embedding: embedding]]].
	
	self notePendingMethods.
	^ result