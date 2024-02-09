embeddings
initializeEmbeddingsFor: someDocuments

	| result |
	self class cacheSourcesDuring:
		[result := super initializeEmbeddingsFor: someDocuments.
	
		embeddingCache ifNotNil:
			[someDocuments do: [:document |
				embeddingCache 
					sesqAt: document methodHash
					put: document embedding]]].
	
	^ result